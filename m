Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id ED7D870F06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2014 11:32:14 +0000 (UTC)
Received: from localhost (83.252.255.124) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.279.1; Mon, 27 Oct 2014
	12:32:13 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Oct 2014 12:31:42 +0100
Message-ID: <9a0b3d2f7e1ac7e854430fe1e93271c71f574083.1414409458.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <cover.1414409458.git.anders@chargestorm.se>
References: <cover.1414409458.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-qt5][PATCH 1/1] qmake5: set OE_QMAKE_INCDIR_QT
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
X-List-Received-Date: Mon, 27 Oct 2014 11:32:19 -0000
Content-Type: text/plain

This is set when generation an SDK, and thus would be usefull to have also
when bitbaking. That allows us to use this in *.prf files which is used
both when bitbaking as well as when using the SDK.

Signed-off-by: Anders Darander <anders@chargestorm.se>
(cherry picked from commit 96e8d29fdbdf6fa656c854d9b55c5b0c213166a7)
---
 classes/qmake5_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 3861cd0..f1a0945 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -32,6 +32,7 @@ EXTRA_OEMAKE = " \
     OE_QMAKE_AR='${OE_QMAKE_AR}' \
     OE_QMAKE_STRIP='${OE_QMAKE_STRIP}' \
     OE_QMAKE_WAYLAND_SCANNER='${OE_QMAKE_WAYLAND_SCANNER}' \
+    OE_QMAKE_INCDIR_QT='${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}' \
 "
 
 OE_QMAKESPEC = "${QMAKE_MKSPEC_PATH_NATIVE}/mkspecs/${OE_QMAKE_PLATFORM_NATIVE}"
-- 
2.1.1


