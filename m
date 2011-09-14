Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3pR7-0000OK-1t
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 15:23:33 +0200
Received: by yia27 with SMTP id 27so362727yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2011 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=JPSs2WGgkn8KHumnCKuYZ9NDGFLqoiQN9Dr/lq9xfwA=;
	b=UlHf3Nr+JR5nuOH8lqlRWN526b4/VqWJghrQ2zjs8sKIkf/SuHuDQM5aBQdcR3yBt5
	2f54PEB85jyAkJp2BYeSKZUc9jko2CoHT8iVnWrjzn9NQuaUVXvfAy9XM2/Q9zyxc953
	pvjJOg+QftjiVEzkt+JFgDSP9fS4yetyivJFU=
Received: by 10.91.73.7 with SMTP id a7mr2097032agl.80.1316006302353;
	Wed, 14 Sep 2011 06:18:22 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t10sm7567487anl.26.2011.09.14.06.18.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Sep 2011 06:18:21 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2011 13:18:08 +0000
Message-Id: <1eb2612347e83d9906021429768912fcd036951a.1316006259.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1316006259.git.otavio@ossystems.com.br>
References: <cover.1316006259.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1316006259.git.otavio@ossystems.com.br>
References: <cover.1316006259.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] xorg-xserver-common.inc: usr ${datadir} instead of /usr/share
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
X-List-Received-Date: Wed, 14 Sep 2011 13:23:33 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-xserver/xorg-xserver-common.inc           |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
index e68008e..06763bb 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
+++ b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
@@ -3,7 +3,7 @@ SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"
 
-INC_PR = "r20"
+INC_PR = "r21"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
@@ -44,7 +44,7 @@ EXTRA_OECONF += " --enable-xcalibrate \
                   --disable-xfbdev \
                   --disable-xnest \
                   --disable-kdrive-vesa \
-                  --with-default-font-path="/usr/share/fonts/X11/misc" \
+                  --with-default-font-path="${datadir}/fonts/X11/misc" \
                   ac_cv_file__usr_share_sgml_X11_defs_ent=no"
 
 # CONFIG_MANAGER_OPTION is used only in recipes which support those options
@@ -65,7 +65,7 @@ FILES_${PN}-xprint = "${libdir}/X11/xserver/*/print"
 FILES_${PN}-xvfb = "${bindir}/Xvfb"
 FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
-FILES_${PN}-doc += "${libdir}/X11/doc /usr/share/X11/xkb/compiled/README.compiled"
+FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled"
 FILES_${PN}-xephyr = "${bindir}/Xephyr"
 
 FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
-- 
1.7.2.5



