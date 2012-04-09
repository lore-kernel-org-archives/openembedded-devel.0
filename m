Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTV-0001du-LA
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:49 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so2626913wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=xWC/ZLVhk/LUcjLqGwrl2FtJnBfKGZJPi77pFlOJYhk=;
	b=Pt64wSFAZytvAElIBnMEoRrm5OFYW7ekQkoZqFaTwvzdbq7JND6IfnskgYxXzReAjO
	aAcnAxbQB1laRpTcyzcTq3wnJYKLQUoepk4ynj97xYc2VzFjGqdImoXgft9UWvI0JRsO
	6enadFZZc79M0sI3zU8fq7vi8KKN/CMmZ5OQNYb7Blj0V8GUY/zLuKV6Qqf890sEt+L8
	tCYZevQZIqyla0UdZ8Bn02JASpSUMhOBv/wTiH+Lxco0BbKbEZrNmb+uvfEYSlleo9Qf
	vZw9RJI+ZAhkZBbVHvam7C2bBCMgBGJsHOclcvB/hpQEMA9pHIhi+h0ZkYFR1SXbUAby
	/ujg==
Received: by 10.180.92.228 with SMTP id cp4mr16974044wib.2.1333984595350;
	Mon, 09 Apr 2012 08:16:35 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm50085106wib.7.2012.04.09.08.16.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:13 +0200
Message-Id: <1333984573-28464-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnZ0pPSJUL2hEJpKn7O8z0GcNsTtsCvoJQ7KP7QAPy4W8Vqre8oGS2kTW5g1lNX4msXq1Jp
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 10/10] xbmc: fix .desktop for ARM
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
X-List-Received-Date: Mon, 09 Apr 2012 15:25:50 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/xbmc/xbmc_git.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb b/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
index 459b571..0595c9b 100644
--- a/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
+++ b/meta-oe/recipes-multimedia/xbmc/xbmc_git.bb
@@ -58,6 +58,11 @@ do_compile_prepend() {
 	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir)::g' ${S}/Makefile	
 }
 
+# on ARM architectures xbmc will use GLES which will make the regular wrapper fail, so start it directly
+do_install_append_arm() {
+	sed -i -e 's:Exec=xbmc:Exec=${libdir}/xbmc/xbmc.bin:g' ${D}${datadir}/applications/xbmc.desktop
+}
+
 FILES_${PN} += "${datadir}/xsessions ${datadir}/icons"
 FILES_${PN}-dbg += "${libdir}/xbmc/.debug ${libdir}/xbmc/*/.debug ${libdir}/xbmc/*/*/.debug ${libdir}/xbmc/*/*/*/.debug"
 
-- 
1.7.2.5



