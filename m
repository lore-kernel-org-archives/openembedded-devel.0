Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QNVLN-0005Oe-J3
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 21:26:41 +0200
Received: by gyf1 with SMTP id 1so1542500gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=Zz7yTmH7HlsFq5OWSrJ2xXArRR0BgPKp3lT6HzPsdRs=;
	b=kzqj97ysz6rLyeoCvII+d4dbUh4ntITzwJjWmWHn8r0h/aHNBq1dVpYnAVBCpMxpaZ
	VzkxGCpVGPl62rs/wxcELNH6PCHDaqHS7J8ESe2rI6D6xCELrZTDUspLemAhMAYmO1Xw
	Ov+/yQ9jAlEigRo4nC1BZQwwIsIZwNlcX1NIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Sie9cOKf25lnuiRt8KWqON4rxjgCv03y9D7xJ2nz8JI9NQ7gLUjsbUYmatOld1nfc2
	Ly34/nfsOAhCttuzun/ODt+lM92znmQejUGWRNG11qdmM2Pe+LW5BuxlOaVIGmyhM0QQ
	fOI52/ybb+Y/NIHxzyxPjjweRZArTcE64cYrE=
Received: by 10.91.80.20 with SMTP id h20mr922390agl.149.1305919423374;
	Fri, 20 May 2011 12:23:43 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w1sm2821186anh.10.2011.05.20.12.23.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 12:23:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 May 2011 19:23:04 +0000
Message-Id: <c938bb18ef2943ad2ab79a594dda8f14f34a4884.1305917406.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1305917406.git.otavio@ossystems.com.br>
References: <cover.1305917406.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1305917406.git.otavio@ossystems.com.br>
References: <cover.1305917406.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/3] xorg-xserver/xorg-xserver-common.inc: do not install modules' .la files
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
X-List-Received-Date: Fri, 20 May 2011 19:26:41 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-xserver/xorg-xserver-common.inc           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
index fdce06c..4b219aa 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
+++ b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
@@ -3,7 +3,7 @@ SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
@@ -65,7 +65,7 @@ FILES_${PN}-sdl = "${bindir}/Xsdl"
 FILES_${PN}-xprint = "${libdir}/X11/xserver/*/print"
 FILES_${PN}-xvfb = "${bindir}/Xvfb"
 FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
-FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules ${libdir}/xorg/modules /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
+FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-doc += "${libdir}/X11/doc /usr/share/X11/xkb/compiled/README.compiled"
 FILES_${PN}-xephyr = "${bindir}/Xephyr"
 
-- 
1.7.2.5



