Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQDQF-00058H-JC
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 May 2012 09:59:27 +0200
Received: by wibhj13 with SMTP id hj13so951137wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 May 2012 00:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=IV05cn+qsrA4gCvnxwP+0yBQW4ACqUUMkZsJFJwmOdU=;
	b=kSNcc7Dw33OHM7JQxifNbDOSkiC/seAEk/SfBjB/xgLW0pR8wb90/A89qTVQK8Eg82
	T5IJahG58ugUFtp7inzKPuQyC8oJStmNuHuHVXrz60k/cdRUWPqdMCsU7emnoWwfL7b1
	IQRbmtnxB8GjsmYc/E/qM5RMf2hmjByKUxCIPLW+LK4EtMs/Q1XjwjR5qGWK1F4t3Uks
	qI/hu0DFjNWWvgPEly42wXYmBR3vb2dZfgfX8up5jSaIdk1VRi0xncoagjsFo9OCKeqo
	aCuC/QOFBMt6w01juGtqNTxe7m/8Cdem/5dvYdU0P5Nr6H4W5iyFSZ/YE9dw0NCiz+L6
	qoQQ==
Received: by 10.180.96.228 with SMTP id dv4mr10371469wib.14.1336117781097;
	Fri, 04 May 2012 00:49:41 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm12425470wib.7.2012.05.04.00.49.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 00:49:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 May 2012 09:49:35 +0200
Message-Id: <1336117775-20242-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnXbML1S7YHIKdkcavGj1Va/L3z/7fv8dT8bUSGXp7ox2X28udPVrhG9/P0mO2yYDSnX7i9
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] xinput-calibrator 0.7.5: add xterm to RDEPENDS, the menu item doesn't work without it
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
X-List-Received-Date: Fri, 04 May 2012 07:59:27 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
index a50a0cf..765dcf2 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
 DEPENDS = "virtual/libx11 libxi"
 
-PR = "r5"
+PR = "r6"
 
 inherit autotools systemd
 
@@ -33,5 +33,5 @@ SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "${PN}.service"
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
-RDEPENDS_${PN} = "xinput"
+RDEPENDS_${PN} = "xinput xterm"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.7.10



