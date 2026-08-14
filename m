Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AA5C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:21 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24535.1786747632784191113
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lz49mQ2I;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso1170588a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747632; x=1787352432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdU3JVZzQtdPHiuiuQZCjbVtwsnuvLhvtLuIBrKQdUA=;
        b=lz49mQ2Igmspb1Zt5efrwywcKo9NExmzE+e/f7TFAce8Pd8ddFPb/BXCdccdVKZAD0
         +Z6lOSRIjq3xKlnZTEMxKRBkkr12vNRjhvtYPUW4z1gps5KgXpPbnSQQXeVLqsHR5jEw
         n/NeGO4/O32DK0m70GxSE/FjuFRytxPiok3aIYmFjR5GQyD8LM/2Orqx73IkPzrgNBm+
         uJxdRr0VV2EOX195I8W3RqKXzD1+4R+YP3W2QWOmSbX21VJuEA2kcigo7mT7EFM7o/6O
         hfup7CthknNFIPswx8DTmCVo+DludEXJ1J/UfYTbbXEYXEDHnMTZ/KTt9SMC6k6gxLoN
         3xPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747632; x=1787352432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdU3JVZzQtdPHiuiuQZCjbVtwsnuvLhvtLuIBrKQdUA=;
        b=qaY848jpIqRI0XjkXImaSfVp138aTcYN8MHoaicip1KNriB9t7Ldczt+/lkY0i7MBe
         dcvP4Ttw38eFR4mmlVQkrilU9XwPvkVy4zkOrpMFh6SR1jKWK+TyYbIt1dTgZ64nVZuE
         lG5DIbdfgWaTJA9cbMxx90yug9Kcnbp204aDEBQo1NJWMfshfQgKjNYrwIfWglbIhkzO
         Tc18aicDX84zNiKehicB25h/EiyHZvvraaRFtx1ZUD92NLbwYKgzQonFsruVPXDLIY/A
         ZuDYooiCpBNfnOk2ybLSirp2VvNHYE6FsRCFVfL4jcGKC4ljU6zhOiYMDZl6pPcd+BBR
         FvsA==
X-Gm-Message-State: AOJu0Yxp14pl0V5AUPOJRD4N7ivEcSUo9uVPL9jWc4fDpSq5jeRWQfTz
	mp9vBuWr0mBrlhTRFLUzIew4VqDXpHzXh61rq3W2Z0Yzj4vqoj3dzkXohs8p9VW1
X-Gm-Gg: AR+sD10k2+EsEZr3VcPLUy2rBa2W7ycNe2qe6DPdP8iFd0gePpB5FhRldOsWhtyRvGF
	guys8q6DD/tFipnoZhXg410oc2xwwv4w1gQYD6JYmOmUbCU1STg50KIm52QnPy7G4DU2IuJICdE
	dhjgkIOLTQzMo/NAI9zfLugg3y1nkmt72zXc9acP6Hia42iWx2jp3hSQUUp7Stnv2/HryeSjQH2
	IATHpOxs7k858bMHwy+CB5cMKYbdB700uxsGG9+mALuHhVklG+7UQfvSvvqVfwAXSL7gLw5iWWH
	tXqarOXe0uYarIuzY6szX+sRvaC0vtb4fqZzROm5fdu9CSEQaa+Iig3ulIuEhrZGK+ew3sZGCgm
	xFEYl7KDUyfTQlJ9dH+C6/PmD1MqwIuYN9el5EZQwYIF1fBMgPgRedoXdX7fMhxb7EhZZxYu9r7
	rMwmh2O+rXf8cVTjW2vea6UhX7ZF/WF59tcKsrB/yeAbepiLtuznN2So6TtBgeswUpsAhUe6LA7
	Fqu1tVMvNAoRzu96TfLB3hRFuf1C1aPVViD8ZWWQOMLPbF2cz94NfDN2LfuG9FNSbfE4Ksjg8pt
	/hxNqgkKvm/2ZsPuO5l1KYfo+/9yKCqCBri4u/LVpVfWZBKZ+Ag8xpLdDPnr5/Og0zYNgTVzXEd
	yS9ARKpQDLT+cynYdnGdcvyy4Nrwse9+vrSC2sFxHoncROg==
