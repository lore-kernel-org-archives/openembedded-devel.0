Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sj6W7-0003OZ-DK
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jun 2012 12:27:35 +0200
Received: by eekd49 with SMTP id d49so1222920eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2012 03:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=3plrA1VmJ0liKQSo80YG6Zo21K9kV9F9REXSrceq5dw=;
	b=Cvq/NaR+WJjVqpqu/C/lmBGtQ+bXx34m8MTO2d+MUP0cOi1TgXEPem+M0xwTqeFx1G
	hML2WR6X8Kl/DJ0MUFPR/nlriFghkp4MTtdjy8lAZ7OTgZQAXaYb7pUklB28Yqxk7XDd
	zXSksQwhLawa05rg5HgL9xnCnB753/adxY4e9do86yxKZ2+gqnOkaMMOfMTOuoUSCVzT
	u265fQIE/kkmUD3CvDUIOpt//K64kWM5D79jiB+PhhgxpMgm4KelJjPb9lR0xfqeKm9f
	m2LUyU31FHlDwtf8Jtaz2fX7a/yIsj0QF57zFMtKztcvDX6dZ3E1rUH1e6QIC5OlGfOF
	lryA==
Received: by 10.14.100.137 with SMTP id z9mr2175730eef.227.1340619404681;
	Mon, 25 Jun 2012 03:16:44 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id p41sm137217847eef.5.2012.06.25.03.16.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jun 2012 03:16:44 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jun 2012 12:16:39 +0200
Message-Id: <1340619399-25303-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnKM8C3ogwhBxpvCIUevl12NQbWjINplwRt4gwVch+6cfcS7n9kJBBE6zcCAEmXQ0Z3K8RT
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] python-docutils: update to 0.9.1
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
X-List-Received-Date: Mon, 25 Jun 2012 10:27:35 -0000

This fixes the 'no module named Roman' errors. License checksum changed due to date changes

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../{python-docutils_0.5.bb => python-docutils_0.9.1.bb}       |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-docutils_0.5.bb => python-docutils_0.9.1.bb} (53%)

diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb b/meta-oe/recipes-devtools/python/python-docutils_0.9.1.bb
similarity index 53%
rename from meta-oe/recipes-devtools/python/python-docutils_0.5.bb
rename to meta-oe/recipes-devtools/python/python-docutils_0.9.1.bb
index adecd8f..44d08d3 100644
--- a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
+++ b/meta-oe/recipes-devtools/python/python-docutils_0.9.1.bb
@@ -2,19 +2,17 @@ DESCRIPTION = "Text processing system"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=ac6ee29ac0310c091afab5ac4bea2fa3"
-PR = "r1"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=21eae6cbbd42b24a4243269f39e5d592"
 
 DEPENDS = "python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "dd72dac92fc8e3eb0f48c3effeef80f6"
-SRC_URI[sha256sum] = "747cf984edfca0575addbb42453274a1bdd98ec7780bd37a883dc8b2a66a610e"
+SRC_URI[md5sum] = "b0d5cd5298fedf9c62f5fd364a274d56"
+SRC_URI[sha256sum] = "e89f187dbbc6674f839239c89fec44af9f18809b66a8a55a41b57b9ee2356994"
 
 S = "${WORKDIR}/docutils-${PV}"
 
 inherit distutils
 
-NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
 
-- 
1.7.10



