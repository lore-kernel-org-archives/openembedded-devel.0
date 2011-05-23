Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOVGR-0000l5-Eg
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 15:33:43 +0200
Received: by gxk3 with SMTP id 3so2261769gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=i/tQQQR+IaMksnJdUk4zPP+c0PzceGdzGU+dmi/f94M=;
	b=oWH2wfmG9x8Xxb4Q8yrM2qWd14JbT19qkoFJTQREZCrlchWVkzeDIRnnpfjSQKDA0o
	5Pjh1Ci/RWHNq81WZdh3BRAAuNkJZgYosbNmFj03aRdp+XNUi1ECLyVQVNZ4SS7BHJoJ
	Fq29oO4Hi/IzjSvyZ1wIJFPcZeSibJ4xmTPVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=SHnXFzVyby+MFBM2fym8+6St6dQDHrcFP5obhZZoIBaUc5joKLdx1J29pHYB/BXhqG
	wm6uShOMZuR+TOnkJvrlacHCbWKCk5A+9uOJy8uRlmohFIWSrsLOH5zEgGbU/5c+lMTK
	GSinx4UVuBmvFS+lM13mFIi8H7BGb60qxG5iw=
Received: by 10.150.255.36 with SMTP id c36mr2981688ybi.56.1306157442649;
	Mon, 23 May 2011 06:30:42 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q29sm2723749yba.17.2011.05.23.06.30.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 06:30:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 May 2011 13:30:22 +0000
Message-Id: <a5e16c72b819ec7728d3ec2ef469f9ce9e734d49.1306157341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306157341.git.otavio@ossystems.com.br>
References: <cover.1306157341.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306157341.git.otavio@ossystems.com.br>
References: <cover.1306157341.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/4] udev: fix action used during startup
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
X-List-Received-Date: Mon, 23 May 2011 13:33:43 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/udev/udev/init   |    4 ++--
 meta-oe/recipes-core/udev/udev_168.bb |    2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev/init b/meta-oe/recipes-core/udev/udev/init
index 808d9e9..ecc357d 100644
--- a/meta-oe/recipes-core/udev/udev/init
+++ b/meta-oe/recipes-core/udev/udev/init
@@ -65,10 +65,10 @@ echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
 
 /sbin/udevadm control --env STARTUP=1
 if [ "$not_first_boot" != "" ];then
-	/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	--subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
+	/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	--subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform --action=add
 	(/sbin/udevadm settle --timeout=8; /sbin/udevadm control --env STARTUP=)&
 else
-	/sbin/udevadm trigger
+	/sbin/udevadm trigger --action=add
 	/sbin/udevadm settle
 fi
 
diff --git a/meta-oe/recipes-core/udev/udev_168.bb b/meta-oe/recipes-core/udev/udev_168.bb
index 4e34c0d..eaba889 100644
--- a/meta-oe/recipes-core/udev/udev_168.bb
+++ b/meta-oe/recipes-core/udev/udev_168.bb
@@ -35,6 +35,8 @@ SRC_URI += " \
        file://udev-compat-wrapper-patch \
 "
 
+PR = "r1"
+
 inherit update-rc.d autotools
 
 EXTRA_OECONF += " --with-udev-prefix= \
-- 
1.7.2.5



