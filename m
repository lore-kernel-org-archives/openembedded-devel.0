Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q5dJw-0008IA-Jj
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 14:19:21 +0200
Received: by yxn22 with SMTP id 22so1390712yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 05:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=dt+uBATT+ZcT2AqRNnH1tK0pTr0wxdbdLJePDZ9zSBU=;
	b=ipRYiUgrdPHUOyTiR8p+cu8ON9MQ6SIzGtfgl6nslslE2KuObWkrcqXFTUUoM4JLQF
	glmipsZK5ig15/6it/XLN4g73G8OJF+j7XiTDAd3MSipOWE/QIlXChxif9HHrTTLzQIA
	OlR2tRfQpEVqNJXIOgmEp/zVE4UszOtonsFwo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=ilcY72kW0VD+yV86gMgsGL5J8+gAXRaUkUx7MPWWCKoV0dUjUOTXZxMOgzdquF5VF6
	3VDZYbkCaGpFxteP6Xm/YbkmcTHRCZX6ZzrvVD7v38dOYfSxBWg714Gr2JCS4P7HPUn3
	R4qYeNa0pMFdSGEloDxpgDkDjniyzHEs/JMB4=
Received: by 10.151.13.7 with SMTP id q7mr3761811ybi.304.1301660238998;
	Fri, 01 Apr 2011 05:17:18 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id d3sm948462ybi.20.2011.04.01.05.17.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 05:17:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 12:16:46 +0000
Message-Id: <1301660208-31105-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 01 Apr 2011 12:19:21 -0000

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



