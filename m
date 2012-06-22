Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Si51H-0004c7-Ss
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 16:39:32 +0200
Received: by dalh21 with SMTP id h21so2301626dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2012 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6wyteAWgHD9x9tNZ4+sNI5ixcXW56TrD4FFyciYGkF0=;
	b=VzhANuXQSgIWmr/QoLISgEC3KGFIzCoBvka4qW8jpywQltAMpzjNBSQK+eJMP9Ally
	PEQKlxNXgkOEq6RHo6TKOmvurPZi2DleuRons5RF+6gMqmqWyeCNBxrpHwAFd9XeS+G3
	OvMqaoaeWCH6KLKp6/gLzQj36ygdncG3kHOZIhW4A8uvgBXwcjcoKCeNnhZ/9YN1MsCf
	gxnPkLVNxRL8OLSt8H6s3oDPq1YpiRsofJXlD4QSrfUV8+PbZ0La1OWzlNrVCiK1qpc1
	8Wy8AvTKNrg/CPeprF8/F338wTt1C4MDxS7cu1uJyrf9iH4G6jGfqpFH3ay7uL1j3yvh
	xV0Q==
Received: by 10.68.190.40 with SMTP id gn8mr10683998pbc.118.1340375321899;
	Fri, 22 Jun 2012 07:28:41 -0700 (PDT)
Received: from localhost.localdomain ([94.205.109.242])
	by mx.google.com with ESMTPS id os1sm39101988pbb.49.2012.06.22.07.28.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 07:28:41 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 16:28:27 +0200
Message-Id: <1340375307-20787-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Fri, 22 Jun 2012 14:39:32 -0000

This commit fixes the following warnings:
WARNING: Unable to get checksum for python-numpy SRC_URI entry config.h: file could not be found
WARNING: Unable to get checksum for python-numpy SRC_URI entry numpyconfig.h: file could not be found

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index a67bf8b..0ae2ca2 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -5,7 +5,16 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa"
 PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
-	   file://config.h \
+           ${CONFIGFILESURI} \
+	  "
+
+CONFIGFILESURI ?= ""
+
+CONFIGFILESURI_arm = "file://config.h \
+	   file://numpyconfig.h \
+	  "
+
+CONFIGFILESURI_mipsel = "file://config.h \
 	   file://numpyconfig.h \
 	  "
 
-- 
1.7.9.5



