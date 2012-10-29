Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TSogi-0003DL-SF
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 13:43:29 +0100
Received: by mail-yh0-f47.google.com with SMTP id g23so888224yhg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2012 05:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=6me1AwowGzFyhlLQbLMuJrTQxC0YhE1Rh+BNGr+kHsA=;
	b=CHr1XEYjYhKTPYZBEc5vlgIG5BC1TOSx34o5GLhkbWlKa+gtuiKYr9bh2AXLgTthyL
	Juaw7kZ+eKC2J82nWMYg3PKj/4mT+TMUc6CE8CV8Oqd8eO4sgHNGa/2wfCMRrkjvJX2n
	HzNtgWMgv+TmdieeSD1+l3kgmjnanncVoPa76y7KP8EdKJ5mYQYyJxdWzpK06q0ubKgz
	hQbUWOvB+MGAiBh/4wsSZjos4FSyE41ROt5VvPrc6mPZv8VPFg8kui/tMNK7NHYO3IAp
	uN/iD1RSwDTGSZ64KSj1dKTnZqQGzSPBFpuNQvKMdp+vqLEFkJHkLqHiK5khURLhY7ht
	ADgw==
Received: by 10.236.85.201 with SMTP id u49mr29762164yhe.6.1351513794501;
	Mon, 29 Oct 2012 05:29:54 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id j8sm8362054ann.3.2012.10.29.05.29.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2012 05:29:53 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2012 10:29:43 -0200
Message-Id: <1351513785-15026-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/3] pcsc-lite: Update to 1.8.6
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
X-List-Received-Date: Mon, 29 Oct 2012 12:43:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{pcsc-lite_1.7.2.bb => pcsc-lite_1.8.6.bb}     |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.7.2.bb => pcsc-lite_1.8.6.bb} (59%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
similarity index 59%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
index a4f3fcc..bc51f72 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
@@ -1,14 +1,12 @@
 DESCRIPTION = "PC/SC Lite smart card framework and applications"
 HOMEPAGE = "http://pcsclite.alioth.debian.org/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c8e551349dc346258274f0007679e149"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a39d325b7d9cf2f07826a5154b16500c"
 DEPENDS = "udev"
-PR = "r3"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/3533/pcsc-lite-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "47e7055cfc14399fdaa1b7a4aa06e5aa"
-SRC_URI[sha256sum] = "41f13d552eaa2c3978fbb6f2125e81903a0767011d999052fd1a6ee03880b398"
+SRC_URI = "https://alioth.debian.org/frs/download.php/3757/pcsc-lite-${PV}.tar.bz2"
+SRC_URI[md5sum] = "3e4b777231d35ce35c15c0704f936eaa"
+SRC_URI[sha256sum] = "1e44049168d1ce55fd56c175f61206955254df0f385455f2a20ec7e8a0e6a77a"
 
 inherit autotools
 
-- 
1.7.2.5



