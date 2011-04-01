Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q5dJo-0008Hp-ED
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 14:19:12 +0200
Received: by ywg8 with SMTP id 8so1387729ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=6eFJwYho3Vg7SUv6HC8uFl0+xtYYHkXh2a89PPSK1As=;
	b=ZLl5wa71dM3DEEpf4Tib8z1eoidc8LPusmiJIPfO+4DZd3N4ne+LLnbh8lqElZe1oa
	KuuvWd5KwAO4r8YPkOzX6jEBp+DgdPZKh7oBaTBzmUGfEEEgk0Wv8vNmMGMQ/6Vhqu/t
	GZH3rEswS4SCktYSgbccvJS9OywHc2wMsKZEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=Kw3/NnqoMYfMEfMvvcfzPO1g2EcxRzKUw8/szAb2E/n7uH5SqnJi8cj72fBffNIGLb
	Dgw/H4uFY0fwEUbe2+dEzBIm6OwCSjaV2Lyl9YQTVusdW4vAnv2uodUDBBorbdv7/tMJ
	Hojxvh+jyenNjuMbZSGd5MVLH3WFEYK/+WmqM=
Received: by 10.151.69.17 with SMTP id w17mr3933330ybk.7.1301660230500;
	Fri, 01 Apr 2011 05:17:10 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id d3sm948462ybi.20.2011.04.01.05.17.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 05:17:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 12:16:43 +0000
Message-Id: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
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
X-List-Received-Date: Fri, 01 Apr 2011 12:19:12 -0000

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



