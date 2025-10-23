Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B06CCF9E2
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 14:44:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.23028.1761230635387769376
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 07:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OC3/RdWi;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so471306f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761230634; x=1761835434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQg+nQmXyPfdvMGn7N3kzYRdzqjifYVR0CrreQzgBpk=;
        b=OC3/RdWiwi0IFrCan5vrc9HVYhfvjJft7pqTFXGpoUhGywhH5hOcOPNCl8Ug9xju7r
         kpVw+UDZ9G356mXQfElxbVwunOAhXtphO1Ipi14R4HxEgmHdRn7Qk3BP97OPtzyDPFpe
         BjY3N7iXen+RiwlM56jVEPfkudJN7uiRcyfBOgFf4EBKyj+XgXVNl3tvxJiKTEc+L3l0
         pna4QOZ4w1dqS6MY5+OoP0atd2JwEhrgeMMOFhp4HFOtFPFyjrqRgxJN6koixHcPWMUR
         d/TM/uvx7g9k97iK1raD7J9v6GwVmSV0aui3E6Imqugwhjhxw0/l38VHmhKiUGlT5Yhl
         5THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230634; x=1761835434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQg+nQmXyPfdvMGn7N3kzYRdzqjifYVR0CrreQzgBpk=;
        b=NEfc2K7lT3qR8EeDnBy+5I2yWah4aDDwhHxvLb3ydH4YP57RKuks4nxgv7uWYx3Qz7
         zEqNRkDWvxzeZbHNPHHb53Hmqr/ZwBtw89VlQWz7afIUbmWLZKEMiLzI2GVJFpzOERmZ
         JUBGpnYQJ3L6FoXgrCheJ4vJxdGKcJWusJhn8Mg4Ujc6ZqLunxG6uqeY4twNBJTo6wo0
         JMxWn3Z8aXx7woH7zJjK5ZCF4TmXls4cHnn5tCxD+xgn6KJV2u5NEMWi8oQJhUJtrtKK
         CXscfhO7MujW5Rn9s4+Uiml6GM5c/WVXFO6xpu9V0iWlbV+xFyI/eUV3Pqojfo6oKkpt
         lkxQ==
X-Gm-Message-State: AOJu0YzICiVX/W1GD6Pf6b+e+R6IY6SumIYGli3hlNLWrAhdGRMrAdTo
	WNsXM2woyud6vgH90nW3DHqw8LrZdoRx2y11yICUwxWxcoUYCBbSmue86t3xeQ==
X-Gm-Gg: ASbGncu391hFOpD4MnKNUFhDNB17Mw43mY1DjPYwWHAQzjNMf6kfzyB4cNq2fB01YTg
	r7rRt/lvjjgaPBxUJlpDq0XymW9uUEsMyYBjMztw+7PfDY7QfSwJ5961nkwktVgYP6p1aUUB7Dj
	u8QSqf4k83xXO/UMSNocn6wXVz3aCJsIJLIE0il8ubtQde/7j3jjSVOqfGny4jaf06xaT/ifV34
	BQydNvqYUY+rTZW+j725nr58hPfcP6+omfgTEr56hPUuRe5eIDTKOkyNfiHNDUANh7clBGWP+dB
	JhUBwkPMY7RY3HUu8z+8HwN3emwB8/nmHVpHJF4dCdB6FshSjMt6V1iElY0pT+VIpmdPWrtwlo5
	ut/YukdbSkOKsskf3VagU7ZXrfirUTw2s4smhYHaCKRwJI8QAUN2a3S1EB5RbDYqE/IP1LcBwNQ
	==
X-Google-Smtp-Source: AGHT+IEFaQnRaX1ipwKCPw1Qyxagkm/6qPD60SdADlVEip0sdFyjID3Z/tM/OUU6pzzo2bx1jnyjqQ==
X-Received: by 2002:a05:6000:310b:b0:3eb:8395:e2e0 with SMTP id ffacd0b85a97d-42704dab124mr16137689f8f.51.1761230633604;
        Thu, 23 Oct 2025 07:43:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccd88sm5278872f8f.36.2025.10.23.07.43.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:43:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] psqlodbc: fix a failing ptest
