Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAA6FCB63F
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:21:01 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39479.1772979656579697764
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ewRABFtA;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so14481765e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772979655; x=1773584455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dp2/E1cD6HWjiUia3FCzCru9bSs1F2kqG1O3lyF97/8=;
        b=ewRABFtAaCy9Ybjsg5o239FX0jLDnrPTBcmWwa8EDFsjrEdYtDgrLVWyaKcjCSnPZf
         0YSxsOLiqqU8tp3698L5+iwl7FOxsWa2xtffnktPGIbim5lD9qCIygRUK26S1Rv5WMQZ
         VUkf6bFoYZH9NAF3ag02U+IOD/rWJ/1cPlZADEgEqxmi34RZ6hLAXxIetdd8bwh19Nu8
         9Ld8D+azai0l9KxNPQsCKK/j546HstdMpxNZ4DvxGkzpUa/LliP+N0Qna5/Jollw/1B2
         or2hqAKaYbLPlIVeEUo1eg7KsYbq91VayirWO9R4kXTcfgmJCML3nVu6S/HRigxdxURh
         w/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772979655; x=1773584455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dp2/E1cD6HWjiUia3FCzCru9bSs1F2kqG1O3lyF97/8=;
        b=kzmdKe8slArrOiaCeB5PUoSd1cHuuDPUyP2ouUCtEEMF+VdRS5t78hSOhcuNoPUXBd
         GnMHTmeRUzahgHJ6XWFBFBa3NvOxBFpINvmcJNFf6vVbArVChspkRrhnaZ4xR8VM9yzA
         hrempRf3fKPw5VriuYr+ch9u0TCZOMltu5ZKtbZaBlnEHiuXKWwpc3OEVquqBvFUBRaw
         1SQq9sJJnUHW7tILP7uVbYZfiqvWb15UuiVl7VfM2M24jQvRj4/E6gbdeOJi3+gLpvRt
         ojNE0lcjgkHbULnFiA1U1LadC55BpoB80TAGrvRG44aFFJYS78Ooa0LJkOHUWQQmWMGW
         DtKA==
X-Gm-Message-State: AOJu0YzyGZWsuOvMrebqYXdrfYKL2PuWQR2SgOiJRRVULML+BashtomL
	xAsz3NtPdF3bFRc4wn5IjZaOfk9u4iOCDqmdVx0wiVBsC3M0NDhZW3DTdw5W/Q==
X-Gm-Gg: ATEYQzxmkTe2kMDEARynEaaQs+tskjCrQLb1oeM9TjviiGzhNUnuKihKQVDWsEU9cuD
	+QEuI8P2rPiYzBFWJM7OyKhN4BkZbkSuBi+6E/uRXpFil4YHanzNeU6j92YXyih/9tKnf/GHJkA
	8vvO7BddMF7DHwm/7eJGHn/lEic2O3s0cYVMErflDoxKuFOhHa/GDZZtSLwB7Sju8eQJqwOJF3E
	6LU+ZChbUhAB4+27VoVebfadPAy0vYl8hj3yLcwIXVkWx1hkIPBaVCJgCtOzy77MBdjbpVdTG3f
	oJ0zn+KT7cac711NdEoxSrI6Ln9kbkY3CUFcVAVp+5xsZs1TnS3XdrL+0HUGLh6/FZKaac4sLZZ
	WX+QQ3aVqv+1jQKekkn/DTLOnQLzWNp3QKWTx/aVWr7b9EQQzF2eIbgopEcHSkGvqTxhtBXaeG4
	aY8/GGRUy/nsk2KqU6sXAu
X-Received: by 2002:a05:600c:34d0:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-4852696b8e3mr139912435e9.19.1772979654607;
        Sun, 08 Mar 2026 07:20:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48534fa65a6sm38858905e9.2.2026.03.08.07.20.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 07:20:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] lmdb: patch CVE-2026-22185
Date: Sun,  8 Mar 2026 15:20:53 +0100
Message-ID: <20260308142053.3262102-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 14:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124941

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22185

Pick the patch that is mentioned as a solution in the related upstream bug[1].

[1]: https://bugs.openldap.org/show_bug.cgi?id=10421

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../lmdb/files/CVE-2026-22185.patch           | 29 +++++++++++++++++++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch

diff --git a/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch b/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
new file mode 100644
index 0000000000..c5a44d179e
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
@@ -0,0 +1,29 @@
+From 145cff10d8ce9adbd0bee07447e103680081c297 Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Tue, 6 Jan 2026 20:52:25 +0000
+Subject: [PATCH] ITS#10421 mdb_load: check for malicious input
+
+CVE: CVE-2026-22185
+Upstream-Status: Backport [https://github.com/LMDB/lmdb/commit/8e1fda85532a3c74276df38a42d234dcdfa1e40d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libraries/liblmdb/mdb_load.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libraries/liblmdb/mdb_load.c b/libraries/liblmdb/mdb_load.c
+index d2a3cec..7eccf40 100644
+--- a/libraries/liblmdb/mdb_load.c
++++ b/libraries/liblmdb/mdb_load.c
+@@ -208,6 +208,12 @@ badend:
+ 
+ 	c1 = buf->mv_data;
+ 	len = strlen((char *)c1);
++	if (!len) {
++		/* This can only happen with an intentionally invalid input
++		 * with a NUL byte after the leading SPACE
++		 */
++		goto badend;
++	}
+ 	l2 = len;
+ 
+ 	/* Is buffer too short? */
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
index a76d388d70..531ec045d1 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
            file://run-ptest \
            file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
            file://0001-make-set-soname-on-liblmdb.patch;patchdir=../.. \
+           file://CVE-2026-22185.patch;patchdir=../.. \
            "
 
 SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"

