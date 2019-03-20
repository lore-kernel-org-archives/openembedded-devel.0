Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id E93F97CE6B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2019 13:07:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id f3so20680566wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2019 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CXzRavQS+KU57nKQRaE79eaNaX/nQu+mwkxb35wDWXk=;
	b=vNMEZqTKHN/dMpaH7aT7y7pHnX37yBFEcA8adntjpT5xg4i3WYzlYHBOVoQeUuwtgQ
	+a+M9N0YGWmrB+amqT1ud3ymdnhWwXWsmSBaEqjDDxuBPvO9ydmTV8Aa/dy8YvDQVIil
	Sya63GaQCMh+5AkJWquRWvKPnQyYltEny2dQ6Jdtk6gL6VWA2LkgHUitzmfzCinpI1uW
	lJfnsjQh00/EInZVP163qlchxWbkEhbCAgaDsEUAuZWuX79pWWuOUetk2FpU5xjVAl+z
	tlKsT7X7lwu16ZUAlfeKX7f84nljrrguuVDD2eaEfE0Nm+pUsEUkCeB91aOBw/rBgH2U
	nLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CXzRavQS+KU57nKQRaE79eaNaX/nQu+mwkxb35wDWXk=;
	b=lJ/YXcJyOCIBQH+KbzgKj7P1Y2hZJF8oFD5IdiX7Se1IrUjP3s+wFNIkU3YMZ9BCNN
	KyI0Bc1uAdhpeNdAGzk9QRvBxJLhuCgUyp2wBJNuLWxmh/icVqC9NoKLxEiEsQg+C2g7
	dVtFubgtmrWw96jBxtAffxA/B8tFTY1bev/SvOSvkR2bVzZpN7E9USl9LpJP9cuBLN5Z
	zqjeGOv0FkV6vTTkEwzz6zZ6KSo1YW4FGQoM9+pLnrJySxBSMgQgGPxAkO0GHt3Ln4LU
	tux38n/ow9mQyYkwWwepKNyC9gjJnfAN7Kff7/WwUzoJiEkYDimztZEZ5+FS+QqRUjh/
	ax9w==
X-Gm-Message-State: APjAAAW5Lh1RpM/XhSfmlCaOR15c1rKHY+awO27QbOD/1XdHFBREWigE
	gpGe2jW9OkFbO+g1lGeUF/N5sBATFio=
X-Google-Smtp-Source: APXvYqzUxhcpyda0U0L/PDw7YO2UtAAgrtY86RaglewIPqPIwcEoUnU3xIsCMGBp24Vy9kx6jHyCsg==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr8595650wmi.6.1553087261376;
	Wed, 20 Mar 2019 06:07:41 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u12sm2425754wrt.2.2019.03.20.06.07.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 06:07:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Mar 2019 13:07:35 +0000
Message-Id: <20190320130735.16859-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190320130735.16859-1-ross.burton@intel.com>
References: <20190320130735.16859-1-ross.burton@intel.com>
Subject: [meta-python][PATCH 2/2] python3-kconfiglib: add
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
X-List-Received-Date: Wed, 20 Mar 2019 13:07:41 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-kconfiglib-10.42.0.inc | 8 ++++++++
 meta-python/recipes-devtools/python/python3-kconfiglib_10.42.0.bb | 2 ++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-kconfiglib-10.42.0.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-kconfiglib_10.42.0.bb

diff --git a/meta-python/recipes-devtools/python/python-kconfiglib-10.42.0.inc b/meta-python/recipes-devtools/python/python-kconfiglib-10.42.0.inc
new file mode 100644
index 0000000000..72d6a65922
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-kconfiglib-10.42.0.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "Kconfiglib is a Kconfig implementation in Python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712177a72a3937909543eda3ad1bfb7c"
+
+SRC_URI[md5sum] = "2306279a050c6a888f34a5719047f217"
+SRC_URI[sha256sum] = "0070eb9061f924e1fa7bc2b1f0aeea1d38e1ddf9bbdbd4b5c346bcf1a0848674"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-kconfiglib_10.42.0.bb b/meta-python/recipes-devtools/python/python3-kconfiglib_10.42.0.bb
new file mode 100644
index 0000000000..10b039a75d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-kconfiglib_10.42.0.bb
@@ -0,0 +1,2 @@
+require python-kconfiglib-${PV}.inc
+inherit pypi setuptools3
-- 
2.11.0


