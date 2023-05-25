Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3B2C77B73
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 05:47:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.5432.1684993637400754207
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 22:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IC2XXwLT;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ae507af2e5so4765935ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 22:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684993637; x=1687585637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z9XuXfYHh6aOdx+1IRWoJjYAImixyEY7NbkGMesqzY=;
        b=IC2XXwLTZm9svAG9dJRJlWpxZtQDu48KIulMXP8oAlHbcbnilft64Xr8xf9qr5rGox
         Ato/Ky5Uc8uKvpi6g8MQ8sFnlqTFPDkeKIA1hlJrD+ujUBZjhQ//DtNdlDJJ7GMPDygQ
         J+VF498jK92lYMYrInsE3dw3m3dl6BRaOHJEisRA4MLNUWOkDH8A2ES3NLWvyD9TYhHQ
         rDK6uY8DC9wE8ZfJ0megYf5Wmc5RKsO8HJSYc6hgDDrYUYqykYaTi4zqojQc6GkGvE9U
         ZDfOSaDEssMrjj9QheV9AR1r0KVJ8Ah8nqBo6j42CCN2X3PuIsasYRH8uAEKOk7Hh6EW
         SpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684993637; x=1687585637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z9XuXfYHh6aOdx+1IRWoJjYAImixyEY7NbkGMesqzY=;
        b=I4pn1zUZ+XLYb4/UO8RD0zG213CgfQKi/V51olfjle1kmDDvBiLFBjzCdTfQ6tZ0aN
         jOAFeEziOu0bCTvdIhkhe43Z/U3ZoPe6Lf9qD/LAJ/IXM/DuPRvMNp0woTS4NYLa+rES
         I5NYz54I72z3UiN+pHOzZnIDV+UOO/dnoqyz1d3GSxNc33F+lXw0crj1NuAZ5ExNxbp8
         k27f8l+7nkbUO0Nwgzz/KUEcJo5JoKY4vWwuMQKJ/eFZIiys07ao32PFSGPx27vTNaO4
         LIHXyjj80OGWwUpITSDnJYNrAgUHwSeZhspjNqH5i269+4LGPde7l+VxIqVabx9mN5d9
         Y+Jw==
X-Gm-Message-State: AC+VfDzQtpznCTptaH4t+9IysoFdTKR1vw7FeEyIORh5w+gJ+bHlUZJb
	70UG+Emn5LZTncvQt1oXHgBM9XIWiz8=
X-Google-Smtp-Source: ACHHUZ6kBzCW80GLVgRbgyNxn2U3+ei5Dnhof5tIoeU+qQvr1490cR01vn2cv01xhb6U7Q/xIx3NkA==
X-Received: by 2002:a17:902:ea0d:b0:1ad:b5ed:e951 with SMTP id s13-20020a170902ea0d00b001adb5ede951mr367799plg.13.1684993636520;
        Wed, 24 May 2023 22:47:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id j7-20020a17090276c700b001a6d4ea7301sm441286plt.251.2023.05.24.22.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 22:47:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 5/5] gimp: Fix buildpaths in binaries and scripts
Date: Wed, 24 May 2023 22:47:12 -0700
Message-Id: <20230525054712.1593592-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525054712.1593592-1-raj.khem@gmail.com>
References: <20230525054712.1593592-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 05:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102803

Fixes

WARNING: gimp-2.10.34-r0 do_package_qa: QA Issue: File /usr/libexec/gimp-debug-tool-2.0 in package gimp contains reference to TMPDIR
File /usr/bin/gimp-console-2.10 in package gimp contains reference to TMPDIR
File /usr/bin/gimptool-2.0 in package gimp contains reference to TMPDIR
File /usr/bin/gimp-2.10 in package gimp contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...irst-line-of-compiler-version-string.patch | 30 ++++++++++++++++
 ...dd-build-time-library-paths-to-LD_LI.patch | 34 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb  |  4 ++-
 3 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
new file mode 100644
index 0000000000..618b4cc7a7
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.patch
@@ -0,0 +1,30 @@
+From 5711ccfab40e304ced7f5be39a4083e3fcecff91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 May 2023 22:22:41 -0700
+Subject: [PATCH] configure: Keep first line of compiler version string
+
+Full output of cc -v may contain additional information which could
+contain build path information, which is unnessasary
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gimp/-/merge_requests/926]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c25415d..68707a0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -599,7 +599,7 @@ fi
+ for CC_VERSION_OPT in $CC_VERSION_OPTS; do
+   # We run $CC, and escape and format its output, in a single step,
+   # since some shells expand escape sequences in "echo" arguments.
+-  CC_VERSION="`$CC $CC_VERSION_OPT 2>&1 | sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
++  CC_VERSION="`$CC $CC_VERSION_OPT 2>&1 | head -1 | sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
+   if test $? -eq 0; then
+     break
+   fi
+-- 
+2.40.1
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
new file mode 100644
index 0000000000..cec0055284
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
@@ -0,0 +1,34 @@
+From c720df90dfe3a3e92e34bfb36a04cc792064a501 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 May 2023 22:39:02 -0700
+Subject: [PATCH] libtool: Do not add build time library paths to
+ LD_LIBRARY_PATH
+
+This does not serve much purpose on cross builds as it will add build
+time paths which are only useful when trying to run these tools from
+build area but when they are cross built this is not possible to run
+them like this.
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ltmain.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ltmain.sh b/ltmain.sh
+index 134902c..068d74a 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -5748,7 +5748,7 @@ func_exec_program ()
+ 	if test yes = "$shlibpath_overrides_runpath" && test -n "$shlibpath_var" && test -n "$temp_rpath"; then
+ 	  $ECHO "\
+     # Add our own library path to $shlibpath_var
+-    $shlibpath_var=\"$temp_rpath\$$shlibpath_var\"
++    $shlibpath_var=\"$shlibpath_var\"
+ 
+     # Some systems cannot cope with colon-terminated $shlibpath_var
+     # The second colon is a workaround for a bug in BeOS R4 sed
+-- 
+2.40.1
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb
index 76825d96c5..7343036807 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.34.bb
@@ -43,7 +43,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SHPV = "${@gnome_verdir("${PV}")}"
 
-SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2"
+SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
+           file://0001-configure-Keep-first-line-of-compiler-version-string.patch \
+           file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch"
 SRC_URI[sha256sum] = "84004642d351b398a4293cd7fd3592044a944f05bb52850ee6068f247c657aa3"
 
 EXTRA_OECONF = "--disable-python \
-- 
2.40.1


