Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1E06FF9D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 13:43:49 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id 90so8034774qgz.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 06:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kg54dld1ml9JCG0sscuERlIcWmIkM2sNpvrEfZY9Z1w=;
	b=X6+mCLfbyEfbry7rSFjlDCkuiyiw3OnaGJ4Rq7pa5iUoadkVU/7bg4M98w+lZJcZJ5
	M7G7wPsw8p9+uBuXaL7Lkt6qZv+9k3O9fV1pupOe44ujOUJTzxFsmh6rAaxP1GLjyI+N
	Aj/pXZMlq7eo9SjzH9GrCQNHs1/WivWg9UMdKvYPGQDXaE760dPl40eyOSsWPVPbKS5B
	jKXCFwsuJP+X8jEWVpHNXD6s6IY08Bn8fWpLhKoAvOD0Z3GsTSOtpeQfBqy2/4WqI9iZ
	t6xEwLpUT4yQMNuWFtRKnKNs4ihb2dPF1Sc24ZeckUbegt9yffDXiD4rHN7bHWHXQU/L
	VvyA==
X-Gm-Message-State: AOPr4FWb9uDInIR0qFGUGSGXMHSG7qGNzUsu2/V/NC8gn3+5Rytht0qM9++0JGGH0XEsgQ==
X-Received: by 10.140.253.84 with SMTP id y81mr16413492qhc.56.1463147029723;
	Fri, 13 May 2016 06:43:49 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	x202sm8299248qhx.30.2016.05.13.06.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 06:43:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2016 09:43:40 -0400
Message-Id: <1463147020-30866-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.36
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
X-List-Received-Date: Fri, 13 May 2016 13:43:52 -0000

license checksum updated for latest release; license remains the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc             | 8 +++++---
 .../python/{python-pymisp_2.3.bb => python-pymisp_2.4.36.bb}      | 0
 .../python/{python3-pymisp_2.3.bb => python3-pymisp_2.4.36.bb}    | 0
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.3.bb => python-pymisp_2.4.36.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.3.bb => python3-pymisp_2.4.36.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 9cd0844..b9141e2 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,10 +1,12 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c0a3e801b740ef31d1f5ddfe76bca538"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9e88f5bb83eea02852e3673b8c0c004a"
 PR = "r0"
 
-SRC_URI[md5sum] = "398408388902c108e3b378152b6c1d24"
-SRC_URI[sha256sum] = "d70e74c528f040f5ff8137337f1758aeb63a5966b58b297f2171f53cb9df033e"
+SRC_URI[md5sum] = "9da2b395cf6d00368d0a6b5b11f706dd"
+SRC_URI[sha256sum] = "22a05d2b442991df82eeadfd36b0f54e4e9514e228fdb0a01598184335fe3f4d"
+
+PYPI_PACKAGE_HASH = "0e63006ef2af33c142c16f3d3d2886236bd6c6a026699639758d8fa2c72356be"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.3.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.36.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.3.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.36.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.36.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.3.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.36.bb
-- 
1.9.1


