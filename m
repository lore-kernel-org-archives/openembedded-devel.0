Received: from mail-yh0-f43.google.com ([209.85.213.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tlivd-0000Ip-JE
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 17:25:04 +0100
Received: by mail-yh0-f43.google.com with SMTP id 3so777558yhp.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 08:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=HEIKB2ITggUk2Fw/g0b8YJxuACKuUatcUY++7s+8cQA=;
	b=fB7BMCHVWvjPNPt5SW1ohCLn+8iBLuAc+QMtg/RfPi6HexnpO3Cf6ydVeTmPHbMXS9
	gTpZblWwB3syDaWT6dxq+p9UC0UQLE3TbtHRq2zg9Y1qeh2h+iT5d1PwNyydJSnLWIFa
	54fklU0AYXgKvKnmjK/QQbkZ0EsTuszdZR5HqoPrVLz3MjmvaAi5oZdO7Q/PyttthRft
	xqaa5qSuHPaPhYQ8pPPvftdb8xEx4Ki32kg+8PlUtgruuKO5vbiiEKTdYluLp28AN4ei
	dFWxxwhoJNPMOl2EyhXTavI/GVQLy4kWPQtCpKEOAbX/5uwKl5yu5XXn3CW1eAnyJBv+
	8k/Q==
X-Received: by 10.236.115.7 with SMTP id d7mr7930887yhh.118.1356019816304;
	Thu, 20 Dec 2012 08:10:16 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.170])
	by mx.google.com with ESMTPS id l35sm7963306yhi.12.2012.12.20.08.10.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 08:10:15 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2012 14:10:07 -0200
Message-Id: <1356019807-9397-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] openmotif: Avoid use os Xos.h from host
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
X-List-Received-Date: Thu, 20 Dec 2012 16:25:04 -0000

Change-Id: I02029212e22cf388cd1a82dd070755779689e2d8
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/openmotif/openmotif_2.3.3.bb   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index 23142ee..9888246 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -1,11 +1,11 @@
 SECTION = "libs"
 DESCRIPTION = "OSM/Motif implementation."
 LICENSE = "OGPL"
-DEPENDS = "xbitmaps virtual/libx11 libxt libxft"
+DEPENDS = "xbitmaps virtual/libx11 libxt libxft xproto"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://fossies.org/unix/misc/openmotif-2.3.3.tar.gz \
            file://configure.patch;patch=1"
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "c85f5545e218fa0c59a3789192132d472fc5a33e914a221a568eee4fc1
 
 inherit autotools
 
-EXTRA_OECONF = "--disable-printing"
+EXTRA_OECONF = "X_CFLAGS=-I${STAGING_INCDIR} --disable-printing"
 
 PACKAGES += "${PN}-bin"
 
-- 
1.7.2.5



