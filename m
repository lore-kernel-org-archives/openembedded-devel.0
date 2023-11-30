Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D09C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 21:22:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5780.1701379320273792165
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 13:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJkNY9gb;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40b31232bf0so12599395e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 13:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701379318; x=1701984118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AROU/NLOg0d4nuGbe1PGQUtusMKbdPxp/bDeq07T+lk=;
        b=eJkNY9gbymtzdF6klE6mjAtW2tey+yWComzrG/Pzs/75q9qQRRE3D5et+cEtZAibUP
         tSG/CWFFOe5uysQrXQvCIhsYa1KRqWvaEt9DdWC97ywhLEfJWYhrvNZxPB32Im5fqRaz
         oLt3SQaAfx7dFnQbwMdri41KyKRrmftWdr1IK9hruWMeIP2kfCyWrcz/7IR0NCPZSmw1
         zr3XXnKKFpHHU9xQSdFOglR/E6XZmpdbPEKtt3fJFeItAkdwO+l3T9x8tNiggscUbMB0
         EOmlF7x6WJcI6LqJ/FXC9kvRNpa/5fvnjbX1d/9muCVywpu1fGvKbmJNbMr/En9MmwgE
         iV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701379318; x=1701984118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AROU/NLOg0d4nuGbe1PGQUtusMKbdPxp/bDeq07T+lk=;
        b=tIttgPItd79AQ612gnHB/uesy9uHCiOhDkH2jkfIbmomnFzT2xTYILEdnkqUsYpggv
         EWIMwRl2AOLEVYDjDUNzCSQIqcWyMaI5hBpMT4+CIDllL7MFIKyGqdtI5ckWGV7cC7ao
         xdmK9aRFmjwL+BJCFBu1lZJcZJcFTf3+RqRCgDqQ0Ox039g2dUddaXzFOhWJrqEb2A2b
         cNaEMf2v3h2nGzVzFt2P785QoYvQjy9ZuwDzKOiQ24iv6Pa0VaB5GxH9fkn6Xjl1LefU
         6ixOthzuOpav3nfM4hGyvMv+UF+5n7XOmteDR9ztMWYtewDB34fRhb8Gi9qVVcwdIjCR
         GaFQ==
X-Gm-Message-State: AOJu0YztT0IoVuAsCGQabFh2SKKeJdiABfuLYuwxLSimY3CHWqNWSfWt
	Ff5n32mmz0++7SZZuAvn69rM3TfMINl22g==
X-Google-Smtp-Source: AGHT+IE2963dEGDocXNebDsN9nqF1tdvmP3MSNRoVmq5Ry502st9lu/O2XDf7JOuaaXdOjf3UFKy7w==
X-Received: by 2002:a05:600c:45d3:b0:40b:5e22:95b with SMTP id s19-20020a05600c45d300b0040b5e22095bmr77174wmo.74.1701379317655;
        Thu, 30 Nov 2023 13:21:57 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id o17-20020a05600c4fd100b0040b32edf626sm3203772wmq.31.2023.11.30.13.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 13:21:57 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libpwquality: upgrade 1.4.4 -> 1.4.5
Date: Fri,  1 Dec 2023 00:21:43 +0300
Message-Id: <20231130212143.3192153-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 21:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107178

* 0001-fix-musl-build.patch removed because fixed in the new version. -> https://github.com/libpwquality/libpwquality/pull/53
* Created ABOUT-NLS file because of following error -> error: required file './ABOUT-NLS' not found

Changelog:

* Translation updates
* Minor bug fixes and documentation enhancements

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
ABOUT-NLS should have installed via gettext.
I couldn't find an answer and asked Ross Burton, he suggested I could solve it this way.

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
index b50c0f7de..787543637 100644
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
+    touch ${S}/ABOUT-NLS
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


