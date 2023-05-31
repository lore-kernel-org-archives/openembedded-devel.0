Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C6DC7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:53 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.11457.1685531623706795150
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PFEXCGtk;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bad102ce9eeso7491320276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531623; x=1688123623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOc2h9R32nSz0RvFBo4SQahh1DM3svFQh5TtXhtMY+c=;
        b=PFEXCGtkWhaMX+SDMZfghPzWKOSFnVnMxGjCksOVl4fz5Hu7nYbwjD/vN67a69fYkG
         XAwE3eixILCretr31oiHUXg0HBqSpIXUG1t9xePyxkePSj/+uKeLnyUWuLQTf7ub1gk9
         Hexm4o8QX7lUnB8t161guJcymfGZ7AFbrGfnVZaEnRpATyoZNc0TBWsbKveUbWmXasg4
         xGqJ68dvwgU5HLPXYMCzUwupE4xpPOItItkfn9rjJO5DH9vEVSJrU/kF7P8SRY4oG5BZ
         UkRzmqd0+jrswPlDVWIxBDyHMcQCnIQbi4VYbwL8fWKoVY8R5oOtHIMK58+xQV9vg8MN
         MwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531623; x=1688123623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOc2h9R32nSz0RvFBo4SQahh1DM3svFQh5TtXhtMY+c=;
        b=IK2wJzv2sr+E4FyV+lnhexVmPAvwzSIpiQjQjnIGB30Bow5xQp2G5ER/DsiFYWSS1V
         0UN3/D1Rv+4leRPsd8Q68moVMf0PL64mxzPV0ciTuiYVn/asjCXWBteBu0gHqmoGQZnW
         Zl/3JERtF5mv9SX9I88O9SK7AruBcd6xAguBBVhx+ovqtTTfZ2JvykdA0E4mCrjW4URm
         xZ7wLO5dwDfa4IkCNgi9yl5PPf1Ru9Haq94q+5xzxOvhDAAd5E9rE5rHAuwWWu31CtCu
         nV6YIlM+mrA+RB4gwauR/Pr5TqXQHZjK5bRYVvG03iC64GM68Lx2XdPfKXLaaAt6awqF
         AwlA==
X-Gm-Message-State: AC+VfDxRoNI1Hfr9uBFabndZYGXFPnbGifJkxiT4uuiJAMZ7Azc3Gdlb
	8mvHgShA7P0X+U6WXTiGBY5pqhFWl6I=
X-Google-Smtp-Source: ACHHUZ6XI/eZ1CYnWhXGND3IrWIILDs5IofG0iZpV4FO+RvP2iBPXHNWuzS5L6YRA7OQnaRs2vBcxg==
X-Received: by 2002:a25:24c5:0:b0:bad:6f:8526 with SMTP id k188-20020a2524c5000000b00bad006f8526mr6115995ybk.57.1685531622576;
        Wed, 31 May 2023 04:13:42 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 32/36] gimp: Fix buildpaths in binaries and scripts
Date: Wed, 31 May 2023 07:13:05 -0400
Message-Id: <20230531111309.2454603-32-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103061

From: Khem Raj <raj.khem@gmail.com>

Fixes

WARNING: gimp-2.10.34-r0 do_package_qa: QA Issue: File /usr/libexec/gimp-debug-tool-2.0 in package gimp contains reference to TMPDIR
File /usr/bin/gimp-console-2.10 in package gimp contains reference to TMPDIR
File /usr/bin/gimptool-2.0 in package gimp contains reference to TMPDIR
File /usr/bin/gimp-2.10 in package gimp contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d3bfe80601963cf8c41d67e0eba299b37beec9a5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


