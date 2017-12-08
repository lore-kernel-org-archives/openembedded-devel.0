Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AC91578685
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:46:30 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y89so6524914pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BXy9T94YjTedVTC/fvyNps1LKWMa3aADpDjtZl7/6jc=;
	b=ge06bxwlAADMnBKTt1Mf8Ce+jK4hAW6lYQj/fDrPO8jp9o5rrvITtBo6HryFwAoIyU
	Ibf0AVkXdNSo+jpSA+G7JlkxZuK/BYSbgZouAJQMZUnAPfcZ2hxXn9htRJkNVztzet3b
	4hMIxxxX2FLBn6lGg2UBCWka8s8NWT7lxZfD1w+EL58rnapL8/Iqg7ebFJ2d/v+IrBnY
	Gvs0qoBbM7xgYZdhv70x0uda3Wa5ZRMbk6uFgcADd5LcsQIa4x9iOxye2lOsmHrLXFQp
	7Wil2ku2IZbhaidiKoqp6rO1FSeItyZwBj0nPf10N4oV1sxI/HwedkMvDCZg2aSFhpuO
	8xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BXy9T94YjTedVTC/fvyNps1LKWMa3aADpDjtZl7/6jc=;
	b=rY5gv6l+EBkZl6gvawPlPDD96Rx0e064+B3mbxarA8/LWFkCDCLZ4m0BQD6/QCtJfO
	h9W5nRXSupaQW0xKyPIjBIk/6DlX/czXm2+rmrsyKGMC+1qOOF8fkESUuGHZE5P4SnAk
	KDsvv+vFb+t1aEmyei4L+Cue0voE7M0swXTFaLTryJFk7iO7kpr3P1Gihz3wSA0ltZcn
	4Eow+aPRGakoJ4ZQeiQoIs5qis+i9WkByLbTScQ5G7AqLlfSNEItRE2R23JpJDBb8nGT
	HvgBa/A7kAYOLbOI/e3SOp4oKkKOdNUV22yThzyq+QaX94IA4kHGzt7FwJ7KXtHljqcR
	Xv5g==
X-Gm-Message-State: AKGB3mKhTIN4eM4lRtJQr8BWrDe/ljfv7pyHa0YCwBLw5M50S5xbx2+f
	o+rAkZKb/YCFtyJnPIzzfPzUWA==
X-Google-Smtp-Source: AGs4zMaIIAykfRi+YR5Yh+jvLiy9XLew9CqR64hQu75qO0M/mOt4CnnKrtf+lsSW9wYuabx8UXc8Rw==
X-Received: by 10.84.132.106 with SMTP id 97mr5807158ple.44.1512711991844;
	Thu, 07 Dec 2017 21:46:31 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id w12sm75701pge.59.2017.12.07.21.46.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:46:31 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:45:43 -0800
Message-Id: <20171208054548.26218-8-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054548.26218-1-bill.randle@gmail.com>
References: <20171208054548.26218-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 07/12] python-flask-wtf: move core of recipe to a .inc file
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
X-List-Received-Date: Fri, 08 Dec 2017 05:46:30 -0000

V2: add FILESEXTRAPATH_prepend to pick up common patch directory.

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-wtf.inc        | 15 +++++++++++++++
 .../recipes-devtools/python/python-flask-wtf_0.12.bb    | 17 +----------------
 2 files changed, 16 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-wtf.inc b/meta-python/recipes-devtools/python/python-flask-wtf.inc
new file mode 100644
index 000000000..3a959aed7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-wtf.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Simple integration of Flask and WTForms."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=507e8635f25a06dc4f041a3a1b3359b3"
+
+SRC_URI[md5sum] = "c53a74e8ba481bf53405fd5efdf0339e"
+SRC_URI[sha256sum] = "bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-flask-wtf:"
+SRC_URI += " file://import-simplejson-as-json.patch"
+
+PYPI_PACKAGE = "Flask-WTF"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-wtforms \
+    ${PYTHON_PN}-simplejson \
+"
diff --git a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
index 79afaf6..dbf091b 100644
--- a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
+++ b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
@@ -1,17 +1,2 @@
-DESCRIPTION = "Simple integration of Flask and WTForms."
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=507e8635f25a06dc4f041a3a1b3359b3"
-
-SRC_URI[md5sum] = "c53a74e8ba481bf53405fd5efdf0339e"
-SRC_URI[sha256sum] = "bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
-
-SRC_URI += " file://import-simplejson-as-json.patch"
-
-PYPI_PACKAGE = "Flask-WTF"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} = "\
-    python-wtforms \
-    python-simplejson \
-"
+require python-flask-wtf.inc
-- 
2.7.4


