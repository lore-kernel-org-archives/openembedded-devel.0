Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFEC6067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 23:15:37 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id x49so180665912qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 15:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WYmdXA0SpMcH6Wfm8UFk6aYqLW1tqmlDn8aEgIf5k4c=;
	b=AQWjug4jeVP9k/dPq/xyx3VrDINRyeNFbjZONRL+ePfaZo/E02y8Bq6gkEsgPH/kxK
	CZ1ISjTLmR8Wr+v0bdO3gJgg2UdgyTV5+LP2o230zQMqGn0QyczQMSLY2ddd0Khuy90z
	tHF9A4bz628ZrEk/Cs7I9piJiwPyxVH96lcm1AbEo3U6D5Vsg2vBBqnTBEEAfnvOPCzf
	NID5DBoKvxgongirJ9PuGW1LHYVAI8aQXpUxpRMreRT37adlQSfZ5cjRxb0VHWx4E5MH
	HvBXyIfxi35W3Atdy/p5nEblORvtoyWoSVygdZdbNkfsV4o+KAlR+9r0feO4VQAqQ4OX
	KUzA==
X-Gm-Message-State: AMke39lH/fzeT9imndb6A2WJ71RDnOuYrN81FEBiCDvCc/wXFKz6NxEqyqP2sGNj+fPTVQ==
X-Received: by 10.237.38.65 with SMTP id z59mr55782qtc.5.1486595737420;
	Wed, 08 Feb 2017 15:15:37 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	s20sm7407586qtc.39.2017.02.08.15.15.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 15:15:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 18:15:29 -0500
Message-Id: <1486595729-28378-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-py: update to version 1.4.32
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
X-List-Received-Date: Wed, 08 Feb 2017 23:15:38 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-py.inc                     | 4 ++--
 .../python/{python-py_1.4.31.bb => python-py_1.4.32.bb}               | 0
 .../python/{python3-py_1.4.31.bb => python3-py_1.4.32.bb}             | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.4.31.bb => python-py_1.4.32.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-py_1.4.31.bb => python3-py_1.4.32.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index 9e33b16..4ac502e 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -2,7 +2,7 @@ SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "5d2c63c56dc3f2115ec35c066ecd582b"
-SRC_URI[sha256sum] = "a6501963c725fc2554dabfece8ae9a8fb5e149c0ac0a42fd2b02c5c1c57fc114"
+SRC_URI[md5sum] = "68ee0b5867282595d0b410a7f3c03ab3"
+SRC_URI[sha256sum] = "c4b89fd1ff1162375115608d01f77c38cca1d0f28f37fd718005e19b28be41a7"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.4.31.bb b/meta-python/recipes-devtools/python/python-py_1.4.32.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-py_1.4.31.bb
rename to meta-python/recipes-devtools/python/python-py_1.4.32.bb
diff --git a/meta-python/recipes-devtools/python/python3-py_1.4.31.bb b/meta-python/recipes-devtools/python/python3-py_1.4.32.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-py_1.4.31.bb
rename to meta-python/recipes-devtools/python/python3-py_1.4.32.bb
-- 
2.7.4


