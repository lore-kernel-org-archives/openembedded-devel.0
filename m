Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3un-0007vJ-D3
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:57:57 +0200
Received: by gyf1 with SMTP id 1so1564814gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=mMU3PxujqTxuGtK58DEabW9AOPIpP5omeGFNxh6/Bww=;
	b=qxqVQYx8XqPX1/cYGYD5okRNbExzHfPOjtHEPNwToMEphjtVTaQ11rqh+h4mV90Yrs
	MF5ZMxjg90y7IEIA4X/DIv6kG5CmoWZ7s2yG1Ti4ggY9BBJKLHpEmQIURXEnpF3hvS0n
	PkVoW7ziR/uCU6CXm/ROwU0MOhSJ9J8v47J6U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=We7ABFBUl6Vtyl1qr7GKeWLJ2nS5ZaA8u9iE0jkSlMcMpdN7XIJFQJLc9TO3Em9ceW
	N5d1dWhDjzMU56K5peNhGK1QwoMKb2SDAVnJ18NVtBZidoCGnfIuGLfot3YXpHr1ANMM
	WGKWylyFL5+6LErZfbGcIHjlf8sn3g18PJnY8=
Received: by 10.236.191.66 with SMTP id f42mr6178583yhn.345.1306767288467;
	Mon, 30 May 2011 07:54:48 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.54.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:54:47 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:11 +0000
Message-Id: <1306767263-29895-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 05/17] xserver-xorg (1.10.0.902): enable xephyr
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
X-List-Received-Date: Mon, 30 May 2011 14:57:57 -0000

---
 recipes/xorg-xserver/xserver-xorg_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-xorg_git.bb b/recipes/xorg-xserver/xserver-xorg_git.bb
index d18bdd7..95ade9c 100644
--- a/recipes/xorg-xserver/xserver-xorg_git.bb
+++ b/recipes/xorg-xserver/xserver-xorg_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
 PV = "1.10.0.902"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PR_append = "+gitr${SRCPV}"
 PE = "2"
 
@@ -32,7 +32,7 @@ do_install_prepend() {
 PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
 XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
 
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
 EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
 
 export LDFLAGS += " -ldl "
-- 
1.7.1



