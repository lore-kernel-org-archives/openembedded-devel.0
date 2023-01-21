Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D85C54EAA
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.2134.1674324101933118399
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jnKQDSq7;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso7779810pjf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HFEJxUpe/F1UHYQML5PCMv0n1Fwbf0Pw8qvJnyf8LI=;
        b=jnKQDSq7yqmIAe/68QR11mAiw/U6KuoCfB3veEBD4nybfn3ILQxgzvvGVLepPVXN8z
         3t9inLPzAiooYUKLAqJUoS9Qehb0Osb0OKk6xbpymCvaGWm9mpwlcXB9AOppTzCayTBx
         B7ECrvCrGFiiFW3P6RuTxiztsHjd+9gHB5hqdyB4DUxLFIv4GUihA3NmRHnlZ89DT2VM
         iEok/mu8AZDSNdMzmi3YHPW8cqLEuF9Bs79NHwaN74at0Ptny5fs+VDD8VqGd3NTm8l8
         geZbKysBRkLp3J4PNG7fPt6gRggAwylCQjkveJ1RxPM1kgn/iLnAEDkEzfXqR6txsQdN
         lyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HFEJxUpe/F1UHYQML5PCMv0n1Fwbf0Pw8qvJnyf8LI=;
        b=sxYOJ+s3Q8iyf5zzwzwduP0r1GJ1gpOtFa6jc+lVY/DzH7cCpqVdwfKeKPGTCPkTU9
         bR4U5GxUBfU1naUGoUsf+6rqanD3ipeywIpI2MGDY/L1GSoEr1IgqaDdAoliUETzFRsu
         QYJrQnn6ORdUSpVb6cHUq5YCMIn/Qflrgc2ZqRPgYW4xux8XDOfv/SBuECUokCqpRDom
         q5Qzuaktt2LUZVShz5rLmEApvOoCaivV7+PsoaS/TqeQDSgwBu0Ukl85WOU8dj0OOMRx
         frKVA/lWOW9yaJMs0D0PfgauECoBhThaFCGO28e3bUEgTATpFc1yK+Q3f7J3ZZKiKsw/
         /N7Q==
X-Gm-Message-State: AFqh2kpWCKfGKnc3e9szW4pt7eFOR8yAldmSh0nXgg7lpEQymSG4N727
	tr+R5BmBE63otQ4O2lZAS5EVhf0qFOH7Kg==
X-Google-Smtp-Source: AMrXdXud1RXwruCy5ck5v0XWn6J454a+IpS/dnDnJN3oChtFtw6cRdzM/pcp8cmTEDuTiE6aj1tSVg==
X-Received: by 2002:a17:90a:8409:b0:228:de0e:c8af with SMTP id j9-20020a17090a840900b00228de0ec8afmr20423595pjn.16.1674324100970;
        Sat, 21 Jan 2023 10:01:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 21/30] hplip: Update to 3.22.10
Date: Sat, 21 Jan 2023 10:01:12 -0800
Message-Id: <20230121180121.1229895-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100688

Add a patch to drop 'register' keyword

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...op-using-register-storage-classifier.patch | 309 ++++++++++++++++++
 .../hplip/hplip/configure.patch               |   2 +-
 .../{hplip_3.22.6.bb =3D> hplip_3.22.10.bb}     |   4 +-
 3 files changed, 312 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/0001-Drop-using-re=
gister-storage-classifier.patch
 rename meta-oe/recipes-extended/hplip/{hplip_3.22.6.bb =3D> hplip_3.22.10.=
bb} (95%)

