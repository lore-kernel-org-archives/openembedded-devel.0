Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1B765D31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 06:15:06 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WdZPb-0005FB-Ut for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2014 08:15:03 +0200
Received: from 80-218-32-173.dclient.hispeed.ch ([80.218.32.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 08:15:03 +0200
Received: from auslands-kv by 80-218-32-173.dclient.hispeed.ch with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 08:15:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Neuer User <auslands-kv@gmx.de>
Date: Fri, 25 Apr 2014 08:10:01 +0200
Message-ID: <ljcu7p$b1t$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 80-218-32-173.dclient.hispeed.ch
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
Subject: [meta-qt5][PATCH]Fix: QA Issue: qtmultimedia: Files/directories were installed but not shipped
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
X-List-Received-Date: Fri, 25 Apr 2014 06:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Fix: QA Issue: qtmultimedia: Files/directories were installed but not
shipped on imx6

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index dfc1c76..a2f9a73 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -54,6 +54,7 @@ FILES_${PN}-tools-dbg = " \
 "
 FILES_${PN}-plugins-dbg = " \
     ${OE_QMAKE_PATH_PLUGINS}/*/.debug/* \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
 "

 # extra packages
@@ -98,6 +99,7 @@ FILES_${PN}-tools = " \
 "
 FILES_${PN}-plugins = " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
 "
 FILES_${PN}-mkspecs = "\
     ${OE_QMAKE_PATH_ARCHDATA}/mkspecs \


