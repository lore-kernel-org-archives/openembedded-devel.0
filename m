Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 65FD17669F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 19:18:42 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so208347216wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2015 12:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=IsZ/M1PUUanfdg6iHST7e/DlCnnOXXT8d+RC4hz+8yQ=;
	b=XBt5hhh6ZATxt01JGkG0ZjEsOF8j0NTl/XlXttGjHxb76h1vi7hiqBxuu4uVdKTpfk
	72porsAhXQwuCDRz1QFwwyuUMqrPQOuASsvvbKNNhVH8ok5l3rsAUY7egVyBFSEdz3/0
	kkLpxRQFHCPpvN2lx4Zdaw6CQOrxMO010zuKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=IsZ/M1PUUanfdg6iHST7e/DlCnnOXXT8d+RC4hz+8yQ=;
	b=BLLhbV0eGzh/WyqQMHmT/8ZqvYNmA6KLO5gQAJS85zqOLwrsYYJ+Hv53PNkRoC1LtF
	l25Kj4xZiwQ7diQg2neAjp4hXDr6jIufWJCcaP4jKI1CoBWL+/WknudDAfarRgkv0SXA
	kZ8mZB4dV2A1V/mJB2AKCOJW5BAvatCta0jEpKUT47yTrEXF1QlZ5RqBtsul8r0s5GCe
	HgtA3BasDmbRtwx1PPaex+JTITFSloYOsgKgRMJEaxVpTXEuuxycqVos5U3Q3fat8BUx
	Zv5PMdn83wTLViYRDJ3AefBQXPr70NBG3A92AockSfkgiNE0lQf8Lqun9aY7v3MEwwGs
	umgQ==
X-Gm-Message-State: ALoCoQkyqrnhx/JolYkeOhRfSLJNA368qoPq70duetCjw8wPBm1rLSnRMPfwQACkUPpllPOKFYzX
X-Received: by 10.180.72.112 with SMTP id c16mr5276448wiv.15.1442949522779;
	Tue, 22 Sep 2015 12:18:42 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-41-27.w109-218.abo.wanadoo.fr. [109.218.120.27])
	by smtp.gmail.com with ESMTPSA id
	mc18sm4632411wic.23.2015.09.22.12.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 12:18:41 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Sep 2015 21:18:13 +0200
Message-Id: <1442949493-26944-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2][meta-oe] wayland-fits: Add recipe
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
X-List-Received-Date: Tue, 22 Sep 2015 19:18:45 -0000

wayland-fits is a functional integration test suite
for Wayland and Weston.

It optionally supports EFL and GTK+ tests.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../recipes-graphics/wayland/wayland-fits_git.bb   |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100755 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb

diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
new file mode 100755
index 0000000..a0eefb5
--- /dev/null
+++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Wayland-fits, the Wayland Functional Integration Test Suite"
+DESCRIPTION = "Wayland-fits is a fully automated functional integration \
+test suite. Its main purpose is to test the functionality and integration of \
+client-side (i.e. toolkit) and server-side (compositor) implementations of \
+the Wayland protocol."
+HOMEPAGE = "https://github.com/01org/wayland-fits"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8d34cadaf891753c0f00c6cd48f08f5 \
+                    file://src/extensions/weston/weston-wfits.cpp;endline=21;md5=848c81e55cf3a30a9f6ed75f0dba7a97"
+
+SRC_URI = "git://github.com/01org/wayland-fits.git"
+SRCREV = "f30dfa9fceb438d3687c5215093fffc21a7852fc"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libcheck boost wayland weston"
+RDEPENDS_${PN} = "weston"
+
+EXTRA_OECONF += "--enable-shared --disable-static --with-boost-libdir=${STAGING_LIBDIR}"
+
+PACKAGECONFIG ?= "elementary gtk+3"
+
+PACKAGECONFIG[elementary] = "--enable-efl-tests,--disable-efl-tests,elementary"
+PACKAGECONFIG[gtk+3] = "--enable-gtk-tests,--disable-gtk-tests,gtk+3"
+
+do_install_append() {
+	rm -f ${D}/${libdir}/weston/*.la
+}
+
+FILES_${PN} += "${bindir}/wfits ${libdir}/weston/*.so"
+FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/weston/.debug ${prefix}/src"
-- 
1.7.10.4


