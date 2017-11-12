Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0E878552
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 15:33:23 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id v41so16886545qtv.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 07:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uB4oc9YCeXpF0FupW1dSha216w+AVpSo/MVpsHjuoEM=;
	b=VYcTNozL2oD06mIcadXqKdDEt3CzibrKhdC6omKkHQ+9Jn7R3OAlsKIwAOGMIBwilF
	s+n3wsBIlF7W2+lTtc5EHi72zfrHtNK4eNmZa9Ze8c/JuVttpf/CX7Hnl3Q9b54CHNJA
	mTFiY+LOFqMw+mcPn8NidNgf51YCH2y1Th9exSd3S0VQhnVflyGmqArBzc8cbV8pTaKI
	mKe5U8InLrJJ9Z/o50QAHxzykKfjdexFkUvJwLlHbVvXk6G0pNPvxQMXaNwVq8ZXtrrg
	4rProxY6OE3Lz+MvfERqTEcTf2Yx0Cu5n87r1irWLQr1GGrKE6x/VjwNchUFzkbcZ0Ja
	jaPA==
X-Gm-Message-State: AJaThX4uloRHu0PASA5ClHarehBMAart4oJwCEKHOp+WLoOTM3Uz0O7m
	roPKB2YRjcF4hjtQYXJoJsn+nPr5
X-Google-Smtp-Source: AGs4zMY4DU/+CEg9bbtY0vn5xKggopXqc/xAlgas11Or0KlVSZL3eFYvjwPLBhsGdKksAwtl3ALZQw==
X-Received: by 10.237.60.120 with SMTP id u53mr9377022qte.202.1510500804185;
	Sun, 12 Nov 2017 07:33:24 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	q191sm1192613qke.54.2017.11.12.07.33.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 07:33:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 10:33:17 -0500
Message-Id: <1510500797-25730-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pexpect: update to version 4.3.0
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
X-List-Received-Date: Sun, 12 Nov 2017 15:33:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pexpect.inc                | 4 ++--
 .../python/{python-pexpect_4.2.1.bb => python-pexpect_4.3.0.bb}       | 0
 .../python/{python3-pexpect_4.2.1.bb => python3-pexpect_4.3.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pexpect_4.2.1.bb => python-pexpect_4.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pexpect_4.2.1.bb => python3-pexpect_4.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
index 47d0979..dc8bcc9 100644
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
+++ b/meta-python/recipes-devtools/python/python-pexpect.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
 SRCNAME = "pexpect"
 
-SRC_URI[md5sum] = "3694410001a99dff83f0b500a1ca1c95"
-SRC_URI[sha256sum] = "3d132465a75b57aa818341c6521392a06cc660feb3988d7f1074f39bd23c9a92"
+SRC_URI[md5sum] = "047a486dcd26134b74f2e67046bb61a0"
+SRC_URI[sha256sum] = "00ab0872f80f5db740499e7a1283a7c3b97bea542d72df84d83dea17d0afd2d9"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
diff --git a/meta-python/recipes-devtools/python/python-pexpect_4.2.1.bb b/meta-python/recipes-devtools/python/python-pexpect_4.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pexpect_4.2.1.bb
rename to meta-python/recipes-devtools/python/python-pexpect_4.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.2.1.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pexpect_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pexpect_4.3.0.bb
-- 
2.7.4


