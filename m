Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	by mail.openembedded.org (Postfix) with ESMTP id 908B660B0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:35:23 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id l9so7634049oii.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yMGL5WBwLKXZQ4cKJD5niCwSMAxbPqI2kIpDr5iyJEs=;
	b=ArvkL1J3r7E6VFkSW7RKEE3syUB0VnMWtMFfNtt3bec9Fev5iKQ9T4BjwreT6Y/cVL
	VhjtA/8PbVvTJMg2WqhxSR/+zMxwXLEXB/ZN2WKfASm29wbW3TJetujIn5jI4Dw6eCgh
	dg2hH7YuTykyYuZiGb/ZrdKqqv+GlbvJx2R4n4KpkIYyNTd0C8JR8y5R4EE2+mz/tXr7
	+T3BGCrVMKJbaYokzf0oEjfgauodjvFb/aTsnZwy9I5CJp4dccc1wk7JTur/6/gI1pl9
	RRfLCZOyfp4G62s0BZiXdq3z/14PuTVfB4FBWn70JpVr7Kel10pOo7NX7yuCwOzSchlA
	MxsQ==
X-Gm-Message-State: APjAAAWJIxqgtofklsS9k6c41fzhYpxCbxL6zTnJ774n1vXU61ZT9CV9
	McgL7yGi8olbyfnGAhMSnDE113S4gQE=
X-Google-Smtp-Source: APXvYqzu2Ho+eDlYMB2DxkO9qZUzNlT9tGQxGe/3xCeszi2zcICrVR4y0sNNEqGwn5a6cK8AI55QNQ==
X-Received: by 2002:aca:c646:: with SMTP id w67mr8857912oif.171.1581294924336; 
	Sun, 09 Feb 2020 16:35:24 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	v202sm3467636oie.10.2020.02.09.16.35.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:35:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:35:12 -0500
Message-Id: <20200210003512.11758-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-atomicwrites: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:35:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-atomicwrites.inc      | 7 -------
 .../python/python3-atomicwrites_1.3.0.bb                 | 9 ++++++++-
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-atomicwrites.inc

diff --git a/meta-python/recipes-devtools/python/python-atomicwrites.inc b/meta-python/recipes-devtools/python/python-atomicwrites.inc
deleted file mode 100644
index 773e9dd770..0000000000
--- a/meta-python/recipes-devtools/python/python-atomicwrites.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-DESCRIPTION = "Powerful Python library for atomic file writes"
-HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
-
-SRC_URI[md5sum] = "ce11f780a4ce0fce8a55d64494a88178"
-SRC_URI[sha256sum] = "75a9445bac02d8d058d5e1fe689654ba5a6556a1dfd8ce6ec55a0ed79866cfa6"
diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
index 9f306e60d6..04bbed7074 100644
--- a/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-atomicwrites_1.3.0.bb
@@ -1,2 +1,9 @@
+DESCRIPTION = "Powerful Python library for atomic file writes"
+HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
+
+SRC_URI[md5sum] = "ce11f780a4ce0fce8a55d64494a88178"
+SRC_URI[sha256sum] = "75a9445bac02d8d058d5e1fe689654ba5a6556a1dfd8ce6ec55a0ed79866cfa6"
+
 inherit pypi setuptools3
-require python-atomicwrites.inc
-- 
2.17.1


