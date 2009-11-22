Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NC3lX-00009T-Sq
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 05:09:38 +0100
Received: by bwz9 with SMTP id 9so4130926bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 20:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=bVomJKv/h4L7iVZdlVhuuWjEfvMFkK7xz5MwFdpMaEE=;
	b=SWgjaSfR4eowQd3dNBrpHWr6FxeCha1bGSV1ZWgiQhYOs9fjxcZfjRmqK2Dm9CQset
	b3WNpYEBDLNDGqJRgI2NhYhUy/capToL3EfRELsRFxnDkdD+CJiqBOzpPcgyTbRAl4Kt
	WMBdxLvKyvqXITLw38K6TLACjmncz2gHfcZrc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cxEV3K/leS3CjPNH1mAMHHbD0HY/Zbq0LVmaURoldvVdwtUyI1Qsc1HJ3KG9MWvgVp
	2bH4z8TOs2Pzm9h4f3RyEk5k3/sqwHTjvuRxWoq0CSfAffJ521CjXULIpP48lFgVeQa7
	cCN1IVTUyqGBE6hdsSnODQ9IVu/vI2Mp6cGZw=
Received: by 10.204.11.3 with SMTP id r3mr3066269bkr.107.1258862884091;
	Sat, 21 Nov 2009 20:08:04 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm984737fxm.2.2009.11.21.20.08.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 21 Nov 2009 20:08:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Nov 2009 05:07:59 +0100
Message-Id: <1258862880-17496-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.3
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] module_strip.bbclass: look for modules in right directory
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
X-List-Received-Date: Sun, 22 Nov 2009 04:09:39 -0000

* After 29c7d3351f43678c6e93b707b301832009f64b31 modules are not in
  install directory but in package, packages-split
* modules*.tgz is created BEFORE this, so it contains non stripped
  modules
* for modules*.tgz with stripped modules see following patch
---
 classes/module_strip.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/module_strip.bbclass b/classes/module_strip.bbclass
index 3316e20..1740919 100644
--- a/classes/module_strip.bbclass
+++ b/classes/module_strip.bbclass
@@ -2,11 +2,11 @@
 
 do_strip_modules () {
 	for p in ${PACKAGES}; do
-		if test -e ${WORKDIR}/install/$p/lib/modules; then
+		if test -e ${PKGDEST}/$p/lib/modules; then
 			if [ "${KERNEL_MAJOR_VERSION}" == "2.6" ]; then
-				modules="`find ${WORKDIR}/install/$p/lib/modules -name \*.ko`"
+				modules="`find ${PKGDEST}/${p}/lib/modules -name \*.ko`"
 			else
-				modules="`find ${WORKDIR}/install/$p/lib/modules -name \*.o`"
+				modules="`find ${PKGDEST}/${p}/lib/modules -name \*.o`"
 			fi
 			if [ -n "$modules" ]; then
 				for module in $modules ; do
-- 
1.6.5.3



