Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOVGW-0000m7-ID
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 15:33:48 +0200
Received: by ywg8 with SMTP id 8so2201388ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=H/FNWCKGX9F/ckgAMtUxGOpfWEHU2DPLGO6DlZ0oBZ4=;
	b=u6khgS0EOtmAA7r1x5+8OmzxLbUwn4coV1XEKHPl0NxhyxN6P9VUPB0Da6yuciafTm
	IxPzclAuoOxgH+zlIZFa6lG9LyseH+e88xK6yLhfWEFfVXjYan31CSXjnpwYL/b0azPt
	39GIxsAsbuB1jcwLiA6WoXYp8MECPJP7kSNzw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=is4cg/upEMlxwK6FdDK9mpt2CVgbETuf+FfogBIbcJRPgCo6rvWxIFFefGwJTIct85
	moKo9iMIG+P+mEgBDO4K7UcaJ2z524FVcyZXFUGhV8N5I8i5TPw1aY0iDnaGggVMTr8C
	FgJG9bCnnekN1J5n8O1yDRKQOZa/5+RKGEoCY=
Received: by 10.150.68.34 with SMTP id q34mr2751979yba.248.1306157447881;
	Mon, 23 May 2011 06:30:47 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q29sm2723749yba.17.2011.05.23.06.30.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 06:30:47 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 May 2011 13:30:24 +0000
Message-Id: <f5aac8333a4f3245b8ae7c369ae2bfc09510c11b.1306157341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306157341.git.otavio@ossystems.com.br>
References: <cover.1306157341.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306157341.git.otavio@ossystems.com.br>
References: <cover.1306157341.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/4] udev: move ConsoleKit files to udev-consolekit
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
X-List-Received-Date: Mon, 23 May 2011 13:33:48 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/udev/udev_168.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_168.bb b/meta-oe/recipes-core/udev/udev_168.bb
index eaba889..17600b7 100644
--- a/meta-oe/recipes-core/udev/udev_168.bb
+++ b/meta-oe/recipes-core/udev/udev_168.bb
@@ -35,7 +35,7 @@ SRC_URI += " \
        file://udev-compat-wrapper-patch \
 "
 
-PR = "r1"
+PR = "r2"
 
 inherit update-rc.d autotools
 
@@ -54,7 +54,7 @@ EXTRA_OECONF += " --with-udev-prefix= \
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-PACKAGES =+ "libudev libgudev udev-utils"
+PACKAGES =+ "libudev libgudev udev-utils udev-consolekit"
 
 FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libgudev = "${base_libdir}/libgudev*.so.*"
@@ -68,9 +68,12 @@ RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
 
 # udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
 # is ${prefix}/lib64
-FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
+FILES_${PN} += "/lib/udev*"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
+FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
+RDEPENDS_${PN}-consolekit += "consolekit"
+
 # Package up systemd files
 FILES_${PN} += "${base_libdir}/systemd"
 
-- 
1.7.2.5



