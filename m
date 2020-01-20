Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0BA7F867
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 20:17:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p9so637517wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 12:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zXUV5R6tvBvjCnIzVI08uyVnXbk3qfQBAeDTFLXNDQM=;
	b=hmb3lPkO/ZE4RMDtHKqBimHKfX8XqVwFb8GQfwSHvkNZQPYIYaZm4KdRC+X4nsGnnq
	79RJTkfwVdqSWISluyNPTwHCOBlOu+Fyjv5fDzxZJNBAKRGd/AF1FOIwXAHvncTEzfKQ
	y/46cTdpNCTiCBwlhKEi/DhgcRMUdhBZR/JLakIzkUGCTCqOcv6pxCaKZsldcJ565GaW
	tPuTcCRymF98K9dirvfNLM8p5JM1bXyERd3dAI/SunFzcYvtqi3kCrdZrW7l5ovqETvI
	MpMQVEX3dYnILD8FQjGSlaso3G0jjZVKdDl96C8ZNP1YCh3HE6YB1ZWU0cZ+KtwiV4Yx
	JB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zXUV5R6tvBvjCnIzVI08uyVnXbk3qfQBAeDTFLXNDQM=;
	b=tdhtpOb+RpWTbADx8J8Q52KyjRWnf6hDE5f6L0/S+QeBtSmZvm5LqtnjG4UQQWOaAq
	Sdyx2qN5EyqC6797SHcIVMrVfL659iorbO/SWndXkZI9qiPpy//YgH7uXeXYvFXNnE0u
	ZiAZZLKUR5Za5ueXF66wAC1CqCIDORxTYBbH8FGuF/EerrVT+kMMFjuKpLnl3lOyIkaG
	+jMtkN0W6+Qv9F/Q6ClMQgM7+h6RE5k/g1MwE2vkzZvgLt8jzr/zG09aC+WmxCbqyLAk
	++hq5v93HxnvcNMPnuGZiDf2jI2wWLW611+yr9XrRfH/QBG3MWtSjOqni1bHxSd+WCnb
	rqRg==
X-Gm-Message-State: APjAAAWXOmYsFYCAYD1kvq+mVqwvT1lflet1d7OdSEZxhGgRUPoFU3+z
	uK2rSaMh50o/GbtJtLyvXwwl8BNwv2o=
X-Google-Smtp-Source: APXvYqyIdJr4R7cM+E5cOu/rsrZOHcFIGDmnyhuZgd+hfFiyiFApPR2cfUarIYqZH7YXR96zxHuPhw==
X-Received: by 2002:a05:600c:1103:: with SMTP id
	b3mr510462wma.141.1579551478683; 
	Mon, 20 Jan 2020 12:17:58 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7]) by smtp.gmail.com with ESMTPSA id
	d8sm50174339wre.13.2020.01.20.12.17.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 12:17:58 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 20:17:49 +0000
Message-Id: <20200120201750.29842-3-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120201750.29842-1-andrey.z@gmail.com>
References: <20200120201750.29842-1-andrey.z@gmail.com>
Subject: [meta-python][PATCH 2/3] meta-python: rename python2 recipes to python3 eqiuvalent
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
X-List-Received-Date: Mon, 20 Jan 2020 20:17:58 -0000

Rename recipes which were previously built with python2 to their python3
equivalents.

Use new python3 classes (setuptools3) in those recipes.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 .../{python-pyro4_4.77.bb => python3-pyro4_4.77.bb}             | 2 +-
 .../{python-thrift_0.13.0.bb => python3-thrift_0.13.0.bb}       | 2 +-
 .../python-txws/{python-txws_0.9.1.bb => python3-txws_0.9.1.bb} | 2 +-
 .../{python-jsonref_0.2.bb => python3-jsonref_0.2.bb}           | 0
 .../python-cson/{python-cson_git.bb => python3-cson_git.bb}     | 2 +-
 .../{python-pyephem_3.7.7.0.bb => python3-pyephem_3.7.7.0.bb}   | 2 +-
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python-pyro4_4.77.bb => python3-pyro4_4.77.bb} (94%)
 rename meta-python/recipes-connectivity/python-thrift/{python-thrift_0.13.0.bb => python3-thrift_0.13.0.bb} (95%)
 rename meta-python/recipes-connectivity/python-txws/{python-txws_0.9.1.bb => python3-txws_0.9.1.bb} (95%)
 rename meta-python/recipes-devtools/python-jsonref/{python-jsonref_0.2.bb => python3-jsonref_0.2.bb} (100%)
 rename meta-python/recipes-extended/python-cson/{python-cson_git.bb => python3-cson_git.bb} (96%)
 rename meta-python/recipes-extended/python-pyephem/{python-pyephem_3.7.7.0.bb => python3-pyephem_3.7.7.0.bb} (94%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
similarity index 94%
rename from meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
rename to meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
index 738cf8677..f9dd9300b 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.77.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "2bfe12a22f396474b0e57c898c7e2c561a8f850bf2055d8cf0f7119f0c
 
 PYPI_PACKAGE = "Pyro4"
 
-inherit pypi setuptools
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-logging \
diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.13.0.bb
similarity index 95%
rename from meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python3-thrift_0.13.0.bb
index 2d51619d4..80f1a5017 100644
--- a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.13.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e95cd2f17c70d3180a2b361332319fe0"
 SRC_URI[md5sum] = "c3bc8d9a910d2c9ce26f2ad1f7c96762"
 SRC_URI[sha256sum] = "9af1c86bf73433afc6010ed376a6c6aca2b54099cc0d61895f640870a9ae7d89"
 
-inherit pypi setuptools
+inherit pypi setuptools3
 
 # Use different filename to prevent conflicts with thrift itself
 PYPI_SRC_URI_append = ";downloadfilename=${BP}.${PYPI_PACKAGE_EXT}"
diff --git a/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
similarity index 95%
rename from meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
rename to meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
index f3631cda3..6d1327ac4 100644
--- a/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -11,5 +11,5 @@ SRCREV= "88cf6d9b9b685ffa1720644bd53c742afb10a414"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools
+inherit setuptools3
 
diff --git a/meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb
rename to meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
diff --git a/meta-python/recipes-extended/python-cson/python-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
similarity index 96%
rename from meta-python/recipes-extended/python-cson/python-cson_git.bb
rename to meta-python/recipes-extended/python-cson/python3-cson_git.bb
index efb338cf2..5c74c7a30 100644
--- a/meta-python/recipes-extended/python-cson/python-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 RDEPENDS_${PN}_class-native = ""
 DEPENDS_append_class-native = " python-native "
 
-inherit setuptools
+inherit setuptools3
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
index 422f0dbc4..38b3c0a4f 100644
--- a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_3.7.7.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "607148429f85412915e32265779c0cf6d09f73aa97cf1ff0d101ac22c6
 
 PYPI_PACKAGE = "ephem"
 
-inherit pypi setuptools
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
-- 
2.17.1


