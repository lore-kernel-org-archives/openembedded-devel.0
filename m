Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rb9RI-0002uQ-80
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 12:25:28 +0100
Received: by ghrr15 with SMTP id r15so1412186ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 03:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=vM+5SPvd9XImQrkKFanZIym+2dYDooJsbewTK1WEC1M=;
	b=Sb0VuSyu8INDcE85l1xxs8aUaPdP/lT0nXHoOTge3+ZR7UWr3ttejyf4OCVeAYU4H+
	YNnNkK9SYZa3EBbqMVb12sPX4QK7v8zT5j4AkYnVDIhOe82V2Lq5QpAbAt9p8988kokM
	R7BqDGUxCZIVwP/ul1WrocOFaR9aOSrtL3EXE=
Received: by 10.101.95.20 with SMTP id x20mr1102592anl.83.1323947906135;
	Thu, 15 Dec 2011 03:18:26 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c44sm8652593yhm.5.2011.12.15.03.18.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 03:18:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 11:18:04 +0000
Message-Id: <ac183f41540e463ed0af3955ab804be8cde005bd.1323947853.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/5] twm: fix checksum
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
X-List-Received-Date: Thu, 15 Dec 2011 11:25:28 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
index af27632..a0a0eaf 100644
--- a/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
 
 
-SRC_URI[archive.md5sum] = "952d06a0c2ec34687b536c7b619fc671"
-SRC_URI[archive.sha256sum] = "e7dccad7879a7570442f0cd9df0b9064e926466b5a52b710fca8cfb167f294e9"
+SRC_URI[md5sum] = "952d06a0c2ec34687b536c7b619fc671"
+SRC_URI[sha256sum] = "e7dccad7879a7570442f0cd9df0b9064e926466b5a52b710fca8cfb167f294e9"
 
 FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
 ALTERNATIVE_NAME = "x-window-manager"
-- 
1.7.2.5



