Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OS40V-0000VE-PN
	for Openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 10:11:30 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id D73D71073F9;
	Fri, 25 Jun 2010 04:06:50 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Fri, 25 Jun 2010 04:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=T2x6NOAWTUufSc+Q4CfYUij+h5g=;
	b=g6ox1/3vcU61XbLGyqY6T9D/JYPrrM/u50suaZGXEmhGwaakMj1d3uWUgGklAMSyFgVkhaCbJLZINwAmQTNNruqc3OGAI+EvfxEXDI7/hfSWYLZqoCIj9pS4u2yZ8isY/7It20FJkzP6pFl5TEGXGukCZ/rR/EaqFrEc1nUgsiU=
X-Sasl-enc: LIHem4sIVsY7MbePi0wi9Rmqi72YRr51zQv1nOpJsA02 1277453210
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07afec.pool.mediaWays.net [77.7.175.236])
	by mail.messagingengine.com (Postfix) with ESMTPA id 15EC44BD57E;
	Fri, 25 Jun 2010 04:06:49 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 10:08:09 +0200
Message-Id: <1277453289-23392-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20100416150505.GE7857@excalibur.local>
References: <20100416150505.GE7857@excalibur.local>
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH][STABLE] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version).
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
X-List-Received-Date: Fri, 25 Jun 2010 08:11:30 -0000

Add recipes for version 0.5.2 and the current head of the subversion
repository.  dfu-programmer is DFU utility supporting Atmel chips
with a USB bootloader (which aren't supported by dfu-util).

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/dfu-programmer/dfu-programmer_0.5.2.bb |   17 +++++++++++++++++
 recipes/dfu-programmer/dfu-programmer_svn.bb   |   16 ++++++++++++++++
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 recipes/dfu-programmer/dfu-programmer_0.5.2.bb
 create mode 100644 recipes/dfu-programmer/dfu-programmer_svn.bb

diff --git a/recipes/dfu-programmer/dfu-programmer_0.5.2.bb b/recipes/dfu-programmer/dfu-programmer_0.5.2.bb
new file mode 100644
index 0000000..34404bd
--- /dev/null
+++ b/recipes/dfu-programmer/dfu-programmer_0.5.2.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "USB Device Firmware Upgrade utility (special atmel-version)"
+SECTION = "devel"
+AUTHOR = "Weston Schmidt <weston_schmidt@alumni.purdue.edu>"
+LICENSE = "GPL"
+
+PV = "0.5.2"
+PR = "r0"
+
+DEPENDS = "libusb1"
+
+SRC_URI = " \
+	${SOURCEFORGE_MIRROR}/project/${PN}/${PN}/${PV}/${PN}-${PV}.tar.gz;name=tar \
+	"
+SRC_URI[tar.md5sum] = "ce882d37383df698a1c530080724b191"
+SRC_URI[tar.sha256sum] = "e3c8bc1429fe1681c56ddc14fb05d29a7933aac566d13f894dca6fd916829cb9"
+
+inherit autotools
diff --git a/recipes/dfu-programmer/dfu-programmer_svn.bb b/recipes/dfu-programmer/dfu-programmer_svn.bb
new file mode 100644
index 0000000..2f860dc
--- /dev/null
+++ b/recipes/dfu-programmer/dfu-programmer_svn.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "USB Device Firmware Upgrade utility (special atmel-version)"
+SECTION = "devel"
+AUTHOR = "Weston Schmidt <weston_schmidt@alumni.purdue.edu>"
+LICENSE = "GPL"
+
+SRCREV = "95"
+PV = "0.5.2+svnr${SRCPV}"
+PR = "r1"
+DEFAULT_PREFERENCE = "-1"
+
+DEPENDS = "libusb1"
+
+SRC_URI = "svn://${PN}.svn.sourceforge.net/svnroot/${PN}/;module=trunk;proto=http"
+S = "${WORKDIR}/trunk/${PN}"
+
+inherit autotools
-- 
1.7.1



