Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3978E78464
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:33:31 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id u12so76708047qth.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TgM9Qmb+kgCk978hKK1jq7yJlr4Ap41HtLaxmizOZa8=;
	b=deG/yNT9q16cUWwDmzOQYiPKfAP0eQDRj4/p2qrgUCdMuKod/fxKSvQImqMQQY/q37
	5/yV4Ta1cDKjLuNMbh3C83MSYN4RjP4NgrgC9oBTNY8wGSCU4ir+j11iWzOwo2QdGBph
	c/+dW5OZYT2lMLbTwDQFD8v3IqsKC3KwESH2ZqT1SsBSq1TosI0c7/8oysy2d73h07Eo
	GNK/N0JMHVq3i1NPtrbcC8tIPhFo2L0MtLcdqoJlY9HfHIaALKgA/VnNMkRfbYbUxDc5
	BJGUToAnoG2CKwYmvBkCqdLvB+BPU6hY+sgN3nb0wlePr2UqEJNMBSwqKBYYxsQW8qXc
	QekA==
X-Gm-Message-State: AKS2vOzGj0Y0KGK0EDnOyVwashnr3T1CesNVql8eLokhX29UQKCallO2
	hI5p/p8uCmzY6ppDxVM=
X-Received: by 10.55.158.208 with SMTP id h199mr14260508qke.254.1497641612996; 
	Fri, 16 Jun 2017 12:33:32 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id n3sm2028566qkd.21.2017.06.16.12.33.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 12:33:32 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:33:24 -0400
Message-Id: <1497641604-6998-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask-pymongo: update to version 0.5.1
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
X-List-Received-Date: Fri, 16 Jun 2017 19:33:32 -0000

Verify the license terms remain the same and update checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask-pymongo.inc        | 6 +++---
 ...{python-flask-pymongo_0.4.1.bb => python-flask-pymongo_0.5.1.bb} | 0
 ...ython3-flask-pymongo_0.4.1.bb => python3-flask-pymongo_0.5.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-pymongo_0.4.1.bb => python-flask-pymongo_0.5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-pymongo_0.4.1.bb => python3-flask-pymongo_0.5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
index 6d54837..e11283e 100644
--- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
@@ -3,10 +3,10 @@ DESCRIPTION = "PyMongo support for Flask applications."
 HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;startline=1;endline=24;md5=dff998d5a8469503612ee7757f3a2052"
+LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;startline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
 
-SRC_URI[md5sum] = "cbf5fbcd22719d8393e481bcac36be05"
-SRC_URI[sha256sum] = "75862daece1c979a9eab5f9d1e32eb781775842273b629ae5d1cb28e6953df78"
+SRC_URI[md5sum] = "d7a1b717f27154e1f3a355f8ec2467d6"
+SRC_URI[sha256sum] = "2baaa2ba5107d72b3a8bd4b5c0c8881316e35340ad1ae979cc13f1f3c8843b3d"
 
 PYPI_PACKAGE = "Flask-PyMongo"
 
diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo_0.4.1.bb b/meta-python/recipes-devtools/python/python-flask-pymongo_0.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-pymongo_0.4.1.bb
rename to meta-python/recipes-devtools/python/python-flask-pymongo_0.5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_0.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-pymongo_0.5.1.bb
-- 
2.7.4


