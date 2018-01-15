Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id EF1FD786D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:17:11 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f71so378389wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3LUSjYztUXAb95dMyCfNtbKgcIKpVqkbtOV0qUNgM4U=;
	b=ZEQAVjCrBxWasD4yF74XddG70IwXB/WaQBc0WRm510/ugqALkI2Ruld2OnQkcSMlcL
	gTFXbtbchVxWz9gZUAOPhp2WcvFmPh8o/5aRZSq4mUwHyjFr1pgZitJc8U09qhCKk+yl
	8QWIzJiViD77/IM3IO0cr0iQFh70VKF3I4UvzwCaoTmFm1JkWDO914QwoFaYkiQMRy97
	qSu23NmuNBWa8qcxRCnnyb9nfqMsg8MoXnFyXyVQYOe4dr3w/oFeauz2Q17jQVS/m4aO
	BEGiQ6iL/8SPL6/K6yudmWevAesEArayNzlx/+T0U8JIaxhSEjjmD2Lg7pIbqgHTaS6S
	KOvA==
X-Gm-Message-State: AKwxytf9wys5o/8AC+/PlaDvmHsq1G498OkEPKdH67JN329FCOpkNqfr
	6D2kCRJST3EHFem8FbtcUaWPXqwR
X-Google-Smtp-Source: ACJfBosarkFoiCq5nD5d5zFOQVPWjpfmkcDSCZEU/GCpTT5zjRLVSe6c5wYKpVmDxY90aiZIE5xQPA==
X-Received: by 10.80.245.92 with SMTP id w28mr5486339edm.73.1516007832365;
	Mon, 15 Jan 2018 01:17:12 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 15sm780937eds.54.2018.01.15.01.17.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:17:11 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:17:06 +0000
Message-Id: <20180115091707.1539-5-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091707.1539-1-git@andred.net>
References: <20180115091707.1539-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 5/6] python-pyjwt: add initial recipe for version 1.5.3
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
X-List-Received-Date: Mon, 15 Jan 2018 09:17:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-pyjwt.inc    | 17 +++++++++++++++++
 .../recipes-devtools/python/python-pyjwt_1.5.3.bb       |  2 ++
 .../recipes-devtools/python/python3-pyjwt_1.5.3.bb      |  2 ++
 3 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyjwt.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyjwt_1.5.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt_1.5.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pyjwt.inc b/meta-python/recipes-devtools/python/python-pyjwt.inc
new file mode 100644
index 000000000..dda4b942d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyjwt.inc
@@ -0,0 +1,17 @@
+SUMMARY = "JSON Web Token implementation in Python"
+SUMMARY = "JSON Web Token implementation in Python"
+DESCRIPTION = "A Python implementation of JSON Web Token draft 32.\
+ Original implementation was written by https://github.com/progrium"
+HOMEPAGE = "http://github.com/jpadilla/pyjwt"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
+
+SRC_URI[md5sum] = "739494379f582ca98c89fb7ac229915b"
+SRC_URI[sha256sum] = "500be75b17a63f70072416843dc80c8821109030be824f4d14758f114978bae7"
+
+PYPI_PACKAGE = "PyJWT"
+inherit pypi
+
+RDEPENDS_${PN} = "${PYTHON_PN}-cryptography"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pyjwt_1.5.3.bb b/meta-python/recipes-devtools/python/python-pyjwt_1.5.3.bb
new file mode 100644
index 000000000..f0a77b674
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyjwt_1.5.3.bb
@@ -0,0 +1,2 @@
+require python-pyjwt.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_1.5.3.bb b/meta-python/recipes-devtools/python/python3-pyjwt_1.5.3.bb
new file mode 100644
index 000000000..dc16d2282
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_1.5.3.bb
@@ -0,0 +1,2 @@
+require python-pyjwt.inc
+inherit setuptools3
-- 
2.15.1


