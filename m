Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 898BA72FD6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:16:49 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x35so2529150qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gItDYcCmqn9Rea01toDmtx+sIcu6EOaPk5nIvMlj3dM=;
	b=FtBN8yvX2CxxxW3szmYseT5KzGGojYLTwsj221RbIcqmscXqGgJPtm5t8/GGQM4j4c
	qnTkl7u103H1KE5ImA7ejmduv+w+LcvyYI/1ZFpPZrCQMV4kO5jWpN9HnEkbDAgLKArC
	Uz8mjj3qrna6gjdjbLSpjrzbGqyaoGIyTM8qbUzziy9Z2f2wPoFbz6pR0+ZwARFOqkvx
	RKv/+PYBR1wcfni3KjCfjZADTaj62ASecqyzZbJ8a10Ri8nCP99liwIFZk1cHQYPRow3
	ZuZaLSswVnf5U6KZ96838wToOy9ssmv5SQD6hYcZZRmaAHvpd/TirxmfqB+yFtO55isN
	FjOA==
X-Gm-Message-State: AMke39kLi5UTdPIt6CfdfTeKU4F/B0v1MYFuw2eZDmRx1VnjCg7+PsQ23g1blDuhPcDtlw==
X-Received: by 10.237.62.130 with SMTP id n2mr5229882qtf.40.1487809010846;
	Wed, 22 Feb 2017 16:16:50 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	r30sm1722725qtc.15.2017.02.22.16.16.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:16:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:16:43 -0500
Message-Id: <1487809003-26350-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-tornado: update to version 4.4.2
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
X-List-Received-Date: Thu, 23 Feb 2017 00:16:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-tornado.inc             | 6 +++---
 .../python/{python-tornado_4.3.bb => python-tornado_4.4.2.bb}      | 0
 meta-python/recipes-devtools/python/python3-tornado_4.3.bb         | 2 --
 meta-python/recipes-devtools/python/python3-tornado_4.4.2.bb       | 7 +++++++
 4 files changed, 10 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_4.3.bb => python-tornado_4.4.2.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-tornado_4.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado_4.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 7e3ac8c..9b1cf41 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -6,11 +6,11 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://setup.py;startline=2;endline=15;md5=5ab7571a79ad62d0ca7aea308bac7560"
 
-SRC_URI[md5sum] = "d13a99dc0b60ba69f5f8ec1235e5b232"
-SRC_URI[sha256sum] = "c9c2d32593d16eedf2cec1b6a41893626a2649b40b21ca9c4cac4243bde2efbf"
+SRC_URI[md5sum] = "b4816ea209118667ffc52ce9ff06ac85"
+SRC_URI[sha256sum] = "2898f992f898cd41eeb8d53b6df75495f2f423b6672890aadaf196ea1448edcc"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email ${PYTHON_PN}-subprocess \
-                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi"
+                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading"
 
 RDEPENDS_${PN}-test += "${PN} ${PYTHON_PN}-unittest"
 
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.3.bb b/meta-python/recipes-devtools/python/python-tornado_4.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tornado_4.3.bb
rename to meta-python/recipes-devtools/python/python-tornado_4.4.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.3.bb b/meta-python/recipes-devtools/python/python3-tornado_4.3.bb
deleted file mode 100644
index eecc1f0..0000000
--- a/meta-python/recipes-devtools/python/python3-tornado_4.3.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-tornado.inc
diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_4.4.2.bb
new file mode 100644
index 0000000..77c9fb5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado_4.4.2.bb
@@ -0,0 +1,7 @@
+inherit pypi setuptools3
+require python-tornado.inc
+
+# Requires _compression which is currently located in misc
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-misc \
+    "
-- 
2.7.4


