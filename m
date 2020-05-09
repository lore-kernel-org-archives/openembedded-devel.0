Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.6798.1589017825812216396
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2020 02:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j3kr1NKc;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id g12so13274603wmh.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2020 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0GqcvNamMv0T0JMy8X7zoMVYSVHKhwilU5jWpCnmfJU=;
        b=j3kr1NKc+gb6LccB/E+MTJSr5cdG7nSY/OcrBObkHFiFnPVvSYjp7NDZSD7bmZPVXJ
         fDBvHAgmVQ+/vMAW5bKdCFYL6GGfQzPbMiI4ECUNBvHvP9MDhQgL0ZHxicgyjgnEjnjT
         s++ZLQmCpg7YPDbo2/+YrFDhMcO0UHCtrhnFH0q9BJWJGFgK6UVbn+GLm0TbScqdXSjx
         OUvTR5SC1HiMzpYQGcE+kGBMJZcOK6c3IbXkwo5lX9PdPIU0XmWwuUPwaFSPeghBKiuG
         hzYPsMQBbWFbTyQxXkmc4RMHBSBJG6+Q3ToP/GHrzZToTigkiR8ZCGHYvR1OBZ20v2lv
         zeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0GqcvNamMv0T0JMy8X7zoMVYSVHKhwilU5jWpCnmfJU=;
        b=l9Fs/L4ZejqsonTtES4k2DqLiaOJKDBcEGdYyI/60UiNc5eNjTt1cYvecwEnkJKYoR
         8/oVQlmP3MiRJ9xerWtkShv1jxEYkS7ZGth77h7EY6LwRsKoEq2pjsCGaozTbvaFXkdK
         oeaUn7TPRej1VGX5r/SphlYAoQD098MaVrPJ2kIvEIOwELCTwhFE7otV1RbUkVuuz9kb
         EMburYHveQ1rg9GUdlrk4stYFRL9UOyeWDDUe5lne4F+ZhzTjPOOOxLm7FoYh0fn2TY8
         H1kD03mH4g13rtwvPjDcgoqOcZNVkGxHCsDD1dRXR1ddPWs9Ds8c+aLbv7DfYpk038Q/
         wozQ==
X-Gm-Message-State: AGi0Pubjn6c/fNM8x/A8udNI5hKBIxoAub/m+aVW8aa3lR39qpIXTn69
	FhatI34Sl8rOZjbpgwHR5ePo/yiyKDw=
X-Google-Smtp-Source: APiQypLFsBfWzUUIOVw2zbwwvQHBtkbJ8H5KbBbwPJRkpLnb0CfULVTu8jQmJo59ZESlRGmu4rgcAA==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr21503627wme.126.1589017824020;
        Sat, 09 May 2020 02:50:24 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from t460s-2.res.training (ppp-2-86-153-22.home.otenet.gr. [2.86.153.22])
        by smtp.gmail.com with ESMTPSA id z18sm7123466wrw.41.2020.05.09.02.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 02:50:23 -0700 (PDT)
From: "Robert Berger" <oecore.mailinglist@gmail.com>
X-Google-Original-From: robert.berger@ReliableEmbeddedSystems.com
To: openembedded-devel@lists.openembedded.org
Cc: richard.leitner@skidata.com,
	Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
Subject: [meta-java][PATCH v3] WORKDIR and ARCHIVER_WORKDIR support
Date: Sat,  9 May 2020 12:50:10 +0300
Message-Id: <20200509095010.25808-1-robert.berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1

From: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>

do_unpack_extract_submodules was called via postfuncs[do_unpack].
This breaks the build when the archiver.bbclass is used in a way
where do_unpack_and_patch is called by it. In this mode the archiver
class modifies WORKDIR, S, B,... and those modifications are lost 
via postfuncs.

In order to pick up WORKDIR, S, B,... (potentially modified by 
archiver.bbclass) do_patch_prepend is used instead of pre/postfuncs 
and calls do_unpack_extract_submodules now.

Without this patch the build will break when you add this to local.conf:

INHERIT += "archiver"
ARCHIVER_MODE[src] = "original"
ARCHIVER_MODE[diff] = "1"
ARCHIVER_MODE[dumpdata] = "1"
ARCHIVER_MODE[recipe] = "1"
COPYLEFT_LICENSE_INCLUDE = "GPL* LGPL*"

Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index c78bb2a..04acc59 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -42,6 +42,21 @@ do_unpack_extract_submodules () {
     tar xjf ${WORKDIR}/${NASHORN_FILE_LOCAL} --transform "s,-${NASHORN_CHANGESET},,g"
 }
 
+do_patch_prepend() {
+    # use do_patch_prepend syntax and not pre/postfuncs to
+    # call do_unpack_extract_submodules
+    # *) the archiver.bbclass modifies WORKDIR, S, B,...
+    #    and those modifications are lost otherwise,
+    #    which leads to build failures in do_unpack_and_patch -> do_patch
+    func = 'do_unpack_extract_submodules'
+    bb.build.exec_func(func, d)
+
+    # delete X11 wrappers if x11 is not part of PACKAGECONFIG
+    if bb.utils.contains('PACKAGECONFIG', 'x11', False, True, d):
+       func_delete = 'do_unpack_delete_X11_wrappers'
+       bb.build.exec_func(func_delete, d)
+}
+
 do_unpack_delete_X11_wrappers() {
     find ${S}/jdk/src/solaris/classes/sun/awt/X11 -maxdepth 1 -name '*.java' -delete
 }
@@ -155,8 +170,8 @@ def jdk_configure_options(d):
     options = package_config_option_cleanup(d)
     return options[3]
 
-do_unpack[postfuncs] += "do_unpack_extract_submodules"
-do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_delete_X11_wrappers', d)}"
+#do_unpack[postfuncs] += "do_unpack_extract_submodules"
+#do_unpack[postfuncs] += "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'do_unpack_delete_X11_wrappers', d)}"
 
 export DEBUG_BINARIES = "true"
 
-- 
2.17.1

