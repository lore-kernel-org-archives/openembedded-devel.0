Return-Path: <alexis.cellier@openwide.fr>
X-Greylist: delayed 415 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Apr 2015 14:19:26 UTC
Received: from zimbra3.corp.accelance.fr (zimbra3.corp.accelance.fr
	[213.162.49.233])
	by mail.openembedded.org (Postfix) with ESMTP id 295B972A85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 14:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by zimbra3.corp.accelance.fr (Postfix) with ESMTP id 509D17CB9C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 16:12:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra3.corp.accelance.fr
Received: from zimbra3.corp.accelance.fr ([127.0.0.1])
	by localhost (zimbra3.corp.accelance.fr [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id ZoLMCC4n-9Q4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 16:12:28 +0200 (CEST)
Received: from zimbra2.corp.accelance.fr (zimbra2.corp.accelance.fr
	[213.162.49.232])
	by zimbra3.corp.accelance.fr (Postfix) with ESMTP id 0B3EF7C16A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 16:12:28 +0200 (CEST)
Date: Tue, 28 Apr 2015 16:12:27 +0200 (CEST)
From: Alexis Cellier <alexis.cellier@openwide.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <1242158112.3767308.1430230347909.JavaMail.root@openwide.fr>
In-Reply-To: <1620830615.3767281.1430230294080.JavaMail.root@openwide.fr>
MIME-Version: 1.0
X-Originating-IP: [193.56.60.161]
X-Mailer: Zimbra 7.2.6_GA_2926 (ZimbraWebClient - FF3.0 (Linux)/7.2.6_GA_2926)
Subject: [meta-qt5][PATCH] qmake5_base.bbclass: fix typo
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
X-List-Received-Date: Tue, 28 Apr 2015 14:19:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

In the qt.conf file created, fix typo on "TargetSpec" (was "TartgetSpec").

Signed-off-by: Alexis Cellier <alexis.cellier@openwide.fr>
---
 classes/qmake5_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 44575c4..dbdaf78 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -79,7 +79,7 @@ HostBinaries = ${OE_QMAKE_PATH_HOST_BINS}
 HostData = ${OE_QMAKE_PATH_HOST_DATA}
 HostLibraries = ${OE_QMAKE_PATH_HOST_LIBS}
 HostSpec = ${OE_QMAKESPEC}
-TartgetSpec = ${OE_XQMAKESPEC}
+TargetSpec = ${OE_XQMAKESPEC}
 ExternalHostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
 Sysroot = ${STAGING_DIR_TARGET}
 EOF
-- 
2.3.5

