Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1Lz5gQ-0002eI-Jb
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 11:02:27 +0200
Received: by bwz19 with SMTP id 19so1177453bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:from:date:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=hn+d0OGey+VEy3iXXO+6V4rDQNLwG5o3kRUCBjVTXb0=;
	b=WjUh4GPIxbaDrworHwYTrfutRrGKADzXMoJNC0zh3ReEwiy3gTO3dGhwWyyePw9UeF
	P6snciIp+1Ex0xY0EHMdkdIYoG9Xr6jB1QLk6hgiCPLnyCRwdideOD6GCfTytECZMyM+
	byu3pQkA4qtSSx4RjV9TKP+Z++W0gAAu+ZHtM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=XpRl1KxLPAWVpw0P7ElKxfXTTZnGNDTePRZDh5gy8dykfO2dUUZRiCNJa9Y6o8UzNo
	cRNN5ndaRRK2/r1zvsq2Mdo8ykd82NELr+GvuOnD18jtzv3GA/Zs5/Wc7tm5Foglv+ZG
	GtJO5B9p4Y3uObYfc9ouTPO//cNCCdIttIus4=
MIME-Version: 1.0
Received: by 10.204.31.201 with SMTP id z9mr91587bkc.79.1240995430151; Wed, 29 
	Apr 2009 01:57:10 -0700 (PDT)
From: Matthieu Poullet <matthieu.poullet@gmail.com>
Date: Wed, 29 Apr 2009 10:56:50 +0200
Message-ID: <80a0c20d0904290156j7a217a9ex9569753d7c1091fd@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH, repost] dsplink: change path to the XDC tools directory
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
X-List-Received-Date: Wed, 29 Apr 2009 09:02:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This way the naming convention is more coherent:
TIBIOSDIR -> BIOS_INSTALL_DIR
TIXDCTOOLSDIR  -> XDC_INSTALL_DIR

Signed-off-by: Matthieu Poullet <m.poullet@avm.de>
---
 recipes/dsplink/ti-paths.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/dsplink/ti-paths.inc b/recipes/dsplink/ti-paths.inc
index 2f1a0e5..20a453f 100644
--- a/recipes/dsplink/ti-paths.inc
+++ b/recipes/dsplink/ti-paths.inc
@@ -9,7 +9,7 @@
 TITOOLSDIR ?= "/OE/TI"
 # Path under TITOOLSDIR where dspbios is unpacked
 TIBIOSDIR ?= "bios_5_33_02"
-TIXDCTOOLSDIR ?= "${TITOOLSDIR}/xdctools_3_10_03"
+TIXDCTOOLSDIR ?= "xdctools_3_10_03"
 # Path under TITOOLSDIR where the dsp toolchain is unpacked
 TICGTOOLSDIR ?= "cg6x_6_0_16"

@@ -20,7 +20,7 @@ TICGTOOLSDIR ?= "cg6x_6_0_16"
 # export some more variable to point to external TI tools
 # information is duplicated between the js and make based tools
 export CE_INSTALL_DIR=${S}
-export XDC_INSTALL_DIR=${TIXDCTOOLSDIR}
+export XDC_INSTALL_DIR=${TITOOLSDIR}/${TIXDCTOOLSDIR}
 export BIOS_INSTALL_DIR=${TITOOLSDIR}/${TIBIOSDIR}
 # needed for configuro:
 export CGTOOLS_V5T="${CROSS_DIR}"
-- 
1.6.0.4


