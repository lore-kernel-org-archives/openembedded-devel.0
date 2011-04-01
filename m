Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q5dJz-0008If-J4
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 14:19:23 +0200
Received: by gyf1 with SMTP id 1so1383958gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 05:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=2Ett1qQmnCexPCZ8viTU18mYRD8oadyZQV3ZFevK+FQ=;
	b=rLG1c9IC4obw4zSpLiqAPgTapwIWr+0AxcRAVD26zJvLQ+fcmYudfpSgoUseU1+GC8
	KQ8HeyaTutRQOEN11kjvdkb79tRm6wGTJbFBsn4q9Dox3hB/CTTAHH107NUziyyENlBl
	YIIDzbcTg2xVwIH5DmRlNbPHkj+MSFO6pyfr0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=XH4z3CiFqsa7jzhWxi5MCflKpqXvaTS4pjcygOEeaEUC0cehKMcWSRNK82bE1mibYm
	KWmIQaVc04gR99wH/OoJrx0LOFZmYlb87V5Ahboc9b5PcvjHGg0Xc7CcQb0rtp1SW42n
	jEoo88rCgu3REC2IdRT0vGE07PcvWKt7nv2Ts=
Received: by 10.150.240.13 with SMTP id n13mr3821961ybh.334.1301660241155;
	Fri, 01 Apr 2011 05:17:21 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id d3sm948462ybi.20.2011.04.01.05.17.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 05:17:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 12:16:47 +0000
Message-Id: <1301660208-31105-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 5/6] xserver-xorg (git): enable xephyr
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
X-List-Received-Date: Fri, 01 Apr 2011 12:19:23 -0000

---
 recipes/xorg-xserver/xserver-xorg_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-xorg_git.bb b/recipes/xorg-xserver/xserver-xorg_git.bb
index 98831ef..d37c61e 100644
--- a/recipes/xorg-xserver/xserver-xorg_git.bb
+++ b/recipes/xorg-xserver/xserver-xorg_git.bb
@@ -6,7 +6,7 @@ require xorg-xserver-common.inc
 DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
 PV = "1.9.99.1"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PR_append = "+gitr${SRCPV}"
 PE = "2"
 
@@ -32,7 +32,7 @@ do_install_prepend() {
 PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
 XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
 
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
 EXTRA_OECONF += " --enable-dri2 --disable-unit-tests "
 
 export LDFLAGS += " -ldl "
-- 
1.7.2.3



