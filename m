Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1Lz5VC-0002JD-HE
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 10:50:51 +0200
Received: by bwz19 with SMTP id 19so1171689bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:from:date:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=X4As8ppvsrYd3i3lGvUDwcNehQMh0m4ge37lGE461Qg=;
	b=p3LZIE2dDuPvGOk6tna0EtnydDiE9GB2kXQp5gc2f1bg/HZOxr6kvK/l2QdsIYwITW
	nX/nQS6X/YOFFphpQLxRmDRdMcBtCj5Qh2WrUovQFlZ55NwNX+CDilU6SEIqfQEW5CQx
	EyninuN5NMlBvic8wxwSSJqRCaqxAcLj+AAcs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=Iex0mUSoR8Bwl0mWwvFd8pKd98X4p2SOdabZQItqXqzsn/LwXfSEJLbTmgNtEQSnp4
	ur6EniUlSMcrVESRF26VcniVcjpVTa6UwJD89UYEsITXzlYUcH1eCioQZWlDFD40H749
	5NWY3SAlY9y/CHR6Y+rXCMyMPILTIzkXHdySc=
MIME-Version: 1.0
Received: by 10.204.63.209 with SMTP id c17mr88757bki.47.1240994734090; Wed, 
	29 Apr 2009 01:45:34 -0700 (PDT)
From: Matthieu Poullet <matthieu.poullet@gmail.com>
Date: Wed, 29 Apr 2009 10:45:14 +0200
Message-ID: <80a0c20d0904290145p41042612m976c066baf001133@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] dsplink: change path to the XDC tools directory
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
X-List-Received-Date: Wed, 29 Apr 2009 08:50:52 -0000
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
index 2f1a0e5..b403732 100644
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
+export XDC_INSTALL_DIR=${TITOOLSDIR}/{TIXDCTOOLSDIR}
 export BIOS_INSTALL_DIR=${TITOOLSDIR}/${TIBIOSDIR}
 # needed for configuro:
 export CGTOOLS_V5T="${CROSS_DIR}"
-- 
1.6.0.4


