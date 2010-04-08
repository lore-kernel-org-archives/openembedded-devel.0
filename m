Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Nztqt-0003F6-Mm
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 17:41:11 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id E37FEEA6D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 11:37:43 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Thu, 08 Apr 2010 11:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=gago62CcrQaF5lYW7Q1W6TyAP70=;
	b=oDcoIcjS7Ozxp3bbq8vERIsYaEvjDoAzDDPIqjLQgI9ZjD0xPAqOSf9NhH5NAckkV0m1WaCzMMAoxiDGdkJp0pfE1LMvYNh/pQ85mEjgH20iyCUFyU8UgJCjGa7Z+8fNOw9pCHC8aNLD1LmjL7DP5eqBuXaxjqZ0dak1suqg2aM=
X-Sasl-enc: Lt03GmQSRiLHUG2Km6jKL9BLryE1PdKqs0BVo6wDj1Ed 1270741063
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 3D64C4CBE74
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 11:37:43 -0400 (EDT)
Date: Thu, 8 Apr 2010 17:37:41 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
Message-ID: <alpine.DEB.1.10.1004081733510.3264@vitus.devnet.local>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
User-Agent: Alpine 1.10 (DEB 962 2008-03-14)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Thu, 08 Apr 2010 15:41:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

Add recipes for version 0.5.2 and the current head of the subversion
repository.  dfu-programmer is DFU utility supporting Atmel chips
with a USB bootloader (which aren't supported by dfu-util).

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 conf/checksums.ini                             |    4 ++++
 conf/distro/include/sane-srcrevs.inc           |    1 +
 recipes/dfu-programmer/dfu-programmer_0.5.2.bb |   15 +++++++++++++++
 recipes/dfu-programmer/dfu-programmer_svn.bb   |   15 +++++++++++++++
 4 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes/dfu-programmer/dfu-programmer_0.5.2.bb
 create mode 100644 recipes/dfu-programmer/dfu-programmer_svn.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 3c6f712..73f5901 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5258,6 +5258,10 @@ sha256=3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639
 md5=be12c0132a1ae118cbf5e79d98427c1d
 sha256=ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191

+[http://downloads.sourceforge.net/project/dfu-programmer/dfu-programmer/0.5.2/dfu-programmer-0.5.2.tar.gz]
+md5=ce882d37383df698a1c530080724b191
+sha256=e3c8bc1429fe1681c56ddc14fb05d29a7933aac566d13f894dca6fd916829cb9
+
 [http://pknet.com/~joe/dgen-sdl-1.23.tar.gz]
 md5=b1896c1b21ddb152626aec2e8a157a3a
 sha256=44396b3b324433187cf7082d1059cd9f519f02accddd667e627a57ff8514d436
diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 902c844..982632c 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -41,6 +41,7 @@ SRCREV_pn-contact ?= "1410"
 SRCREV_pn-dasher-gpe ?= "1251"
 SRCREV_pn-dbus-c++ ?= "13131"
 SRCREV_pn-dbus-c++-native ?= "13131"
+SRCREV_pn-dfu-programmer ?= "93"
 SRCREV_pn-dfu-util ?= "4160"
 SRCREV_pn-dfu-util-native ?= "4160"
 SRCREV_pn-disko ?= "f52597b8d5d584811cbe8f9e0bf25ea372526953"
diff --git a/recipes/dfu-programmer/dfu-programmer_0.5.2.bb b/recipes/dfu-programmer/dfu-programmer_0.5.2.bb
new file mode 100644
index 0000000..2f769af
--- /dev/null
+++ b/recipes/dfu-programmer/dfu-programmer_0.5.2.bb
@@ -0,0 +1,15 @@
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
+	${SOURCEFORGE_MIRROR}/project/${PN}/${PN}/${PV}/${PN}-${PV}.tar.gz \
+	"
+
+inherit autotools
diff --git a/recipes/dfu-programmer/dfu-programmer_svn.bb b/recipes/dfu-programmer/dfu-programmer_svn.bb
new file mode 100644
index 0000000..3d9b169
--- /dev/null
+++ b/recipes/dfu-programmer/dfu-programmer_svn.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "USB Device Firmware Upgrade utility (special atmel-version)"
+SECTION = "devel"
+AUTHOR = "Weston Schmidt <weston_schmidt@alumni.purdue.edu>"
+LICENSE = "GPL"
+
+PV = "0.5.2+svnr${SRCREV}"
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


