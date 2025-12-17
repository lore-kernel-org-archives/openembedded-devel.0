Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909CFD65C7B
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 17:31:08 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18854.1765988331658725350
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 08:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BFYkTmP2;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: rbarrau33@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5943b62c47dso5763278e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988329; x=1766593129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/ib63cEmiOAr+s7gRqIhdnmU7GL4ur23V2AtZ1fW5Y=;
        b=BFYkTmP2LiE54F/HuWetBKfUFHmvslc2O0fZMizMWkiONTMp7QnlT8tOn7r7IEeABc
         5AEqKrHm+S6p5vtxE2rsUEUMX6Q+msOICGhEnnL2DXcrv69bBLnLUP9HdWmt+x+kmxZm
         EfEBfviBZ/SxauEG2O5TRFE58FMKGgEm5cjeJ6WhQakEljZ0kuF/i2vXqvsINM4Ol/HH
         J04BVk6Ye2bqN93N1zCMwyyQeacUnejsvzD4CPMfpLApfan2rq8RDoeb0AhbD+J6+Hkl
         25M+esTYb5r+OGIow3wBCvFaRxnsZwBrNZy57I/4ctDIj70Jf2NL8tTz08krW4BhWs2K
         ifdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988329; x=1766593129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/ib63cEmiOAr+s7gRqIhdnmU7GL4ur23V2AtZ1fW5Y=;
        b=IqsZ501TOMwDNDn3cm2es3uAo5VKtKYbyLzcjagMjH/SWBUbR5BO+GcAOkQ2iRu6S4
         rrer+ixtUhyKP1afmppUUiRclEh6fb3AAlRjbyr8VqsdAanBBirahWkMSf9mlSQUN7Rg
         5M1vCkDtEC4vhjy0gH7Y4qy/Wp4Y45iCLBsFlNL+CMz4kU9M5WnLlmBeh0dbdwXMr7IX
         vUoFBQz+vypDaiIBrTaSJkFhE287O/fAVL/5826WKCYPpUv7KSUTBBgxmaiBKXdQWvJk
         dzc0YYwDT0uD0i9kN01ZL9iSPFtmu21TtqxX3AkJSrz4Q1Vs4fFChTzLwTCAWuIAhPtv
         iHYg==
X-Gm-Message-State: AOJu0Yw+Tz2CfsWscOK/02nltuAWPMHiK7eIZ16WCCgKhsDbSKJiVu94
	5WNvtgxpd90KRfJbSfuQL8vmDBxJKoNmd0M/X5XCEoorvt4Nnkokv67s6sBmhg==
X-Gm-Gg: AY/fxX7Y35C5mwnZPKUlqqkGUrfnlHr6NgWgMwVrvGARJGChyZ3la6CNc88Xb2fqE71
	B0rTCSr38botlLFwdND+4vHof+Uk1MQGnW2sYjWHYv4xP2+FQvOYa+JAKxiXdBIxUwq71TbjVTW
	ZehOhxtlh/lqCRcRVWxo/V5KUQWnE6/hRR8bY1gXC3Fe0JLGYWFM4sv3OjBfWR4rBKfNtV4wmZx
	kU+ysCkU/Gayu54suIv+mY2ifLD+PqS1rfPasXvjkW8DRBkhsWO4Tv+7tNiRj3dESQ78GbUQiT+
	3nfbam0O7ef5QHq90b0EjDxQ7tKfIyrzR6pgaDWlKet9ga/nKUA7uybs6qhkaBBZ5QoH57/yiAa
	UKu6oKXHzkKvF8UdJE0mJnOWO91rWRv37HUgPh72G/Uc6oL19A7reGGfS9JlTG2eCvZIAWklEZu
	J52QTssJk6FTIBEq/AyWKHSJimTEOyoBEUnWASuHrF77gYXDS/b+u2V6Y3XuQoLONqz2r6+pXyJ
	97WZSDEOvVjhR9TTWonHQOSH4jZI1rkCNJkOItZ2mRaFBsVlRHYlOj0tstQJKbRvbWleTpWHWYa
	4AU=
X-Google-Smtp-Source: AGHT+IEYbcKM3rNOYOmQfye3+EWam2MNji8vNqg6ghVddKsNcm5AJiDg2+RktSbchKuXiQSj4rKDeg==
X-Received: by 2002:a5d:5f54:0:b0:429:c14f:5f7d with SMTP id ffacd0b85a97d-42fb48fc127mr22969994f8f.29.1765987888182;
        Wed, 17 Dec 2025 08:11:28 -0800 (PST)
Received: from LSTA-2404.. (2a01cb01403af46ce64bc8ed90517e24.ipv6.abo.wanadoo.fr. [2a01:cb01:403a:f46c:e64b:c8ed:9051:7e24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ada8426sm5482869f8f.5.2025.12.17.08.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:11:27 -0800 (PST)
From: Renaud Barrau <rbarrau33@gmail.com>
X-Google-Original-From: Renaud Barrau <renaud.barrau@madic.com>
To: openembedded-devel@lists.openembedded.org
Cc: Renaud Barrau <rbarrau33@gmail.com>
Subject: [meta-oe][PATCH 2/2] drm-lease-manager: add new recipe
Date: Wed, 17 Dec 2025 17:11:14 +0100
Message-ID: <20251217161114.403899-2-renaud.barrau@madic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217161114.403899-1-renaud.barrau@madic.com>
References: <20251217161114.403899-1-renaud.barrau@madic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 17:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122726

From: Renaud Barrau <rbarrau33@gmail.com>

Create a recipe for the drm-lease-manager project  https://github.com/AGLExport/drm-lease-manager

Signed-off-by: Renaud Barrau <rbarrau33@gmail.com>
---
 .../drm-lease-manager_git.bb                  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb

diff --git a/meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb b/meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb
new file mode 100644
index 0000000000..621a08f324
--- /dev/null
+++ b/meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Recipe for drm-lease-manager"
+HOMEPAGE = "https://github.com/AGLExport/drm-lease-manager"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "git://github.com/AGLExport/drm-lease-manager;protocol=https;branch=master"
+
+SRCREV = "e6c3bf4ff76ae5eeefdb149e4b4167195dfcfb61"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+DEPENDS += "libdrm pkgconfig-native libtoml"
+
+# Change default path /var/run/drm-lease-manager.
+# For exemple if you wish to move the runtime dir of drm-lease-manager to /etc :
+# EXTRA_OEMESON += "-Druntime_subdir=/etc/drm-lease-manager"
+
+FILES:${PN} += "${bindir}/drm-lease-manager"
-- 
2.43.0


