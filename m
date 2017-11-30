Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C37878532
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:48:08 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e14so2577346pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UstiTsEZLKhozOQnKBzLL8wayua4lN3eVilR1HMGZ4o=;
	b=DALPlHqRw4aWo13CIQNmKzeRH9rNZt2IwwLidxxPcFew6/OsXg1OBq2YdMqQj7/Dtk
	m7dFzM0CwpuZ2EpWwZTlaGE+6gZkqt7Mtl6/rIdDyXBttTtKIwCCKhJ69nKkLex5sjq2
	lFfBoQaH3TThoT2s7zoR1CfbsL6ummBwPOAniLn8ug8vHIbNl0JvyBAGKFOPQ/WNE7nR
	rejMw5p2WNiRy/GRqin/Ay2Vp/2rj3SWEOCfrPGFOpgFQu2REPodu+LaSTEzwwTWRIFS
	16Yjdd+Fg6jfRVp5Qyczc6sI+cjTNzsLAQsKibLilB+sxDXYr8+DNGkCMjc5h7hoFcJs
	gPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UstiTsEZLKhozOQnKBzLL8wayua4lN3eVilR1HMGZ4o=;
	b=lhvnhps5dm9dGehX5E45mYGp5B3UeAGHZqGP3J8/JbPdmM0nBXAl6SEIYoSsXg6ODR
	dJydBujU8zlBGq2hFsb1+yxnHK6AZJv0nzNqYxZV1dhuwCQnJHYg/KJBoWJFYkyCrNVZ
	i7pcVKQPrBQUZ9/4PW411poSdGJgILDNaz9H2ZWsbDIzHAYZfxxfIGYvDaiGvlm4gB4/
	mVSavl8HXFWvhDp8zQLfVgUMa+mczcWPfCl7ydzFJ7mfQxMCiDZjqwOoI0ArsXd2BLGU
	vZhl8NitMtU3eRVXZ/IuOvd0pDGhFMN0dZPpOQzB5xeBEibYlV3szAJvFqIJ30fz/Mv5
	2e8Q==
X-Gm-Message-State: AJaThX4ConoxGpPLA1ToXkKtWVPt/HUU+e98/UoQjMWvO6dGCswZSmPz
	Irw0A8ZjOeN8VcRc5arb/EOwQw==
X-Google-Smtp-Source: AGs4zMbxkdHnLN1zCgIRh79ir3t+UGddOmkjcV1lI3U2RCazVWfMi5RyzU++52pHUKOVUIm2zoL+/w==
X-Received: by 10.99.119.67 with SMTP id s64mr1307250pgc.390.1512020889321;
	Wed, 29 Nov 2017 21:48:09 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.48.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:48:08 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:47:02 -0800
Message-Id: <1512020828-4040-4-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 03/12] python-flask-bootstrap: move core of recipe to a .inc file
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
X-List-Received-Date: Thu, 30 Nov 2017 05:48:08 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-bootstrap.inc   | 14 ++++++++++++++
 .../python/python-flask-bootstrap_3.3.7.1.bb             | 16 +---------------
 2 files changed, 15 insertions(+), 15 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-bootstrap.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
new file mode 100644
index 0000000..0723b97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
+
+SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
+SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
+
+PYPI_PACKAGE = "Flask-Bootstrap"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dominate \
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-visitor \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
index 2b2a6f9..eeaade9 100644
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
@@ -1,16 +1,2 @@
-DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
-
-SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
-SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
-
-PYPI_PACKAGE = "Flask-Bootstrap"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-dominate \
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-visitor \
-    "
+require python-flask-bootstrap.inc
-- 
2.7.4


