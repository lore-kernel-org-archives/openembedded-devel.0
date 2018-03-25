Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5C07803F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 23:05:00 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f23-v6so10798621plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 16:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TfAUy5SpYs/4upLdGCMMAkImnZTA7FH7T9vFkBsh/ek=;
	b=lCPg49LoWp/iTIEIcbAkF1+AyZCMfLCi3cZI4EvcsJ7klqizTAhZn650uwmSHTi25T
	3SEp++QWcHop/6TkDUCa19Qg6bAzLx6jgH7PysbC6EN7j/JJ8nCVEl0eqicVXWQ8k8FI
	h4Q8yDfS0xXbtmMqB2ZT2ZWlwHL1MtcjAv7yKJaEirUO8QfZvlg5IITf4/wsGtfxh6iS
	i2CaXi2dCng+Wz5YYJ8R+ZVJX0HrnT34tNZiyuA5+Hebfa5cZ9/Rpmr0RGeUb3gzb9Fy
	LyrHrE6R380tBev/vyM1laXvxgepx9KtVzW4pHdLUh+7+4DoSUvEXcAuoS/FtZhjae8t
	z21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TfAUy5SpYs/4upLdGCMMAkImnZTA7FH7T9vFkBsh/ek=;
	b=agplookNpF9YtaftpC2e41+WzsbEmZObmaFjxToPXTkgSLz90JY+swglI/MQ5qyzKz
	Fvd3lpy6qFIiA+a/StNb8IqbtDHmNvTCWgasm75fzKDzkkFsrDyUj6NyjJS6MU3Cm6Oa
	1YY8JFbc3cZCD4ciBm90twCcZOg3fQr0pMOwJXiYv6GXAE9hrMv0UxIRi2XAErQPCh7Z
	tliBBG3lWMb63fNFQeQ8fnLknm4DuWqeCRt5jBOtEhhUylM2v52a/b5blJNHAuCEJM5g
	TfwP3jfgqL1ah/DhCgarvjg6Jp6j9EgutiqZgeAHqQUDqU+RpFpJjqUSOVrZKl636jXH
	6NfA==
X-Gm-Message-State: AElRT7GhiKqoOl548bLbJQ1QVwvdQqTXCBqlMzASgrdYzbqxW6YSdvJu
	VRhNILTZ76PEJPK8dDnRlcarqA==
X-Google-Smtp-Source: AG47ELuD5T2+/TAQaVOQ/OtGWBT1Vd+SJ/nB72C40eZPGv/5HovYEUy19HT1INQQMBTW3qdUzyTDfQ==
X-Received: by 2002:a17:902:122:: with SMTP id
	31-v6mr39051431plb.280.1522019101519; 
	Sun, 25 Mar 2018 16:05:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	y15sm9174945pfb.37.2018.03.25.16.05.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Mar 2018 16:05:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 16:04:51 -0700
Message-Id: <20180325230452.40908-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-qt5][PATCH 1/2] qtwebkit: Fix build on armv7ve (rpi)
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
X-List-Received-Date: Sun, 25 Mar 2018 23:05:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index b23d4d6..0f5cbbc 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -18,6 +18,19 @@ DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
+# https://bugs.webkit.org/show_bug.cgi?id=159880
+# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
+# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
+ARM_INSTRUCTION_SET_armv7a = "thumb"
+ARM_INSTRUCTION_SET_armv7r = "thumb"
+ARM_INSTRUCTION_SET_armv7ve = "thumb"
+
+# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
+# Segmentation fault
+GI_DATA_ENABLED_armv7a = "False"
+GI_DATA_ENABLED_armv7ve = "False"
+
 # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
 # 5.10.meta-qt5.1
 SRC_URI += "\
-- 
2.16.2


