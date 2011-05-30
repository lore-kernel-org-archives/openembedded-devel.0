Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3zY-000192-R2
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 17:02:53 +0200
Received: by yia13 with SMTP id 13so1570948yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=4Y08OhAsMoOUBZAo0XdOz0BduFa7z2VY0loTacI7sG0=;
	b=tRXQ7XSkLWMxB3z+y00sKuIKP9mS0/L20wDDj/AEUT8tM6yD75LqOmnqWWs0x+hTLT
	KDDG5KsPQE4iqBOGT/D7E4vKGfCq9s6F8/BLCAWbbMy2ZWnNDQ1PiDuYhSQqE2IozrJ9
	Mn+ImHRqONuDon5QiAandGOQfqfkNavKAobyE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=vAw1zMiF9HtnrdRnsKpP470INC7t+lhlFSx7PPxBnRyKARxiufKgMCtZCqpbr8u7u4
	pQP7355y1VcjhGf5ts/HO5zB0NO7+26fgzC0Bq0ch/DBhnzNqitpdWLzWy+1g7C6S5aG
	DcesTBOvpeLIQIYk4LX6qt5qo0XH+Jopx+Sag=
Received: by 10.236.185.34 with SMTP id t22mr2733857yhm.283.1306767278269;
	Mon, 30 May 2011 07:54:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.54.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:54:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:07 +0000
Message-Id: <1306767263-29895-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 01/17] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Mon, 30 May 2011 15:02:53 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/udev/udev_165.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
index f909256..def2d37 100644
--- a/recipes/udev/udev_165.bb
+++ b/recipes/udev/udev_165.bb
@@ -71,7 +71,7 @@ EXTRA_OECONF += " --with-udev-prefix= \
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-PACKAGES =+ "libudev libgudev udev-utils"
+PACKAGES =+ "libudev libgudev udev-utils udev-consolekit"
 
 FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libgudev = "${base_libdir}/libgudev*.so.*"
@@ -84,7 +84,8 @@ FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 
 # udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
 # is ${prefix}/lib64
-FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
+FILES_${PN} += "/lib/udev*"
+FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
 # Package up systemd files
-- 
1.7.1



