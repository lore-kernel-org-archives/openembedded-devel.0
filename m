Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id DD96A601F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 13:24:47 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v125so10787392qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 05:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VlaOk08bAr+S1rI9Laq/gUG5OyPh5z6zess3NXdVAJ0=;
	b=HYGZcoEwZJmm+Pgal4R3RQ/wbVwIIMrYxPL6rPaO39hbwDvy1BtWm8HbK9lPJh7qeS
	39lOSX6Ws898Yv1GoI5zaCB7BWQGROZQ1ESCiVU7DgSFcre1gb3LqurDPmL349tPKUc6
	3D5bc2a5PeDjYibEL+Wmh5yT8z+3ut3DRRGirD7Z5+/gTUM2/chPlmQYTPhtaE9sKRRW
	NcAzg37AoBl41NyZvnctnT6iuunG6i+g6Rcxju2+17oTPAUDLM443fQ7oZiBk90lLZYZ
	oN3HW2pH8aDZ7TkyzhsMLFYxV+5gPG02v9LBke5OkADcgsfSR6grTt+MxdTVEP9FXW3u
	+CTQ==
X-Gm-Message-State: AMke39nlN/s2xubmaDFRHp2fAC0I7YijT8EwkzvGbnGQfUS/u2GVM5gdvBSEKszYEorbrw==
X-Received: by 10.200.53.99 with SMTP id z32mr7864595qtb.106.1488979488731;
	Wed, 08 Mar 2017 05:24:48 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id x2sm2063751qkc.61.2017.03.08.05.24.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 05:24:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Mar 2017 08:24:34 -0500
Message-Id: <1488979474-6997-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.2.0
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
X-List-Received-Date: Wed, 08 Mar 2017 13:24:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc                 | 4 ++--
 .../python/{python-psutil_5.1.3.bb => python-psutil_5.2.0.bb}         | 0
 .../python/{python3-psutil_5.1.3.bb => python3-psutil_5.2.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.1.3.bb => python-psutil_5.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.1.3.bb => python3-psutil_5.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 57bfc88..6d3ebf8 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "3090e32d42761086ae82036cadb95ba3"
-SRC_URI[sha256sum] = "959bd58bdc8152b0a143cb3bd822d4a1b8f7230617b0e3eb2ff6e63812120f2b"
+SRC_URI[md5sum] = "c9aa2599dcd9e5b59d71b6660d396062"
+SRC_URI[sha256sum] = "2fc91d068faa5613c093335f0e758673ef8c722ad4bfa4aded64c13ae69089eb"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.1.3.bb b/meta-python/recipes-devtools/python/python-psutil_5.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.1.3.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.1.3.bb b/meta-python/recipes-devtools/python/python3-psutil_5.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.1.3.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.2.0.bb
-- 
2.7.4


