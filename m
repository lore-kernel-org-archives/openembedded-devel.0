Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2mKu-00081O-Ah
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 16:16:02 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 05347EB44A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 10:12:32 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 10:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=RK5TQfnCVh4vrNTCcYd5QHQt8pM=;
	b=ts+yPAxA8kYwQdKWyKc5/kWJjZiZJ1hbEt9rXSGO5yUsu/bgjS9oHs5UWdfJD3F6RNdC/XqY98QURVFL3rRBvV2MRksfoZCtYMn2o0oKbH6sJ0HWsfm7jvsbuetAnnfDVbxSCO6++nzLv0S3pn5o3M1fMw3DqOwvsbWbsbmm36Y=
X-Sasl-enc: CCNS3ofY7iXmhxlbYRdEqrGgw2NWPvQofc2eVKe8uEpO 1271427151
Received: from [192.168.1.34] (hnvr-4d07a1c5.pool.mediaWays.net [77.7.161.197])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 3C94D3DE25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 10:12:31 -0400 (EDT)
Date: Fri, 16 Apr 2010 16:13:44 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.DEB.1.10.1004081733510.3264@vitus.devnet.local>
Message-ID: <alpine.LNX.2.00.1004161612220.28729@asterix.crazy-teaparty.dyndns.org>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
	<alpine.DEB.1.10.1004081733510.3264@vitus.devnet.local>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Fri, 16 Apr 2010 14:16:02 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

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
index 0000000..d35c601
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
+DEPENDS = "libusb"
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
index 0000000..80ebee5
--- /dev/null
+++ b/recipes/dfu-programmer/dfu-programmer_svn.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "USB Device Firmware Upgrade utility (special atmel-version)"
+SECTION = "devel"
+AUTHOR = "Weston Schmidt <weston_schmidt@alumni.purdue.edu>"
+LICENSE = "GPL"
+
+SRCREV = "93"
+PV = "0.5.2+svnr${SRCPV}"
+PR = "r0"
+DEFAULT_PREFERENCE = "-1"
+
+DEPENDS = "libusb"
+
+SRC_URI = "svn://${PN}.svn.sourceforge.net/svnroot/${PN}/;module=trunk;proto=http"
+S = "${WORKDIR}/trunk/${PN}"
+
+inherit autotools
-- 
1.5.6.5


-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


