Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 618636080F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 20:41:51 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j2so17822027qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 13:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h7COA9+A3dK3P8c7YibSJJFw9gxl/m+I9/iknXHxvtM=;
	b=URJF6QNlW3OwLjjLgvC+3zssYznw/DoInorByqH/npjkgkQlzwt6Kc87l36GyisgCm
	I+3q2WbIe4hwphsOz255ctRXPxu8e1o9GNP4QbqQKnkWj7CAx1/+6mUrpfDRkxhaPs8s
	LX8wI9jDTIYPyOnITt38Im/qfI7yqZ5pypqltWFmcNvy8PSoi9R8AR9blsF7IfHvqnX5
	AcrGNTl1gvDOG/QizkNZC/UUrI1UqP1guTfaltFByyVqnh84WJwmOiW7bqmumYIqS1gV
	f15TNDwhQqlChol5ZMqsFZTvPE6p+5XCJyToK9a6JBTggU+MGQCAog9RGATIvpXEOe1c
	d9QA==
X-Gm-Message-State: ALyK8tICaxnaf5Tq6g+1wS0VEAej4e85EGFy0nV2ABOss6gyH6Ly7VviXmTToyMM9pWgpg==
X-Received: by 10.200.40.181 with SMTP id i50mr556052qti.89.1466714511853;
	Thu, 23 Jun 2016 13:41:51 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 29sm764014qtx.4.2016.06.23.13.41.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 13:41:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2016 16:41:43 -0400
Message-Id: <1466714503-8983-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.48.1
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
X-List-Received-Date: Thu, 23 Jun 2016 20:41:52 -0000

  * Update license checksum for updated changelog

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc               | 6 +++---
 .../python/{python-pymisp_2.4.36.bb => python-pymisp_2.4.48.1.bb}   | 0
 .../python/{python3-pymisp_2.4.36.bb => python3-pymisp_2.4.48.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.36.bb => python-pymisp_2.4.48.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.36.bb => python3-pymisp_2.4.48.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index d765f4d..c49bf47 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9e88f5bb83eea02852e3673b8c0c004a"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f64d66a9942f5e2de6c06b0dab2764b3"
 PR = "r0"
 
-SRC_URI[md5sum] = "9da2b395cf6d00368d0a6b5b11f706dd"
-SRC_URI[sha256sum] = "22a05d2b442991df82eeadfd36b0f54e4e9514e228fdb0a01598184335fe3f4d"
+SRC_URI[md5sum] = "581ec9d30e15b537dcb203f0756aa136"
+SRC_URI[sha256sum] = "ba909f0d2186f10f59da383d9fccd20ce3d589b6ff243e7ea8a8ebbfce135f68"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.36.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.48.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.36.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.48.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.36.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.48.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.36.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.48.1.bb
-- 
1.9.1


