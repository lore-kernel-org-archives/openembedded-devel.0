Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA1AC531CC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:46 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11220.1784859281323207141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DMp4rz7n;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1193904a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859281; x=1785464081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lR31YHRxiV0djHq1zIOUkgvXsVr6NGABConQhGGMo28=;
        b=DMp4rz7nSX//rrpy77lRFVQQ+rZ+J1wDm2FPPValTqF14D3a5si5Rt9HZMcPWjpxTz
         MIOp5ikMugggGCkewukHSUOUoI3UNtPycVo8mytcO+noPOYRGOsrf78gloutrkZ13xZ2
         ZYwdMTzhED65S/Cep0I0NzAGOmoj9O1/ty7NqGErMW8YIWjAl6yDclYr2S/XpVFl+tep
         CP/G61p59HNXOe6Mc0WCLjtufqwp1fxZMtOEmXsZ2Ceqgx3KF8a4gHN4D5xMLUEC7ZSR
         8w7J8gk6WSx3AWrThA1mu83odcZ0elDiK3c+e7KUUOVMkkm+rlgAMKsgdu4CyJOPWHX+
         WAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859281; x=1785464081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lR31YHRxiV0djHq1zIOUkgvXsVr6NGABConQhGGMo28=;
        b=owW9bSwTsQ4nvlBsFcocmM9sJPPr7TqCavN2UMVOA0Tl5ThTSlG0v+ib+eVv4wswOy
         IGrzV1VrzGfZT655IiX5hjMaYhJbnTVsKEHEcXDG9s7g8iNdwzNGW8Mv5VMA5oF6F5uG
         M45fk9XxxOhGmtOunAbUc/L51Ol8sNqwpdjEK7UJlWctAcOO+mGjX6iXJQaqt/+i57hi
         G3qxrpbNTI0bLYNTwNS6Ue1pDu1PM5Nzvgstnlpv1XYWhjyd6tVt50efMvprDqdY/AQ/
         sD7pRlfErdnfPyR+O46vPZGrhepFPhg6nb1bPN7sXNixKJdB4bKKcTpFC2VWC4QIcNQy
         Kfcw==
X-Gm-Message-State: AOJu0Yzvz10z8LhaQknFwgpM51MdX3rHUHG0YX2UTD/JL9XWZe90TJTb
	9fewfbO3IWrG9HqywUnFSne30MIAIqYm6ZXVU1iycUjfWPb5sYAsSzjpXrNKdGVh
X-Gm-Gg: AR+sD12BnRpe/KUnQXTfvG089BOnA35DLwnUS8c6m2xOtHFornsujK7tmBGQV10t19K
	2WHvm1kqSsNTpbmLPnw6pzKfg2BzcYB3PldwXZjge0lKFxoXskd4h+bQHJTxVH88lPaDAPeCA2P
	J+EdGwP0lZNr02us++nJI5O22abtyGqPr5G8yYnQWzgd6QNp0yL7ylpQH2stBJv6ZSpJb8YgKJN
	j4lmGAo/xMyuq1fDZqvuAT6PCWAjndz8mNON7hIOys2vlDcAZUZ9A5VQAxiXdwBoV0iYHRlpi+f
	+L/ur79le1KrEIyw4Qutc10vki3O9Gpx7UB6y9scuc1Nv9xpUrHnWBqGjb/NpIS5JNd5Rywz3yP
	nOZWHLxUJdZDS8gdEbdP6IITBad5sjYlGN+f9Fvb71ixKS2IlC480GqfSdlDhzku3lERwJkLaYY
	USCiQ4JvIxr3jsKJE=
X-Received: by 2002:a17:90b:4d83:b0:38e:6497:ca45 with SMTP id 98e67ed59e1d1-38ec6aaf9ccmr4864651a91.39.1784859280675;
        Thu, 23 Jul 2026 19:14:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 8/13] libusb-compat: upgrade 0.1.8 -> 0.1.9
Date: Fri, 24 Jul 2026 14:14:02 +1200
Message-ID: <20260724021407.2840261-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128430

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refreshed 0002-automake-make-example-programs-installable.patch

Changelog:
https://github.com/libusb/libusb-compat-0.1/compare/v0.1.8...v0.1.9

PTESTS passed:

root@qemuarm64:~# ptest-runner libusb-compat
START: ptest-runner
2026-07-24T02:01
BEGIN: /usr/lib/libusb-compat/ptest
...
...
END: /usr/lib/libusb-compat/ptest
2026-07-24T02:01
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0002-automake-make-example-programs-installable.patch     | 4 ++--
 .../libusb/{libusb-compat_0.1.8.bb => libusb-compat_0.1.9.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libusb/{libusb-compat_0.1.8.bb => libusb-compat_0.1.9.bb} (96%)

diff --git a/meta-oe/recipes-support/libusb/libusb-compat/0002-automake-make-example-programs-installable.patch b/meta-oe/recipes-support/libusb/libusb-compat/0002-automake-make-example-programs-installable.patch
index faf532cad2..74dd0eab95 100644
--- a/meta-oe/recipes-support/libusb/libusb-compat/0002-automake-make-example-programs-installable.patch
+++ b/meta-oe/recipes-support/libusb/libusb-compat/0002-automake-make-example-programs-installable.patch
@@ -17,8 +17,8 @@ index 9bd3efc..f4324c2 100644
 +++ b/examples/Makefile.am
 @@ -1,5 +1,5 @@
  AM_CPPFLAGS = -I$(top_srcdir)/libusb
--noinst_PROGRAMS = lsusb testlibusb
-+bin_PROGRAMS = lsusb testlibusb
+-noinst_PROGRAMS = lsusb testlibusb hotplug_monitor
++bin_PROGRAMS = lsusb testlibusb hotplug_monitor
  
  lsusb_SOURCES = lsusb.c
  lsusb_LDADD = ../libusb/libusb.la
diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb b/meta-oe/recipes-support/libusb/libusb-compat_0.1.9.bb
similarity index 96%
rename from meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
rename to meta-oe/recipes-support/libusb/libusb-compat_0.1.9.bb
index 960f547f94..424e5cce3b 100644
--- a/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
+++ b/meta-oe/recipes-support/libusb/libusb-compat_0.1.9.bb
@@ -27,7 +27,7 @@ SRC_URI = " \
     file://0002-automake-make-example-programs-installable.patch \
     file://run-ptest \
 "
-SRCREV = "c497eff1ae8c4cfd4fdff370f04c78fa0584f4f3"
+SRCREV = "4831748a1439aec81e9cbb9984b1b0289c1c7051"
 
 UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb-compat-0.1/releases"
 

