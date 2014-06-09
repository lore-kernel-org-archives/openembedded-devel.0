Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id C0E8C65E87
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 12:34:59 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id hy4so1835330vcb.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jun 2014 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=xUvrfalPiZxxFBlH++P2BJxV08sTYViHGleOI2VYuV8=;
	b=SX9ohD112ZzEt6WVVaY1ImA42mzb2ZLhjVKy72jb+OtuKjgxb6TtLzUZ9hfMIF44up
	dMx8n96IQa6Bz23YvCkfksWuuMALsCF8d+3RBMWvmxTq17CvL0DU3ohC8dCZhgqQGbdh
	pDSf28YnUWglR+aDUbkOboqKde1HyzfhdMEig2rqTIHf4XIsOGoB43pY29DIcARpug9N
	RDUO6IHQiZ2RU/oegAf4aT1s3s6bQO/b+cKd6XxhdniloCa4IA3B7qYRpPFaJTbMdPC1
	Jd9sMod1LgUkz4SapyhF4R5ClOTwc/T+dSNC+PFSQiQIcn075Jg1mGIk+4cz4slDfQlZ
	nl+A==
X-Received: by 10.58.132.41 with SMTP id or9mr25982579veb.5.1402317301002;
	Mon, 09 Jun 2014 05:35:01 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	wb2sm22634456veb.13.2014.06.09.05.34.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 05:34:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 2CE4C1B95540D; Mon,  9 Jun 2014 09:34:56 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon,  9 Jun 2014 09:34:53 -0300
Message-Id: <1402317295-5120-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 1/3] qmake5_base.bbclass: Add the Qt5 tools in the search path
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jun 2014 12:35:02 -0000

Every recipe using Qt5 needs to know where the Qt5 tools are installed
and have them in the search path.

Originally it was being done in qt5.inc file but a better place for it
is inside qmake5_base.bbclass. We now use the native bindir as every
recipe needs to use the native one (be it native, nativesdk or
target).

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/qmake5_base.bbclass | 3 +++
 recipes-qt/qt5/qt5.inc      | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 3861cd0..3b8c3bd 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -113,6 +113,9 @@ B = "${SEPB}"
 
 CONFIGURESTAMPFILE = "${WORKDIR}/qmake5_base_configure.sstate"
 
+# The Qt5 tools binaries need to be included into the search path
+PATH_prepend = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}:"
+
 qmake5_base_preconfigure() {
         if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
                 if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${S}" != "${B}" ]; then
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index bb0bcdc..7b7526a 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -161,5 +161,3 @@ FILES_${PN}-examples-staticdev = " \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*.a \
     ${OE_QMAKE_PATH_EXAMPLES}/*/*/*/*/*/*/*/*.a \
 "
-
-PATH_prepend = "${STAGING_DIR_NATIVE}${OE_QMAKE_PATH_QT_BINS}:"
-- 
2.0.0.rc4


