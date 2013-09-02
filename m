Return-Path: <lpapp@archlinux.us>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 42B976BC15
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2013 08:32:56 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id x12so3428719wgg.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2013 01:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=KOx4A1WHbHWP5aH5WbJwrICfLkED1d2BRAclbHRARNs=;
	b=ffPE8DsI+QDsp+fG4MkVlwTjfaw9drgpuw17ZUxV9+3UtnrSZGxUhatANhiFWg9ame
	PSHgLoXZhYjb0uwhKBZVARWiM7GkFHuL7lV0J5aINy8H9XAo9NRDylxjmjMkcHKY8v2X
	Re6v4R/9eRUeeKeHjHL1NdBbQ1AHjwW9TBxJZiEViljfsyN5siiIbDaLxn8fVyf88Fkz
	LigcB2uZlzy5U7XcEiZTLXPKENOemFz3hGD93Z8sFvFEGvFUnTllpR2Som7xse6UydJl
	7pOIRaYYpf8D5s6OF3YCkOQrg5Ggl54ccyG+DrigeoHZCxh/nCnLEt5X8qqpfCI8jEVy
	be+A==
X-Gm-Message-State: ALoCoQnaWbZRbHyjgsZF9x9iyjN5q2mwmTpl5Uf8QqijcgR7Et+6avzYjkrXv+FtYnLy65QcdlVy
X-Received: by 10.180.183.206 with SMTP id eo14mr12564197wic.33.1378110775883; 
	Mon, 02 Sep 2013 01:32:55 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginmedia.com.
	[86.30.245.31])
	by mx.google.com with ESMTPSA id i12sm15902573wiw.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 01:32:55 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Mon, 02 Sep 2013 09:33:00 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Sep 2013 09:20:51 +0100
Message-Id: <1378110051-8976-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.4
Subject: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Mon, 02 Sep 2013 08:32:56 -0000

1) The version in meta-virtualization is quite old. It is basically from 2009,
and a lot of things has changed since then.

2) More importantly, this software is more like for networking rather than
virtualization, so I think it was misplaced.
---
 .../recipes-support/openflow/openflow_1.0.bb       | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/openflow/openflow_1.0.bb

diff --git a/meta-networking/recipes-support/openflow/openflow_1.0.bb b/meta-networking/recipes-support/openflow/openflow_1.0.bb
new file mode 100644
index 0000000..eb7770e
--- /dev/null
+++ b/meta-networking/recipes-support/openflow/openflow_1.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "OpenFlow"
+DESCRIPTION = "Open standard that enables researchers to run experimental protocols in the campus networks"
+HOMEPAGE = "http://www.openflow.org"
+SECTION = "networking"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
+
+SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
+PV = "1.0+git${SRCPV}"
+SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
+
+DEPENDS = "virtual/libc"
+
+EXTRA_OECONF += "KARCH=${TARGET_ARCH}"
+
+PACKAGECONFIG ??= "libssl"
+PACKAGECONFIG[libssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
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
+	# Remove /var/run as it is created on startup
+    rm -rf ${D}${localstatedir}/run
+}
-- 
1.8.4


