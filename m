Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id B830A6FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 15:56:39 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id c10so75005036pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 07:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=QlOSFQbYGV+81TuzGk67qoQN943zQ0rKC1lKNcLLiuo=;
	b=OGjNl6sBFVdfr6jIX65CTrPbqtMDbshHSHDSt9ur4eOoDXOSD5w7wr3+uEWXdbUDpf
	F0jnWQl5eFcaCskv/eyLxlY+BemW3kGGyA1SdwEYqVfCHCMuGBovOJleDe+9zZEQq4ca
	nhE5S1dI2gaZt7TAxYnWb5KIWOxpqDZvpKqmQ1L/S9OW0XcU8FfCNx46bOYBbj45yNMc
	+0M4YNDwQrEPPvVMJ3mXx99vpeGcyjpJ0QYTzaDKpJgctpPGtEx1MaTHL8Mpi7kCVH4V
	POkjwBzExdg/rygNuZQ6op+BmCXESvKSybN0C4BE1lvenRvXJNhNmAsGJ9cC1csMs4Py
	ZnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QlOSFQbYGV+81TuzGk67qoQN943zQ0rKC1lKNcLLiuo=;
	b=V+FZux6AmgczG2wEjqlW89G9SU+1Xgc23+Eo6dhWcjKccOkfRISUwhzw1Ol1w28TDk
	EvJ1jcOgr1GgmddZkjwzgpVJAv7EFWFA4OGiLPRTAhy4hPBJ5cXxNQjBshFC+IAhkDZB
	t8jBk2HRnK+pwq8Oj65gXiEjfi0HwhvpGo3wNeuV36ZNETcX3n0VFdCVpR6jnA/ikjwF
	XmnbYikEq2MgYwZO2tetXQKyLoXSiku726LcMC0xNOnlWwAA98GQv8Ok5K9JuwGDqSwA
	iWJgPbnaimsMTX5jP40wr60pBeUTuGeC4AM9x/a4csXzVWB+YJBsWtk+yCuc10Pialvp
	phVw==
X-Gm-Message-State: AG10YOR3Z+5BQELctoLshD59+LcrD2xYDZLxtBBQ5jlIlY2RtquszCL4evzO/6cIWtf0QA==
X-Received: by 10.98.68.212 with SMTP id m81mr17148709pfi.135.1455465400168;
	Sun, 14 Feb 2016 07:56:40 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 9sm32327235pfc.69.2016.02.14.07.56.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 07:56:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2016 07:56:33 -0800
Message-Id: <1455465393-9781-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][jethro][fido][PATCH] xdelta3: Security fix CVE-2014-9765
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
X-List-Received-Date: Sun, 14 Feb 2016 15:56:40 -0000

CVE-2014-9765 xdelta: buffer overflow in main_get_appheader

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xdelta/files/CVE-2014-9765.patch               | 311 +++++++++++++++++++++
 meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb    |   1 +
 2 files changed, 312 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdelta/files/CVE-2014-9765.patch

