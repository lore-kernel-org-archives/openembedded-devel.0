Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1THhJ0-0002V9-IH
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 22:37:02 +0200
Received: by ghbz2 with SMTP id z2so1031501ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2012 13:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=/j+Usb6n/cQpE9Fj1KhdqA36ixZzJQGpAAphpZQzFSA=;
	b=rEFK+rHizVURRzuEDlznPhuAZpIqPPlAe5kqRPjTqCSkZRsrs8v4UQQdfsBLu7jGvJ
	JbMUMvz7cvXNw1i8oX5n3uZfOcpf8in30jB2LroQPxPZI75L1MSFPAymF8jSxgJclz3W
	u56Y/vOIz/U7KVXWUNCLosxmdBxxmSoE6WuLjB++E+MRaB99yOJ/Z5qcW8W1vtMbgSJz
	KCxa90jzWnj7ntfutSYRgItfgx2B6LRDitPtsPNhy8oyutC1advbklwVoiQjBbPdq+hn
	Jyzb3XVvKxfWAlAyNFSyl4GDeBW48tGzNeqrvAw4ycnz0NydbbeXSO4qb76HPCh74p+1
	qa9Q==
Received: by 10.101.132.11 with SMTP id j11mr2900520ann.65.1348863845768;
	Fri, 28 Sep 2012 13:24:05 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id o11sm10717094anj.20.2012.09.28.13.24.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 13:24:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Sep 2012 17:23:50 -0300
Message-Id: <1348863831-31989-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] uhd: Fix recipe syntax error
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
X-List-Received-Date: Fri, 28 Sep 2012 20:37:02 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/uhd/uhd.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
index 5e2e329..27584da 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd.inc
+++ b/meta-oe/recipes-connectivity/uhd/uhd.inc
@@ -7,7 +7,7 @@ DEPENDS = "git-native boost libusb1 uhd-firmware orc-native"
 RDEPENDS_${PN} += "uhd-firmware"
 
 PE = "1"
-INC_PR = "r1"
+INC_PR = "r2"
 
 inherit cmake
 
@@ -20,7 +20,7 @@ FILES_${PN} += "${libdir}/libuhd.so \
 FILES_${PN}-tests += "${datadir}/uhd/tests/*"
 FILES_${PN}-e1xx += "${datadir}/uhd/usrp_e_utils/*"
 FILES_${PN}-dbg += "${datadir}/uhd/examples/.debug/* \
-"                   ${datadir}/uhd/utils/.debug/* \
+                    ${datadir}/uhd/utils/.debug/* \
                     ${datadir}/uhd/tests/.debug/* \
                     ${datadir}/uhd/usrp_e_utils/.debug/*"
 FILES_${PN}-examples = "${datadir}/uhd/examples/*"
-- 
1.7.2.5



