Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q7pAM-000286-0d
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 15:22:30 +0200
Received: by yia13 with SMTP id 13so1010996yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=dt+uBATT+ZcT2AqRNnH1tK0pTr0wxdbdLJePDZ9zSBU=;
	b=KrTq9wvDLtonEUketMkwN2bzx5RwZ9IyE/QNvPdC/u7rAL4DWq6Yn4UlIFgvJqTRi2
	LjObJl8tgFkI/V4DRgMbeY8aMobJGbTgfP6Qm8Ch0LC/UgyOVj8/8guU1S3UuXnBsb2J
	G+9LGBntiCiOXiT1jXMWtyGTw8zt2uA10QNAU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Nniyw/lHO2X9mNhFaV8ZcGLynLPm3rFlGqnhaBNQ2FlPWAJ79XACvHUkSekNyeqlaS
	1d+iER47A6mnocXwBlVVy4PZJV8P+F80nX/6jPlPiJ8gP/BlZwqOmyKviP2CWbQYRYss
	Zfl9lEODUSC4wFiV/MyRDzH+P2pZlI4pF2b0o=
Received: by 10.236.152.8 with SMTP id c8mr1107749yhk.171.1302182421774;
	Thu, 07 Apr 2011 06:20:21 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l43sm726453yhn.36.2011.04.07.06.20.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 06:20:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:19:54 +0000
Message-Id: <1302182396-4171-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1302182396-4171-4-git-send-email-otavio@ossystems.com.br>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-4-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/6] xserver-xorg (1.9.4): enable xephyr
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
X-List-Received-Date: Thu, 07 Apr 2011 13:22:30 -0000

---
 recipes/xorg-xserver/xserver-xorg_1.9.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-xorg_1.9.4.bb b/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
index 89e7a03..cc2dc43 100644
--- a/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
+++ b/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
@@ -6,7 +6,7 @@ require xorg-xserver-common.inc
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
 PE = "2"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += " \
             file://dolt-fix.patch \
@@ -25,7 +25,7 @@ do_install_prepend() {
 PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
 XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
 
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
 EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
 
 export LDFLAGS += " -ldl "
-- 
1.7.2.3



