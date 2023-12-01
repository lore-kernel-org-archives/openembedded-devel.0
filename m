Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F5CC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 16:03:30 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.3201.1701446609188275514
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 08:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TBCCD0b/;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-54c109ed07aso3349932a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 08:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701446607; x=1702051407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B1V7fb00TzBQN7opVZBspe3U/n3Tmu3lxUTqIejQAgo=;
        b=TBCCD0b/IZx2hbn4vEzoQmgChDA9mVuoapFdOdt9RcBuLSaVzOVS7Lz7iC/Pq6kA4i
         m2hlCT0Yic1v55ESuXYWq+rurGyZQJaaAa3Uh+lakgsl+lfZVmQeJejscCUopj5TkWeC
         cZiEvjuhFsEBEwvbEwOgNPIjQbsQJXEOtRrL5YVhfkpktefzHgroiG6sgSdsauy1bqDa
         n3u84r5fgDB4bserD8B0HWrRGNy68v1iQh232OCuEGXiQhoxXzz0vdZfSontqvbGPTRW
         nOi0hi4t+MHCkDov2Lz0X0tnpUvwE5aZrG37z73tE8X4j6WWeGJF+3Xmz5WyYkhaDxY3
         euvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701446607; x=1702051407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1V7fb00TzBQN7opVZBspe3U/n3Tmu3lxUTqIejQAgo=;
        b=mDOBSDudCqT7dELLQknisBsAUS+PkOq7peHjjVuLSYfazg2vtxUso6w7oubf7OmeO4
         A4F76LCcFzEqYVf+jXFqIvFpmsKphfhVhadk7N97niVg+XKaE2Fy+e5Id0cnUpUJqs1T
         CCjzopo7pv0K7n1L+a170sYXJfq7nvGFaHlJ7hjmqtJIplZit+ZmSax2M/RSuSLtVuxX
         lX5bxcmygKNcfvgRsnOxRYXHWDis4hg2pqNR/s3+BQwd98VlX1m3q7+JyW5a8yXAPjh/
         d+F2sEB8BGYbnuoFBY4RqPJRWi1jAcXcAhW5RgAYj86NpjBJz+CxSgWH4a/XfR8bjPQP
         ZxUA==
X-Gm-Message-State: AOJu0YyGD58sPGsRd/p8n2O9lK4eWpSKdQEezyf391PpFZlxFJ3KKygj
	1SfTMxYvKC/4E1mLdnh94LHC8iwg+qATzQ==
X-Google-Smtp-Source: AGHT+IHk5ki/VyFW4o0tjUkxMcGhnu5ut5uxXIqR7zB1Hvida6m3VZudqc594fIP7QfgrR1V8mIQwg==
X-Received: by 2002:a17:906:9e:b0:a1a:5480:a153 with SMTP id 30-20020a170906009e00b00a1a5480a153mr119151ejc.15.1701446606903;
        Fri, 01 Dec 2023 08:03:26 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id gv11-20020a170906f10b00b00a0ac350f807sm2008348ejb.212.2023.12.01.08.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:03:26 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] libpwquality: upgrade 1.4.4 -> 1.4.5
Date: Fri,  1 Dec 2023 19:03:09 +0300
Message-Id: <20231201160309.93540-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 16:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107189

* 0001-fix-musl-build.patch removed because fixed in the new version. -> https://github.com/libpwquality/libpwquality/pull/53
* Copied ABOUT-NLS from native sysroot's gettext manually because of following error -> error: required file './ABOUT-NLS' not found

Building from sources need additional steps. Gettextize would have produced this file properly. But, we don't run it as part of autotools bbclass's autoreconf step
Instead of creating an empty ABOUT-NLS file, copied it from native sysroot's gettext manually.

Changelog:

* Translation updates
* Minor bug fixes and documentation enhancements

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../files/0001-fix-musl-build.patch           | 72 -------------------
 ...quality_1.4.4.bb => libpwquality_1.4.5.bb} | 27 ++++---
 2 files changed, 12 insertions(+), 87 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.patch
 rename meta-oe/recipes-extended/libpwquality/{libpwquality_1.4.4.bb => libpwquality_1.4.5.bb} (61%)

diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.patch b/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.patch
deleted file mode 100644
index 2cbdd6c74..000000000
--- a/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Do not use fgetpwent_r
-
-fgetpwent_r does not exist on musl
-
-Source: https://git.alpinelinux.org/aports/tree/community/libpwquality/0001-fix-musl-build.patch
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/src/pam_pwquality.c
-+++ b/src/pam_pwquality.c
-@@ -19,6 +19,7 @@
- #include <stdio.h>
- #include <pwd.h>
- #include <errno.h>
-+#include <security/pam_modutil.h>
- #include "pwquality.h"
- 
- /*
-@@ -43,8 +44,6 @@ struct module_options {
- 
- #define CO_RETRY_TIMES  1
- 
--#define PATH_PASSWD "/etc/passwd"
--
- static int
- _pam_parse (pam_handle_t *pamh, struct module_options *opt,
-             int argc, const char **argv)
-@@ -98,44 +97,7 @@ static int
- check_local_user (pam_handle_t *pamh,
-                   const char *user)
- {
--        struct passwd pw, *pwp;
--        char buf[4096];
--        int found = 0;
--        FILE *fp;
--        int errn;
--
--        fp = fopen(PATH_PASSWD, "r");
--        if (fp == NULL) {
--                pam_syslog(pamh, LOG_ERR, "unable to open %s: %s",
--                           PATH_PASSWD, pam_strerror(pamh, errno));
--                return -1;
--        }
--
--        for (;;) {
--                errn = fgetpwent_r(fp, &pw, buf, sizeof (buf), &pwp);
--                if (errn == ERANGE) {
--                        pam_syslog(pamh, LOG_WARNING, "%s contains very long lines; corrupted?",
--                                   PATH_PASSWD);
--                        /* we can continue here as next call will read further */
--                        continue;
--                }
--                if (errn != 0)
--                        break;
--                if (strcmp(pwp->pw_name, user) == 0) {
--                        found = 1;
--                        break;
--                }
--        }
--
--        fclose (fp);
--
--        if (errn != 0 && errn != ENOENT) {
--                pam_syslog(pamh, LOG_ERR, "unable to enumerate local accounts: %s",
--                           pam_strerror(pamh, errn));
--                return -1;
--        } else {
--                return found;
--        }
-+	return pam_modutil_check_user_in_passwd(pamh, user, NULL) == PAM_SUCCESS;
- }
- 
- PAM_EXTERN int
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
similarity index 61%
rename from meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
rename to meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index b50c0f7de..5287430c4 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -1,27 +1,24 @@
 DESCRIPTION = "Library for password quality checking and generating random passwords"
 HOMEPAGE = "https://github.com/libpwquality/libpwquality"
 SECTION = "devel/lib"
-LICENSE = "GPL-2.0-only"
+
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bd2f1386df813a459a0c34fde676fc2"
 
-SRCNAME = "libpwquality"
-SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2 \
+DEPENDS = "cracklib"
+
+SRC_URI = "git://github.com/libpwquality/libpwquality;branch=master;protocol=https \
            file://add-missing-python-include-dir-for-cross.patch \
 "
-SRC_URI:append:libc-musl = " file://0001-fix-musl-build.patch "
-
-SRC_URI[md5sum] = "1fe43f6641dbf1e1766e2a02cf68a9c3"
-SRC_URI[sha256sum] = "d43baf23dc6887fe8f8e9b75cabaabc5f4bbbaa0f9eff44278d276141752a545"
-
-UPSTREAM_CHECK_URI = "https://github.com/libpwquality/libpwquality/releases"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+SRCREV = "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
 
-DEPENDS = "cracklib virtual/gettext"
+S = "${WORKDIR}/git"
 
-inherit autotools setuptools3-base gettext
+inherit autotools-brokensep gettext setuptools3-base
 
-B = "${S}"
+do_configure:prepend() {
+    cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
+}
 
 export PYTHON_DIR
 export BUILD_SYS
@@ -35,7 +32,7 @@ EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
-PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
 
 FILES:${PN} += "${base_libdir}/security/pam_pwquality.so"
 FILES:${PN}-dbg += "${base_libdir}/security/.debug"
-- 
2.25.1


