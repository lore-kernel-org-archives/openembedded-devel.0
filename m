Return-Path: <joe@deserted.net>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id A6B6A6CEA5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 13:35:15 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id j7so3819343qaq.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 06:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=rD3wzq/cA58BxQXqxPtMkrNEUi0uxwZB6hc2z9nH30Q=;
	b=iaoj1zJ17q2syau4WWC3HM2zRluMIcaqZEGavcZAHAN0SlS/OLh2FbUU3BuEi5UFmu
	Aj3Cc8ZiDgxBf7j4yifVbdbtADtmWhfYJuZplq6zMrp7mL7OueFmUB2a8iawtmWTTQxn
	v82cKQ/1rM386qGduB9ZgTFPTrMFFw51iP9kMlhcwyf+w6hMUKE4Lal6cX40P+nsvDiH
	4l6g5FkdKyptXNkReXbEqrWgbMiLjVgjC/+wADVor9UP+EL0fTakmcjt6YLGmv0DaHxd
	ug3JQGmhsI6/sk8TYXJGCJhwXUyIGaEDh8yHMrnXeN0StjK8x2vt/MZ/j3TiAM659IDx
	MWUQ==
X-Gm-Message-State: ALoCoQl/rFHRpPd02l47oXNsbuZa0vzSA1B91xijg1etpG+Li/ZYXX7dJAAgeZP4VC4Cs6ncqp0E
X-Received: by 10.49.24.202 with SMTP id w10mr1369123qef.12.1381239317130;
	Tue, 08 Oct 2013 06:35:17 -0700 (PDT)
Received: from burninator.corp.ad.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id og1sm37505560qeb.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 06:35:16 -0700 (PDT)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 09:35:08 -0400
Message-Id: <1381239308-8682-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com, lpapp@kde.org
Subject: [meta-networking][PATCH] openflow: import and tweak
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2013 13:35:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Based on work by David Nyström (meta-virtualization) and Laszlo Papp
(meta-oe).

   - Import OpenFlow 1.0 from meta-virtualization and provide an updated
     version of the recipe for the head of tree in the OpenFlow git
     repository.

   - Minor tweak in both recipes for do_install_append() spacing.

   - Update 'libssl' PACKAGECONFIG flag in both to follow the 'openssl'
     convention used elsewhere in meta-oe.

   - Create common include file for both versioned and git recipes.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 .../recipes-protocols/openflow/openflow.inc        |   35 ++++++++++++++++++++
 .../recipes-protocols/openflow/openflow_1.0.bb     |    4 +++
 .../recipes-protocols/openflow/openflow_git.bb     |    4 +++
 3 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow.inc
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow_1.0.bb
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow_git.bb

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
new file mode 100644
index 0000000..43af54e
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -0,0 +1,35 @@
+SUMMARY = "OpenFlow communications protocol"
+DESCRIPTION = "\
+Open standard that enables researchers to run experimental protocols in \
+contained networks.  OpenFlow is a communications interface between \
+control and forwarding planes of a software-defined networking architecture.\
+"
+HOMEPAGE = "http://www.openflow.org"
+
+SECTION = "networking"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
+
+SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
+
+DEPENDS = "virtual/libc"
+
+EXTRA_OECONF += "KARCH=${TARGET_ARCH}"
+
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+do_configure() {
+    ./boot.sh
+    oe_runconf
+}
+
+do_install_append() {
+    # Remove /var/run as it is created on startup
+    rm -rf ${D}${localstatedir}/run
+}
diff --git a/meta-networking/recipes-protocols/openflow/openflow_1.0.bb b/meta-networking/recipes-protocols/openflow/openflow_1.0.bb
new file mode 100644
index 0000000..a7e254d
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow_1.0.bb
@@ -0,0 +1,4 @@
+include ${BPN}.inc
+
+SRCREV = "5ccca75a69f99791659bcfbcf35353ab1921320a"
+PV = "1.0"
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
new file mode 100644
index 0000000..6403bfb
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -0,0 +1,4 @@
+include ${BPN}.inc
+
+SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
+PV = "1.0+git${SRCPV}"
-- 
1.7.10.4


