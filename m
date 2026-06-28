Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9ACC44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:44 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69113.1782634297611698421
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y3lwAdRz;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3619051eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634297; x=1783239097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbEww2xS7GvauC5hb8ZQ8L6AdeWFgEcQBcPdGA+l9TY=;
        b=Y3lwAdRzXMNy2jIv4XZzYrGc0FZ8gii3X3hINJY6Q6dXe2biIJdyUhm4KF5/PNuIWT
         1Upd2wlrrL/8EnDlxWNnpwOmg/iDNUoEjrk9KMGnDvVW4914vTk0oFrV9pMLU/A8BMsT
         AG6NzqnTbTTTymqx2qpPk67uwNXFattvmV1XKntQs2VfFGT1s5A8R3E5bLDeAG+Cga7y
         L0fubhyubCmdMn1qCer/k7Ywal//8z7qKNiYcO1CdAKr7rm4/GLm5CoXMGMoNLC/uKOk
         xnaQMfEjiHyb52Yd23AGKIfm6P2uXLt2740QwU1WKhX7dK4SuWUeP7SFJawCCEq9Nra1
         Y11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634297; x=1783239097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZbEww2xS7GvauC5hb8ZQ8L6AdeWFgEcQBcPdGA+l9TY=;
        b=pwMgcAqomwcxsWdAQUREBbTlbazReCKutVYDA2NJbwUvfkMIqOs20Qug39icEULLfx
         +rJto/CE527vj6769+gRVj0JMFTIS1etSfmcD+y4z5kYRhFdXMjjjsKl43L9xQe6pka4
         cAAn1INVc7Uv1hq3td65+Tc4p6TndfE8NuXOdPSVsB5dD8kRIMCOkCaCwM4cLxBbW4Hx
         K9xoXmMzxL2v7mjiWVuJV63j5J4V0znXtHSNxG8flL3mO2iEKw95QW1dI0Rz8LsROAih
         SnplMdmUPvOQUVzjRs4ge9R/PSpvLpcBOa6xc7zhWv9Ey1tiPzx878MlUJMJPOrtgGKZ
         D2mw==
X-Gm-Message-State: AOJu0Yy9qQ5Yzo0p2tp2jgii/1dyFmbTuoOzo59cWjr88PBLiO7FI5y3
	OUhLv5lzray6Cv8b3vU3HilaKngDlRknB+TI16cTFq+uYF+KwSGKYtqz5Zz+jotBuxOUkQ==
X-Gm-Gg: AfdE7cnrhsUIBhpIF1bIPwP2XUMb7TciTGeYY6lyfySMN1jZpexlBaKcJEBSeCjGd3q
	trsYmhg1xARrl1pxxXmD/N56jBNVgpS867ZcKi69pisDQZ9xhu/ALdONtdQ0SdiawMWWqExkiCA
	5PVup6RYyym1n4Dd6OneLRzjwX9ktSbIKydcAfxbwYkb0p8B0KISBCnRb/hp7bCBzaSOJ8FWDrs
	ucixeE6DI52yYPoxGGCZBe9jcK/Et/aI5rZAIrHS6ZJeZkpo+yDU0PhpGGT4f2/5vrNCLHoNsGY
	R1k99H9f7yre0PJpPias7JgHpLG+4me+41d0aL6rEFSm9ip3jSYLZXX+fhUh1Lb+LdgtwRFqS6N
	P3y15685lppH66W+N54bwkWUdWb7m8v1hbvJrMAH7CsSB4kmLhPsvmlMlTe57e+EYVUEvDMqctM
	t1mWGal3BVQweqeRNDoncIQxPs/20lDU9z5Y/m/3jSIyOlNVQMAljESaxxpnbe764c64v9QYMUH
	wAsbaiRgoc1Q7YUbiVh9/EVOumX+eBliWTGNb34o02rRb/XmlttfvzVlyO+6MmPeO+7q8VkYInf
	s2K8rRGtIcdgQDq3j9losbVAf4oeQw==
X-Received: by 2002:a05:7022:914:b0:139:7a47:ab68 with SMTP id a92af1059eb24-139dbbcc212mr11784139c88.37.1782634296893;
        Sun, 28 Jun 2026 01:11:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 013/128] dconf-editor: upgrade 45.0.1 -> 49.0
Date: Sun, 28 Jun 2026 01:09:24 -0700
Message-ID: <20260628081122.178348-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127823

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../dconf/{dconf-editor_45.0.1.bb => dconf-editor_49.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf-editor_45.0.1.bb => dconf-editor_49.0.bb} (72%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_49.0.bb
similarity index 72%
rename from meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
rename to meta-gnome/recipes-gnome/dconf/dconf-editor_49.0.bb
index 32a69a0707..5e40b4df25 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_49.0.bb
@@ -13,8 +13,8 @@ DEPENDS = " \
 
 inherit gnomebase vala gsettings bash-completion pkgconfig gtk-icon-cache
 
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/45/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
-SRC_URI[archive.sha256sum] = "1180297678eedae6217cc514a2638c187d2f1d1ef2720cb9079b740c429941dd"
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/49/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
+SRC_URI[archive.sha256sum] = "90a8ccfadf51dff31e0028324fb9a358b2d26c5ae861a71c7dbf9f4dd9bdd399"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \

