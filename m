Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BFAFC9EFB
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 11:41:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7650.1772883709582728574
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 03:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UJ4rxP+i;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439bcec8613so4730212f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 03:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772883708; x=1773488508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3lLiq/8/ZgsJld+4XqtfUrHq72a+q33Pw52itUU5L4=;
        b=UJ4rxP+iSPHAG/QkK4QFm/BLvFjpOzAxJqh8j1VrhdaOSO/nAaHL5Vq/ouXFF2J3W/
         9zN/dKXPGTkUEsPG9wblP1o/ko3LoW4I0E9k/4x8dOetlynvvtMwA1MCkmfl+M08G93l
         V2jXzc1bNXmRWB2n+U6/5lbmKlbVc0UfJMl2MnkA+Ri/0SSidVlQu3gdbf5rSCixdwTN
         qz3YfCIthRgLI7hpKJJhWiCQT2QWbo8h0iMac1CiubBdbXSM9mgRFANVSx1YPo4t+I8N
         4s5zDd0nI7oejIy3/27XTTMz9ZNiwp4CfAPPjEs2WW6jlixkvy+KT0WTpjtIMxm63ghX
         TsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883708; x=1773488508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3lLiq/8/ZgsJld+4XqtfUrHq72a+q33Pw52itUU5L4=;
        b=Up6Kjf+IV6ZWd3DXSg2XTisf113KWcqja5hvD6MPytJ+LFhOQk+1PcThUCtbOoRqwW
         FA+fFEJaUb6LJLkjvZbEyJMlRoGZOJSW6rwM6TabiEs4gw/LHcj8wRgJ8VtFtdneHQnE
         H0DW7vi+HiP25gPEnoMHixUNJfF2t/CuJYkJYpAnXyZS2TGXtvdNVK+FNnkwsDMCDcsF
         x/8ZJP0scu0UhD9e3WkwzxGsJ0gMpkHmKpN699zZoqHMhy18GwtYcTbx6pKiYmHn9ZHu
         MfjGH+6wQxFJPpC7mf/StLEo0eBhR8jYBxC3s8iKleMIbM4nsKnKwiamubUBgIMVhnbt
         6Spw==
X-Gm-Message-State: AOJu0Yzvk5oCbPIlKEm10A4zeJehJiz1/2m09WrCeAXtDZF0fKaqBqwC
	FYes7mBcR4/bdEkzA4Fx2GejgcWowi7Kd3NvEZahNICevU7OsO6oxpNA2zZujw==
X-Gm-Gg: ATEYQzzaZfEtsoph8QYAjSenQsq+BhXu92hMPdXWeIxY4wwTIBCBvFBP+2dHWVaMbDo
	JECoOe+l1PRR/haVJY+xKwM01CkPnxtbYakqrLBVdIfBit/tmyBnA6DTslt4vnDRH0Pwt8+MjsW
	k89SheIWwik4DXSdV9qgA91FqTXVEXqUqYzT3sQGalVQKRMqa+J2CZKpUzevv+2Lzt4ryARN2GP
	4IcA6aMUd2RLC4D7by76LChuLMahQnDQMQMxUtHn8GFY6Ci49ablbIURiaWqzIxMxVhqNToWAjt
	SqmbG9iai/ddh3ZYUdUOzhhoZvTVnVAW1f1rXOyLtfv5YVZEGzWIX+kBNTfyTv6R/F/fTWTP2yO
	d1y87CQfqmPhpHZXqdAR19DAZChQ0hhx4WbcbpuD9tx1EOazXuADohM7a/6fUyhH080VtSfMwgu
	QxcvL/fJWrWSk9J2MtHYAl
X-Received: by 2002:a05:6000:2012:b0:439:abcd:b317 with SMTP id ffacd0b85a97d-439da351ae3mr9504307f8f.14.1772883705340;
        Sat, 07 Mar 2026 03:41:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm11170913f8f.21.2026.03.07.03.41.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:41:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/4] tinyproxy: drop obsolete patch
Date: Sat,  7 Mar 2026 12:41:41 +0100
Message-ID: <20260307114142.3992185-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307114142.3992185-1-skandigraun@gmail.com>
References: <20260307114142.3992185-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 11:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124928

The patch removed manual generation completely from the build scripts,
however upstream has added a configure option in version 1.11.0[1] to
do it in a more gentle way.

Drop the patch, and use the configure option instead.

[1]: https://github.com/tinyproxy/tinyproxy/commit/5ba958829f73ecc02658a46f5b1bba5ffed2281d

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tinyproxy/disable-documentation.patch     | 61 -------------------
 .../tinyproxy/tinyproxy_1.11.2.bb             |  2 +-
 2 files changed, 1 insertion(+), 62 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
deleted file mode 100644
index faefd1d4ea..0000000000
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From b71eb384522b5ce4629dee6e8be257fb4880fef3 Mon Sep 17 00:00:00 2001 
-From: Benjamin Gaignard <benjamin.gaignard@linaro.org> 
-Date: Thu, 20 Apr 2017 14:25:18 +0200
-
----
-Upstream-Status: Pending
-
- Makefile.am  |  1 -
- configure.ac | 17 -----------------
- 2 files changed, 18 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 4a3ead6..a12cb98 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,7 +2,6 @@ SUBDIRS = \
- 	src \
- 	data \
- 	etc \
--	docs \
- 	m4macros \
- 	tests \
- 	scripts
-diff --git a/configure.ac b/configure.ac
-index 3849383..9f3a633 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -179,18 +179,6 @@ AC_SUBST(CPPFLAGS)
- AC_SUBST(LIBS)
- AC_SUBST(ADDITIONAL_OBJECTS)
- 
--if test x"$manpage_support_enabled" = x"yes"; then
--AC_PATH_PROG(POD2MAN, pod2man, no)
--
--if test "x$POD2MAN" = "xno" && \
-- ! test -e docs/man5/tinyproxy.conf.5 -a -e docs/man8/tinyproxy.8 ; then
--AC_MSG_ERROR([
--  manpage generation requested, but neither pod2man
--  nor pre-generated manpages found.
--  Use --disable-manpage-support if you want to compile anyway.])
--fi
--fi #manpage_support_enabled
--
- AM_CONDITIONAL(HAVE_POD2MAN, test "x$POD2MAN" != "x" -a "x$POD2MAN" != "xno")
- 
- AC_PATH_PROG(GPERF, gperf, no)
-@@ -216,11 +204,6 @@ src/Makefile
- data/Makefile
- data/templates/Makefile
- etc/Makefile
--docs/Makefile
--docs/man5/Makefile
--docs/man5/tinyproxy.conf.txt
--docs/man8/Makefile
--docs/man8/tinyproxy.txt
- m4macros/Makefile
- tests/Makefile
- tests/scripts/Makefile
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
index 222cc8d7c6..8558291c18 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
@@ -4,7 +4,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz \
-           file://disable-documentation.patch \
            file://tinyproxy.service \
            file://tinyproxy.conf \
            file://run-ptest \
@@ -21,6 +20,7 @@ EXTRA_OECONF += " \
 	--enable-reverse \
 	--enable-upstream \
 	--enable-xtinyproxy \
+        --enable-manpage_support=no \
 	"
 
 inherit autotools systemd useradd ptest

