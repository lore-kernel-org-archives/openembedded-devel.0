Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Nzn0d-00028d-9H
	for Openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 10:22:44 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 44209EAC13
	for <Openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 04:19:22 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Thu, 08 Apr 2010 04:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=HY46iPOJxzzu2Ijb4BMZIsvtz8g=;
	b=ucQ5T6Whon805BDLn+WNqbBSI9CDG0ma7EDctlWjJJULHHUAeyNbxKgHTDEMnELFLbvFZJeY/N/RDzjG7Dx1n23ExYCsV3GJ8ZWWhmpg60kzoTSFVqP1KS1V2Hv2/M1pREZtxfOVv3ky7vnwIZ3uh0G+MSY6yEi0i9nTGMc1Qzc=
X-Sasl-enc: HRTU4QMzxHG1PU9rHsmsLP01P0Lm9Uht4CZ9mQXA6pVv 1270714761
Received: from vitus.devnet.local (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 8ACF435BB1
	for <Openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 04:19:21 -0400 (EDT)
Date: Thu, 8 Apr 2010 10:19:17 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Message-ID: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
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
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Thu, 08 Apr 2010 08:22:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Add recipes for version 0.5.2 and for the head of the SVN repository.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 conf/checksums.ini                             |    4 ++++
 recipes/dfu-programmer/dfu-programmer_0.5.2.bb |   17 +++++++++++++++++
 recipes/dfu-programmer/dfu-programmer_svn.bb   |   20 ++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
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
diff --git a/recipes/dfu-programmer/dfu-programmer_0.5.2.bb b/recipes/dfu-programmer/dfu-programmer_0.5.2.bb
new file mode 100644
index 0000000..af37b04
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
+SRC_URI = "http://downloads.sourceforge.net/project/dfu-programmer/dfu-programmer/0.5.2/dfu-programmer-${PV}.tar.gz"
+
+inherit autotools
+
+do_stage() {
+	autotools_stage_all
+}
diff --git a/recipes/dfu-programmer/dfu-programmer_svn.bb b/recipes/dfu-programmer/dfu-programmer_svn.bb
new file mode 100644
index 0000000..5bb946b
--- /dev/null
+++ b/recipes/dfu-programmer/dfu-programmer_svn.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "USB Device Firmware Upgrade utility (special atmel-version)"
+SECTION = "devel"
+AUTHOR = "Weston Schmidt <weston_schmidt@alumni.purdue.edu>"
+LICENSE = "GPL"
+
+SRCREV = "${AUTOREV}"
+PV = "0.5.2+svnr${SRCREV}"
+PR = "r0"
+DEFAULT_PREFERENCE = "-1"
+
+DEPENDS = "libusb"
+
+SRC_URI = "svn://dfu-programmer.svn.sourceforge.net/svnroot/dfu-programmer/;module=trunk;proto=http"
+S = "${WORKDIR}/trunk/dfu-programmer"
+
+inherit autotools
+
+do_stage() {
+	autotools_stage_all
+}
-- 
1.5.6.5


-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


