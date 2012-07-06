Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Smz7w-00040r-8h
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 05:22:40 +0200
Received: by pbbrq2 with SMTP id rq2so13355547pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2012 20:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mTQI6fsTrOvRw0HgM9Jwc2s3x9RGgMzQ1XZnkVu5kVY=;
	b=WP7BL9Ud+lsNFHeNYLIfd7FHECI4fTdLBbACXBCg+yfqPjXTTEJjdUoE2kW+Tx54rZ
	f4+Jk9jLYT9BV23S7sXQyNcJ3XQEB7Uk/nYvSlwr8yDCAA2/YBGF3sbo4Dmu+Vsx3xop
	ZdPpIyum8teFjxFnpwy+8bYIeJgye2TJaxBOwtALstJvWDMOAnJzjcHc6GtxRFBo3Q37
	ybK1iSnsazuOqLB9eg6LY5ugTrY3xvd+6dr0gDFRmlLOhxdChzBdK+34tJATFKEWlw+R
	wF4FBEcR0mnx8VTkiN3S+u1FKBcJAAL7ASKeP+IoWnircSU/TRRY6mcreG4fGlPALDN7
	HJxA==
Received: by 10.68.195.97 with SMTP id id1mr33678612pbc.91.1341544294263;
	Thu, 05 Jul 2012 20:11:34 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id rs4sm20952836pbc.0.2012.07.05.20.11.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 20:11:33 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jul 2012 06:52:27 +0400
Message-Id: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded 1/4] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Fri, 06 Jul 2012 03:22:40 -0000

This commit fixes the following warnings:
WARNING: Unable to get checksum for python-numpy SRC_URI entry config.h: file could not be found
WARNING: Unable to get checksum for python-numpy SRC_URI entry numpyconfig.h: file could not be found

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index a67bf8b..c1923f7 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -5,7 +5,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa"
 PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
-	   file://config.h \
+           ${CONFIGFILESURI} \
+	  "
+CONFIGFILESURI ?= ""
+
+CONFIGFILESURI_arm = "file://config.h \
+	   file://numpyconfig.h \
+	  "
+CONFIGFILESURI_mipsel = "file://config.h \
 	   file://numpyconfig.h \
 	  "
 
-- 
1.7.9.5



