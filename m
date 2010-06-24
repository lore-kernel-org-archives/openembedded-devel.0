Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1ORlz6-00048H-2O
	for Openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 14:57:12 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 8689F108216;
	Thu, 24 Jun 2010 08:52:11 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 24 Jun 2010 08:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=ULdqLbDRbZOEv6dSOT/aDozlDjk=;
	b=Po5GnxxAZ09KbG7d2G7xC5IXp6XJqRDqM7tCLy6yIwObdE7XL7YbxoE0W6HajN12MViuysvlIgRQu8lhLkuHHCsw3ZJtddHd/BG3g/F7bqoA/tODwP3YjTZKtbZfoqNYbmI93lP3WTKmzzcX9C9snRYDC85d2w9VS35YhNBgdDc=
X-Sasl-enc: VJH7V96GqeM+DX/IXFgbcY1vPoAcf14woHGLfjHP2L8F 1277383929
Received: from localhost.localdomain (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2BC684AF02B;
	Thu, 24 Jun 2010 08:52:09 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jun 2010 14:51:57 +0200
Message-Id: <1277383917-23599-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <alpine.LNX.2.00.1006240651040.4844@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1006240651040.4844@asterix.crazy-teaparty.dyndns.org>
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH] libusb1_1.0.8: new recipe
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
X-List-Received-Date: Thu, 24 Jun 2010 12:57:20 -0000


Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/libusb/libusb1_1.0.8.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libusb/libusb1_1.0.8.bb

diff --git a/recipes/libusb/libusb1_1.0.8.bb b/recipes/libusb/libusb1_1.0.8.bb
new file mode 100644
index 0000000..360dce5
--- /dev/null
+++ b/recipes/libusb/libusb1_1.0.8.bb
@@ -0,0 +1,18 @@
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
+inherit autotools
+
+EXTRA_OECONF = "--disable-build-docs"
+
+SRC_URI[tar.md5sum] = "37d34e6eaa69a4b645a19ff4ca63ceef"
+SRC_URI[tar.sha256sum] = "21d0d3a5710f7f4211c595102c6b9eccb42435a17a4f5bd2c3f4166ab1badba9"
-- 
1.5.6.5



