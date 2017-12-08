Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CC20A78709
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:35 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p84so6528865pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wj0dOG1X4GZkEloCY0lhSFF848jFCenCeUXxaf8dPNs=;
	b=q2XXKfgjSHEPpGbzfFe05lBe1PXOaU9GHLDtyh7Yl2Bvy6y+XVJcUM4WlDecQNBa1t
	aD0Sh+1VqHIJ3HzzdgLn6Oc3ScIxKMzQI203yT3v4/ewoE9fzo/KJYOZPxG7UWrXxnuT
	rGn3OXG323pjbzYixQqQAJwju2sB1DZrSaLq6wFAitms5EytY7Jfkr6uo5pbQJtsLkIR
	uMf1UxRVTRUTYtel5Dw0X4t1tO64yHq/VH/lEk5tCor7JT9vCiNJdXDZWcSsiekMpTgI
	rQuD7OynKqQld4nwBGppj0bXP6/uspwhoLynRMVcqKLB2rYRsA7TAk7lj0zRTiDLLaoP
	EqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wj0dOG1X4GZkEloCY0lhSFF848jFCenCeUXxaf8dPNs=;
	b=pxTmiyl4ceC7xcjAALBSRjM1fhjXB6lP0oGLomeFUcGz9mMRfXZAROWPwaKsbIOXXz
	3SFRoDtomiQBWnMQVCAF4nelieOxjgwCV0GfnN4m1O3tcVFZ/itefw+38v5sVHFUHKtJ
	/d3eQn7xWN9Nh6GADYyY5qIK65anSDgsNKjDeGdu1ThZez/rBJWM5/Lp6j1o3wxdk1pr
	7UFCxH4eA0bdyPU9Vz6L41BNQkTqTytI1EnqS6xvY2u9bqWb90/iNlMuY3E2ZQGO+mZT
	yj91O7FulPsxNlXCso/XQHOxb0gOaP/1lo5/WwIK4OpqYCcWackl4H6i227qu7Gr8Er6
	4JXw==
X-Gm-Message-State: AKGB3mK7aasSa+RBJUNFRgcLKLBX1MPM/hBODR1EOTd8ZFZt5qffl9BH
	3usisjcn7q3y9L6uKQhgbU8+tw==
X-Google-Smtp-Source: AGs4zMayWJzwke6ikKPC/wLn8UCJ/FaSY6c9ovRGwhaoOCG0/PBkXYdVY2B45X/3crGkh78o3VJ0Bg==
X-Received: by 10.101.80.138 with SMTP id r10mr4310922pgp.428.1512712177003;
	Thu, 07 Dec 2017 21:49:37 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:36 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:10 -0800
Message-Id: <20171208054911.27014-13-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 12/13] python[3]-xstatic-font-awesome: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:36 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../python/python-xstatic-font-awesome.inc              | 17 +++++++++++++++++
 .../python/python-xstatic-font-awesome_4.7.0.0.bb       |  2 ++
 .../python/python3-xstatic-font-awesome_4.7.0.0.bb      |  2 ++
 3 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc b/meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc
new file mode 100644
index 0000000..d13cb83
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=313d021898694cd2b0ea6508bdfe51a2"
+
+PYPI_PACKAGE = "XStatic-Font-Awesome"
+
+inherit pypi
+
+SRC_URI[md5sum] = "141a0e9a7e21e82f922573a00ae0c166"
+SRC_URI[sha256sum] = "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b685816d220e685f6c"
+
+DEPENDS += " \
+        ${PYTHON_PN}-xstatic \
+        ${PYTHON_PN}-pip \
+        "
diff --git a/meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
new file mode 100644
index 0000000..41e85f4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-xstatic-font-awesome.inc
diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
new file mode 100644
index 0000000..639f80d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-xstatic-font-awesome.inc
-- 
2.7.4


