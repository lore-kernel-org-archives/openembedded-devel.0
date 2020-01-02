Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA317F9AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 06:13:39 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id t101so2929656pjb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2020 22:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u1mZ1vG48iwN0KJ0tmJ1ZHG1T+XZY4ttr3ffNZfx04I=;
	b=kaK+YJ9s6lbsHVxkOekIDFtRt9yJt/A7Z7tth3bqA55uHZ83UMb7dzjzAHBqVVoXiB
	pzpEQVl3lSRbyrZsjs7QHaQ0ncuxaYDr9xN+jTXrVmqbXaj5c/8RYYrx0260Yu2rqN1h
	1WiIX9Op73JOiDfesoFcMvr98aSXyWCljaPwpH2us1GdSMm96mZVDn67Jb/i9DDPtEJF
	FraDMdMP6FTuap60O7sEqCTRYP9rODCXtbbNFXE8O2FTkOQGiYCPbQR8Z8rBZwPa2/ok
	PCXKIhnCOIoGu8YgI5OHIDDwqR+eFUSUZAvLKIdawPwfg6WmTyUd2QwN+auZZpDpQcme
	5owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u1mZ1vG48iwN0KJ0tmJ1ZHG1T+XZY4ttr3ffNZfx04I=;
	b=BsmMLutzC8UGUbqF9PodMarZtRMoiKTWFZzLXvAapCShNeu2pOqHjsF8zYSHbTwD72
	feJFn+dM6Fr/QE/mb9j8oF3kLNRCgwOhDN3Mx9s5RIau+v7JKx7R81FEARM++2/7olOk
	ofRxpNTLWAoxO0UQeNMgvfSxYPF+rsQ8PE/edZGa8Eknz21XuHQ9lCGH0sM6FTuTz8Eq
	O6ubwaPdta/bkWbxzT4dzAGx1+8KwZIJuNQ01IotuSIYx9cgEhCk4nwzMSHTqp6r1UWL
	u+Uqt/ogH4A+kHZmCnQ3P+3QFbZofuuyOyFtIMv62oYkSy+r0xsCNbSnLl8Ynf1TdPSl
	5stw==
X-Gm-Message-State: APjAAAUVDV9KbzQtWMT/IbnfrNCyyAzsO53ah+WbL3Ses2TfLPQQdDFA
	HY/9/OkX+Mo5K6MS6l4eizchDfHfZ8A=
X-Google-Smtp-Source: APXvYqypsrrzs/nO26yDeQs0q9uN4gzMbMTMlFxn5R4fi+XVptJnUIMyxH96yLAaTEXyOYJbvu3q6A==
X-Received: by 2002:a17:902:ac88:: with SMTP id
	h8mr82635844plr.131.1577945620238; 
	Wed, 01 Jan 2020 22:13:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	e19sm9369149pjr.10.2020.01.01.22.13.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jan 2020 22:13:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2020 22:13:25 -0800
Message-Id: <20200102061330.480482-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/6] udisks2: Updare to latest master beyond 2.8.4
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
X-List-Received-Date: Thu, 02 Jan 2020 06:13:39 -0000
Content-Transfer-Encoding: 8bit

Drop the feature.h patch since its fixed differently upstream [1]

[1] https://github.com/storaged-project/udisks/commit/7c9bb088ed8c7b509e94f68abe6427b45fad092f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../udisks/udisks2/non-gnu-libc.patch         | 26 -------------------
 meta-oe/recipes-support/udisks/udisks2_git.bb |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-support/udisks/udisks2/non-gnu-libc.patch

diff --git a/meta-oe/recipes-support/udisks/udisks2/non-gnu-libc.patch b/meta-oe/recipes-support/udisks/udisks2/non-gnu-libc.patch
deleted file mode 100644
index 98e6c75f24..0000000000
--- a/meta-oe/recipes-support/udisks/udisks2/non-gnu-libc.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-musl does not define __GNUC_PREREQ therefore check for C library being glibc
-if not then define the macro
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: udisks-2.1.7/udisks/udisksclient.c
-===================================================================
---- udisks-2.1.7.orig/udisks/udisksclient.c
-+++ udisks-2.1.7/udisks/udisksclient.c
-@@ -27,8 +27,15 @@
- #include "udisksobjectinfo.h"
- 
- /* For __GNUC_PREREQ usage below */
--#ifdef __GNUC__
-+#ifdef __GLIBC__
- # include <features.h>
-+#else
-+#if defined(__GNUC__)
-+#define	__GNUC_PREREQ(__maj, __min)	\
-+	(__GNUC__ > (__maj) || __GNUC__ == (__maj) && __GNUC_MINOR__ >= (__min))
-+#else
-+#define	__GNUC_PREREQ(__maj, __min) 0
-+#endif
- #endif
- 
- /**
diff --git a/meta-oe/recipes-support/udisks/udisks2_git.bb b/meta-oe/recipes-support/udisks/udisks2_git.bb
index 21851666ee..ecaf01e71d 100644
--- a/meta-oe/recipes-support/udisks/udisks2_git.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_git.bb
@@ -18,10 +18,9 @@ RDEPENDS_${PN} = "acl"
 
 SRC_URI = " \
     git://github.com/storaged-project/udisks.git;branch=master \
-    file://non-gnu-libc.patch \
 "
-PV = "2.8.4"
-SRCREV = "f333e13de8d32f2b82237ccd180c3458d71e78b8"
+PV = "2.8.4+git${SRCREV}"
+SRCREV = "db5f487345da2eaa87976450ea51c2c465d9b82e"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.24.1


