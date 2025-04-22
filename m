Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13278C369D1
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 17:57:58 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.46955.1745344672540820081
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 10:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J+6zvpAQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac9aea656so6968867f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745344671; x=1745949471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1FeSp6sdwD88PkDWW1BYcKruL7+jx+V4iiF7YwrnmA=;
        b=J+6zvpAQfOlBxEjTPvdMYr1MLs1gbYZdfN1jnNP845vu3jZHZp4LOI77NHmvbHQ2BA
         Zgi7X1Koggie7k4UIgTTU596utDa3P8Oqc5ds4jDUYSR/9biNXA0wnckhCN1v66Tkexw
         ZGe1+/eaW96MDKQDB8FZUKwd0rncTjIpLitWABKrmym0X3syqMXS5uTlU32mja3u1sgl
         0go7wbuOmJfO/J7gxKXu5HAV78xQ6elJmJ/jkcr1nAxy3yO9mp+C/B8+IzqB5HeXri+P
         pkFzWzAHEyhBAglR5OjtvTGOF+R0yfJ4Yc76V8/lwqA+m+D/6NAlQcmABqBie6lXzTTT
         8ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344671; x=1745949471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1FeSp6sdwD88PkDWW1BYcKruL7+jx+V4iiF7YwrnmA=;
        b=Hm7UFHWUUXbn5WZpoAiPhOPBvckdee08hTwh5re3nit8H8LUCIdDvNMYi0/4BZSyTX
         56BSfTn/Iwqmymw5wPMgI7rm7KhfFtSCt3HBhwQL+RdgvYkKYPX1wZ41gEdDkfKw1bN5
         KOdzw+6d5mdqyeHQ0BAYFCXSNcT3/YJgTa6YJzbSNXnj5gAEFsWnl7HaH726LLLRBcLu
         OhuLXfGjVpa4UxbGB7SrImzyNG8tHWJTNkCIObaJ55IkJOdca2ayiqV9gSa8PQpXW3cC
         1/MEqAQiPwHN/ocNG3bYx1VRlaZ/0LK6cURsV3Ti2qf7OdJVLoiBnTUCAM3ue9mQkQGd
         bU6w==
X-Gm-Message-State: AOJu0YxyjKLI1wQfBREqi+lxj/z1ngPaHhUHroKnyI4rOjQS5gkij6Gt
	YWfr1HQIlyKMETvRTRrljbLiJynnBbA8IF0MbUXohpEo4esG1aaw+NAXGjl7
X-Gm-Gg: ASbGncvWMMHHyhH+dXQ/PBAKp+2ZDo4TlP8k+3vnA8RbpymjeFTrT+wcK3/qFTYnocM
	PMUyypvZ00mAcC+V5rQyJMK5A+0hwvxKw4wwxQwzjywqaWwqk9axJR/ePxlcJqNCiM+Gmt23o9W
	7WDzEnbiQNxP7XXMCZZ5Gx9IPzGOg9uldKFHKtdEfqfMCFDouBbhK+9g6GQELO+5AEszjwY2+k4
	eaYhIgTpLA6/1kMLnmp+4JlygOW3EFuzeaIZTf4Lo1QyniGyTLKlGM7EJso/2w8jze13D/pgbv2
	JY6k0dS6qDkM/FOpnlqrMj9D2SlSywHDyjR7gAYYznDt9t0ITGgprKkDQgk7HxofDtzfYpRpQA=
	=
X-Google-Smtp-Source: AGHT+IE4hSmca5iJwcs+kiS8HIKUZswhyu+JPerZsLsdhSCl9RZ853qNSH2k5R0C+h5cbX7Rv/BABQ==
X-Received: by 2002:a05:6000:178c:b0:391:1458:2233 with SMTP id ffacd0b85a97d-39efba2beafmr12966922f8f.11.1745344670898;
        Tue, 22 Apr 2025 10:57:50 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43bf09sm15777827f8f.44.2025.04.22.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:57:50 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 4/6] cups-filters: fix build with gcc-15
Date: Tue, 22 Apr 2025 19:57:40 +0200
Message-ID: <20250422175742.786560-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422175742.786560-1-martin.jansa@gmail.com>
References: <20250422175742.786560-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117064

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/852846/

../cups-filters-2.0.0/filter/foomatic-rip/pdf.c:79:32: error: passing argument 2 of 'start_process' from incompatible pointer type [-Wincompatible-pointer-types]
   79 |   kid3 = start_process("kid3", exec_kid3, (void *)cmd, NULL, NULL);
      |                                ^~~~~~~~~
      |                                |
      |                                int (*)(FILE *, FILE *, void *)
In file included from ../cups-filters-2.0.0/filter/foomatic-rip/pdf.c:16:
../cups-filters-2.0.0/filter/foomatic-rip/process.h:21:45: note: expected 'int (*)(void)' but argument is of type 'int (*)(FILE *, FILE *, void *)'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...uild-failure-with-GCC-15-and-std-c23.patch | 28 +++++++++++++++++++
 .../cups/cups-filters_2.0.0.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/0001-Fix-build-failure-with-GCC-15-and-std-c23.patch

diff --git a/meta-oe/recipes-printing/cups/cups-filters/0001-Fix-build-failure-with-GCC-15-and-std-c23.patch b/meta-oe/recipes-printing/cups/cups-filters/0001-Fix-build-failure-with-GCC-15-and-std-c23.patch
new file mode 100644
index 0000000000..7165593608
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters/0001-Fix-build-failure-with-GCC-15-and-std-c23.patch
@@ -0,0 +1,28 @@
+From a31812e179f24f71199e7b1c823ecd212f10472f Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Fri, 24 Jan 2025 09:44:58 +0100
+Subject: [PATCH] Fix build failure with GCC 15 and -std=c23
+
+The newest standard has more strict data type checks, function pointers
+in function prototypes have to declare data types of its arguments.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups-filters/commit/9871a50b5c1f9c2caa2754aac1f5db70c886021b]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ filter/foomatic-rip/process.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/filter/foomatic-rip/process.h b/filter/foomatic-rip/process.h
+index f6e15f6..54a4292 100644
+--- a/filter/foomatic-rip/process.h
++++ b/filter/foomatic-rip/process.h
+@@ -18,7 +18,7 @@
+ #include <sys/wait.h>
+ 
+ 
+-pid_t start_process(const char *name, int (*proc_func)(), void *user_arg,
++pid_t start_process(const char *name, int (*proc_func)(FILE*, FILE*, void*), void *user_arg,
+ 		    FILE **fdin, FILE **fdout);
+ pid_t start_system_process(const char *name, const char *command, FILE **fdin,
+ 			   FILE **fdout);
diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
index ff4ed16794..0886e7061b 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
@@ -8,6 +8,7 @@ DEPENDS = "libcupsfilters libppd glib-2.0 poppler"
 SRC_URI = " \
 	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
 	file://fix-make-race.patch \
+        file://0001-Fix-build-failure-with-GCC-15-and-std-c23.patch \
 "
 SRC_URI[sha256sum] = "b5152e3dd148ed73835827ac2f219df7cf5808dbf9dbaec2aa0127b44de800d8"
 

