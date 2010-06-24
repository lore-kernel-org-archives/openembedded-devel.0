Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1ORsAY-0002zZ-5q
	for Openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 21:33:04 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 9DCFA107FB4;
	Thu, 24 Jun 2010 15:28:20 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 24 Jun 2010 15:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=J9RYkGVkFlygGJlI83h6EVoH2Ww=;
	b=aEcKIXbDhF1o0b8qVX52Nht5VwA/VUWwunAEWqgXKmULr2OfFvySY2yz4pkwDYcoN8YIj3Qu4URpyiZBr8y1kReS3NFgGMhXfB4k04xtgdFZiMZiHTWkdJmkytL6jEJ0cVj3a4vGQabl36G2UWjSpiCiYQa2d3gk5VVytvzTSsI=
X-Sasl-enc: VLemqatFJtELtaY0Hkc/c1TOqgqWVx1VIvZmFypUIARV 1277407690
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07a327.pool.mediaWays.net [77.7.163.39])
	by mail.messagingengine.com (Postfix) with ESMTPA id A73D94E2D44;
	Thu, 24 Jun 2010 15:28:10 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jun 2010 21:29:10 +0200
Message-Id: <1277407750-16012-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20100624151638.GC28292@gmail.com>
References: <20100624151638.GC28292@gmail.com>
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH][STABLE] libusb1_1.0.8: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jun 2010 19:33:04 -0000


Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/libusb/libusb1_1.0.8.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libusb/libusb1_1.0.8.bb

diff --git a/recipes/libusb/libusb1_1.0.8.bb b/recipes/libusb/libusb1_1.0.8.bb
new file mode 100644
index 0000000..f264321
--- /dev/null
+++ b/recipes/libusb/libusb1_1.0.8.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "library to provide userspace access to USB devices"
+HOMEPAGE = "http://libusb.sf.net"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+
+PR = "r0"
+
+SRC_URI = " \
+	${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2;name=tar \
+	"
+S = "${WORKDIR}/libusb-${PV}"
+
+inherit autotools_stage pkgconfig binconfig lib_package
+
+EXTRA_OECONF = "--disable-build-docs"
+
+LIBTOOL = "${HOST_SYS}-libtool"
+EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
+
+PACKAGES =+ "libusbpp"
+FILES_libusbpp = "${libdir}/libusbpp*.so.*"
+
+SRC_URI[tar.md5sum] = "37d34e6eaa69a4b645a19ff4ca63ceef"
+SRC_URI[tar.sha256sum] = "21d0d3a5710f7f4211c595102c6b9eccb42435a17a4f5bd2c3f4166ab1badba9"
-- 
1.7.1



