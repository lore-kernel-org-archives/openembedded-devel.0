Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1A76E374
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 21:02:51 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id lh14so9885285vcb.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 13:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TrPN73l3cYfslNY4tj1p95oY++rFd19Vnw2KQ16AZMc=;
	b=a0hYDgfzp16Jw3xxDKiZwv5Z6enTzRsMaMawdfsP9kCKGGoucauTfLAtTvQJLnQcZo
	DkFFWbyFkXNaEKJtBYyf/Ak4Z92oKFupK6Mc9d7T0VsTuA4vq0vRAyzwo7im3hSDo/nr
	36vNvTx9A6gz2tsK3MKeyvRp108ptxwYVh1WaQYHwJ8mPcHja1EAN5ZWVucq4dx1d27m
	M5j/hbUqKYAiAPvsLZFTjEfTZM/tLFImy8PtUxQtTgg4+eZd2KxWqnlnDAL2Q44401AX
	NZwKqmG9VmfQO0gAUS2y/H3rpGICfqLVqvrMJLYqM7JqXq7Lbf3/3awQotrdc6px30tF
	Z/rw==
X-Received: by 10.52.170.241 with SMTP id ap17mr5703951vdc.13.1392411772957;
	Fri, 14 Feb 2014 13:02:52 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id ay4sm17507546vdb.4.2014.02.14.13.02.51
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 14 Feb 2014 13:02:52 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2014 19:02:34 -0200
Message-Id: <1392411754-10608-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
References: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 2/2] nativesdk-qtbase.inc: Remove unused contents
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
X-List-Received-Date: Fri, 14 Feb 2014 21:02:52 -0000

Fixes:

ERROR: QA Issue: nativesdk-qtbase: Files/directories were installed but not shipped
  /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib
  /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/include
  /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/share
  /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Test.so
  /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Network.so
  ...

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/nativesdk-qtbase.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 36bc334..fe80c9b 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -188,4 +188,8 @@ do_install() {
     # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
     # e.g. qt3d, qtwayland
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
+
+    # remove things unused in nativesdk; things are statically link
+    # and we just use the binaries so drop all unused files
+    rm -rf ${D}${includedir} ${D}${libdir} ${D}${datadir}/doc
 }
-- 
1.7.10.4


