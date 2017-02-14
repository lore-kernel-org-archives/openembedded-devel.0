Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id CDE93760A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 22:24:29 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id p22so13354363qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 14:24:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h5abAxn2ihu1tNxcyb5S57rjIujRqMkXKmRBwY4Bj5I=;
	b=lbw0ga5MM7MLmVRbCEIWmmfdYR3AIwblVgPruBWvnK7zSS2bgGuSLu3vppQcJIOJgr
	eDxy1MwSsxHLLdhgYkXn9znhLDU9KrauMOZWQ16TV3GfqJOeM5EvvsYxT8+jBRThN92V
	UGLBVSu0bDHIgSwhnmy7K2eQ3Vy+7nheP3cGAgyOGpM5q/C50qmRHNjHRGSZVEsY7ver
	YqjVq5FRjjP8nJUdxxhKu5KnxEChnOyq48+iB2lbP9ij56v2ZxBtWIMxAo6MODIfIotz
	HE1jVqbiWe2lLIXCrhLHefOAh8ncHncHxqRUfyvJ3bfGf/ZZuRTogHWQHJb29aRxkMS6
	2Duw==
X-Gm-Message-State: AMke39lg1Q8leP6BVr8fKECbkHFTlKu2wd/JWNBuxt4MWVEQxS0tzlFXE1S4Gt9x8tjmbQ==
X-Received: by 10.55.110.6 with SMTP id j6mr30208748qkc.67.1487111069216;
	Tue, 14 Feb 2017 14:24:29 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	n42sm1121414qtn.58.2017.02.14.14.24.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 14:24:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Feb 2017 17:24:11 -0500
Message-Id: <1487111051-19305-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] Remove blacklists of python packages where build issues have been resolved
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
X-List-Received-Date: Tue, 14 Feb 2017 22:24:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-connectivity/gateone/gateone_git.bb               | 2 --
 .../recipes-devtools/python/python-cryptography-vectors_1.6.bb        | 2 --
 meta-python/recipes-devtools/python/python-pbr_1.10.0.bb              | 2 --
 .../recipes-devtools/python/python3-cryptography-vectors_1.6.bb       | 2 --
 meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb  | 2 --
 meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb          | 4 ----
 meta-python/recipes-devtools/python/python3-requests_2.13.0.bb        | 4 ----
 7 files changed, 18 deletions(-)

diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index ba9a799..8b2a192 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -86,5 +86,3 @@ RDEPENDS_${PN} = "mime-support \
 
 SYSTEMD_SERVICE_${PN} = "gateone.service"
 INITSCRIPT_NAME = "gateone"
-
-PNBLACKLIST[gateone] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130642/"
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb
index 92b4907..4975278 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb
@@ -1,4 +1,2 @@
 inherit pypi setuptools
 require python-cryptography-vectors.inc
-
-PNBLACKLIST[python-cryptography-vectors] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130664/"
diff --git a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
index 74d7866..7fddf7a 100644
--- a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
@@ -14,5 +14,3 @@ RDEPENDS_${PN}_class-target += " \
         "
 
 BBCLASSEXTEND = "native"
-
-PNBLACKLIST[python-pbr] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130650/"
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb
index 909bbb4..58994ff 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb
@@ -1,4 +1,2 @@
 inherit pypi setuptools3
 require python-cryptography-vectors.inc
-
-PNBLACKLIST[python3-cryptography-vectors] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130626/"
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb
index c8fb94e..3f07b2e 100644
--- a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb
@@ -1,4 +1,2 @@
 inherit pypi setuptools3
 require python-ndg-httpsclient.inc
-
-PNBLACKLIST[python3-ndg-httpsclient] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130615/"
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
index 582d01d..4523d9e 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
@@ -1,6 +1,2 @@
 inherit pypi setuptools3
 require python-pymisp.inc
-
-PNBLACKLIST[python3-pymisp] ?= "Runtime depends on blacklisted python3-pymisp"
-
-PNBLACKLIST[python3-pymisp] ?= "Runtime depends on blacklisted python3-pymisp-dev"
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
index bbfbfeb..5e869b7 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
@@ -3,7 +3,3 @@ require python-requests.inc
 
 # Add the runtime depends for selectors.py
 RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-
-PNBLACKLIST[python3-requests] ?= "Runtime depends on blacklisted python3-ndg-httpsclient"
-
-PNBLACKLIST[python3-requests] ?= "Runtime depends on blacklisted python3-requests-dev"
-- 
2.7.4


