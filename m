Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB2BECAAD4
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 23:02:27 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.18935.1661900528106618377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 16:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Soc/ya3K;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 73so3617001pga.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 16:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=CP1j0Kfk9X3mdT4btG0FvrzC7rkquWaZzbXFhCu8YTE=;
        b=Soc/ya3KlJZ9d4195n0OB/jprDjW1UnK8Rz0hD/AGNeLL6o+FOYB80wwofCu36cu7c
         ZcoAve2EBCAyfQJdij17eJ38VlR5YCxaGOMQuC4b0kBFZ7K0/hnGIickoBJP2AFJA1tq
         J/AsF/H2eWn1c6qZXJV1LGU1uj9IwUnD1o3LSzbqit8PYiyjfJsmFszrfqUgpy6lAoI4
         EUI5aDYbUPzbjyu8zo6p4sM63/44CwW7pLgBVicIcFoaczcffbN4q4yZyE6TggXsRwmT
         UkwJBwo3uI1KwEjMsyvzjE7eRqJ/BsPjjb+FuJafAtL8/JNujiGG4xXEcrHMBYRKn2za
         EPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=CP1j0Kfk9X3mdT4btG0FvrzC7rkquWaZzbXFhCu8YTE=;
        b=C8hZw4EQ8i1EXHzB+UjVNR8R3L8KO6nm0ofgIVlO+LrKNb3ynjb7g2MnHoDkkb6ese
         9pNShUAD+lvt/z6pXK7G4lWqze4AoDvmFFOw4n1/LN0joVNfLNBFmbZ1O9YMsG1c3Vvq
         v1nq/VIDJpujTTtixIdLo/PJjzwEq/24BtGeE/U8RYQwEKV4NLnp42fGgdbhTak83htt
         zwteVNstHBdb4XZ7RLrcddi+0Mij6tThV2gQSQE4dz9UIbPS7dWXcq82qb2EPgF3zRQl
         Gc3kCQ1fpPGEOUM/9F35IHaCuazkGng481e6jHzBTGg0YqIACF7fVhUiDtVRKj4ehn+A
         GYEw==
X-Gm-Message-State: ACgBeo0TooupjQY2tcApkCs+J7BQXTbr/n5JxWWNx6AUUVvh2wfJ08Ox
	1P7nWYxxWv8vlIsHiL1jK1M2wBW1eSBlRg==
X-Google-Smtp-Source: 
 AA6agR6nj5riuIpMRlrIHonXUbsR0jVAHKlBbO9zogo7JiVOZf3kBRceYpNPvlYEt5UUQi5mrbmdBA==
X-Received: by 2002:a65:450d:0:b0:42b:9117:ba5b with SMTP id
 n13-20020a65450d000000b0042b9117ba5bmr16394478pgq.418.1661900527163;
        Tue, 30 Aug 2022 16:02:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 s12-20020a17090302cc00b00172ea8ff334sm10270388plk.7.2022.08.30.16.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 16:02:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] libcurses-perl: Fix main prototype in testtyp.c
Date: Tue, 30 Aug 2022 16:02:04 -0700
Message-Id: <20220830230204.2704368-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 23:02:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98569

Enable widechar support based on ENABLE_WIDEC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-proper-prototype-for-main-function.patch | 40 +++++++++++++++++++
 .../libcurses/libcurses-perl_1.41.bb          | 10 ++++-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-perl/recipes-perl/libcurses/libcurses-perl/0001-testtyp.c-Use-proper-prototype-for-main-function.patch

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl/0001-testtyp.c-Use-proper-prototype-for-main-function.patch b/meta-perl/recipes-perl/libcurses/libcurses-perl/0001-testtyp.c-Use-proper-prototype-for-main-function.patch
new file mode 100644
index 0000000000..ab5af3fa8c
--- /dev/null
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl/0001-testtyp.c-Use-proper-prototype-for-main-function.patch
@@ -0,0 +1,40 @@
+From 01d0904a987ec3d8850ae3b54252c9d3bbe75962 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 30 Aug 2022 15:43:42 -0700
+Subject: [PATCH] testtyp.c: Use proper prototype for main function
+
+Newer compilers like clang-15+ will complain about the prototype
+vigorously, and the test will end up failing for this reason instead of
+real check it should be failing/passing for.
+
+Fixes
+testint.c:11:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
+main() {
+^
+int
+1 error generated.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testtyp.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/testtyp.c b/testtyp.c
+index 949c3d4..4042f73 100644
+--- a/testtyp.c
++++ b/testtyp.c
+@@ -7,7 +7,8 @@
+ #define _XOPEN_SOURCE_EXTENDED 1  /* We expect wide character functions */
+ 
+ #include "c-config.h"
+-
+-main() {
++int
++main(int argc, char *argv[]) {
+   typedef SYM c_sym_t;
++  return 0;
+ }
+-- 
+2.37.3
+
diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb
index 6a6f012fd7..421823d9cd 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb
@@ -8,13 +8,19 @@ LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=0b37356c5e9e28080a
 
 DEPENDS += "perl ncurses "
 
-SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz"
+SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz \
+           file://0001-testtyp.c-Use-proper-prototype-for-main-function.patch \
+           "
 
 SRC_URI[sha256sum] = "fb9efea8c7b5ed5f8ea5dee49d35252accfc05ee6e75cb9a37ab7c847cd261d7"
 
 S = "${WORKDIR}/Curses-${PV}"
 
-EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS=-L${STAGING_LIBDIR}"
+EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS=-L${STAGING_LIBDIR} TEST_SYMS_OPTS=-v"
+
+# enable NCURSES_WIDECHAR=1 only if ENABLE_WIDEC has not been explicitly disabled (e.g. by the distro config).
+# When compiling against the ncurses library, NCURSES_WIDECHAR needs to explicitly set to 0 in this case.
+CFLAGS:append:libc-musl = "${@' -DNCURSES_WIDECHAR=1' if bb.utils.to_boolean((d.getVar('ENABLE_WIDEC') or 'True')) else ' -DNCURSES_WIDECHAR=0'} -DNCURSES_INTERNALS"
 
 inherit cpan
 
-- 
2.37.3