diff --git a/meta-oe/recipes-extended/hplip/hplip/0001-Drop-using-register-=
storage-classifier.patch b/meta-oe/recipes-extended/hplip/hplip/0001-Drop-u=
sing-register-storage-classifier.patch
new file mode 100644
index 0000000000..237374d74b
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/0001-Drop-using-register-storage=
-classifier.patch
@@ -0,0 +1,309 @@
+From c36f0af7ba75c133edc46f052b291188351b6c20 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Jan 2023 15:49:16 -0800
+Subject: [PATCH] Drop using register storage classifier
+
+Its beeing dropped from latest standards beginning C++17
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ip/xjpg_dct.c                 |  4 +--
+ ip/xjpg_dct.h                 |  4 +--
+ prnt/hpcups/Mode9.cpp         |  2 +-
+ prnt/hpcups/ModeDeltaPlus.cpp |  4 +--
+ prnt/hpcups/jccolor.c         | 46 +++++++++++++++++------------------
+ prnt/hpijs/compression.cpp    |  2 +-
+ prnt/hpijs/jccolor.c          | 44 ++++++++++++++++-----------------
+ prnt/hpijs/ljfastraster.cpp   |  4 +--
+ prnt/hpps/psutil.c            |  6 ++---
+ 9 files changed, 58 insertions(+), 58 deletions(-)
+
+diff --git a/ip/xjpg_dct.c b/ip/xjpg_dct.c
+index 63f021b..1986923 100644
+--- a/ip/xjpg_dct.c
++++ b/ip/xjpg_dct.c
+@@ -103,7 +103,7 @@
+  |         for the Winograd DCT.                                         =
     |
