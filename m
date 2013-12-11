Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB956DD28
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Dec 2013 20:07:54 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id x13so5619899qcv.15
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Dec 2013 12:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=JSmUJX+VNusBr7hxC8CJqOINgB/54w5uxxHdEtjPZjY=;
	b=Tb97CC90q16LaubJ1B1KpbTcgyK9bz5sakSc6ZaVopf+iUEaY9o8OLKJgs1NUDkLh4
	cPYHbLqwdJ8rW2qmscDndVzwVc1pAe0P1C90eSIxI3fyesIkPzEOJfmSHvkBb5MgDm0r
	3yzizBvvIlzJ1L2682z5+3mesAsG1mjikAILs7KndsuxboqnraFIvVJfi8A48rAw0T5p
	ubCvPkRwRMM92rkiVFYh/5v2vWwKVVng+vdPMpzwx5iyF0RfOxI5J0YJ3/Jicp/RG103
	VlXV8o2P3pwEZw+0/4XckOcR+g6VkbHPSPbYXfAsCzxDB6x62Vczjz8WB1+LERXEBgba
	Cu9A==
X-Received: by 10.49.28.101 with SMTP id a5mr6076114qeh.70.1386792472970;
	Wed, 11 Dec 2013 12:07:52 -0800 (PST)
Received: from localhost.localdomain
	(pool-108-44-82-190.ronkva.east.verizon.net. [108.44.82.190])
	by mx.google.com with ESMTPSA id c1sm24540100qad.1.2013.12.11.12.07.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Dec 2013 12:07:52 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Dec 2013 15:07:49 -0500
Message-Id: <1386792469-1451-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH] mcpp : Add recipe. mcpp is a c/c++ preprocessor.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Dec 2013 20:07:55 -0000

Includes a patch from Zeroc to help with ice builds.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch | 208 +++++++++++++++++++++
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb        |  19 ++
 2 files changed, 227 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
 create mode 100644 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb

