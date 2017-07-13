Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB6D078191
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 07:42:08 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j186so5995603pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 00:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kvGoXCl3R3UbsNt5rMmtju+YCuRKFIdBGb0Clf2W5uE=;
	b=UgHAk59BR5OaWvVelxqeiSM26oJld4oPa9epcEyDlC+p6ZnYxipe+eupzYENaE0QVy
	W5eiaTNUq9rMXCWwFOr1vCMt9HopoCEqhceVlBFhnLhmZUyWSZXTleoeVweXkuDFOOxw
	FBY3bVVwnpuC1Zy6TGH5tvA7ySf1WWGi4fsC6RKvm7+3gWgSdFBbnvMf89GuSH2dWKPv
	3wLRsDOwl1IV2pLdHGDfopKeldLuMroEgUEtgmEFvQ3/9hQSU5f14Xs/Vui7UHfV7m0L
	Kq4mu9ypBqRfhLPBoHKnPKs4ASl2WbX/mjKzyG3cJQFkiSvbPouSZzFX/EKGKAafUXbY
	05Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kvGoXCl3R3UbsNt5rMmtju+YCuRKFIdBGb0Clf2W5uE=;
	b=CI2Z6SPnrTQZgccFfuQT6B8e/GcaC+ur2TUXQh7uAEbYBOp5Ug1lYcO2YOm1f5ROYr
	TDmyUYSetVDg+lhKYiYhIxEx06huOMA68c2K+CDEgiADtLIXMTZLiRznq6gc2pHUTnX4
	xO33BOk/MIzi63grEkzfRjRWX8eLaBOhXHRUdzP84xUsx6Yo9TC3X6Np9bN1a18GCJbE
	zNFG/cBPny+FDHPd+Wk5OyxR8w3h/LqmGYKUUq4zYGfr4RiThj0/Uwv4s/BDBiHqOgqY
	FceKFR85zps3VERCVLn5rTJwxcylS1x5ZXzKy16mF+fXFcM4Jn1GJVEVzTnJyrYxZeUr
	wVIw==
X-Gm-Message-State: AIVw110kl02nFPpefP7/3SMbBitbpxl8mbRSe20qmkDIsBvK0g5FanxE
	eLi0uA1ZsfZaBV7H
X-Received: by 10.99.96.132 with SMTP id u126mr7795947pgb.121.1499931729918;
	Thu, 13 Jul 2017 00:42:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z6sm11473952pff.46.2017.07.13.00.42.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 00:42:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 00:41:53 -0700
Message-Id: <20170713074154.10606-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170713074154.10606-1-raj.khem@gmail.com>
References: <20170713074154.10606-1-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/3] qtvirtualkeyboard: Include sys/time.h
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
X-List-Received-Date: Thu, 13 Jul 2017 07:42:09 -0000

Fixes build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-sys-time.h-for-timeval.patch      | 28 ++++++++++++++++++++++
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch

diff --git a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
new file mode 100644
index 0000000..8518ae9
--- /dev/null
+++ b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
@@ -0,0 +1,28 @@
+From 78106c5b939cc7d84710fe4c8e2a356ac1f110ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 23:59:52 -0700
+Subject: [PATCH] include sys/time.h for timeval
+
+Musl exposes this issue since its not indirectly
+including sys/time.h like glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/virtualkeyboard/3rdparty/pinyin/include/userdict.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/virtualkeyboard/3rdparty/pinyin/include/userdict.h b/src/virtualkeyboard/3rdparty/pinyin/include/userdict.h
+index 1b9673f..924be7b 100644
+--- a/src/virtualkeyboard/3rdparty/pinyin/include/userdict.h
++++ b/src/virtualkeyboard/3rdparty/pinyin/include/userdict.h
+@@ -24,6 +24,7 @@
+ // Debug performance for operations
+ // #define ___DEBUG_PERF___
+ 
++#include <sys/time.h>
+ #ifdef _WIN32
+ #include <winsock.h> // timeval
+ #else
+-- 
+2.13.2
+
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 08914b1..244e529 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -5,6 +5,7 @@ LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
+SRC_URI += "file://0001-include-sys-time.h-for-timeval.patch"
 
 # To enabled Nuance T9 Write support, you need to provide the licensed components
 # and enable "t9write" in PACKAGECONFIG. This can be done in a separate .bbappend file.
-- 
2.13.2