Date: Thu, 23 Oct 2025 16:43:51 +0200
Message-ID: <20251023144351.264756-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251023144351.264756-1-skandigraun@gmail.com>
References: <20251023144351.264756-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 14:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120935

The descrec test fails currently, due to the different characterwidth
postgres uses depending on the current locale.

If the locale is C or posix, then each character is 1 byte. Otherwise,
if it's some UTF8 locale, then it is 4 bytes.

The test case expects 4 byte width by default, making it fail. This backported patch
allows for both 4 and 1 byte characters to be tested successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...xpected-output-file-for-descrec-test.patch | 72 +++++++++++++++++++
 .../psqlodbc/psqlodbc_17.00.0006.bb           |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch

diff --git a/meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch b/meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch
new file mode 100644
index 0000000000..af25b207c8
--- /dev/null
+++ b/meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch
@@ -0,0 +1,72 @@
+From 453a8bdcaafde9fcd108a195ffea3ccb5c4d0a21 Mon Sep 17 00:00:00 2001
+From: Christoph Berg <myon@debian.org>
+Date: Mon, 16 Jun 2025 20:25:26 +0200
+Subject: [PATCH] Add expected output file for descrec test in C locale (#131)
+
+When running with LC_ALL=C, SQL_DESC_OCTET_LENGTH matches the character
+length. Add "10" as accepted value.
+
+The net diff to the existing descrec.out file is this:
+
+ test/expected/descrec.out	2025-06-13 19:02:36.460302799 +0200
+ test/expected/descrec_2.out	2025-06-16 14:34:44.270543393 +0200
+ @@ -19,7 +19,7 @@
+  -- Column 3 --
+  SQL_DESC_NAME: col3
+  SQL_DESC_TYPE: 12
+ -SQL_DESC_OCTET_LENGTH: 40
+ +SQL_DESC_OCTET_LENGTH: 10
+  SQL_DESC_PRECISION: 0
+  SQL_DESC_SCALE: 0
+  SQL_DESC_NULLABLE: 0
+
+Fixes #51.
+
+Upstream-Status: Backport [https://github.com/postgresql-interfaces/psqlodbc/commit/453a8bdcaafde9fcd108a195ffea3ccb5c4d0a21]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ test/expected/descrec_2.out | 34 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+ create mode 100644 test/expected/descrec_2.out
+
+diff --git a/test/expected/descrec_2.out b/test/expected/descrec_2.out
+new file mode 100644
+index 0000000..6f61c49
+--- /dev/null
++++ b/test/expected/descrec_2.out
+@@ -0,0 +1,34 @@
++connected
++
++-- Column 1 --
++SQL_DESC_NAME: col1
++SQL_DESC_TYPE: 4
++SQL_DESC_OCTET_LENGTH: 0
++SQL_DESC_PRECISION: 0
++SQL_DESC_SCALE: 0
++SQL_DESC_NULLABLE: 0
++
++-- Column 2 --
++SQL_DESC_NAME: col2
++SQL_DESC_TYPE: 2
++SQL_DESC_OCTET_LENGTH: 6
++SQL_DESC_PRECISION: 4
++SQL_DESC_SCALE: 2
++SQL_DESC_NULLABLE: 1
++
++-- Column 3 --
++SQL_DESC_NAME: col3
++SQL_DESC_TYPE: 12
++SQL_DESC_OCTET_LENGTH: 10
++SQL_DESC_PRECISION: 0
++SQL_DESC_SCALE: 0
++SQL_DESC_NULLABLE: 0
++
++-- Column 4 --
++SQL_DESC_NAME: col4
++SQL_DESC_TYPE: -5
++SQL_DESC_OCTET_LENGTH: 8
++SQL_DESC_PRECISION: 0
++SQL_DESC_SCALE: 0
++SQL_DESC_NULLABLE: 0
++disconnecting
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
index cead6789f4..2fbd8b78e4 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;br
     file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
     file://psqlodbc-donot-use-the-hardcode-libdir.patch \
     file://psqlodbc-fix-for-ptest-support.patch \
+    file://add-expected-output-file-for-descrec-test.patch \
     file://run-ptest \
 "
 

