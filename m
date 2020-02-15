Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3247C6118C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 01:19:15 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id u12so5435765pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=XAHATwyFvleen0sa50RaouzWdZ35UNVASYxMiirK/gE=;
	b=HAqEXWPkbLWj51CtjjYjsgCWOAQYnYUXTaD0m9JQS/8GZVHiND72ApL45t71TwcKaf
	S5zLX/JnRhxB/TRn5jePV1sgTjA66sQmA27gs1MpuNBc/hmgwdJd/GxZV7ye5xwh2NoU
	dU9437Tb8OIolpPN25zdthl8GJUb10tiz4uxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XAHATwyFvleen0sa50RaouzWdZ35UNVASYxMiirK/gE=;
	b=q7zL7A/nexRI7X9aFuiLozbsPaWtjGpslTRWog9XsVvMFbChMQL3KDfg5TxjDDiabI
	O3PUxij/sKNlMeOq8bcTsjLzxQxYxiH+i+8cAmOsdut7MygFYaam9hLfTB3WdroO4Mqy
	VrilRHPWwnbrAYRNDw0ZVh2JOT8AGfVfww43lVnXXPnuIGeAgBterYmBgJs5ahRu9bpj
	Fl6DGfTo1LwG+k3FsoTpFqxKk3wS5N9Jwvm74Cpd5bS9wGvcVZYrEWflJW4WlnyMX6k+
	y6cwF9xuPrBo+WtLXfmvz7Qe79DOkvq4z0we+EnwT5AmMGyLmlXKCa4sahdR206EwQxl
	Q1DA==
X-Gm-Message-State: APjAAAVl6idD/iLaDH61F6HpcR0EUuFoCTb3q1N0yuPIdjKToP190Eu6
	WMXSouxotlV/zQmjWJ7qp6RRDoCyjfwoEH0qwUjyJke1MdA0uleptqgktadocG9vRkalSrq/6td
	oHOxj36/BcLvtZsarHOahp5CfsQGnhfWrexY6G74Vwu+05WowX17xP7zRCquv4BTfXIgsg96fdm
	0OkRwBf6b6qUm1cq+d/kugualTuwqRKj8=
X-Google-Smtp-Source: APXvYqwu73NV3I+S6byGQUklQmJ3wNWpmbj4USjGkmiL9HGoeMogwaDJdO8gRbfsoTrbRs0i/FcVXA==
X-Received: by 2002:aa7:9f5e:: with SMTP id h30mr6212561pfr.137.1581729555978; 
	Fri, 14 Feb 2020 17:19:15 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	x4sm8087797pff.143.2020.02.14.17.19.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 17:19:15 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:19:07 -0800
Message-Id: <20200215011907.113092-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe] [PATCH] python3-openpyxl: Add initial version 2.6.3
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
X-List-Received-Date: Sat, 15 Feb 2020 01:19:15 -0000

openpyxl depends on et-xmlfile and jdcal.
---
 .../python/python3-openpyxl_2.6.3.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb b/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
new file mode 100644
index 000000000..87cb46ea9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_2.6.3.bb
@@ -0,0 +1,15 @@
+SUMMARY = "openpyxl is a Python library to read/write Excel 2010 xlsx/xlsm/xltx/xltm files"
+DESCRIPTION = "It was born from lack of existing library to read/write natively \
+from Python the Office Open XML format. All kudos to the PHPExcel team as openpyxl \
+was initially based on PHPExcel."
+
+HOMEPAGE = "http://www.python-excel.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3baf26d8abf08632beaf913ea973cb8a"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "b067750e51f17a1a9cc6bacfdd668218"
+SRC_URI[sha256sum] = "72d1ed243972cad0b3c236230083cac00d9c72804e64a2ae93d7901aec1a8f1c"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
-- 
2.17.1


