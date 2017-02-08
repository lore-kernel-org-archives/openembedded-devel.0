Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5CED3719B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 22:38:11 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id u25so19835432qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 14:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3mP4805heQ6o2R+Yhs5k7Z4PYfzL92I8cCrumCnqg20=;
	b=tGPmOU6Igr9rq2x1eX+RswW77GvihDMgBbGEgQ1Inn1uaXQX3LBvk03u1EWNghwY66
	pcx+uIs9bMBK4RCPO1ugjm/X8ivPv+mCF/Zizj6aLeq15qbtuGqK2FI5nF8j4xJ04oUo
	GwWEQjnW4REy3dqC4GrK8qkbj4YQR7WZ5q6mAYGXp0sELu6afrPfIcv76pIu+koGGXMr
	7qPB866n6uGPLgRXQGgI8D21ej9FQiFOW797t7jVplrg0ikaqfB9qOlvpDzrUbr3fsrH
	j6P0Iy0DUgUJhMZy4hITDRoPBPLdkwwl98yFHzWVa4dVkU5xYYNr2+g0qCA/t8gLDcK9
	tcXw==
X-Gm-Message-State: AMke39nVNGSp1eYjY/kWzXHmHVd8SlqA8uFhFE0pmdxkHX62Mpi9Tm9LK1gY101c27S6fw==
X-Received: by 10.55.174.3 with SMTP id x3mr21007173qke.162.1486593492131;
	Wed, 08 Feb 2017 14:38:12 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 11sm7394170qke.38.2017.02.08.14.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 14:38:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 17:38:04 -0500
Message-Id: <1486593484-11400-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-werkzeug: update to version 0.11.15
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
X-List-Received-Date: Wed, 08 Feb 2017 22:38:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc              | 5 +++--
 .../{python-werkzeug_0.11.11.bb => python-werkzeug_0.11.15.bb}       | 0
 .../{python3-werkzeug_0.11.11.bb => python3-werkzeug_0.11.15.bb}     | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.11.11.bb => python-werkzeug_0.11.15.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.11.11.bb => python3-werkzeug_0.11.15.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index 91c47ae..e469bf3 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68f5361a2b2ca9fdf26b38aaecb6faa"
 
-SRC_URI[md5sum] = "1d34afa1f19abcef4c0da51ebc2c4ea7"
-SRC_URI[sha256sum] = "e72c46bc14405cba7a26bd2ce28df734471bc9016bc8b4cb69466c2c14c2f7e5"
+SRC_URI[md5sum] = "cb4010478dd33905f95920e4880204a2"
+SRC_URI[sha256sum] = "455d7798ac263266dbd38d4841f7534dd35ca9c3da4a8df303f8488f38f3bcc0"
 
 PYPI_PACKAGE = "Werkzeug"
 
@@ -25,6 +25,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.11.11.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.11.15.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-werkzeug_0.11.11.bb
rename to meta-python/recipes-devtools/python/python-werkzeug_0.11.15.bb
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.15.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_0.11.15.bb
-- 
2.7.4


