Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MmPQJ-0003Th-Rn
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Sep 2009 12:01:42 +0200
Received: by fxm22 with SMTP id 22so1272269fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2009 03:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=OBswwcUauOJEm4wAXyQTzrUTwdGxmNX33OoRzKOeTjU=;
	b=M9knDKxhHEBAvKqcJA63lbmAOOhquJuXoqsFK/KLVSz13okpdCX33bLBebwFsj8ukB
	yEjuBi1Gcjr//k39yWIRS5a62gJ6u6CONmd4dW6+44WUg507meWm2wygLZ41qD7KNMfy
	FN1F5okOUcnIlqhWn/KgbFcIabgOPq/DCDUXw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Cnp1aaHxATqHNVYySNSkdi3E1V+5iw2kCd12iBu/GcXtS6DAil9mUJ4wnc9nRzAxkt
	ZMpPo6DWRmYhkRvwaYMs90jKpKMMTPUgOH3gCNCfJ0tNygx/Jx2CXbmxHKueXUyKGTSm
	zoV9rvR1oQy1m0WWe54+gvoelMfbSLWRQpLJk=
Received: by 10.86.227.1 with SMTP id z1mr3088134fgg.56.1252749670407;
	Sat, 12 Sep 2009 03:01:10 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id e11sm1217586fga.21.2009.09.12.03.01.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 12 Sep 2009 03:01:07 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Sep 2009 12:01:04 +0200
Message-Id: <1252749664-1074-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] quake2: fix QA errors
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
X-List-Received-Date: Sat, 12 Sep 2009 10:01:43 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/quake/quake2_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/quake/quake2_svn.bb b/recipes/quake/quake2_svn.bb
index 31491ad..a01def8 100644
--- a/recipes/quake/quake2_svn.bb
+++ b/recipes/quake/quake2_svn.bb
@@ -5,6 +5,7 @@ DEPENDS = "libsdl-x11 libxxf86dga"
 
 SRCREV = "205"
 PV = "0.16.1+svnr${SRCREV}"
+PR = "r1"
 
 SRC_URI = "svn://svn.icculus.org/quake2/;module=trunk \
            file://quake2-arm.patch;patch=1"
@@ -14,7 +15,7 @@ S = "${WORKDIR}/trunk"
 export BUILD_SDLQUAKE2=YES
 export OSTYPE=Linux
 export ARCH=${TARGET_ARCH}
-export BASE_CFLAGS="${TARGET_CC_ARCH} -Wall -pipe -Dstricmp=strcasecmp"
+export BASE_CFLAGS="${TARGET_CC_ARCH} ${LDFLAGS} -Wall -pipe -Dstricmp=strcasecmp"
 export OPT_CFLAGS="-O3 -ffast-math -funroll-loops -fomit-frame-pointer -fexpensive-optimizations"
 
 do_compile() {
-- 
1.6.1



