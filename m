Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8095D7FCFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 04:12:12 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 4so684471pgd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 20:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=myDtRLxpUgOMRglaAHtBkqend2vMmkMrAet0/0CZVdw=;
	b=dbVtHD5RcU+PhZtIf1v5HVNuqwYkvFePmXYP6NF6sPSs8ApXGDLg6tnSYEzZJiLa66
	zIRY+hL5cd5RUWadU8FIKa/829Fktzx5MzNhWQZq0bWie/6D1pXnhRy8wRdWZTSg95PG
	VT9GhiQyNLS/AfWygTW4tVU897oFIXewpTHareK78PLNoO3ko9A683MZ3GWbYifa1Tpm
	UZwZkNRM+C7Hfd+lrqEh7PmbcDrSyfYSSDwc6JDGmXDe92oDwVciTkO8hgdqdyNgfd4z
	bY81J0bq5m6/DUPXYx3lxTGbbLjTOTUVHC+zjUm4eHerwkU9/6kKBDlKfjaxh/cXd6Rp
	dx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=myDtRLxpUgOMRglaAHtBkqend2vMmkMrAet0/0CZVdw=;
	b=SjfcDJ5LalHGphQPGlc/0Qk0ezaPjAxvy4dcYoc5p3wNsaFe1ei1ysbatC+PEhQzMY
	ugQ6dxeA97qvUv7BB4ZioC0favJK1k5/LRaLtage9EqnQZBHxQqa1XHyH225+6j1IMSm
	U66S9Cw05zkeRqza+mTGOkXe2za/qb7+0dSeBYu9YMns47bJhW5kWZVilCC9fKpQmz1o
	rElWNMWQwTFGZlrE/POB3gDsQedOHdQFvQD4Lyn9HLGpHZNlUjHfqjFQ5AyIhf8hbYmc
	OXVQTQGk7ShnJ0bIp27t/SW4pLNRho0Qzbu81e8AINE/2+RY3XbR4wHoxiY+108yTIDD
	K73A==
X-Gm-Message-State: APjAAAWuQjUUUedrHO37zeCOuqyhgmV1lyoDrnAFspTysgQfohTEpdRE
	DyoMktrV0hYv7VcuwczVe4rGIPrg5zw=
X-Google-Smtp-Source: APXvYqxjhixIMjur9RSSfzXHSlduxws2TJerl1x025q8VDk9Qo3Yu0GdxcNIkJ6NnibfhXYjweAmeA==
X-Received: by 2002:a65:678f:: with SMTP id e15mr1851957pgr.130.1579752733233; 
	Wed, 22 Jan 2020 20:12:13 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:982e:71f9:9a69:ecbf])
	by smtp.gmail.com with ESMTPSA id d3sm447319pfn.113.2020.01.22.20.12.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 20:12:12 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 20:12:03 -0800
Message-Id: <20200123041204.35593-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH v2 1/2] python-booleanpy: add RDEPENDS and enable ptest
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
X-List-Received-Date: Thu, 23 Jan 2020 04:12:12 -0000
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


