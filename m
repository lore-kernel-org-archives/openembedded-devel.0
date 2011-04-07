Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q7pAE-00027E-5n
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 15:22:22 +0200
Received: by gwb11 with SMTP id 11so809406gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 06:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=6eFJwYho3Vg7SUv6HC8uFl0+xtYYHkXh2a89PPSK1As=;
	b=QVHsNIWqExC7Tb9wc9fGWiVqABAFlhRdW2vpzIgJaPSBJf+iXlNdJutreuLzOBKe/s
	HeI4COjexqzG8Rjsk/4OfwK/zcYmq1WwIRoBiv6rX7Jrl9SmaKTn0lWPjgAwGAzgq+ZO
	0vdU9tp4sGo6FNd5wg+eBW56QMMC9FtowGz5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=GjyRFD1jlypaOIyX7C+ra987v5k+7hzi0t7EEQahvuRoifmd4gZyriVoAnGLfCkIHT
	ZiY9eZ6LtmoQce5Z/Juwe99MsW3k/0ZmhzSfIsGrjKoth98QxSaO7w/taohc7gGcWa4i
	l3NsbwnAZb3IakMevpjqmd99kdNwtY7lm9j/8=
Received: by 10.236.141.37 with SMTP id f25mr1109940yhj.113.1302182413726;
	Thu, 07 Apr 2011 06:20:13 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l43sm726453yhn.36.2011.04.07.06.20.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 06:20:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:19:51 +0000
Message-Id: <1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/6] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Thu, 07 Apr 2011 13:22:22 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/udev/udev_165.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
index d426aff..822891f 100644
--- a/recipes/udev/udev_165.bb
+++ b/recipes/udev/udev_165.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r3"
+PR = "r4"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -71,7 +71,7 @@ EXTRA_OECONF += " --with-udev-prefix= \
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 03 S ."
 
-PACKAGES =+ "libudev libgudev udev-utils"
+PACKAGES =+ "libudev libgudev udev-utils udev-consolekit"
 
 FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libgudev = "${base_libdir}/libgudev*.so.*"
@@ -84,7 +84,8 @@ FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 
 # udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
 # is ${prefix}/lib64
-FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
+FILES_${PN} += "/lib/udev*"
+FILES_${PN}-consokekit += "${libdir}/ConsoleKit"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
 RPROVIDES_udev_append = " udev-compat-wrapper"
-- 
1.7.2.3



