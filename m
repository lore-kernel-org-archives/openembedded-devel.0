Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F0EB271DAD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 21:05:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so344610wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 13:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1oMnxPCd4stqKpZeTBEuZFi5sVOuvVzX9MRO9ym8q8g=;
	b=VU97FL1COFBywsYgy9R822V9IaZQs3ZJUUAOC6Z9+eb+lg/wWRCr82GY4UUui7xVaF
	I1/2LVfpGqyFGUD6HXtvJAu6BbDLn1J+a6WayXH2Bdhtad9gnssoZKglA0u1cZzNDACf
	kOej3A8pTW9qrjcvhsM8a6SlgjQA1KVW+ZHuNN2v3jzSl6gL9kE4upQbOxQ6HxEMWDDI
	Er5FCJU9gOa0uwCW0lLHvcZFCrFXsraLjej0+eouSEyosiKlDrTMCpfVzaSCerKYX/ud
	qp2FN7tmE/Oq7yTYyoPPWOwk0kGLTZLrFXr/KvmxtDq0qphG2toxyH5HYzrXU1Qy3kGp
	rjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1oMnxPCd4stqKpZeTBEuZFi5sVOuvVzX9MRO9ym8q8g=;
	b=hJ9kxiMs7fDcHKHEum2EgKodroK024zZ73I6ZGGtpGBT5rKK4qwFJ8qTRviZSy/jXx
	lSQgxjLruWUS9yoZi6VCS9G5u+Ypw9erFQcU3I/OMDFH0JXzlPfm8wIPK7YnPuvsmwRV
	NeY/PDDm1P0r6yL2yT+aK4FbLqNlprvVoveeV6vrNkjmYUKNFb2CyT+lBIf+gm6bc4zg
	JDRXhAiAlPM/Kc+JWmN1ONwkjy0zGiBSSAeYMVJnGg3pyh3VhOcA0y3hu+Ia9Lf68n1n
	m2nE0waWhirld/G3cxeeuIXpJBw7cBir9HgpMyX5hExIUeKnLBJ/Gxoyt77YWwvfCy/7
	tPKA==
X-Gm-Message-State: AMke39mWV0XYe/sWr9PjocAa8lX9WKx8xj27wXRZk9at7qJi50G2Xckfz/XODLVAS+0Rdg==
X-Received: by 10.28.156.86 with SMTP id f83mr211665wme.93.1487019901588;
	Mon, 13 Feb 2017 13:05:01 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	g11sm12212764wrb.63.2017.02.13.13.05.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 13:05:00 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 22:02:05 +0100
Message-Id: <1487019728-19329-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH][master-next 1/4] python-m2crypto-native: rdepend on python-typing
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
X-List-Received-Date: Mon, 13 Feb 2017 21:05:03 -0000

Because of a bitbake limitation add python-m2crypto-native.bbclass
which can be inherited by users of python-m2crypto-native to get
the required dependencies into their recipe specific sysroot.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-python/classes/python-m2crypto-native.bbclass            | 6 ++++++
 meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/classes/python-m2crypto-native.bbclass

diff --git a/meta-python/classes/python-m2crypto-native.bbclass b/meta-python/classes/python-m2crypto-native.bbclass
new file mode 100644
index 0000000..afaeca8
--- /dev/null
+++ b/meta-python/classes/python-m2crypto-native.bbclass
@@ -0,0 +1,6 @@
+# Inherit this class if you need python-m2crypto-native in your
+# sysroot. This works around RDEPENDS of native packages pulled in via
+# DEPENDS not being installed otherwise.
+
+DEPENDS_append = " python-m2crypto-native python-typing-native"
+inherit pythonnative
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
index ca46222..7c41828 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
@@ -12,7 +12,9 @@ SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi setuptools siteinfo
 
-DEPENDS += "openssl swig-native python-typing"
+DEPENDS += "openssl swig-native"
+# any change to RDEPENDS should also go into python-m2crypto-native.bbclass
+RDEPENDS_${PN} += "python-typing"
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
-- 
2.6.6


