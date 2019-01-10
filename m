Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id DE41E60272
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 18:11:53 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id e5so5517122plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 10:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AHLlLzuPDq1eHtPYM/A/ouraELQ2kvCXlSBwps2YTDI=;
	b=ef73uYDcnuUIPiCxvRkC9hImbzNzKTd6EcGgqw292QzTrl0+UW1k6DXl+Hba1gvkw5
	gy1IfSpRE61QELQCamJAlFgABTYBIKeaZVKaj/PjmWkBo5phWytqaJIASqjn/DpdfUZ2
	Ae+FisY2Y3+um3uthpJtTE0k7GIFgxVry5zbIwrXawpsUvNysiLDVXyBBqYBq73U3ipo
	EmyNbTVi2lo0kNsdeYK2gKnIE+q8CcGzVuK+OmT2WD+2hNnbuT8IZHTRNXBMGSXPlUid
	JL4BqlVLXVVeIykcjar0WgjZ6hazq9FWSYwoSta1PgfR8r9P4rSoJLHnYmSTpPz/pymp
	CFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AHLlLzuPDq1eHtPYM/A/ouraELQ2kvCXlSBwps2YTDI=;
	b=RhlHfG3QX9r+F/tXYimm2ZBhH9owDrWTuGpfD6o2ABrmovCAVtVgqFH/JkloCyDO0f
	M18sXRAY5cJmgxiUwcJyUkylK7h+drTjXJN5/jhV6tABqitBeNuFH5H06gVIHzaadpoJ
	VyTi2TWw0DHQLVfXguA42iLH2eoo55bFylxvwhmkIFup6XrixLLQaxzsDwGBxUD6OFpD
	ljaa990pXr9ArC0Do35Cq6dMe2QMPN5D2HzYwpEmUMdSz/OBzlrCJq/MXniUCmjnoxHm
	ur6YMqqg5k4Isbw6SN1nuGTfDdgX209opzBCkeQNmhCFWglH9spikIhAELiU2CZHT1pE
	NOmw==
X-Gm-Message-State: AJcUukdQ2NX80XNS5M6iioCBSjcNm5MVDovJiRxmZUZL4zJVM/8GTtoH
	HHB4CY5sx1sZ5n76R8tfqM9ga3kc6lA=
X-Google-Smtp-Source: ALg8bN44964DGubhpLOnmUkXcvJsJ7fFdd0STxihasoPgvaRjCTNSEVMl6zknNcBLf6c3o3FVdKf+A==
X-Received: by 2002:a17:902:3f81:: with SMTP id
	a1mr11194505pld.258.1547143914008; 
	Thu, 10 Jan 2019 10:11:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::9055])
	by smtp.gmail.com with ESMTPSA id
	h64sm120064903pfc.142.2019.01.10.10.11.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 10:11:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 10:11:45 -0800
Message-Id: <20190110181145.18912-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190110181145.18912-1-raj.khem@gmail.com>
References: <20190110181145.18912-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 2/2] guider: add a new runtime profiler package
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
X-List-Received-Date: Thu, 10 Jan 2019 18:11:54 -0000
Content-Transfer-Encoding: 8bit

From: Peace Lee <iipeace5@gmail.com>

guider [1] is a system-wide performance analyzer for platforms based
on linux kernel. It can measure a variety of system resource usage and
trace thread/process activities. It also reports vary meaningful
output to analyze system status.

[1] https://github.com/iipeace/guider

Signed-off-by: Peace Lee <iipeace5@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/guider/guider_3.9.4.bb   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.4.bb

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.4.bb b/meta-oe/recipes-devtools/guider/guider_3.9.4.bb
new file mode 100644
index 0000000000..1a413452a3
--- /dev/null
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.4.bb
@@ -0,0 +1,35 @@
+SUMMARY = "runtime performance analyzer"
+HOMEPAGE = "https://github.com/iipeace/guider"
+BUGTRACKER = "https://github.com/iipeace/guider/issues"
+AUTHOR = "Peace Lee <ipeace5@gmail.com>"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
+
+PV = "3.9.4+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://github.com/iipeace/${BPN}"
+#SRCREV = "${AUTOREV}"
+SRCREV = "b433f3805674ef4588c1a161986c74eeac6a48e7"
+
+S = "${WORKDIR}/git"
+R = "${RECIPE_SYSROOT}"
+
+inherit distutils
+
+GUIDER_OBJ = "guider.pyc"
+GUIDER_SCRIPT = "guider"
+
+do_install() {
+    python ${S}/setup.py install
+
+    install -d ${D}${bindir}
+    install -v -m 0755 ${STAGING_BINDIR_NATIVE}/${GUIDER_SCRIPT} ${D}${bindir}/${GUIDER_SCRIPT}
+
+    install -d ${D}${datadir}/${BPN}
+    install -v -m 0755 ${STAGING_LIBDIR_NATIVE}/python${PYTHON_BASEVERSION}/site-packages/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
+}
+
+RDEPENDS_${PN} = "python-ctypes python-shell \
+                  python-json python-subprocess"
-- 
2.20.1