X-Received: by 2002:a05:6a20:3949:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3cc71ced4d0mr9671721637.10.1786747632057;
        Fri, 14 Aug 2026 15:47:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 079/109] pngcheck: upgrade 2.3.0 -> 3.0.2
Date: Fri, 14 Aug 2026 15:45:05 -0700
Message-ID: <20260814224539.1523174-79-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129143

Major release. Three patches rebased onto 3.0.2's shifted line numbers:
0001-make-Respect-variables-from-environement.patch (upstream added an
alternate -L$(ZPATH) -lz definition, commented out, above our target lines;
same changes, offset only), 0001-png-fix-IDAT-windowsize-...patch and
10-pngsplit-format-strings.patch (upstream renamed the usage-string macros
png_fix_IDAT_windowsize_usage/PNGSPLIT_HDR/PNGSPLIT_USAGE to their current
names; same %s-format fix, offset only).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-Respect-variables-from-environement.patch | 13 +++++----
 ...dowsize-Fix-format-string-errors-in-.patch | 17 ++++++-----
 .../pngcheck/10-pngsplit-format-strings.patch | 28 ++++++++++---------
 .../{pngcheck_2.3.0.bb => pngcheck_3.0.2.bb}  |  4 +--
 4 files changed, 32 insertions(+), 30 deletions(-)
 rename meta-oe/recipes-support/pngcheck/{pngcheck_2.3.0.bb => pngcheck_3.0.2.bb} (84%)

diff --git a/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch b/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch
index 12333cc1f1..1ca4ecab1a 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch
+++ b/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch
@@ -5,6 +5,9 @@ Subject: [PATCH] make: Respect variables from environement
 
 link with shared zlib
 
+Rebased on 3.0.2: context shifted by 2 lines (upstream added an alternate
+-L$(ZPATH) -lz definition, commented out); same changes, offset only.
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 Upstream-Status: Pending
@@ -13,11 +16,10 @@ Upstream-Status: Pending
  1 file changed, 8 insertions(+), 10 deletions(-)
 
 diff --git a/Makefile.unx b/Makefile.unx
-index 772da46..4ae7061 100644
 --- a/Makefile.unx
 +++ b/Makefile.unx
-@@ -24,18 +24,16 @@ ZINC = -I$(ZPATH)
- ZLIB = $(ZPATH)/libz.a
+@@ -24,18 +24,16 @@
+ #ZLIB = $(ZPATH)/libz.a
  
  INCS = $(ZINC)
 -LIBS = $(ZLIB)
@@ -40,7 +42,7 @@ index 772da46..4ae7061 100644
  PROG = pngcheck
  PROG2 = pngsplit
  PROG3 = png-fix-IDAT-windowsize
-@@ -57,13 +55,13 @@ EXES = $(PROG)$(E) $(PROG2)$(E) $(PROG3)$(E)
+@@ -57,13 +55,13 @@
  all:  $(EXES)
  
  $(PROG)$(E): $(PROG).c
@@ -57,6 +59,5 @@ index 772da46..4ae7061 100644
  
  
  # maintenance ---------------------------------------------------------------
--- 
+--
 2.12.2
-
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch b/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch
index 0fc5a8e0d2..97ddb8df09 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch
+++ b/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch
@@ -12,27 +12,26 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/gpl/png-fix-IDAT-windowsize.c b/gpl/png-fix-IDAT-windowsize.c
-index 6d4ef9c..d212017 100644
+index 6543d20..b190906 100644
 --- a/gpl/png-fix-IDAT-windowsize.c
 +++ b/gpl/png-fix-IDAT-windowsize.c
-@@ -127,7 +127,7 @@ int main(int argc, char *argv[])
+@@ -126,7 +126,7 @@ int main(int argc, char *argv[])
              fprintf(stderr, "  Compiled with zlib %s; using zlib %s.\n",
                ZLIB_VERSION, zlib_version);
              fprintf(stderr, "\n");
--            fprintf(stderr, png_fix_IDAT_windowsize_usage);
-+            fprintf(stderr, "%s", png_fix_IDAT_windowsize_usage);
+-            fprintf(stderr, PNG_FIX_IDAT_WINDOWSIZE_USAGE);
++            fprintf(stderr, "%s", PNG_FIX_IDAT_WINDOWSIZE_USAGE);
              fflush(stderr);
              return 1;
          }
