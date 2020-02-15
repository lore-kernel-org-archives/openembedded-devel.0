Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 06FD26118C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 01:18:17 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id a6so4361456plm.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ApHDEUEZFEGHuppdKFoToTfn+yefE/BboMz+NDKaxGk=;
	b=dg1rmhJkF4r5o4DZGaUj6rWfgq+HsB4ds0XYZ4ey74mtbGe1Dax0nB41rVExDC2AzP
	xPv53YewdMiRclf14UzxVKR4ADzJNpOgb6FJ4RR9YyAHOAQsZC55/RkoaIyCIf8r4TMV
	ZlVzQgL9G0DefKVHccknwlanrxKkaAModGKxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ApHDEUEZFEGHuppdKFoToTfn+yefE/BboMz+NDKaxGk=;
	b=JkFn3hP+z6ssB945OFWIo4mcBvfZrr2OSL5df5fOfZGKACgNDLRCL6kQ8P1bYKjGte
	w9WgnAQaiIpuH+dm8eMdCZQKRVeD2BMTc/uEXTpw64If8kLAd19VbsK+XrcsGCFbzjP3
	7KU4RmSgkRfbh29O5L2DCPUeucnRINym6hqNRPmgufL54HftT6wNhKpj9GSpuxTrTHDB
	2orYL0gSi0Cc5VxBUDZAYaMXMtX+o/bcBt3L+uv55ycxGysBNqddqvyPcQyZyBrEltI7
	tAgFMH3bzkiT6RAJ46u1rGGfnr0kZpgezrl4xHJTlHRQJX8G8b9fCb8qcYJSM4J5XJry
	RG0g==
X-Gm-Message-State: APjAAAVuewfuEikF+HBA/O195c9g4CVGzqBAAUvUUAKzJyMMymGlWSAK
	Sl2LFYnm3vX8zTfs9+K157UzMDTg1KKUxI2JGOnpOmIRdTd3Ttf2FK9y7b335q720U5S7tr5Jhd
	1Xd+DLh2f8C7iHT5c7hZwcfTL+RKkC8okBifGDf63lDmdfLGgeVBvpQpRI8PVOMvm5Del5iD12Z
	lzi/E/awaZzE87kjPSu/IUrGsNNmmP6Kg=
X-Google-Smtp-Source: APXvYqxBuY/V11j/VOPCLhXeE9U+bYkulHvCR6L128xraPsp6Z/b+vqBaeCPAqu0oHgAI7tfpcVYuw==
X-Received: by 2002:a17:90a:ead8:: with SMTP id
	ev24mr6739047pjb.91.1581729498755; 
	Fri, 14 Feb 2020 17:18:18 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	x28sm8301638pgc.83.2020.02.14.17.18.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 17:18:18 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:18:09 -0800
Message-Id: <20200215011809.112941-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe] [PATCH] python3-et-xmlfile: add initial recipe version 1.0.1
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
X-List-Received-Date: Sat, 15 Feb 2020 01:18:18 -0000

---
 .../python/python3-et-xmlfile_1.0.1.bb        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-et-xmlfile_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.0.1.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.0.1.bb
new file mode 100644
index 000000000..cfff150cc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.0.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "et_xmlfile is a low memory library for creating large XML files"
+DESCRIPTION = "It is based upon the xmlfile module from lxml with the aim of allowing code \
+to be developed that will work with both libraries. It was developed initially for \
+the openpyxl project but is now a standalone module."
+
+HOMEPAGE = "https://bitbucket.org/openpyxl/et_xmlfile/src/default/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b3d89cae66f26c3a0799be8a96f3178b"
+
+SRC_URI[md5sum] = "f47940fd9d556375420b2e276476cfaf"
+SRC_URI[sha256sum] = "614d9722d572f6246302c4491846d2c393c199cfa4edc9af593437691683335b"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
+
+inherit setuptools3
+PYPI_PACKAGE ?= "et_xmlfile"
+PYPI_SRC_URI ?= "https://files.pythonhosted.org/packages/source/e/et_xmlfile/et_xmlfile-1.0.1.tar.gz"
+SECTION = "devel/python"
+SRC_URI += "${PYPI_SRC_URI}"
+S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
-- 
2.17.1


