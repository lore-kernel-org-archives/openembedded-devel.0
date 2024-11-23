Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB51E6ADD3
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 00:04:09 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.38795.1732320247218278769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 16:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LEjy0vLe;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e38c1ac8e3cso3147709276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 16:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732320246; x=1732925046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxD+zYhalaR+PbNCB0Yf2STFst8py+nGJxRcajSobeI=;
        b=LEjy0vLexSa0cLhdiDsXazSnpDngywDvVWHdBCiUupa9uwYQtdRKM8lC4ANLy1RFdc
         6PEWVDmYbdfdycpIPg97QczxrCQGNI4/OMLNiO00yGACfgIwNfyHRhwKQmIArZjIJHGS
         EFnM1InTg1CNIBHFWDIb8i7GsoVyr832Fg6KC/vrzL+pUwGuArszbsJrPsVIwpzG695C
         04dclRpz5CsDeAXfAG1abP62YCZGsTbWbe7sqS8ptN8F0N41IjtkqD7QwqmOaK7J/tkT
         UEb6Y49DlYS9ZSKb/ZVEhRLwIQbdkUWuljmSIp24bWWkCxHCqQG+YsI/naXHZ+MHfKM5
         PuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732320246; x=1732925046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxD+zYhalaR+PbNCB0Yf2STFst8py+nGJxRcajSobeI=;
        b=uLZ4mAEGi3G8HEtvTiEY18t0arpi8pdeZLkyzBmb5MXO6r1g0OrMNFX/n8sEZczwMM
         9vc5lPH22XzdFCeyTH36bhbHC8/d7iau3duBdDOeryHuhHjATHBmuB6PSEpOe69jB5SZ
         +lpLJ4DI1jufxy3W2rFrwxyVAlV3YMbR8GC6wYRS4JBUrOBP4NCBVOGuX6LLOPOTGpZS
         dyNsvtzC/1oPK1bCIpMb3DJntCMUied+7bZ2wzuqm2WiPmAndM16R/H6RNXBYqvuQGuf
         VQL4kJmkEmLaKDa3mxB5JFBd7FvQcPmWGexPBIvyQOb+4R08dpngZRNoExCtw/TAmFQI
         bgkg==
X-Gm-Message-State: AOJu0YxPCRY8jrz2mSa+w5+uPaEar9JGCwSm0EhdexXyUHVQ6GDXeiaB
	nzEtt9tPj8tcI4BcqWiZHp3rU/KeIxK8rZ+cmOviadewqmURYRDU/wLXjp0b
X-Gm-Gg: ASbGncti7mN0hofKcleJTPwoZbWchkkvmslCtX+c9mv5Zmi+rfN/vN0/taaIE00cU9c
	NJkQV30miUvopG/uznS4LPHx790caVz3KiYRkSf5PlcS8WrqmwpZ+Rv/AaM/GiGrL99BMx8R4jC
	R9Do290VZ9CoFvTLeu6STVjVHu7V/vyH4/pGWPe+Zfe0Zg98ha3bixiyaOm79fuETxofj+Ks0/1
	XId34NYiwdG+cpK/cWzPjV2IUQwSWJPpO6LJllV3N7Gy/sFuMxv2d3T
X-Google-Smtp-Source: AGHT+IHQ5gO2fFZPRR7o5W/kIk3APCyZY+mCPUMho1s32ICP9KlR6Mgjgl6anOEy9pDipk3pCKuBSg==
X-Received: by 2002:a25:c886:0:b0:e38:9227:bf06 with SMTP id 3f1490d57ef6-e38e14a30b0mr9313974276.2.1732320245978;
        Fri, 22 Nov 2024 16:04:05 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f6319e12sm888256276.38.2024.11.22.16.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 16:04:05 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 6/6] xfconf: Upgrade 4.18.0 -> 4.18.1
Date: Fri, 22 Nov 2024 19:02:30 -0500
Message-ID: <20241123000230.1479075-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241123000230.1479075-1-schonm@gmail.com>
References: <20241123000230.1479075-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 00:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114015

Changelog: https://gitlab.xfce.org/xfce/xfconf/-/tags/xfconf-4.18.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-xfce/xfconf/{xfconf_4.18.0.bb => xfconf_4.18.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.18.0.bb => xfconf_4.18.1.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.1.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.18.1.bb
index f5c598b8d..e780b0760 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.1.bb
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection bash-completion vala
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[sha256sum] = "2e8c50160bf800a807aea094fc9dad81f9f361f42db56607508ed5b4855d2906"
+SRC_URI[sha256sum] = "d9714751bbcfdc5a59340da6ef8ddfc0807221587b962d907f97dc0a8a002257"
 
 FILES:${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.43.0


