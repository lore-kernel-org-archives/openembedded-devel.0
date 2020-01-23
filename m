Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id C4AD67FD03
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 04:08:49 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id k25so676379pgt.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 20:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=myDtRLxpUgOMRglaAHtBkqend2vMmkMrAet0/0CZVdw=;
	b=XzrcVHlCWGm9Nky2T8H+aVheMqfAktXES+u1Buv6SB7o3RY9rKVlanMA65GcmVc5uL
	fAehkP3ZjL+atZkmOwAErYPgz93EyG/BJIL7OMwEAsgbz+RfF/R3iFUD5+vABoZUHMy0
	ospCUTDtMwrLWYO/C0n4q8IPRvaZfJ7AeS1IgWSrAVTqXXoFALUpZ40+DgJp0iSABLRq
	bdEGA4vKgWX0Ffqr36mnufpWAmy7FhGXSzbueWRHzslROzt/GpHzxp1LJWS6ze/uvG9m
	JtTK5/YSvBb2rsacTI/+jfdppTlODnDcXhLXywrrs/hwAkMomgxJCLuKVPL7HXCDSCHR
	TdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=myDtRLxpUgOMRglaAHtBkqend2vMmkMrAet0/0CZVdw=;
	b=kziBtHRh2jz2IsOUebkY7Fqq5AGUxXSi+Ly7STcxDlq8b54c1tM8Eps+Y5zCghKrV4
	q7ePXBRgGtCSolY+MUmBzAWiROhFhq3stjHITDds7wQckg1dYztT1Pt5kQg3KDBlB5Ow
	a6VlTmUP/wdXzwZ1S9EWfa9ekkU/K0WBIZED46gjK918NJJzJPeRZ9xRHLRjDaylqQGi
	jQeBIxKjowpJnrNlZN1WZ9B7hD2TzwYWA1wR+dlThrO/zhsiX4HALy4St7DqeKwLTjk9
	icEmBOzCyJKynOMpIl5WfnPRWq8LX+HFhYno+sBHMHWP59HEqCOwwQ6f82bQbQY4NER8
	pVbQ==
X-Gm-Message-State: APjAAAWDNiz0adLaYrXGWS2jVywL7ffleW6Zf7O8sXBHn25bbup6YBjQ
	GtGjgmeL0A4RTdeZfC2+ZhKgNrFvQCM=
X-Google-Smtp-Source: APXvYqw1EzC42XMkU2uZOUp4n4sSDJ5ZlFcXCPJZL4TyvwafCBOHjiphKD2g2wR6sj/0/HcMghAMXg==
X-Received: by 2002:a62:7696:: with SMTP id r144mr5739196pfc.177.1579752530466;
	Wed, 22 Jan 2020 20:08:50 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:982e:71f9:9a69:ecbf])
	by smtp.gmail.com with ESMTPSA id
	h126sm467637pfe.19.2020.01.22.20.08.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 20:08:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 20:08:31 -0800
Message-Id: <20200123040832.35503-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH 1/2] python-booleanpy: add RDEPENDS and enable ptest
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
X-List-Received-Date: Thu, 23 Jan 2020 04:08:49 -0000
Content-Transfer-Encoding: 8bit

Missing run-time dependency on python-

This package is a great example of how simple
python module ptest can be, so enable ptest,
including ptest-only dependencies.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python-booleanpy/run-ptest         |  2 ++
 .../python/python-booleanpy_3.7.bb            | 19 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 recipes-devtools/python/python-booleanpy/run-ptest

diff --git a/recipes-devtools/python/python-booleanpy/run-ptest b/recipes-devtools/python/python-booleanpy/run-ptest
new file mode 100644
index 00000000..0ba239c2
--- /dev/null
+++ b/recipes-devtools/python/python-booleanpy/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+py.test
diff --git a/recipes-devtools/python/python-booleanpy_3.7.bb b/recipes-devtools/python/python-booleanpy_3.7.bb
index feb9062f..b80e4344 100644
--- a/recipes-devtools/python/python-booleanpy_3.7.bb
+++ b/recipes-devtools/python/python-booleanpy_3.7.bb
@@ -4,11 +4,28 @@ HOMEPAGE = "https://github.com/bastikr/boolean.py"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e319747a5eb94cddf646037c01ddba47"
 
+SRC_URI += "file://run-ptest"
 SRC_URI[md5sum] = "1189d115a38f84f5df743014926a9159"
 SRC_URI[sha256sum] = "bd19b412435611ecc712603d0fd7d0e280e24698e7a6e3d5f610473870c5dd1e"
 
 PYPI_PACKAGE = "boolean.py"
 
-inherit pypi setuptools
+inherit pypi setuptools ptest
+
+RDEPENDS_${PN}_append_class-target = "\
+    ${PYTHON_PN}-lang \
+"
+
+RDEPENDS_${PN}-ptest += "\
+    ${PYTHON_PN}-unittest \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/boolean
+    cp -rf ${S}/boolean/test_boolean.py  ${D}${PTEST_PATH}/boolean/
+}
+
+FILES_${PN}-test = ""
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0


