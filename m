Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D49E7AD55
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:51:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137508.1766667106223731531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+RnRzka;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so67436915e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766667104; x=1767271904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9msYJH7qhc3a6mSMK6ia0zQ1pXFpJlB7cLOPnlxTDag=;
        b=k+RnRzkanGVsiM2HQlMc9dydSQSX+bHJ5Cn5U/ez5pFT+C4YK1thecuVobSGKa5n/H
         VYlY2sMeMuATXhWEWj+KOKv5VyR1tPbOd7UZizZ18cLgYe89d41YafnLcuOj1eweHmMm
         MQbQkQySTaAA3FTxgbq8hOU2Vc2M52QaJdbJfgtFNE/fhvJsIjE7pSnFJ1uTdIGfs+aa
         OkbXehB7sqEm7Ar58iifl31BU+Ot40LWNcVN+79h8xXMGLc59COPPl5mNnIWtuKeunYa
         h5q/qa1pmkT4YdAzSXar0K6bDSOQ4OB258MWFfwpNl6CX6r56E7RIgk92ru6A3DUzE05
         wuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766667104; x=1767271904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9msYJH7qhc3a6mSMK6ia0zQ1pXFpJlB7cLOPnlxTDag=;
        b=PT8bPKgOTRfR+F4Q8+bjY4krpq9atw4TQuk0Mrs9A+fcL74THFuvPo6kSv75077L6L
         mfuHexFRkeyRFw2UyhaFdDmAlzG+LAacDy19VDAOwiHOSC30TvqUjsylVUxXxz8T2es3
         UYasE+MrnUxyXjUZewEdX2tctHWCHbDUcgTh6SE71Lx2mHyEIfVB6ZF3k4PmAXptHKBr
         hSwAhmud3dR8CE6sqjlOT7DtyTwcaJuPcxy3F8NNsupeJcCvAt+32bUT0jvLZVJLmIVx
         Kw8lTc6yjS2EkKbQhUjUIK1ohHkRVIjrK+X1Rrme9IOmPvBDvSW3FPwIuCFXkWbieQZr
         ZdWw==
X-Gm-Message-State: AOJu0YxzQWnrRL4JyK1x7gksWvHO5eFf5v8KzzkGzmV2C2nwPaJEmsZb
	t6a3Mf+sdqieUlK+TKLDVbZ9oBrk7Y5T5ExWrrE4u/AwY6b5m+KdtNnwoDA54A==
X-Gm-Gg: AY/fxX5XOMkBl3p01IgHwTldKzc7umUTJIT13EGP6AFNihTHyDuUeaHz5KvrRaN4JbQ
	gH7/QbxAulyFWhOJB6JlZVRNJ7vDP/g/kowU4oSKDTeaNbDLDMbP4KctPy2TmsIwaZ7WXT+GsFj
	gxizHb2CYMmIYAyg4FhHCCxQyzIkITzHbJ6ti3FWjXTT+FDKPEAA6ANkxt7Ic0HVhFwwH64EtNU
	Arg9sA0SrIkZhq/nV7XQSFCO1oK4UFur3oCiexT/iaVWEnB7Qkc5FvGaBnH4lRBiX4ijTARjYW3
	7tm4yG+xzpA2fcStJ2s27myvgH2jihVybuvEW3ZxlCnzSaAWu/xnCEBc771fY4zTAO/DvxBlUMN
	EbccN1yeoUyo68MCzvKsfxTI0zD8BWRjku8ycIa+DbFrUjWZ8V3dCJLplJEvSTp0yQf9HTCuq/J
	gP9aMKukB1
X-Google-Smtp-Source: AGHT+IE/X8XWyXGHgjN5fXGWCwXEtNOa2VFWOxjdQS6LMFKx2n2zlArEJo8IehYBfDV4RaPcvwu1CQ==
X-Received: by 2002:a05:6000:2305:b0:431:808:2d49 with SMTP id ffacd0b85a97d-4324e4c6fbfmr20969374f8f.8.1766667104473;
        Thu, 25 Dec 2025 04:51:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm40219073f8f.20.2025.12.25.04.51.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:51:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 7/8] cups-filters: patch CVE-2023-24805
Date: Thu, 25 Dec 2025 13:51:38 +0100
Message-ID: <20251225125139.2436941-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225125139.2436941-1-skandigraun@gmail.com>
References: <20251225125139.2436941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122919

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-24805

Pick the patch referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-printing/cups/cups-filters.inc    |   1 +
 .../cups/cups-filters/CVE-2023-24805.patch    | 213 ++++++++++++++++++
 2 files changed, 214 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2023-24805.patch

