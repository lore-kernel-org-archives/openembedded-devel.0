Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0330F771EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 11:37:19 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f73so41938518wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 03:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uFffxMZ1C9ZSYYWg7lRautOPIhxcBYL1ydYUkVULzOQ=;
	b=j0rJxVwqtAVM2Xl0zEF9OzQHkVfNTf97tDqmygJ5znUPMkfevadrA9TR6HOgpdk+0W
	bWRUVpTkmRUobJ0ns2IsE73ALPBS5wTuRXPDcGQXNcfG16zKUocPKzxDeVeYs+SjsoZ2
	5Pm//75mlQpzOggY/SeVTmE4tCVpWMGz3xhJBhL61aSdJHCc0xIBHbak7+Xu+OpNjeGW
	CDgVXhvJl7t4lkL++H6Dv6sCURsajKGKLvrQ8S/5po4Nai1vu/9I0hEYLRbGP30zsqDI
	iqs4dmumuaQtgLO5mTc6LHY5f4WhE7ds9gYw9AgpFPtSwcyWibD+Ylz4hoT5uOsiFpck
	nX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uFffxMZ1C9ZSYYWg7lRautOPIhxcBYL1ydYUkVULzOQ=;
	b=UgP0rrr0SHpGbcaPXghfUbmKRG0QGz5p3N47lJ6k5fWw3tmpaw//hZFfhO52Irx/JD
	3mgidc/URVql4BFg8lFnoXU4qmWybD/zk8ES/GDCbic7T5UWkksKCtHoZlkFr3DdteOU
	eGUlZ3bT8OKQZNsb7y9GkGPIhdaCItKinZbsZoHW1y+335hNnyf/g6rmg7V6/vzdkSiJ
	ijAUY/mHeRCpA45ylAed1nrOPOicDDrgG3R0p6NjW3ETljCpbJxwpxb64o8M6gkIMfkv
	2GARaL0UPXUh3YSJhHaYn13aziyeipTKqHNDoakc3XNeak5MlGckZ5dZsqf+9X36hz3T
	jg/w==
X-Gm-Message-State: AIkVDXJva6CukotUSUtzt4BbWfPisRD5zTmItWaBs+Z3mZA80fV9dtFimQOTdf18SXE/HQEh
X-Received: by 10.223.133.4 with SMTP id 4mr28496850wrh.176.1485257838944;
	Tue, 24 Jan 2017 03:37:18 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	a35sm19620413wra.21.2017.01.24.03.37.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 03:37:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jan 2017 11:37:13 +0000
