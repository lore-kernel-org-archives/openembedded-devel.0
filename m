Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602AAC54E58
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 01:48:12 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.21835.1711244883528483170
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 18:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EaZkLbwY;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1def3340682so26299775ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 18:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711244883; x=1711849683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7HE2x3wSqKQnfp7RcLDeAvU2vFAFAKh/XzKwkBwtWfI=;
        b=EaZkLbwYCH+xLhha8Kb+wksWQPi5D5Nre61u/DYoEezEeZTDBSmUKPgqJR5SFW60Xj
         dulTeKCIh8DfHLd00yA4lM4sqsHSs+qTIGUNEjNnnZOPSzQZDAqBTe9LBHEw/oSv6qP+
         VC+U/hE1ZbnT9GlZIaWfUm0PP6jb8o1P6L1gniQrbNJRcmjYn8wNGGe7lPAFb2gmuooc
         o3qVV8ZoA2j3XOwzfHCx1NDR49to7YAU56Xdr9nPWZLzaZndHVcfISmN0Rb06y8LGpd+
         Y3amM0nRnt8SAqeOruPUGGBX/9Rc0ix/vmNmlmEkvmhTO7HIlqP8EnwqdSO1gsR/B/Kr
         yDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711244883; x=1711849683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HE2x3wSqKQnfp7RcLDeAvU2vFAFAKh/XzKwkBwtWfI=;
        b=dv6BJU55EXbvIrjr7UKkvASTwPMi6/94innpsJ3Edu+hS/AgbNjt8+0jD4DUe3ZjrY
         iDg2g5tgN6MfzcHHqeCqOtNWc8TF208A9oiPi9AxtTcM99ejz5x7Qa+NAiZ/lJPfE8iv
         LxKIjwrbPOp0KAOhDZEs4XcKxEdKkuNzeaALcMLy9hCqtcujLC56Mp6EUzrpbppaGF6v
         y5SmPhHCC/Xl8d6lSJ5UNIPg24EdyeCHov4wzjfy8I4SqHVcQXRc4TLDpMKGXE0R8Kb0
         qdNkPh0vIDDf2StkM6IXnjk8AvXJXOIopw8OTZKLslVRqVxQklC9dk+bCyCBGb0fPSnn
         fP6g==
X-Gm-Message-State: AOJu0Yyq4rGsTzKjpR7pUdpR2FnimE1lJ1yVY59YDyWfFrZQ/lyGUwz2
	AF6HkfTwwFiScDmNznwsM/8i2scOkaYWrF8LtccDBHliocXfOR12ghlMyY7i
X-Google-Smtp-Source: AGHT+IEh3IV9Hg2VN949DONaK6dQly/EWKGs1tskPAXsiFfqNVsfZkaG+6IJcLizGTE7SQ3H0zH4Zg==
X-Received: by 2002:a17:902:bf47:b0:1e0:2be8:f8b7 with SMTP id u7-20020a170902bf4700b001e02be8f8b7mr3899038pls.59.1711244882539;
        Sat, 23 Mar 2024 18:48:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::779c])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090301c400b001dee4a22c2bsm2195453plh.34.2024.03.23.18.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 18:48:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] ploate: Fix sys/stat.h and linux/stat.h conflicts with musl
Date: Sat, 23 Mar 2024 18:47:59 -0700
Message-ID: <20240324014800.732601-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 01:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109558

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...at.h-only-when-sys-stat.h-is-not-inc.patch | 39 +++++++++++++++++++
 .../plocate/plocate_1.1.22.bb                 |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/plocate/plocate/0001-Include-l=
inux-stat.h-only-when-sys-stat.h-is-not-inc.patch

