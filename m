Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SySxQ-0008Ee-1J
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 21:27:16 +0200
Received: by ggmq1 with SMTP id q1so2613175ggm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 12:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=r0ERxHcCo839eiLl1q6qStKtxeHaCjzZtlo9hBFuc5w=;
	b=B5NkG73VfpTJmZdcp+SMiivFUFfmNXgDTqwjYlmMD627DuHYvyS20kJI0cXT8J2XLU
	Abugh0CsmP1DwrHmylW40ghJiTkcnG5Hl1/ZCfJvbXbirWUmRDEkXJzE4uPKhZF4bPxb
	l7W6KrKZQxMq4i1Y+rIiLP2fROY58HRNDNdYW4OMyB0u4PWwbSFLKzCxqC+L8oiZwc+a
	CKultMiy2+KCeGdB7J0fdwiEizIXGyja525cuUA65SA+7FNjLEOlGPBlWOByG5z7LKsc
	kqUNd5N5Ld5mM1pjAlH1edmo7DLbUYdahLmR1clLEH+ec4KYNA2VZv5sELwHSizGEtx1
	r2cQ==
Received: by 10.236.155.10 with SMTP id i10mr10934605yhk.91.1344280530669;
	Mon, 06 Aug 2012 12:15:30 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id y66sm33052136yhi.10.2012.08.06.12.15.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 12:15:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2012 16:15:18 -0300
Message-Id: <1344280518-21955-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] libxaw: Fix libxaw-dev to not depends on non-existent libxaw package
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
X-List-Received-Date: Mon, 06 Aug 2012 19:27:16 -0000

The libxaw recipe generate a binary package for each soname of libxaw
(currently libxaw6-6 and libxaw-7-7) but no libxaw so libxaw-dev
cannot depends on it.

Reported-by: Daiane Angolini <daiane.angolini@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
NOTE: this patch should be applied on denzil branch as it is broken there too.

 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
index 89338d9..88863a7 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -5,6 +5,7 @@ DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp pr
 LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
 PE = "1"
+PR = "r1"
 
 SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
 SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
@@ -24,4 +25,7 @@ FILES_libxaw6 = "${libdir}/libXaw*.so.6*"
 FILES_libxaw7 = "${libdir}/libXaw*.so.7*"
 FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
 
+# Avoid dependency on libxaw as it is not build
+RDEPENDS_${PN}-dev = ""
+
 XORG_PN = "libXaw"
-- 
1.7.2.5



