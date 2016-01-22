Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id AD20E77060
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:58 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l65so477474wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KNLJgNDOtyU+o8H0PY84tIki7PtZB0g2vecs1dZLRZY=;
	b=PSsru+ErkzmpwnveGDv0SX/5Z78R7jhS1QH54SSkGKj2Cw6yziXec2Iju4d5U4nJ13
	FM4XU/606J8ZTGdrO31zjXGTBbMNlbpmm8Bey1/52v+jFYio3eck2LrAxhgtLEqfb/Ui
	a65KjFSZMz1Y7Y2umaSWUr6G4BoLwTN497Uhe8vgrjQU1FsXSWH3lDAE7YqdEoY6K4R2
	p8NusXWqndqiG1WHsS8//i3attYozNY5SbydesiDVDzSk+q+qJC/BZXc6On+PAGf7lhR
	W8At/po7aVmifH8uIqBLP0iakDnlIr3k7wwV3xZXcxo7iR8C2iQlyk+mv7pCxqHowFB0
	6yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=KNLJgNDOtyU+o8H0PY84tIki7PtZB0g2vecs1dZLRZY=;
	b=h/wVITeDuJKm26xZ+gRG0FP27yj9Nh1IwZ/3r7fvuPEpb5/uTJJ+19UezuGPV7VdcX
	kEZFruHmtnGEqMYxUNJRBHC+bFLq0s9i3Q/VQ2IcRYtC3JOa0kJrWHphHMLDbgiqGR/G
	Ae3SHe0hTRfE7s7Dwf9p4iYAAyTAQmM6q/8tzFi63+3+b1rj43DUj+CVV4Vv1GeLZBcv
	996HRIolWBfvUNZTRtjJSF1tKx2eTd/fr3BH42+rRjKBO49uqxg8zrER9Ni+PD/lQDZ4
	G8EBw9sNTI8mKh4TQ5FioSvIXB1In7u8KEQg1pIhDrWZoWJZUI+6Ao6uIKJnU36NOa6z
	17wg==
X-Gm-Message-State: AG10YORicU5g3Mnu5ylUdb+9XRqghkHHG+XKwt2RTInMV7F05L9txPh8wRMT/V8q3x1/kQ==
X-Received: by 10.194.112.41 with SMTP id in9mr5610863wjb.139.1453505459336;
	Fri, 22 Jan 2016 15:30:59 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:58 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:17 +0100
Message-Id: <54d954f5c3b5272ff7808fdd86ccc1c01b51eb8c.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 15/21] python-certifi: 14.05.14 -> 2015.11.20.1 and add python3 recipe
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:59 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../{python-certifi_14.05.14.bb => python-certifi.inc}    | 15 +++------------
 .../python/python-certifi_2015.11.20.1.bb                 |  2 ++
 .../python/python3-certifi_2015.11.20.1.bb                |  2 ++
 3 files changed, 7 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_14.05.14.bb => python-certifi.inc} (53%)
 create mode 100644 meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb

diff --git a/meta-python/recipes-devtools/python/python-certifi_14.05.14.bb b/meta-python/recipes-devtools/python/python-certifi.inc
similarity index 53%
rename from meta-python/recipes-devtools/python/python-certifi_14.05.14.bb
rename to meta-python/recipes-devtools/python/python-certifi.inc
index 5e0404e..c9c3e2d 100644
--- a/meta-python/recipes-devtools/python/python-certifi_14.05.14.bb
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -2,19 +2,10 @@ SUMMARY = "Python package for providing Mozilla's CA Bundle."
 DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
 Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
-HOMEPAGE = "https://pypi.python.org/pypi/certifi"
-SECTION = "devel/python"
+HOMEPAGE = " http://certifi.io/"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRCNAME = "certifi"
-
-SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "315ea4e50673a16ab047099f816fd32a"
-SRC_URI[sha256sum] = "1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+SRC_URI[md5sum] = "e04b512009401603f1485380ac879cf5"
+SRC_URI[sha256sum] = "30b0a7354a1b32caa8b4705d3f5fb2dadefac7ba4bf8af8a2176869f93e38f16"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb b/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
new file mode 100644
index 0000000..ce121d6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-certifi.inc
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb b/meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb
new file mode 100644
index 0000000..dfdd6e9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-certifi.inc
-- 
1.9.1