diff --git a/meta-oe/recipes-support/xdelta/files/CVE-2014-9765.patch b/meta-oe/recipes-support/xdelta/files/CVE-2014-9765.patch
new file mode 100644
index 0000000..572a3c0
--- /dev/null
+++ b/meta-oe/recipes-support/xdelta/files/CVE-2014-9765.patch
@@ -0,0 +1,311 @@
+From ef93ff74203e030073b898c05e8b4860b5d09ef2 Mon Sep 17 00:00:00 2001
+From: "josh.macdonald" <jmacd@users.noreply.github.com>
+Date: Sun, 12 Oct 2014 05:24:22 +0000
+Subject: [PATCH] Add appheader tests; fix buffer overflow in
+ main_get_appheader
+
+Upstream-Status: Backport
+
+This appears to be fixed in xdelta3 3.0.9 and later via
+https://github.com/jmacd/xdelta-devel/commit/ef93ff74203e030073b898c05e8b4860b5d09ef2
+
+CVE: CVE-2014-9765
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ xdelta3-main.h |   5 +-
+ xdelta3-test.h | 131 +++++++++++++++++++++++++++++++++++++++----------
+ 2 files changed, 108 insertions(+), 28 deletions(-)
+
+diff --git a/xdelta3-main.h b/xdelta3-main.h
+index 090b7d9..5146b38 100644
+--- a/xdelta3-main.h
++++ b/xdelta3-main.h
+@@ -2810,14 +2810,15 @@ main_get_appheader (xd3_stream *stream, main_file *ifile,
+ 
+   if (appheadsz > 0)
+     {
++      const int kMaxArgs = 4;
+       char *start = (char*)apphead;
+       char *slash;
+       int   place = 0;
+-      char *parsed[4];
++      char *parsed[kMaxArgs];
+ 
+       memset (parsed, 0, sizeof (parsed));
+ 
+-      while ((slash = strchr (start, '/')) != NULL)
++      while ((slash = strchr (start, '/')) != NULL && place < (kMaxArgs-1))
+ 	{
+ 	  *slash = 0;
+ 	  parsed[place++] = start;
+diff --git a/xdelta3-test.h b/xdelta3-test.h
+index e9848b6..0e10251 100644
+--- a/xdelta3-test.h
++++ b/xdelta3-test.h
+@@ -1,5 +1,5 @@
+ /* xdelta 3 - delta compression tools and library Copyright (C) 2001,
+- * 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012.  
++ * 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012.
+  * Joshua P. MacDonald
+  *
+  *  This program is free software; you can redistribute it and/or modify
+@@ -54,7 +54,7 @@ void mt_init(mtrand *mt, uint32_t seed) {
+     /* only MSBs of the array mt[].                        */
+     /* 2002/01/09 modified by Makoto Matsumoto             */
+     mt->mt_buffer_[i] =
+-	(1812433253UL * (mt->mt_buffer_[i-1] ^ 
++	(1812433253UL * (mt->mt_buffer_[i-1] ^
+ 			 (mt->mt_buffer_[i-1] >> 30)) + i);
+   }
+ }
+@@ -69,20 +69,20 @@ uint32_t mt_random (mtrand *mt) {
+     int kk;
+ 
+     for (kk = 0; kk < MT_LEN - MT_IA; kk++) {
+-      y = (mt->mt_buffer_[kk] & UPPER_MASK) | 
++      y = (mt->mt_buffer_[kk] & UPPER_MASK) |
+ 	(mt->mt_buffer_[kk + 1] & LOWER_MASK);
+-      mt->mt_buffer_[kk] = mt->mt_buffer_[kk + MT_IA] ^ 
++      mt->mt_buffer_[kk] = mt->mt_buffer_[kk + MT_IA] ^
+ 	(y >> 1) ^ mag01[y & 0x1UL];
+     }
+     for (;kk < MT_LEN - 1; kk++) {
+-      y = (mt->mt_buffer_[kk] & UPPER_MASK) | 
++      y = (mt->mt_buffer_[kk] & UPPER_MASK) |
+ 	(mt->mt_buffer_[kk + 1] & LOWER_MASK);
+-      mt->mt_buffer_[kk] = mt->mt_buffer_[kk + (MT_IA - MT_LEN)] ^ 
++      mt->mt_buffer_[kk] = mt->mt_buffer_[kk + (MT_IA - MT_LEN)] ^
+ 	(y >> 1) ^ mag01[y & 0x1UL];
+     }
+-    y = (mt->mt_buffer_[MT_LEN - 1] & UPPER_MASK) | 
++    y = (mt->mt_buffer_[MT_LEN - 1] & UPPER_MASK) |
+       (mt->mt_buffer_[0] & LOWER_MASK);
+-    mt->mt_buffer_[MT_LEN - 1] = mt->mt_buffer_[MT_IA - 1] ^ 
++    mt->mt_buffer_[MT_LEN - 1] = mt->mt_buffer_[MT_IA - 1] ^
+       (y >> 1) ^ mag01[y & 0x1UL];
+     mt->mt_index_ = 0;
+   }
+@@ -166,7 +166,7 @@ static int do_cmd (xd3_stream *stream, const char *buf)
+ 	{
+ 	  stream->msg = "abnormal command termination";
+ 	}
+-      return XD3_INTERNAL;
++      return ret;
+     }
+   return 0;
+ }
+@@ -257,8 +257,10 @@ int test_setup (void)
+ static int
+ test_make_inputs (xd3_stream *stream, xoff_t *ss_out, xoff_t *ts_out)
+ {
+-  usize_t ts = (mt_random (&static_mtrand) % TEST_FILE_MEAN) + TEST_FILE_MEAN / 2;
+-  usize_t ss = (mt_random (&static_mtrand) % TEST_FILE_MEAN) + TEST_FILE_MEAN / 2;
++  usize_t ts = (mt_random (&static_mtrand) % TEST_FILE_MEAN) +
++    TEST_FILE_MEAN / 2;
++  usize_t ss = (mt_random (&static_mtrand) % TEST_FILE_MEAN) +
++    TEST_FILE_MEAN / 2;
+   uint8_t *buf = (uint8_t*) malloc (ts + ss), *sbuf = buf, *tbuf = buf + ss;
+   usize_t sadd = 0, sadd_max = (usize_t)(ss * TEST_ADD_RATIO);
+   FILE  *tf = NULL, *sf = NULL;
+@@ -409,7 +411,7 @@ test_compare_files (const char* tgt, const char *rec)
+ 	{
+ 	  if (obuf[i] != rbuf[i])
+  	    {
+-	      XPR(NT "byte %u (read %u @ %"Q"u) %d != %d\n", 
++	      XPR(NT "byte %u (read %u @ %"Q"u) %d != %d\n",
+ 		  (int)i, (int)oc, offset, obuf[i], rbuf[i]);
+ 	      diffs++;
+ 	      return XD3_INTERNAL;
+@@ -421,7 +423,7 @@ test_compare_files (const char* tgt, const char *rec)
+ 
+     fclose (orig);
+     fclose (recons);
+-    if (diffs != 0) 
++    if (diffs != 0)
+       {
+ 	return XD3_INTERNAL;
+       }
+@@ -429,12 +431,12 @@ test_compare_files (const char* tgt, const char *rec)
+ }
+ 
+ static int
+-test_save_copy (const char *origname)
++test_copy_to (const char *from, const char *to)
+ {
+   char buf[TESTBUFSIZE];
+   int ret;
+ 
+-  snprintf_func (buf, TESTBUFSIZE, "cp -f %s %s", origname, TEST_COPY_FILE);
++  snprintf_func (buf, TESTBUFSIZE, "cp -f %s %s", from, to);
+ 
+   if ((ret = system (buf)) != 0)
+     {
+@@ -445,6 +447,12 @@ test_save_copy (const char *origname)
+ }
+ 
+ static int
++test_save_copy (const char *origname)
++{
++  return test_copy_to(origname, TEST_COPY_FILE);
++}
++
++static int
+ test_file_size (const char* file, xoff_t *size)
+ {
+   struct stat sbuf;
+@@ -499,7 +507,7 @@ test_read_integer_error (xd3_stream *stream, usize_t trunto, const char *msg)
+   inp = buf->base;
+   max = buf->base + buf->next - trunto;
+ 
+-  if ((ret = xd3_read_uint32_t (stream, & inp, max, & rval)) != 
++  if ((ret = xd3_read_uint32_t (stream, & inp, max, & rval)) !=
+       XD3_INVALID_INPUT ||
+       !MSG_IS (msg))
+     {
+@@ -1654,11 +1662,11 @@ test_compressed_stream_overflow (xd3_stream *stream, int ignore)
+   if ((buf = (uint8_t*) malloc (TWO_MEGS_AND_DELTA)) == NULL) { return ENOMEM; }
+ 
+   memset (buf, 0, TWO_MEGS_AND_DELTA);
+-  for (i = 0; i < (2 << 20); i += 256) 
++  for (i = 0; i < (2 << 20); i += 256)
+     {
+       int j;
+       int off = mt_random(& static_mtrand) % 10;
+-      for (j = 0; j < 256; j++) 
++      for (j = 0; j < 256; j++)
+ 	{
+ 	  buf[i + j] = j + off;
+ 	}
+@@ -1683,11 +1691,11 @@ test_compressed_stream_overflow (xd3_stream *stream, int ignore)
+     }
+ 
+   /* Test transfer of exactly 32bits worth of data. */
+-  if ((ret = test_streaming (stream, 
+-			     buf, 
+-			     buf + (1 << 20), 
+-			     buf + (2 << 20), 
+-			     1 << 12))) 
++  if ((ret = test_streaming (stream,
++			     buf,
++			     buf + (1 << 20),
++			     buf + (2 << 20),
++			     1 << 12)))
+     {
+       goto fail;
+     }
+@@ -1889,7 +1897,7 @@ test_recode_command2 (xd3_stream *stream, int has_source,
+     }
+ 
+   /* First encode */
+-  snprintf_func (ecmd, TESTBUFSIZE, "%s %s -f %s %s %s %s %s %s %s", 
++  snprintf_func (ecmd, TESTBUFSIZE, "%s %s -f %s %s %s %s %s %s %s",
+ 	    program_name, test_softcfg_str,
+ 	    has_adler32 ? "" : "-n ",
+ 	    has_apphead ? "-A=encode_apphead " : "-A= ",
+@@ -1910,7 +1918,7 @@ test_recode_command2 (xd3_stream *stream, int has_source,
+   snprintf_func (recmd, TESTBUFSIZE,
+ 	    "%s recode %s -f %s %s %s %s %s", program_name, test_softcfg_str,
+ 	    recoded_adler32 ? "" : "-n ",
+-	    !change_apphead ? "" : 
++	    !change_apphead ? "" :
+ 	        (recoded_apphead ? "-A=recode_apphead " : "-A= "),
+ 	    recoded_secondary ? "-S djw " : "-S none ",
+ 	    TEST_DELTA_FILE,
+@@ -2361,6 +2369,76 @@ test_no_output (xd3_stream *stream, int ignore)
+   return 0;
+ }
+ 
++/* This tests that the default appheader works */
++static int
++test_appheader (xd3_stream *stream, int ignore)
++{
++  int i;
++  int ret;
++  char buf[TESTBUFSIZE];
++  char bogus[TESTBUFSIZE];
++  xoff_t ssize, tsize;
++  test_setup ();
++
++  if ((ret = test_make_inputs (stream, &ssize, &tsize))) { return ret; }
++
++  snprintf_func (buf, TESTBUFSIZE, "%s -q -f -e -s %s %s %s", program_name,
++		 TEST_SOURCE_FILE, TEST_TARGET_FILE, TEST_DELTA_FILE);
++  if ((ret = do_cmd (stream, buf))) { return ret; }
++
++  if ((ret = test_copy_to (program_name, TEST_RECON2_FILE))) { return ret; }
++
++  snprintf_func (buf, TESTBUFSIZE, "chmod 0700 %s", TEST_RECON2_FILE);
++  if ((ret = do_cmd (stream, buf))) { return ret; }
++
++  if ((ret = test_save_copy (TEST_TARGET_FILE))) { return ret; }
++  if ((ret = test_copy_to (TEST_SOURCE_FILE, TEST_TARGET_FILE))) { return ret; }
++
++  if ((ret = test_compare_files (TEST_TARGET_FILE, TEST_COPY_FILE)) == 0)
++    {
++      return XD3_INVALID;  // I.e., files are different!
++    }
++
++  // Test that the target file is restored.
++  snprintf_func (buf, TESTBUFSIZE, "(cd /tmp && %s -q -f -d %s)",
++		 TEST_RECON2_FILE,
++		 TEST_DELTA_FILE);
++  if ((ret = do_cmd (stream, buf))) { return ret; }
++
++  if ((ret = test_compare_files (TEST_TARGET_FILE, TEST_COPY_FILE)) != 0)
++    {
++      return ret;
++    }
++
++  // Test a malicious string w/ entries > 4 in the appheader by having
++  // the encoder write it:
++  for (i = 0; i < TESTBUFSIZE / 4; ++i)
++    {
++      bogus[2*i] = 'G';
++      bogus[2*i+1] = '/';
++    }
++  bogus[TESTBUFSIZE/2-1] = 0;
++
++  snprintf_func (buf, TESTBUFSIZE, 
++		 "%s -q -f -A=%s -e -s %s %s %s", program_name, bogus,
++		 TEST_SOURCE_FILE, TEST_TARGET_FILE, TEST_DELTA_FILE);
++  if ((ret = do_cmd (stream, buf))) { return ret; }
++  // Then read it:
++  snprintf_func (buf, TESTBUFSIZE, "(cd /tmp && %s -q -f -d %s)",
++		 TEST_RECON2_FILE,
++		 TEST_DELTA_FILE);
++  if ((ret = do_cmd (stream, buf)) == 0) 
++    { 
++      return XD3_INVALID;  // Impossible
++    }
++  if (!WIFEXITED(ret))
++    {
++      return XD3_INVALID;  // Must have crashed!
++    }
++
++  return 0;
++}
++
+ /***********************************************************************
+  Source identical optimization
+  ***********************************************************************/
+@@ -2603,7 +2681,7 @@ test_string_matching (xd3_stream *stream, int ignore)
+ 	    default: CHECK(0);
+ 	    }
+ 
+-	  snprintf_func (rptr, rbuf+TESTBUFSIZE-rptr, "%d/%d", 
++	  snprintf_func (rptr, rbuf+TESTBUFSIZE-rptr, "%d/%d",
+ 			 inst->pos, inst->size);
+ 	  rptr += strlen (rptr);
+ 
+@@ -2848,6 +2926,7 @@ xd3_selftest (void)
+   DO_TEST (force_behavior, 0, 0);
+   DO_TEST (stdout_behavior, 0, 0);
+   DO_TEST (no_output, 0, 0);
++  DO_TEST (appheader, 0, 0);
+   DO_TEST (command_line_arguments, 0, 0);
+ 
+ #if EXTERNAL_COMPRESSION
+-- 
+2.3.5
+
diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
index baa92e4..2ddf78a 100644
--- a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
+++ b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SRC_URI = "http://xdelta.googlecode.com/files/${BPN}-${PV}.tar.xz \
            file://compilation-fix.patch \
            file://with-liblzma-configure-option.patch \
+           file://CVE-2014-9765.patch \
 "
 SRC_URI[md5sum] = "c3ae3286ce4193de8e03d5bcaccf3bc3"
 SRC_URI[sha256sum] = "3a86f29c95664fb44b8a40ff22d9bcc3e87aa8c01f0ff75931a7fa78ed3d2e55"
-- 
2.3.5


