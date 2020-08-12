Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.9425.1597214239156051056
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UObA+ZLf;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id 74so498502pfx.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3JFfnA6/A3tc5oS/wbgBxBBB+NdUqNiOkuB/O1hXz7w=;
        b=UObA+ZLfOHA8KzJ8Ooi1LsdxBQI6vng8jF0YYhIBGoP94TKdqfvJMFYdDvm2cDDGsI
         5ItejFTpoOBmjHc/r5u7VUuPojYJTzf6YCbHhcVxJHaNRQQsUKjOs5njQcdr2t43BNqe
         QPOfHZCui5VdJ8CzLFOA5eT/MmRSsjoFUsmHsWBbi2XT4/gO6D9iKEFpqPgwtax+CwhQ
         MzoOKTSn2d0ZS0gAg8KHx3W7w75xvSNWqNE+CowjPYkbKd38PTgLymtByHZcH6SxG3Jl
         8NDvsu1/hEd0sLzQZz4kqc4TZtnCKL3v2XB8+QROAg0OZ9prP2y0iqkzhYLiFswdpy/D
         Wl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3JFfnA6/A3tc5oS/wbgBxBBB+NdUqNiOkuB/O1hXz7w=;
        b=CCGjPM+M7Ac31xd4Q1NcBPQUibCoMitx20kZ6nkE1xfAHm9GvncZxh65m702FPN2mM
         hewVohyB0GhDicTreO5YUS83eZZE98YGfQs/JAq/RoNtIgu1a8eTs5vwFMqeTN86Tv1h
         V2R31wdmFUOG0KBWACdQaBWbo9+i5EaJeGUvI+GeNNCqn/IRKDEH/5oDi4w2dfMmx616
         EdqPMq2ziz3jehUY9QU7oGFfd8HrPmnzLvnXvS1+ccF0yEv8Row4HMHs7eVg7TX2uQty
         o1Ug6S7W3WaRcIEsvxC5e/ifTbkz2GGFIhgpGI8TkTM5GUGug42Wo2qrWMoUuBcK+zfH
         oZzw==
X-Gm-Message-State: AOAM533xhkPH9gM01nI7mLUv/O+OruYL5HUdVIXIwgPDsR/ABZBVyr+J
	R74Wfcjw3nRAGpoYxEfmghExE+TGsTU=
X-Google-Smtp-Source: ABdhPJw4Ou1Jphg8WEQQy8/63MDZR2vnjjZ/RU/2TuInYMdES4evPkldxO094LVvTEFdKAb6SCewsw==
X-Received: by 2002:a63:4181:: with SMTP id o123mr3723325pga.387.1597214238110;
        Tue, 11 Aug 2020 23:37:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id s67sm1187969pfs.117.2020.08.11.23.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:37:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 4/9] gensio: Upgrade to 2.1.4
