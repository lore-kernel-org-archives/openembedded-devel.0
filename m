Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8806E835
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 20:28:26 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id z6so5874872yhz.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/rGLoGhtA3r9TrrKLD7hgE1vutIP36K2S+SGIaGAVz8=;
	b=c0Vb29UGrrByl8JgII5byCcBW6DNdxRzHPB9VKF7Pz2I/nlzhFxF1GLzy+JFKe/WhV
	S2eYYFp75lbxJE+Yb1OQtjIxYsKDOec+/QgDg56L9x3Gq/HTkUokypogMnnZzirhRyFE
	lqK48GdnYuVq/G+w+2O7hpB5xIMpUpl+/AuTcJCIxUk1TKle2eeNFLaWQjX/dJQMCIti
	RbUTB3qgf6Eeh8B30GvlPhJWgs0G3RLf4BCVdNHnj8DFOXdI/Q1c95JuvLzg+jG2TfDJ
	ra8S9IGlvvKGuSoKxDXZIThI7GNflwA2kDafePDw6eC4Q0ZViWDbvT7FdLPvNsV1PrC2
	Sw7w==
X-Received: by 10.236.180.33 with SMTP id i21mr940117yhm.101.1393273707981;
	Mon, 24 Feb 2014 12:28:27 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id f78sm945753yhp.12.2014.02.24.12.28.26
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 12:28:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2014 17:28:16 -0300
Message-Id: <1393273696-9249-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 3/3] populate_sdk_qt5.bbclass: Add support for qtcreator-debug
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
X-List-Received-Date: Mon, 24 Feb 2014 20:28:27 -0000

This adds a new image feature for easier remote debugging with
QtCreator.

The qtcreator-debug needs to be added as a valid item for image
features and having it inside the populate_sdk_qt5 is too late. User
will see a parser error as OE-Core images does not inherit the classs.
The possible workaround for it is to include it inside layer.conf file
until a kind of "bbclassappend" support is in place.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/populate_sdk_qt5.bbclass |    2 ++
 conf/layer.conf                  |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index 635dd6d..c921983 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -52,3 +52,5 @@ toolchain_create_sdk_env_script_append () {
     echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
     echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
 }
+
+PACKAGE_GROUP_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
diff --git a/conf/layer.conf b/conf/layer.conf
index 3b47b7f..75d13a4 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -22,3 +22,5 @@ BBFILE_PATTERN_qt5-layer := "^${LAYERDIR}/"
 # other layers.
 
 BBFILE_PRIORITY_qt5-layer = "7"
+
+IMAGE_FEATURES[validitems] += "qtcreator-debug"
-- 
1.7.10.4