diff --git a/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch b/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
new file mode 100644
index 0000000..8103cf0
--- /dev/null
+++ b/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
@@ -0,0 +1,208 @@
+diff -r -c -N ../mcpp-2.7.2-old/noconfig/vc2010.dif ./noconfig/vc2010.dif
+*** ../mcpp-2.7.2-old/noconfig/vc2010.dif	Wed Dec 31 20:30:00 1969
+--- ./noconfig/vc2010.dif	Fri May 14 12:47:22 2010
+***************
+*** 0 ****
+--- 1,67 ----
++ *** noconfig.H	Thu Sep 25 15:34:56 2008
++ --- noconfig.H.vc2005	Thu Sep 25 17:23:49 2008
++ ***************
++ *** 15,21 ****
++    */
++   
++   /* Define target operating-system.  */
++ ! #define SYSTEM              SYS_FREEBSD
++   
++   /* Define target compiler.          */
++   #ifndef COMPILER
++ --- 15,21 ----
++    */
++   
++   /* Define target operating-system.  */
++ ! #define SYSTEM              SYS_WIN32
++   
++   /* Define target compiler.          */
++   #ifndef COMPILER
++ ***************
++ *** 26,36 ****
++   #define HOST_SYSTEM         SYSTEM
++   
++   /* Define host compiler.            */
++ ! #define HOST_COMPILER       GNUC
++   
++   /* Version message.                 */
++   /* "MCPP V.2.* (200y/mm) compiled by " precedes VERSION_MSG */
++ ! #define VERSION_MSG         "GCC 3.4"
++   #if     0
++       "LCC-Win32 2006-03"
++       "Visual C 2005"
++ --- 26,36 ----
++   #define HOST_SYSTEM         SYSTEM
++   
++   /* Define host compiler.            */
++ ! #define HOST_COMPILER       MSC
++   
++   /* Version message.                 */
++   /* "MCPP V.2.* (200y/mm) compiled by " precedes VERSION_MSG */
++ ! #define VERSION_MSG         "Visual C 2010"
++   #if     0
++       "LCC-Win32 2006-03"
++       "Visual C 2005"
++ ***************
++ *** 212,221 ****
++   #define ONE_PASS            TRUE
++   #endif
++   #define COMPILER_EXT        "_MSC_VER"
++ ! #define COMPILER_EXT_VAL    "1500"      /* VC 6.0: "1200"   */
++       /* VC 2002: "1300", VC 2003: "1310", VC 2005: "1400", VC 2008: "1500"   */
++   #define COMPILER_EXT2       "_MSC_FULL_VER"
++ ! #define COMPILER_EXT2_VAL   "150021022" /* VC 6.0: "12008804"       */
++       /* VC 2002: "13009466", VC 2003: "13103077", VC 2005: "140050320"       */
++       /* VC 2008: "150021022" */
++   #define COMPILER_SP1        "_MSC_EXTENSIONS"
++ --- 212,221 ----
++   #define ONE_PASS            TRUE
++   #endif
++   #define COMPILER_EXT        "_MSC_VER"
++ ! #define COMPILER_EXT_VAL    "1600"      /* VC 6.0: "1200"   */
++       /* VC 2002: "1300", VC 2003: "1310", VC 2005: "1400", VC 2008: "1500"   */
++   #define COMPILER_EXT2       "_MSC_FULL_VER"
++ ! #define COMPILER_EXT2_VAL   "160030319" /* VC 6.0: "12008804"       */
++       /* VC 2002: "13009466", VC 2003: "13103077", VC 2005: "140050320"       */
++       /* VC 2008: "150021022" */
++   #define COMPILER_SP1        "_MSC_EXTENSIONS"
+diff -r -c -N ../mcpp-2.7.2-old/src/internal.H ./src/internal.H
+*** ../mcpp-2.7.2-old/src/internal.H	Wed Aug 27 10:31:16 2008
+--- ./src/internal.H	Fri May 14 12:40:56 2010
+***************
+*** 390,395 ****
+--- 390,397 ----
+  extern char     identifier[];       /* Lastly scanned name          */
+  extern IFINFO   ifstack[];          /* Information of #if nesting   */
+  extern char     work_buf[];
++ extern FILEINFO * sh_file;
++ extern int      sh_line;
+          /* Temporary buffer for directive line and macro expansion  */
+  
+  /* main.c   */
+***************
+*** 557,562 ****
+  #endif
+  #endif
+  
+! #if HOST_HAVE_STPCPY
+  extern char *   stpcpy( char * dest, const char * src);
+  #endif
+--- 559,564 ----
+  #endif
+  #endif
+  
+! #if HOST_HAVE_STPCPY && !defined(stpcpy)
+  extern char *   stpcpy( char * dest, const char * src);
+  #endif
+diff -r -c -N ../mcpp-2.7.2-old/src/main.c ./src/main.c
+*** ../mcpp-2.7.2-old/src/main.c	Wed Nov  5 05:04:46 2008
+--- ./src/main.c	Fri May 14 12:40:56 2010
+***************
+*** 326,331 ****
+--- 326,333 ----
+              = FALSE;
+      option_flags.trig = TRIGRAPHS_INIT;
+      option_flags.dig = DIGRAPHS_INIT;
++     sh_file = NULL;
++     sh_line = 0;
+  }
+  
+  int     mcpp_lib_main
+diff -r -c -N ../mcpp-2.7.2-old/src/support.c ./src/support.c
+*** ../mcpp-2.7.2-old/src/support.c	Tue Jun 10 06:02:33 2008
+--- ./src/support.c	Fri May 14 12:40:56 2010
+***************
+*** 188,194 ****
+      size_t      length
+  )
+  {
+!     if (mem_buf_p->bytes_avail < length) {  /* Need to allocate more memory */
+          size_t size = MAX( BUF_INCR_SIZE, length);
+  
+          if (mem_buf_p->buffer == NULL) {            /* 1st append   */
+--- 188,194 ----
+      size_t      length
+  )
+  {
+!     if (mem_buf_p->bytes_avail < length + 1) {  /* Need to allocate more memory */
+          size_t size = MAX( BUF_INCR_SIZE, length);
+  
+          if (mem_buf_p->buffer == NULL) {            /* 1st append   */
+***************
+*** 1722,1727 ****
+--- 1722,1729 ----
+                      sp -= 2;
+                      while (*sp != '\n')     /* Until end of line    */
+                          mcpp_fputc( *sp++, OUT);
++                     mcpp_fputc( '\n', OUT);
++                     wrong_line = TRUE;
+                  }
+                  goto  end_line;
+              default:                        /* Not a comment        */
+diff -r -c -N ../mcpp-2.7.2-old/src/system.c ./src/system.c
+*** ../mcpp-2.7.2-old/src/system.c      2008-11-26 10:53:51.000000000 +0100
+--- ./src/system.c      2011-02-21 16:18:05.678058106 +0100
+***************
+*** 3534,3539 ****
+--- 3534,3565 ----
+      FILEINFO *      file;
+      const char *    too_many_include_nest =
+              "More than %.0s%ld nesting of #include";    /* _F_ _W4_ */
++             
++     //
++     // When encoding is UTF-8, skip BOM if present.
++     //
++     if(mbchar == UTF8 && fp != NULL && ftell(fp) == 0)
++     {
++         const unsigned char UTF8_BOM[3] = {0xEF, 0xBB, 0xBF};
++         unsigned char FILE_HEAD[3] = {0, 0, 0};
++         int i;
++         for(i = 0; i < 3; ++i)
++         {
++             FILE_HEAD[i] = getc(fp);
++             if(FILE_HEAD[i] != UTF8_BOM[i])
++             {
++                 if(FILE_HEAD[i] == (unsigned char)EOF)
++                 {
++                     i--;
++                 }
++                 for(; i >= 0; --i)
++                 {
++                     ungetc(FILE_HEAD[i], fp);
++                 }
++                 break;
++             }
++         }
++     }
+  
+      filename = set_fname( filename);    /* Search or append to fnamelist[]  */
+      fullname = set_fname( fullname);    /* Search or append to fnamelist[]  */
+***************
+*** 3858,3863 ****
+--- 3884,3892 ----
+  }
+  #endif
+  
++ FILEINFO*       sh_file;
++ int             sh_line;
++ 
+  void    sharp(
+      FILEINFO *  sharp_file,
+      int         flag        /* Flag to append to the line for GCC   */
+***************
+*** 3868,3875 ****
+   * else (i.e. 'sharp_file' is NULL) 'infile'.
+   */
+  {
+-     static FILEINFO *   sh_file;
+-     static int  sh_line;
+      FILEINFO *  file;
+      int         line;
+  
+--- 3897,3902 ----
diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
new file mode 100644
index 0000000..6a635c5
--- /dev/null
+++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "MCPP is a portable C/C++ preprocessor"
+HOMEPAGE = "http://mcpp.sourceforge.net/"
+LICENSE = "BSD"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+           file://ice-mcpp.patch "
+
+inherit autotools
+
+EXTRA_OECONF = " --enable-mcpplib "
+
+BBCLASSEXTEND = "native nativesdk"
+
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ca370b75ec890321888a00cea9bc1d5"
+
+
+SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05"
+SRC_URI[sha256sum] = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
-- 
1.8.3.1


