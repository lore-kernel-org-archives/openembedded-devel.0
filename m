Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id D57A56E687
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 13:24:08 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id f74so7962352qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 06:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+fu0SdZEDt2nrkIzgqu2OojPu31vF7eVdggh+Qap/Mc=;
	b=PaPZXzsVblp+EEURmptLqMkaZTOMC2Ra8dpY0JAoDtty+t6Y/RQEofdCXUDGk25YTY
	5Z7GypJKQOA6niR16Nr3+HLCNF7THVDTM95w5aE1cofwrFXoTBcIXZxFv7+58uOF1edV
	m11nMsOdXjplrQRlE2uJcWiZxJqa1vqjI/76dCs40ckT+MiXcnTHQeGlbqLrNrtnQqH3
	RzkMfKXtJZhoNG723xWGfrNFTbh3KmTj7B4kTp2oji5tJdjR8kzsN7cg2h4ZAlb9Og9v
	ugIgUZllKSOtYY0qziEjxIYnWW18366IFduiqf7FQByXWiPlY24MzmAd6AOEPSGmA7uA
	VvXg==
X-Gm-Message-State: AOPr4FXR/Z+XSastUWbMQ8nLSnJxq9IFPNeB/XSJPte9RVz0iSc/mS4cI/DVhVdT9O9dFw==
X-Received: by 10.140.100.173 with SMTP id s42mr14810584qge.19.1463145849118; 
	Fri, 13 May 2016 06:24:09 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	z189sm8246536qhb.42.2016.05.13.06.24.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 06:24:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2016 09:23:50 -0400
Message-Id: <1463145831-27570-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/2] python-flask-pymongo: update to 0.4.1
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
X-List-Received-Date: Fri, 13 May 2016 13:24:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask-pymongo.inc         | 5 +++--
 .../{python-flask-pymongo_0.4.0.bb => python-flask-pymongo_0.4.1.bb} | 0
 ...python3-flask-pymongo_0.4.0.bb => python3-flask-pymongo_0.4.1.bb} | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-pymongo_0.4.0.bb => python-flask-pymongo_0.4.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-pymongo_0.4.0.bb => python3-flask-pymongo_0.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
index 939113b..535ddfc 100644
--- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
@@ -5,9 +5,10 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;startline=1;endline=24;md5=dff998d5a8469503612ee7757f3a2052"
 
-SRC_URI[md5sum] = "457a210f35ba49d2623dbcf27fbb89e1"
-SRC_URI[sha256sum] = "707ddff92f5b7bdc34d401f1f3857a3d1a9f5dba76e6a1422ccbc3651e2ca521"
+SRC_URI[md5sum] = "cbf5fbcd22719d8393e481bcac36be05"
+SRC_URI[sha256sum] = "75862daece1c979a9eab5f9d1e32eb781775842273b629ae5d1cb28e6953df78"
 
 PYPI_PACKAGE = "Flask-PyMongo"
+PYPI_PACKAGE_HASH = "04417070930eb72f79c69efaa7289635160b20e568b873428304e19dff235244"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb b/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-pymongo_0.4.0.bb
rename to meta-python/recipes-devtools/python/python-flask-pymongo_0.4.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.1.bb
-- 
1.9.1