Date: Tue, 11 Aug 2020 23:37:06 -0700
Message-Id: <20200812063711.2758315-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063711.2758315-1-raj.khem@gmail.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backported patch which is present in 2.1.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-Rename-some-variables-to-tr_stdxxx.patch | 108 ------------------
 .../{gensio_1.5.3.bb => gensio_2.1.4.bb}      |   4 +-
 2 files changed, 1 insertion(+), 111 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/gensio/gensio/0001-filter-Rename-some-variables-to-tr_stdxxx.patch
 rename meta-oe/recipes-connectivity/gensio/{gensio_1.5.3.bb => gensio_2.1.4.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio/0001-filter-Rename-some-variables-to-tr_stdxxx.patch b/meta-oe/recipes-connectivity/gensio/gensio/0001-filter-Rename-some-variables-to-tr_stdxxx.patch
deleted file mode 100644
index dbc48a2134..0000000000
--- a/meta-oe/recipes-connectivity/gensio/gensio/0001-filter-Rename-some-variables-to-tr_stdxxx.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 601e6e56f44b91d957bb643662455f52540f336a Mon Sep 17 00:00:00 2001
-From: Corey Minyard <cminyard@mvista.com>
-Date: Tue, 25 Feb 2020 16:08:40 -0600
-Subject: [PATCH] filter: Rename some variables to tr_stdxxx
-
-stdout and stderr can be macros, don't use the names directly.
-
-Signed-off-by: Corey Minyard <cminyard@mvista.com>
-Upstream-Status: Backport [https://github.com/cminyard/gensio/commit/601e6e56f44b91d957bb643662455f52540f336a]
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- lib/gensio_filter_trace.c | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/lib/gensio_filter_trace.c b/lib/gensio_filter_trace.c
-index d39d58b..abe2db6 100644
---- a/lib/gensio_filter_trace.c
-+++ b/lib/gensio_filter_trace.c
-@@ -32,8 +32,8 @@ struct trace_filter {
-     enum trace_dir dir;
-     bool raw;
-     char *filename;
--    bool stdout;
--    bool stderr;
-+    bool tr_stdout;
-+    bool tr_stderr;
- 
-     FILE *tr;
- };
-@@ -82,9 +82,9 @@ trace_try_connect(struct gensio_filter *filter, struct timeval *timeout)
- {
-     struct trace_filter *tfilter = filter_to_trace(filter);
- 
--    if (tfilter->stdout) {
-+    if (tfilter->tr_stdout) {
- 	tfilter->tr = stdout;
--    } else if (tfilter->stderr) {
-+    } else if (tfilter->tr_stderr) {
- 	tfilter->tr = stderr;
-     } else if (tfilter->filename) {
- 	tfilter->tr = fopen(tfilter->filename, "a+");
-@@ -99,7 +99,7 @@ trace_try_disconnect(struct gensio_filter *filter, struct timeval *timeout)
- {
-     struct trace_filter *tfilter = filter_to_trace(filter);
- 
--    if (!tfilter->stdout && !tfilter->stderr && tfilter->tr)
-+    if (!tfilter->tr_stdout && !tfilter->tr_stderr && tfilter->tr)
- 	fclose(tfilter->tr);
-     tfilter->tr = NULL;
-     return 0;
-@@ -331,12 +331,12 @@ static int gensio_trace_filter_func(struct gensio_filter *filter, int op,
- 
- static struct gensio_filter *
- gensio_trace_filter_raw_alloc(struct gensio_os_funcs *o, enum trace_dir dir,
--			      bool raw, const char *filename, bool stdout,
--			      bool stderr)
-+			      bool raw, const char *filename, bool tr_stdout,
-+			      bool tr_stderr)
- {
-     struct trace_filter *tfilter;
- 
--    if (!filename && !stdout && !stderr)
-+    if (!filename && !tr_stdout && !tr_stderr)
- 	dir = TRACE_NONE;
- 
-     tfilter = o->zalloc(o, sizeof(*tfilter));
-@@ -351,8 +351,8 @@ gensio_trace_filter_raw_alloc(struct gensio_os_funcs *o, enum trace_dir dir,
- 	if (!tfilter->filename)
- 	    goto out_nomem;
-     }
--    tfilter->stdout = stdout;
--    tfilter->stderr = stderr;
-+    tfilter->tr_stdout = tr_stdout;
-+    tfilter->tr_stderr = tr_stderr;
- 
-     tfilter->lock = o->alloc_lock(o);
-     if (!tfilter->lock)
-@@ -385,7 +385,7 @@ gensio_trace_filter_alloc(struct gensio_os_funcs *o,
- {
-     struct gensio_filter *filter;
-     int dir = TRACE_NONE;
--    bool raw = false, stdout = false, stderr = false;
-+    bool raw = false, tr_stdout = false, tr_stderr = false;
-     const char *filename = NULL;
-     unsigned int i;
- 
-@@ -396,15 +396,15 @@ gensio_trace_filter_alloc(struct gensio_os_funcs *o,
- 	    continue;
- 	if (gensio_check_keyvalue(args[i], "file", &filename) > 0)
- 	    continue;
--	if (gensio_check_keybool(args[i], "stdout", &stdout) > 0)
-+	if (gensio_check_keybool(args[i], "stdout", &tr_stdout) > 0)
- 	    continue;
--	if (gensio_check_keybool(args[i], "stderr", &stderr) > 0)
-+	if (gensio_check_keybool(args[i], "stderr", &tr_stderr) > 0)
- 	    continue;
- 	return GE_INVAL;
-     }
- 
-     filter = gensio_trace_filter_raw_alloc(o, dir, raw, filename,
--					   stdout, stderr);
-+					   tr_stdout, tr_stderr);
-     if (!filter)
- 	return GE_NOMEM;
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-connectivity/gensio/gensio_1.5.3.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.1.4.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/gensio/gensio_1.5.3.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.1.4.bb
index 8c97662df5..9d73da90d8 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_1.5.3.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.1.4.bb
@@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "95ec1ab31ee97411fc37156d12061adcf0331598"
-PV = "1.5.3+git${SRCPV}"
+SRCREV = "998a017076a86179696a3ad811e2bae9155e46cb"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https \
-           file://0001-filter-Rename-some-variables-to-tr_stdxxx.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.28.0

