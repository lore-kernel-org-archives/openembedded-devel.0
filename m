Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6B19972FC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:14:44 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n127so2782545qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=INcB+eIk7w4lTD7GzbQLokg9GQ7FrHLbTRCUji5vrPU=;
	b=ItEsRkDMZJfKTbQiaUHSSFwcWcFmt/iF6ySg0sxG4uJKLKhuDYyQ2XVCPjfdqCt1eZ
	lYDbCISahfWBeM2NVwJFVoimovE4uwMIx9IYAzhT50QwpM8iHgyY3EKav0g+6dQn4NM8
	BTYeHhPWWkaHrmfo2rdLr1QxZxjpBUYJJx4W8nrIohUXYeJk9VneUzzBOgWiXt7xsSeb
	9jiGkcrZFQuWTq+r38u4xkpOC6KTAMW/8PI1Nh8f7T5qCNx+pH/kI84jk3LiqufHRS5I
	ZDN8f02tXNuaCKtbDnumxxlnGnyEdHGcI4toUdsWl2jb/cajSiHO2El1hev1s6LA8yZU
	QRRQ==
X-Gm-Message-State: AMke39nJnxQjcDXvXE6N9ys5WA0LOr95byNqj3L94hCcDyW3jBr36PBMJu//h6e0tkfplw==
X-Received: by 10.55.164.70 with SMTP id n67mr34363654qke.95.1487808886413;
	Wed, 22 Feb 2017 16:14:46 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	p19sm1692894qtp.63.2017.02.22.16.14.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:14:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:14:39 -0500
Message-Id: <1487808879-26058-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-pymisp: update to version 2.4.65
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
X-List-Received-Date: Thu, 23 Feb 2017 00:14:45 -0000

Verify the underlying license remains the same and update the checksum
for the latest released version

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc               | 6 +++---
 .../python/{python-pymisp_2.4.54.bb => python-pymisp_2.4.65.bb}     | 0
 .../python/{python3-pymisp_2.4.54.bb => python3-pymisp_2.4.65.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.54.bb => python-pymisp_2.4.65.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.54.bb => python3-pymisp_2.4.65.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 574b6a5..60e7647 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ab76fa0012a07b5bb59582601d0b46b6"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b56d97305d8b2066f2a160d3c8b22f76"
 
-SRC_URI[md5sum] = "1a0653688a862a8746dbaae2c5e66207"
-SRC_URI[sha256sum] = "27edaea4e1f7bd978c8d3271371824e320e722896bc7b044665e04e370f98644"
+SRC_URI[md5sum] = "cc19a249418a3752379e6528813a715b"
+SRC_URI[sha256sum] = "3ab6d990e09ca404ce778ebbe6b2fd733dfbd244fe5a5ba3f86efe897a6c5c1d"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.54.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.65.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.54.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.65.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.65.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.65.bb
-- 
2.7.4


