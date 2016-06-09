Return-Path: <christoph.settgast@methodpark.de>
X-Greylist: delayed 498 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Jun 2016 11:51:56 UTC
Received: from mail.methodpark.de (mail.methodpark.de [212.204.89.242])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC2D60620
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 11:51:56 +0000 (UTC)
Received: from localhost (virusgate [212.204.89.246])
	by mail.methodpark.de (Postfix) with ESMTP id 2D87D33800FD;
	Thu,  9 Jun 2016 13:40:30 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.6 (20110518) (Debian) at methodpark.de
Received: from mail.methodpark.de ([IPv6:::ffff:212.204.89.242])
	by localhost (virusgate.methodpark.de [::ffff:212.204.89.246])
	(amavisd-new, port 10024)
	with ESMTP id r-8VBeMSQTMB; Thu,  9 Jun 2016 13:43:37 +0200 (CEST)
Received: from eng-knecht2.er.methodpark.de (unknown [10.10.100.67])
	by mail.methodpark.de (Postfix) with ESMTP id 72CF933800D0;
	Thu,  9 Jun 2016 13:40:29 +0200 (CEST)
From: Christoph Settgast <christoph.settgast@methodpark.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jun 2016 13:43:22 +0200
Message-Id: <1465472602-10834-1-git-send-email-christoph.settgast@methodpark.de>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] qtbase: add PACKAGECONFIG for journald logging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2016 11:51:57 -0000

Note from qtbase configure script:

 If your users intend on developing applications if logging to journal
 is enabled, ensure that the IDEs they use either set
 QT_LOGGING_TO_CONSOLE to 1 or the IDE is able to read the logged
 output from journald.

Signed-off-by: Christoph Settgast <christoph.settgast@methodpark.de>
---
 recipes-qt/qt5/qtbase_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 72ef3ae..a2a865d 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -127,6 +127,7 @@ PACKAGECONFIG[nis] = "-nis,-no-nis"
 PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
 PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
 PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
+PACKAGECONFIG[journald] = "-journald,-no-journald,systemd"
 
 QT_CONFIG_FLAGS += " \
     -shared \
-- 
1.9.1