Message-Id: <1485257833-4789-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-multimedia][PATCH] tremor: add (from oe-core)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2017 11:37:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../tremor/tremor/obsolete_automake_macros.patch   |  15 +++
 .../tremor/tremor/tremor-arm-thumb2.patch          | 104 +++++++++++++++++++++
 .../recipes-multimedia/tremor/tremor_20150107.bb   |  27 ++++++
 3 files changed, 146 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch
 create mode 100644 meta-multimedia/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
 create mode 100644 meta-multimedia/recipes-multimedia/tremor/tremor_20150107.bb

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch b/meta-multimedia/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch
new file mode 100644
index 0000000..7e51029
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Submitted [https://trac.xiph.org/ticket/1922]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+Index: configure.in
+===================================================================
+--- configure.in	(revision 18764)
++++ configure.in	(working copy)
+@@ -9,7 +9,7 @@
+ AC_CANONICAL_HOST
+ AC_CANONICAL_TARGET
+
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+
+ AM_INIT_AUTOMAKE(libvorbisidec,1.2.1)
diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch b/meta-multimedia/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
new file mode 100644
index 0000000..2049542
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
@@ -0,0 +1,104 @@
+From: Xin Ouyang <Xin.Ouyang@windriver.com>
+Date: Mon, 16 Jul 2012 13:29:34 +0800
+Subject: [PATCH] tremor: add IT instructions for arm thumb2 tune flags.
+
+Upstream-Status: Pending
+
+In Thumb-2, most instructions do not have a built in condition code (except for 
+conditional branches). Instead, short sequences of instructions which are to be 
+executed conditionally can be preceded by a special "IT instruction" which 
+describes the condition and which of the following instructions should be 
+executed if the condition is false respectively. 
+
+For the ARM/Thumb IT(If-Then) instruction:
+http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0489c/Cjabicci.html
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ asm_arm.h |   14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/asm_arm.h b/asm_arm.h
+index c3bda00..823c54f 100755
+--- a/asm_arm.h
++++ b/asm_arm.h
+@@ -108,9 +108,11 @@ static inline void XNPROD31(ogg_int32_t  a, ogg_int32_t  b,
+ static inline ogg_int32_t CLIP_TO_15(ogg_int32_t x) {
+   int tmp;
+   asm volatile("subs	%1, %0, #32768\n\t"
++	       "itt     pl\n\t"
+ 	       "movpl	%0, #0x7f00\n\t"
+ 	       "orrpl	%0, %0, #0xff\n"
+ 	       "adds	%1, %0, #32768\n\t"
++	       "it      mi\n\t"
+ 	       "movmi	%0, #0x8000"
+ 	       : "+r"(x),"=r"(tmp)
+ 	       :
+@@ -139,10 +141,12 @@ static inline void lsp_loop_asm(ogg_uint32_t *qip,ogg_uint32_t *pip,
+       
+       "ldmdb   r0!,{r1,r3};"
+       "subs    r1,r1,%4;"          //ilsp[j]-wi
++      "it      mi;"
+       "rsbmi   r1,r1,#0;"          //labs(ilsp[j]-wi)
+       "umull   %0,r2,r1,%0;"       //qi*=labs(ilsp[j]-wi)
+       
+       "subs    r1,r3,%4;"          //ilsp[j+1]-wi
++      "it      mi;"
+       "rsbmi   r1,r1,#0;"          //labs(ilsp[j+1]-wi)
+       "umull   %1,r3,r1,%1;"       //pi*=labs(ilsp[j+1]-wi)
+       
+@@ -167,6 +171,7 @@ static inline void lsp_loop_asm(ogg_uint32_t *qip,ogg_uint32_t *pip,
+       "mov     r0,#0x4000;\n"
+       
+       "subs    r1,r1,%4;\n"          //ilsp[j]-wi
++      "it      mi;\n"
+       "rsbmi   r1,r1,#0;\n"          //labs(ilsp[j]-wi)
+       "umull   %0,r2,r1,%0;\n"       //qi*=labs(ilsp[j]-wi)
+       "umull   %1,r3,r0,%1;\n"       //pi*=labs(ilsp[j+1]-wi)
+@@ -190,18 +195,23 @@ static inline void lsp_loop_asm(ogg_uint32_t *qip,ogg_uint32_t *pip,
+       "mov     r2,#0;"
+       "orr     r1,%0,%1;"
+       "tst     r1,#0xff000000;"
++      "itt     ne;"
+       "addne   r2,r2,#8;"
+       "movne   r1,r1,lsr #8;"
+       "tst     r1,#0x00f00000;"
++      "itt     ne;"
+       "addne   r2,r2,#4;"
+       "movne   r1,r1,lsr #4;"
+       "tst     r1,#0x000c0000;"
++      "itt     ne;"
+       "addne   r2,r2,#2;"
+       "movne   r1,r1,lsr #2;"
+       "tst     r1,#0x00020000;"
++      "itt     ne;"
+       "addne   r2,r2,#1;"
+       "movne   r1,r1,lsr #1;"
+       "tst     r1,#0x00010000;"
++      "it      ne;"
+       "addne   r2,r2,#1;"
+       "mov     %0,%0,lsr r2;"
+       "mov     %1,%1,lsr r2;"
+@@ -222,15 +232,19 @@ static inline void lsp_norm_asm(ogg_uint32_t *qip,ogg_int32_t *qexpp){
+   ogg_int32_t qexp=*qexpp;
+ 
+   asm("tst     %0,#0x0000ff00;"
++      "itt     eq;"
+       "moveq   %0,%0,lsl #8;"
+       "subeq   %1,%1,#8;"
+       "tst     %0,#0x0000f000;"
++      "itt     eq;"
+       "moveq   %0,%0,lsl #4;"
+       "subeq   %1,%1,#4;"
+       "tst     %0,#0x0000c000;"
++      "itt     eq;"
+       "moveq   %0,%0,lsl #2;"
+       "subeq   %1,%1,#2;"
+       "tst     %0,#0x00008000;"
++      "itt     eq;"
+       "moveq   %0,%0,lsl #1;"
+       "subeq   %1,%1,#1;"
+       : "+r"(qi),"+r"(qexp)
+-- 
+1.7.9.5
+
diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20150107.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20150107.bb
new file mode 100644
index 0000000..937894a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20150107.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Fixed-point decoder"
+DESCRIPTION = "tremor is a fixed point implementation of the vorbis codec."
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
+                    file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
+DEPENDS = "libogg"
+SRCDATE = "${PV}"
+PR = "r1"
+
+# SVN support for upstream version check isn't implemented yet
+RECIPE_UPSTREAM_VERSION = "20150107"
+RECIPE_UPSTREAM_DATE = "Jan 07, 2015"
+CHECK_DATE = "Aug 12, 2015"
+
+SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=19427;protocol=http \
+           file://obsolete_automake_macros.patch;striplevel=0 \
+           file://tremor-arm-thumb2.patch \
+"
+
+S = "${WORKDIR}/Tremor"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--enable-shared"
+
+ARM_INSTRUCTION_SET = "arm"
-- 
2.8.1


