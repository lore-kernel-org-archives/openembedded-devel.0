Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1Rh327-0004l8-BT
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 18:47:53 +0100
Received: by iakh37 with SMTP id h37so23310226iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 09:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=IiPKaNnAgvKb28bN07ZtVOagNzBDxrY0/y+AziGYvfI=;
	b=P2osAO6SiPMGHGvqfGI8CDPUc3lsr6SqqHIrH/hBfIuMvUPZvev8mO5sjqeZk/R6WN
	B6TAntj8rWNV3dEbbUFBWhe33J2056bAyx21caDScPO9U42oVUQ1Z+Ja9cp5QiYX2H72
	bq2mzlnzAdUASjSBO5CNNqE+qstie0pRuCXrA=
Received: by 10.50.191.200 with SMTP id ha8mr50725025igc.27.1325353229928;
	Sat, 31 Dec 2011 09:40:29 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id aq5sm93262882igc.5.2011.12.31.09.40.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Dec 2011 09:40:29 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Dec 2011 11:40:21 -0600
Message-Id: <1325353221-558-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
Subject: [meta-oe][PATCH] python-pyusb: add recipe to support usb development in Python
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
X-List-Received-Date: Sat, 31 Dec 2011 17:47:53 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

---
 .../python/python-pyusb_1.0.0a2.bb                 |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb

diff --git a/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb b/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
new file mode 100644
index 0000000..4048f4b
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pyusb_1.0.0a2.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "PyUSB provides USB access on the Python language"
+HOMEPAGE = "http://pyusb.sourceforge.net/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a53a9c39efcfb812e2464af14afab013"
+DEPENDS = "libusb1"
+
+SRC_URI = "\
+  ${SOURCEFORGE_MIRROR}/pyusb/${SRCNAME}-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "9136b3dc019272c62a5b6d4eb624f89f"
+SRC_URI[sha256sum] = "dacbf7d568c0bb09a974d56da66d165351f1ba3c4d5169ab5b734266623e1736"
+
+SRCNAME = "pyusb"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
-- 
1.7.6.4



