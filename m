Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D86CCD19E
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:44:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.2811.1760600678587118952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=zg68eKKn;
 spf=pass (domain: thaumatec.com, ip: 209.85.208.52, mailfrom: dse@thaumatec.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63babfdb52cso632534a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 00:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1760600677; x=1761205477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtvezvLO+BAl3ADefu/FfaUKHNPVQfvfom7eJrctG1U=;
        b=zg68eKKn9GyCFVJ3o6GgZEl/zs2wCEm2J/O04+aczVhgWuT3f5Trjtg8NJX9V/lvTX
         uaUKUmmBpd4EBSigZNFo7TGEDJApQ4Lj7KE1E9JgP01vNwJ/jxVAgEICIV/fDz8veLnb
         1TmHPvDAVR6F0n1EPzrO7CSYvMzIEoKmyM7w6QQ+vG3+str7qNZoV+hVXmneXbQNawUz
         8/inzHtJJDECgMDgZGbeB8YA191PpK40cAK1368XoW/RSh1s+tQJXlPm4UBBkO5Euciy
         uOZgOIq8GTK5GZAiNGEN2qCSCiiaEZFfS4t/cf0bPPqUm3+0iwVQ4+OjIPHDh56HX4o1
         ClOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600677; x=1761205477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtvezvLO+BAl3ADefu/FfaUKHNPVQfvfom7eJrctG1U=;
        b=RXpIs7O6fW/kbdzgcSFIavR78js5sn97tc0CejlxLSGWykkBvyoR8jW2dpjpqV4BBl
         mCzS8yJq2wI05KFMJWy0Xzo7khglxZVccOJZWBT8+meiBFJz5AfDAEADWNgv5ab43nTm
         sa15hDIA1jxTqoMC4pRafb951bIaTiFoet5Z2knzDwz64nkik+4h65KJ8Z4qzcWb9RFD
         7w9hk+233WfALGUbW7PNYfl36Ksyxa98B/262tbrtc4I2aqfj4kxaA+RSpHDUl2XhmuX
         Qt4ZzQXnA8x1KqILhVM+PdIZUAncNil41JIW/U2FdjJ1vxecuUYEFvuD13LDusPMfqh9
         DLTQ==
X-Gm-Message-State: AOJu0YzBwt+AKgexcoOsgn7wBWU99ZLNfVNKbd/83m4oxBpSivNdt8de
	Rgt5o2FNDnWBYR9eurgPi0DaNJIFukiOinRnyjSVbhwqjld48ONkg1UAGxMyDZEJWlDJucVX1Fu
	HVkBh
X-Gm-Gg: ASbGncuHwVHILvWauJySXeHr4EOjGmSGw8nc7yQggG93LBdVQkIaEaKoxv9r6zioscL
	3IsR67nUqml3fBl5dmDbkr7DHlcbn3X5YD8lKyk1fPz+b6TN7hSnD6OZyy1SvXBa6BJvmJxW9df
	O9Wm6rsO5LX/fPWt61MCOvxqzTZ74j2eroo47LJ3JKMygY8K6KtEQ8mWD/IC0lEuk8eQycd/zWj
	Gadhgxy4Z7hC4kohUL06aUxmMnDfKFX5/LafSVkzWndBvdRDi0srfICyij4UltiW2e9IurJ02jz
	ubKbkKagcM79Xk16ohGSghaLODH1vnwVu1fv1RY8KCjyl1D//KqUg7sRiKWjj9x64HcOZpt5Vtl
	6gAepckbQKNAv7IPYBBlJMSWc97GEWbQdNgL+KK0rxImPNc0SF11qF7pBic+CPYFfJvGF
X-Google-Smtp-Source: AGHT+IEMaKSyMTPKCpq7aX6+cUWR9Q/z1EtBtqzMLbSlSf/5HT3O4z3sZL41+Hfu2IwKqOjIcK0MKQ==
X-Received: by 2002:a17:907:9720:b0:b3e:b226:5bba with SMTP id a640c23a62f3a-b50aaa9c3f5mr3394937266b.15.1760600676952;
        Thu, 16 Oct 2025 00:44:36 -0700 (PDT)
Received: from fedora ([185.186.156.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba459ba2sm447667366b.34.2025.10.16.00.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:44:36 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [meta-webserver][PATCH 3/3] cockpit: Upgrade to 349
Date: Thu, 16 Oct 2025 09:37:45 +0200
Message-ID: <20251016074104.85537-4-dse@thaumatec.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016074104.85537-1-dse@thaumatec.com>
References: <20251016074104.85537-1-dse@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120722

Remove the patch with the fix that is already present in the new
version.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 .../{cockpit_337.bb => cockpit_349.bb}        |  3 +-
 ...am-Create-src-common-directory-befor.patch | 34 -------------------
 2 files changed, 1 insertion(+), 36 deletions(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_337.bb => cockpit_349.bb} (97%)
 delete mode 100644 meta-webserver/recipes-webadmin/cockpit/files/0001-Makefile-common.am-Create-src-common-directory-befor.patch

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
similarity index 97%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
index 522d129502..4726386f6c 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI += " \
     https://github.com/cockpit-project/cockpit/releases/download/${PV}/cockpit-${PV}.tar.xz \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
-    file://0001-Makefile-common.am-Create-src-common-directory-befor.patch \
     file://cockpit.pam \
     "
-SRC_URI[sha256sum] = "df51ef5920fae69e1b435f657376aa93772c0c1720b954a3bac10ebba26bfedf"
+SRC_URI[sha256sum] = "2fa8eef40968135fb6df866a415eba8d4d5adbf4d44f293f28d4f3c841b301bb"
 
 inherit gettext pkgconfig autotools systemd features_check python3targetconfig
 
diff --git a/meta-webserver/recipes-webadmin/cockpit/files/0001-Makefile-common.am-Create-src-common-directory-befor.patch b/meta-webserver/recipes-webadmin/cockpit/files/0001-Makefile-common.am-Create-src-common-directory-befor.patch
deleted file mode 100644
index 36cb6c09c7..0000000000
--- a/meta-webserver/recipes-webadmin/cockpit/files/0001-Makefile-common.am-Create-src-common-directory-befor.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fb3b427bcbc17257ac8c38438a82435b2bd36e38 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 9 May 2025 16:17:05 -0700
-Subject: [PATCH] Makefile-common.am: Create src/common directory before
- generating fail-html.c
-
-During parallel builds, its possible that <build>/src/common directory is
-not yet created and this codepath to generate fail-html.c is executed and
-it will end in build failures
-
-Fixes
- make[1]: Entering directory 'build/tmp/work/riscv64-yoe-linux/cockpit/337/build'
-   ../cockpit-337/tools/escape-to-c cockpit_webresponse_fail_html_text < ../cockpit-337/src/common/fail.html > src/common/fail-html.c.tmp && mv src/common/fail-html.c.tmp src/common/fail-html.c
- /bin/bash: src/common/fail-html.c.tmp: No such file or directory
- make[1]: *** [Makefile:6044: src/common/fail-html.c] Error 1
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/common/Makefile-common.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/common/Makefile-common.am b/src/common/Makefile-common.am
-index ec4b30d..1d55576 100644
---- a/src/common/Makefile-common.am
-+++ b/src/common/Makefile-common.am
-@@ -94,6 +94,7 @@ libcockpit_common_a_SOURCES = \
- # libcockpit-common.a static-links an HTML template to use on failures
- nodist_libcockpit_common_a_SOURCES = src/common/fail-html.c
- src/common/fail-html.c: src/common/fail.html
-+	$(MKDIR_P) $(dir $@)
- 	$(AM_V_GEN) $(top_srcdir)/tools/escape-to-c cockpit_webresponse_fail_html_text < $< > $@.tmp && mv $@.tmp $@
- CLEANFILES += src/common/fail-html.c
- EXTRA_DIST += src/common/fail.html