-@@ -143,7 +143,7 @@ int main(int argc, char *argv[])
+@@ -142,7 +142,7 @@ int main(int argc, char *argv[])
      fflush(stdout);
  
      if ( argn == argc ) {
--        fprintf(stderr, png_fix_IDAT_windowsize_usage);
-+        fprintf(stderr, "%s", png_fix_IDAT_windowsize_usage);
+-        fprintf(stderr, PNG_FIX_IDAT_WINDOWSIZE_USAGE);
++        fprintf(stderr, "%s", PNG_FIX_IDAT_WINDOWSIZE_USAGE);
          fflush(stderr);
          return 5;
      } else {
 -- 
-2.12.2
-
+2.25.1
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch b/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch
index 2ff6d664c0..d71cd12def 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch
+++ b/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch
@@ -7,36 +7,38 @@ Upstream-Status: Pending
  gpl/pngsplit.c |   10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
+diff --git a/gpl/pngsplit.c b/gpl/pngsplit.c
+index ca4567b..0147ef4 100644
 --- a/gpl/pngsplit.c
 +++ b/gpl/pngsplit.c
-@@ -141,8 +141,8 @@
+@@ -141,8 +141,8 @@ int main(int argc, char *argv[])
                    0 == strncmp( argv[argn], "-quiet", 2 ) )
              verbose = 0;
          else {
--            fprintf(stderr, pngsplit_hdr);
--            fprintf(stderr, pngsplit_usage);
-+            fprintf(stderr, "%s", pngsplit_hdr);
-+            fprintf(stderr, "%s", pngsplit_usage);
+-            fprintf(stderr, PNGSPLIT_HDR);
+-            fprintf(stderr, PNGSPLIT_USAGE);
++            fprintf(stderr, "%s", PNGSPLIT_HDR);
++            fprintf(stderr, "%s", PNGSPLIT_USAGE);
              fflush(stderr);
              return 1;
          }
-@@ -150,8 +150,8 @@
+@@ -150,8 +150,8 @@ int main(int argc, char *argv[])
      }
  
      if ( argn == argc ) {
--        fprintf(stderr, pngsplit_hdr);
--        fprintf(stderr, pngsplit_usage);
-+        fprintf(stderr, "%s", pngsplit_hdr);
-+        fprintf(stderr, "%s", pngsplit_usage);
+-        fprintf(stderr, PNGSPLIT_HDR);
+-        fprintf(stderr, PNGSPLIT_USAGE);
++        fprintf(stderr, "%s", PNGSPLIT_HDR);
++        fprintf(stderr, "%s", PNGSPLIT_USAGE);
          fflush(stderr);
          return 5;
      } else {
-@@ -162,7 +162,7 @@
+@@ -162,7 +162,7 @@ int main(int argc, char *argv[])
  
      /*=============================  MAIN LOOP  =============================*/
  
--    fprintf(stdout, pngsplit_hdr);
-+    fprintf(stdout, "%s", pngsplit_hdr);
+-    fprintf(stdout, PNGSPLIT_HDR);
++    fprintf(stdout, "%s", PNGSPLIT_HDR);
      fflush(stdout);
  
      while (argn <= argc) {
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb b/meta-oe/recipes-support/pngcheck/pngcheck_3.0.2.bb
similarity index 84%
rename from meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
rename to meta-oe/recipes-support/pngcheck/pngcheck_3.0.2.bb
index 3bd2f414d7..69eeb204f8 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
+++ b/meta-oe/recipes-support/pngcheck/pngcheck_3.0.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "pngcheck verifies the integrity of PNG, JNG and MNG files"
 HOMEPAGE = "http://www.libpng.org/pub/png/apps/pngcheck.html"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://gpl/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://gpl/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "zlib libpng"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/png-mng/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/png-mng/${BPN}/${PV}/${BPN}-${PV}.tar.g
            file://0001-make-Respect-variables-from-environement.patch \
            "
 
-SRC_URI[sha256sum] = "77f0a039ac64df55fbd06af6f872fdbad4f639d009bbb5cd5cbe4db25690f35f"
+SRC_URI[sha256sum] = "0d7e262f24116fddf2847a8ceb5c92d9f5f26efb42e9fff63ec2bb7676131ca7"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/png-mng/files/pngcheck/"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"