diff --git a/meta-oe/recipes-printing/cups/cups-filters.inc b/meta-oe/recipes-printing/cups/cups-filters.inc
index fe87ac98ae..ddd6451ccc 100644
--- a/meta-oe/recipes-printing/cups/cups-filters.inc
+++ b/meta-oe/recipes-printing/cups/cups-filters.inc
@@ -12,6 +12,7 @@ DEPENDS:class-native = "poppler-native glib-2.0-native dbus-native pkgconfig-nat
 SRC_URI = "http://openprinting.org/download/cups-filters/cups-filters-${PV}.tar.gz \
            file://CVE-2025-57812.patch \
            file://CVE-2025-64524.patch \
+           file://CVE-2023-24805.patch \
            "
 
 inherit autotools-brokensep gettext pkgconfig
diff --git a/meta-oe/recipes-printing/cups/cups-filters/CVE-2023-24805.patch b/meta-oe/recipes-printing/cups/cups-filters/CVE-2023-24805.patch
new file mode 100644
index 0000000000..fd8ef7b806
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters/CVE-2023-24805.patch
@@ -0,0 +1,213 @@
+From c90dcbd2887c1221a1c298c7a194b1d93ed0e501 Mon Sep 17 00:00:00 2001
+From: Till Kamppeter <till.kamppeter@gmail.com>
+Date: Wed, 17 May 2023 11:12:37 +0200
+Subject: [PATCH] Merge pull request from GHSA-gpxc-v2m8-fr3x
+
+* beh backend: Use execv() instead of system() - CVE-2023-24805
+
+With execv() command line arguments are passed as separate strings and
+not the full command line in a single string. This prevents arbitrary
+command execution by escaping the quoting of the arguments in a job
+with forged job title.
+
+* beh backend: Extra checks against odd/forged input - CVE-2023-24805
+
+- Do not allow '/' in the scheme of the URI (= backend executable
+  name), to assure that only backends inside /usr/lib/cups/backend/
+  are used.
+
+- Pre-define scheme buffer to empty string, to be defined for case of
+  uri being NULL.
+
+- URI must have ':', to split off scheme, otherwise error.
+
+- Check return value of snprintf() to create call path for backend, to
+  error out on truncation of a too long scheme or on complete failure
+  due to a completely odd scheme.
+
+* beh backend: Further improvements - CVE-2023-24805
+
+- Use strncat() instead of strncpy() for getting scheme from URI, the latter
+  does not require setting terminating zero byte in case of truncation.
+
+- Also exclude "." or ".." as scheme, as directories are not valid CUPS
+  backends.
+
+- Do not use fprintf() in sigterm_handler(), to not interfere with a
+  fprintf() which could be running in the main process when
+  sigterm_handler() is triggered.
+
+- Use "static volatile int" for global variable job_canceled.
+
+CVE: CVE-2023-24805
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups-filters/commit/8f274035756c04efeb77eb654e9d4c4447287d65]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ backend/beh.c | 107 +++++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 83 insertions(+), 24 deletions(-)
+
+diff --git a/backend/beh.c b/backend/beh.c
+index 225fd27..e864c22 100644
+--- a/backend/beh.c
++++ b/backend/beh.c
+@@ -22,12 +22,13 @@
+ #include "backend-private.h"
+ #include <cups/array.h>
+ #include <ctype.h>
++#include <sys/wait.h>
+ 
+ /*
+  * Local globals...
+  */
+ 
+-static int		job_canceled = 0; /* Set to 1 on SIGTERM */
++static volatile int	job_canceled = 0; /* Set to 1 on SIGTERM */
+ 
+ /*
+  * Local functions...
+@@ -213,20 +214,43 @@ call_backend(char *uri,                 /* I - URI of final destination */
+ 	     char **argv,		/* I - Command-line arguments */
+ 	     char *filename) {          /* I - File name of input data */
+   const char	*cups_serverbin;	/* Location of programs */
++  char		*backend_argv[8];	/* Arguments for called CUPS backend */
+   char		scheme[1024],           /* Scheme from URI */
+                 *ptr,			/* Pointer into scheme */
+-		cmdline[65536];		/* Backend command line */
+-  int           retval;
++		backend_path[2048];	/* Backend path */
++  int		pid,
++		wait_pid,
++		wait_status,
++		retval = 0;
++  int		bytes;
+ 
+  /*
+   * Build the backend command line...
+   */
+ 
+-  strncpy(scheme, uri, sizeof(scheme) - 1);
+-  if (strlen(uri) > 1023)
+-    scheme[1023] = '\0';
++  scheme[0] = '\0';
++  strncat(scheme, uri, sizeof(scheme) - 1);
+   if ((ptr = strchr(scheme, ':')) != NULL)
+     *ptr = '\0';
++  else
++  {
++    fprintf(stderr,
++           "ERROR: beh: Invalid URI, no colon (':') to mark end of scheme part.\n");
++    exit (CUPS_BACKEND_FAILED);
++  }
++  if (strchr(scheme, '/'))
++  {
++    fprintf(stderr,
++           "ERROR: beh: Invalid URI, scheme contains a slash ('/').\n");
++    exit (CUPS_BACKEND_FAILED);
++  }
++  if (!strcmp(scheme, ".") || !strcmp(scheme, ".."))
++  {
++    fprintf(stderr,
++           "ERROR: beh: Invalid URI, scheme (\"%s\") is a directory.\n",
++           scheme);
++    exit (CUPS_BACKEND_FAILED);
++  }
+ 
+   if ((cups_serverbin = getenv("CUPS_SERVERBIN")) == NULL)
+     cups_serverbin = CUPS_SERVERBIN;
+@@ -235,16 +259,26 @@ call_backend(char *uri,                 /* I - URI of final destination */
+     fprintf(stderr,
+ 	    "ERROR: beh: Direct output into a file not supported.\n");
+     exit (CUPS_BACKEND_FAILED);
+-  } else
+-    snprintf(cmdline, sizeof(cmdline),
+-	     "%s/backend/%s '%s' '%s' '%s' '%s' '%s' %s",
+-	     cups_serverbin, scheme, argv[1], argv[2], argv[3],
+-	     /* Apply number of copies only if beh was called with a
+-		file name and not with the print data in stdin, as
+-	        backends should handle copies only if they are called
+-	        with a file name */
+-	     (argc == 6 ? "1" : argv[4]),
+-	     argv[5], filename);
++  } 
++
++  backend_argv[0] = uri;
++  backend_argv[1] = argv[1];
++  backend_argv[2] = argv[2];
++  backend_argv[3] = argv[3];
++  backend_argv[4] = (argc == 6 ? "1" : argv[4]);
++  backend_argv[5] = argv[5];
++  backend_argv[6] = filename;
++  backend_argv[7] = NULL;
++
++  bytes = snprintf(backend_path, sizeof(backend_path),
++                  "%s/backend/%s", cups_serverbin, scheme);
++  if (bytes < 0 || bytes >= sizeof(backend_path))
++  {
++    fprintf(stderr,
++           "ERROR: beh: Invalid scheme (\"%s\"), could not determing backend path.\n",
++           scheme);
++    exit (CUPS_BACKEND_FAILED);
++  }
+ 
+  /*
+   * Overwrite the device URI and run the actual backend...
+@@ -253,17 +287,40 @@ call_backend(char *uri,                 /* I - URI of final destination */
+   setenv("DEVICE_URI", uri, 1);
+ 
+   fprintf(stderr,
+-	  "DEBUG: beh: Executing backend command line \"%s\"...\n",
+-	  cmdline);
++         "DEBUG: beh: Executing backend command line \"%s '%s' '%s' '%s' '%s' '%s'%s%s\"...\n",
++         backend_path, backend_argv[1], backend_argv[2], backend_argv[3],
++         backend_argv[4], backend_argv[5],
++         (backend_argv[6] && backend_argv[6][0] ? " " : ""),
++         (backend_argv[6] && backend_argv[6][0] ? backend_argv[6] : ""));
+   fprintf(stderr,
+ 	  "DEBUG: beh: Using device URI: %s\n",
+ 	  uri);
+ 
+-  retval = system(cmdline) >> 8;
++  if ((pid = fork()) == 0)
++  {
++    retval = execv(backend_path, backend_argv);
++    if (retval == -1)
++      fprintf(stderr, "ERROR: Unable to execute backend: %s\n",
++             strerror(errno));
++    exit (CUPS_BACKEND_FAILED);
++  }
++  else if (pid < 0)
++  {
++    fprintf(stderr, "ERROR: Unable to fork for backend\n");
++    return (CUPS_BACKEND_FAILED);
++  }
++
++  while ((wait_pid = wait(&wait_status)) < 0 && errno == EINTR);
+ 
+-  if (retval == -1)
+-    fprintf(stderr, "ERROR: Unable to execute backend command line: %s\n",
+-	    strerror(errno));
++  if (wait_pid >= 0 && wait_status)
++  {
++    if (WIFEXITED(wait_status))
++      retval = WEXITSTATUS(wait_status);
++    else if (WTERMSIG(wait_status) != SIGTERM)
++      retval = WTERMSIG(wait_status);
++    else
++      retval = 0;
++  }
+ 
+   return (retval);
+ }
+@@ -277,8 +334,10 @@ static void
+ sigterm_handler(int sig) {		/* I - Signal number (unused) */
+   (void)sig;
+ 
+-  fprintf(stderr,
+-	  "DEBUG: beh: Job canceled.\n");
++  const char * const msg = "DEBUG: beh: Job canceled.\n";
++  // The if() is to eliminate the return value and silence the warning
++  // about an unused return value.
++  if (write(2, msg, strlen(msg)));
+ 
+   if (job_canceled)
+     _exit(CUPS_BACKEND_OK);