+  |_______________________________________________________________________=
_____|
+ */
+-void dct_forward (register int *block_p)
++void dct_forward (int *block_p)
+ {
+     #define CONST_FRAC_BITS 14   /* bits of frac in CONST_1-CONST_5 below=
 */
+=20
+@@ -257,7 +257,7 @@ void dct_forward (register int *block_p)
+  |         and level-shifting, you must clamp these values to 0..255.    =
     |
+  |_______________________________________________________________________=
_____|
+ */
+-void dct_inverse (register int *block_p)
++void dct_inverse (int *block_p)
+ {
+     #define CONST_FRAC_BITS 13  /* bits of frac in CONST_1-CONST_5 below =
*/
+=20
+diff --git a/ip/xjpg_dct.h b/ip/xjpg_dct.h
+index 7dc90f3..149d66f 100644
+--- a/ip/xjpg_dct.h
++++ b/ip/xjpg_dct.h
+@@ -43,8 +43,8 @@
+  |_______________________________________________________________________=
_____|
+ */
+=20
+-void dct_forward (register int *block_p);
++void dct_forward (int *block_p);
+=20
+-void dct_inverse (register int *block_p);
++void dct_inverse (int *block_p);
+=20
+ /* End of File */
+diff --git a/prnt/hpcups/Mode9.cpp b/prnt/hpcups/Mode9.cpp
+index 94ff571..6cc210a 100644
+--- a/prnt/hpcups/Mode9.cpp
++++ b/prnt/hpcups/Mode9.cpp
+@@ -203,7 +203,7 @@ bool Mode9::Process(RASTERDATA* input)
+     unsigned int    offset,byte_count,rem_count;
+     Mode9_comtype       command;
+     char* dest=3D    (char*) compressBuf;
+-    register char *dptr=3Ddest;
++    char *dptr=3Ddest;
+=20
+     while ( size > 0 )
+     {
+diff --git a/prnt/hpcups/ModeDeltaPlus.cpp b/prnt/hpcups/ModeDeltaPlus.cpp
+index 4552f4a..6a5837f 100644
+--- a/prnt/hpcups/ModeDeltaPlus.cpp
++++ b/prnt/hpcups/ModeDeltaPlus.cpp
+@@ -241,8 +241,8 @@ bool ModeDeltaPlus::compress (BYTE   *outmem,
+                               const     uint32_t    inheight,
+                               uint32_t  horz_ht_dist)
+ {
+-    register    BYTE     *outptr =3D outmem;
+-    register    uint32_t    col;
++    BYTE     *outptr =3D outmem;
++    uint32_t    col;
+     const       BYTE     *seedrow;
+     uint32_t                seedrow_count =3D 0;
+     uint32_t                location =3D 0;
+diff --git a/prnt/hpcups/jccolor.c b/prnt/hpcups/jccolor.c
+index 7cc8906..6794575 100644
+--- a/prnt/hpcups/jccolor.c
++++ b/prnt/hpcups/jccolor.c
+@@ -73,7 +73,7 @@ typedef my_color_converter * my_cconvert_ptr;
+=20
+ /* We allocate one big table and divide it up into eight parts, instead of
+  * doing eight alloc_small requests.  This lets us use a single table base
+- * address, which can be held in a register in the inner loops on many
++ * address, which can be held in a in the inner loops on many
+  * machines (more than can hold all eight addresses, anyway).
+  */
+=20
+@@ -205,11 +205,11 @@ rgb_ycc_convert (j_compress_ptr cinfo,
+ 		 JDIMENSION output_row, int num_rows)
+ {
+   my_cconvert_ptr cconvert =3D (my_cconvert_ptr) cinfo->cconvert;
+-  register int r, g, b;
+-  register INT32 * ctab =3D cconvert->rgb_ycc_tab;
+-  register JSAMPROW inptr;
+-  register JSAMPROW outptr0, outptr1, outptr2;
+-  register JDIMENSION col;
++  int r, g, b;
++  INT32 * ctab =3D cconvert->rgb_ycc_tab;
++  JSAMPROW inptr;
++  JSAMPROW outptr0, outptr1, outptr2;
++  JDIMENSION col;
+   JDIMENSION num_cols =3D cinfo->image_width;
+=20
+   while (--num_rows >=3D 0) {
+@@ -261,11 +261,11 @@ rgb_gray_convert (j_compress_ptr cinfo,
+ 		  JDIMENSION output_row, int num_rows)
+ {
+   my_cconvert_ptr cconvert =3D (my_cconvert_ptr) cinfo->cconvert;
+-  register int r, g, b;
+-  register INT32 * ctab =3D cconvert->rgb_ycc_tab;
+-  register JSAMPROW inptr;
+-  register JSAMPROW outptr;
+-  register JDIMENSION col;
++  int r, g, b;
++  INT32 * ctab =3D cconvert->rgb_ycc_tab;
++  JSAMPROW inptr;
++  JSAMPROW outptr;
++  JDIMENSION col;
+   JDIMENSION num_cols =3D cinfo->image_width;
+=20
+   while (--num_rows >=3D 0) {
+@@ -300,11 +300,11 @@ cmyk_ycck_convert (j_compress_ptr cinfo,
+ 		   JDIMENSION output_row, int num_rows)
+ {
+   my_cconvert_ptr cconvert =3D (my_cconvert_ptr) cinfo->cconvert;
+-  register int r, g, b;
+-  register INT32 * ctab =3D cconvert->rgb_ycc_tab;
+-  register JSAMPROW inptr;
+-  register JSAMPROW outptr0, outptr1, outptr2, outptr3;
+-  register JDIMENSION col;
++  int r, g, b;
++  INT32 * ctab =3D cconvert->rgb_ycc_tab;
++  JSAMPROW inptr;
++  JSAMPROW outptr0, outptr1, outptr2, outptr3;
++  JDIMENSION col;
+   JDIMENSION num_cols =3D cinfo->image_width;
+=20
+   while (--num_rows >=3D 0) {
+@@ -354,9 +354,9 @@ grayscale_convert (j_compress_ptr cinfo,
+ 		   JSAMPARRAY input_buf, JSAMPIMAGE output_buf,
+ 		   JDIMENSION output_row, int num_rows)
+ {
+-  register JSAMPROW inptr;
+-  register JSAMPROW outptr;
+-  register JDIMENSION col;
++  JSAMPROW inptr;
++  JSAMPROW outptr;
++  JDIMENSION col;
+   JDIMENSION num_cols =3D cinfo->image_width;
+   int instride =3D cinfo->input_components;
+=20
+@@ -383,10 +383,10 @@ null_convert (j_compress_ptr cinfo,
+ 	      JSAMPARRAY input_buf, JSAMPIMAGE output_buf,
+ 	      JDIMENSION output_row, int num_rows)
+ {
+-  register JSAMPROW inptr;
+-  register JSAMPROW outptr;
+-  register JDIMENSION col;
+-  register int ci;
++  JSAMPROW inptr;
++  JSAMPROW outptr;
++  JDIMENSION col;
++  int ci;
+   int nc =3D cinfo->num_components;
+   JDIMENSION num_cols =3D cinfo->image_width;
+=20
+diff --git a/prnt/hpijs/compression.cpp b/prnt/hpijs/compression.cpp
+index fcac793..10194ca 100644
+--- a/prnt/hpijs/compression.cpp
++++ b/prnt/hpijs/compression.cpp
+@@ -266,7 +266,7 @@ BOOL Mode9::Process(RASTERDATA* input)
+     unsigned int    offset,byte_count,rem_count;
+     Mode9_comtype       command;
+     char* dest=3D    (char*) compressBuf;
+-    register char *dptr=3Ddest;
++    char *dptr=3Ddest;
+=20
+     while ( size > 0 )
+     {
+diff --git a/prnt/hpijs/jccolor.c b/prnt/hpijs/jccolor.c
+index a6b2333..8486b65 100644
+--- a/prnt/hpijs/jccolor.c
++++ b/prnt/hpijs/jccolor.c
+@@ -206,11 +206,11 @@ rgb_ycc_convert (j_compress_ptr cinfo,
+ 		 JDIMENSION output_row, int num_rows)=0D
+ {=0D
+   my_cconvert_ptr cconvert =3D (my_cconvert_ptr) cinfo->cconvert;=0D
+-  register int r, g, b;=0D
+-  register INT32 * ctab =3D cconvert->rgb_ycc_tab;=0D
+-  register JSAMPROW inptr;=0D
+-  register JSAMPROW outptr0, outptr1, outptr2;=0D
+-  register JDIMENSION col;=0D
++  int r, g, b;=0D
++  INT32 * ctab =3D cconvert->rgb_ycc_tab;=0D
++  JSAMPROW inptr;=0D
++  JSAMPROW outptr0, outptr1, outptr2;=0D
++  JDIMENSION col;=0D
+   JDIMENSION num_cols =3D cinfo->image_width;=0D
+ =0D
+   while (--num_rows >=3D 0) {=0D
+@@ -262,11 +262,11 @@ rgb_gray_convert (j_compress_ptr cinfo,
+ 		  JDIMENSION output_row, int num_rows)=0D
+ {=0D
+   my_cconvert_ptr cconvert =3D (my_cconvert_ptr) cinfo->cconvert;=0D
+-  register int r, g, b;=0D
+-  register INT32 * ctab =3D cconvert->rgb_ycc_tab;=0D
+-  register JSAMPROW inptr;=0D
+-  register JSAMPROW outptr;=0D
+-  register JDIMENSION col;=0D
++  int r, g, b;=0D
++  INT32 * ctab =3D cconvert->rgb_ycc_tab;=0D
++  JSAMPROW inptr;=0D
++  JSAMPROW outptr;=0D
++  JDIMENSION col;=0D
+   JDIMENSION num_cols =3D cinfo->image_width;=0D
+ =0D
+   while (--num_rows >=3D 0) {=0D
+@@ -301,11 +301,11 @@ cmyk_ycck_convert (j_compress_ptr cinfo,
+ 		   JDIMENSION output_row, int num_rows)=0D
+ {=0D
+   my_cconvert_ptr cconvert =3D (my_cconvert_ptr) cinfo->cconvert;=0D
+-  register int r, g, b;=0D
+-  register INT32 * ctab =3D cconvert->rgb_ycc_tab;=0D
+-  register JSAMPROW inptr;=0D
+-  register JSAMPROW outptr0, outptr1, outptr2, outptr3;=0D
+-  register JDIMENSION col;=0D
++  int r, g, b;=0D
++  INT32 * ctab =3D cconvert->rgb_ycc_tab;=0D
++  JSAMPROW inptr;=0D
++  JSAMPROW outptr0, outptr1, outptr2, outptr3;=0D
++  JDIMENSION col;=0D
+   JDIMENSION num_cols =3D cinfo->image_width;=0D
+ =0D
+   while (--num_rows >=3D 0) {=0D
+@@ -355,9 +355,9 @@ grayscale_convert (j_compress_ptr cinfo,
+ 		   JSAMPARRAY input_buf, JSAMPIMAGE output_buf,=0D
+ 		   JDIMENSION output_row, int num_rows)=0D
+ {=0D
+-  register JSAMPROW inptr;=0D
+-  register JSAMPROW outptr;=0D
+-  register JDIMENSION col;=0D
++  JSAMPROW inptr;=0D
++  JSAMPROW outptr;=0D
++  JDIMENSION col;=0D
+   JDIMENSION num_cols =3D cinfo->image_width;=0D
+   int instride =3D cinfo->input_components;=0D
+ =0D
+@@ -384,10 +384,10 @@ null_convert (j_compress_ptr cinfo,
+ 	      JSAMPARRAY input_buf, JSAMPIMAGE output_buf,=0D
+ 	      JDIMENSION output_row, int num_rows)=0D
+ {=0D
+-  register JSAMPROW inptr;=0D
+-  register JSAMPROW outptr;=0D
+-  register JDIMENSION col;=0D
+-  register int ci;=0D
++  JSAMPROW inptr;=0D
++  JSAMPROW outptr;=0D
++  JDIMENSION col;=0D
++  int ci;=0D
+   int nc =3D cinfo->num_components;=0D
+   JDIMENSION num_cols =3D cinfo->image_width;=0D
+ =0D
+diff --git a/prnt/hpijs/ljfastraster.cpp b/prnt/hpijs/ljfastraster.cpp
+index 8c7073a..7e82fac 100644
+--- a/prnt/hpijs/ljfastraster.cpp
++++ b/prnt/hpijs/ljfastraster.cpp
+@@ -919,8 +919,8 @@ BOOL ModeDeltaPlus::Compress (HPUInt8   *outmem,
+                               const     uint32_t    inheight,
+                               uint32_t  horz_ht_dist)
+ {
+-	register    HPUInt8     *outptr =3D outmem;
+-	register    uint32_t    col;
++    HPUInt8     *outptr =3D outmem;
++    uint32_t    col;
+     const       HPUInt8     *seedrow;
+     uint32_t                seedrow_count =3D 0;
+     uint32_t                location =3D 0;
+diff --git a/prnt/hpps/psutil.c b/prnt/hpps/psutil.c
+index 7282dc2..87fba4f 100644
+--- a/prnt/hpps/psutil.c
++++ b/prnt/hpps/psutil.c
+@@ -148,9 +148,9 @@ static int fcopy(long upto)
+ /* build array of pointers to start/end of pages */
+ void scanpages(void)
+ {
+-   register char *comment =3D buffer+2;
+-   register int nesting =3D 0;
+-   register long int record;
++   char *comment =3D buffer+2;
++   int nesting =3D 0;
++   long int record;
+=20
+    if ((pageptr =3D (long *)malloc(sizeof(long)*maxpages)) =3D=3D NULL)
+       message(FATAL, "out of memory\n");
+--=20
+2.39.1
+
diff --git a/meta-oe/recipes-extended/hplip/hplip/configure.patch b/meta-oe=
/recipes-extended/hplip/hplip/configure.patch
index 571d5fe308..a6e61a47ca 100644
--- a/meta-oe/recipes-extended/hplip/hplip/configure.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/configure.patch
@@ -1,7 +1,7 @@
 --- a/configure.in
 +++ b/configure.in
 @@ -30,7 +30,7 @@
- AC_INIT([HP Linux Imaging and Printing], [3.22.6], [3.22.6], [hplip])
+ AC_INIT([HP Linux Imaging and Printing], [3.22.10], [3.22.10], [hplip])
=20=20
  #AM_INIT_AUTOMAKE([1.9 foreign])
 -AM_INIT_AUTOMAKE
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.6.bb b/meta-oe/recip=
es-extended/hplip/hplip_3.22.10.bb
similarity index 95%
rename from meta-oe/recipes-extended/hplip/hplip_3.22.6.bb
rename to meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index b746006c20..e054553d85 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -15,8 +15,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0004-Define-missing-prototype-for-functions.patch \
            file://0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch \
            file://0006-Workaround-patch-for-missing-Python3-transition-of-=
t.patch \
-"
-SRC_URI[sha256sum] =3D "27ed0d492febb0b47c656234820d3ce573b24ff5b62e3bf4b2=
c47f82868d6bb4"
+           file://0001-Drop-using-register-storage-classifier.patch"
+SRC_URI[sha256sum] =3D "533c3f2f6b53e4163ded4fd81d1f11ae6162a0f6451bd5e62a=
8382d0c1366624"
=20
 DEPENDS +=3D "cups python3 libusb"
=20
--=20
2.39.1