diff --git a/meta-oe/recipes-extended/plocate/plocate/0001-Include-linux-st=
at.h-only-when-sys-stat.h-is-not-inc.patch b/meta-oe/recipes-extended/ploca=
te/plocate/0001-Include-linux-stat.h-only-when-sys-stat.h-is-not-inc.patch
new file mode 100644
index 0000000000..7ba266f44a
--- /dev/null
+++ b/meta-oe/recipes-extended/plocate/plocate/0001-Include-linux-stat.h-on=
ly-when-sys-stat.h-is-not-inc.patch
@@ -0,0 +1,39 @@
+From 1d2197c195e19f1414afef75186bdd4c27b3ee5a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Mar 2024 18:16:19 -0700
+Subject: [PATCH] Include linux/stat.h only when sys/stat.h is not included
+
+This ends up providing certain functions from both headers e.g.
+statx and statx_timestamp since liburing.h forcefully defines _GNU_SOURCE
+to help musl compile liburing, however, this define then causes these
+two files to conflict in plocate, it seems this file is redundant here
+when sys/stat.h is included anyway, mark it for conditional include
+
+Fixes
+| In file included from ../plocate-1.1.22/plocate.cpp:5:
+| In file included from ../plocate-1.1.22/io_uring_engine.h:14:
+| In file included from /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linu=
x-musl/plocate/1.1.22/recipe-sysroot/usr/include/liburing.h:14:
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/plocate/1.1.22/=
recipe-sysroot/usr/include/sys/stat.h:124:8: error: redefinition of 'statx_=
timestamp'
+|   124 | struct statx_timestamp {
+|       |        ^
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/plocate/1.1.22/=
recipe-sysroot/usr/include/linux/stat.h:56:8: note: previous definition is =
here                                             |    56 | struct statx_tim=
estamp {                                                                   =
                                                                           =
                      |       |        ^                                   =
                                                                           =
                                                                      | In =
file included from ../plocate-1.1.22/plocate.cpp:5:                        =
                                                                           =
                                           | In file included from ../ploca=
te-1.1.22/io_uring_engine.h:14:                                            =
                                                                           =
                | In file included from /mnt/b/yoe/master/build/tmp/work/co=
re2-64-yoe-linux-musl/plocate/1.1.22/recipe-sysroot/usr/include/liburing.h:=
14:                                                             | /mnt/b/yo=
e/master/build/tmp/work/core2-64-yoe-linux-musl/plocate/1.1.22/recipe-sysro=
ot/usr/include/sys/stat.h:129:8: error: redefinition of 'statx'            =
                                     |   129 | struct statx {              =
                                                                           =
                                                                           =
          |       |        ^                                               =
                                                                           =
                                                          | /mnt/b/yoe/mast=
er/build/tmp/work/core2-64-yoe-linux-musl/plocate/1.1.22/recipe-sysroot/usr=
/include/linux/stat.h:99:8: note: previous definition is here
+|    99 | struct statx {
+|       |        ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ io_uring_engine.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/io_uring_engine.h
++++ b/io_uring_engine.h
+@@ -7,7 +7,6 @@
+ #include <string_view>
+ #include <sys/socket.h>
+ #include <sys/types.h>
+-#include <linux/stat.h>
+=20
+ struct io_uring_sqe;
+ #ifndef WITHOUT_URING
diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.22.bb b/meta-oe/r=
ecipes-extended/plocate/plocate_1.1.22.bb
index 07de357266..694c29776a 100644
--- a/meta-oe/recipes-extended/plocate/plocate_1.1.22.bb
+++ b/meta-oe/recipes-extended/plocate/plocate_1.1.22.bb
@@ -9,6 +9,7 @@ inherit meson pkgconfig
=20
 DEPENDS =3D "zstd liburing"
=20
-SRC_URI =3D "https://plocate.sesse.net/download/${BP}.tar.gz"
+SRC_URI =3D "https://plocate.sesse.net/download/${BP}.tar.gz \
+           file://0001-Include-linux-stat.h-only-when-sys-stat.h-is-not-in=
c.patch"
=20
 SRC_URI[sha256sum] =3D "3b7e4741b4aa2ec044e53eff06474a32a3fb1e928b9382351f=
e79d4c27fb0049"
--=20
2.44.0


