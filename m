Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B176A60B05
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 13:51:39 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Wznbv-0002Uz-Pb from drew_moseley@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jun 2014 06:51:39 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 25 Jun 2014 06:51:39 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 25 Jun 2014 06:51:38 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jun 2014 09:51:37 -0400
Message-ID: <1403704298-9726-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Jun 2014 13:51:39.0664 (UTC)
	FILETIME=[96C17900:01CF907C]
Subject: [meta-oe][PATCH 1/2] debianutils: Remove postinstall for some apps.
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
X-List-Received-Date: Wed, 25 Jun 2014 13:51:46 -0000
Content-Type: text/plain

The mkboot and sensible-* apps have been removed from
upstream debianutils.  Remove them from the postinstall
stages.
    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=197463
    http://en.it-usenet.org/thread/18153/169437/

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta-oe/recipes-support/debianutils/debianutils_4.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/debianutils/debianutils_4.4.bb b/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
index 30dd9a6..c93c026 100644
--- a/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
+++ b/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
@@ -30,7 +30,7 @@ pkg_prerm_${PN} () {
 if [ "x$D" != "x" ]; then
     echo "can't do u-a offline" ; exit 1
 else
-    for app in add-shell  installkernel  mkboot  remove-shell run-parts  savelog  sensible-browser  sensible-editor  sensible-pager  tempfile  which ; do
+    for app in add-shell  installkernel  remove-shell run-parts  savelog  tempfile  which ; do
        update-alternatives --remove $app $app.${PN}
     done
 fi
@@ -40,11 +40,11 @@ pkg_postinst_${PN} () {
 if [ "x$D" != "x" ]; then
     echo "can't do u-a offline" ; exit 1
 else
-    for app in add-shell  installkernel  mkboot  remove-shell ; do
+    for app in add-shell  installkernel  remove-shell ; do
         update-alternatives --install ${sbindir}/$app $app $app.${PN} 100
     done
 
-    for app in savelog  sensible-browser  sensible-editor  sensible-pager  which ; do
+    for app in savelog  which ; do
         update-alternatives --install ${bindir}/$app $app $app.${PN} 100
     done
 
-- 
1.9.1


