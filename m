Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pg2nX-0002z1-R7
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 23:16:15 +0100
Received: by pwi8 with SMTP id 8so211796pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 14:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=EBit32g3UjlP3wXF8/AjZWXOuDkK+zU1p9QsWPE5j8o=;
	b=PQ3KMZ2DwyazmxtABdKjOUpKA3N8WOmNuOpXjCq6fBOwNRQwbADf1idY3wBA8/haw2
	Nhyr00um+4aCrc61qk7nXR9baE62XOo2Z584Ju2QEbQ+cxB0Yflw1PHr7s6kAFr+pCTd
	59WznECROeqz/5I8VaFrEI4InB9iVSxhYugXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Z0Tx9o7x9WMgeGQh5yODJIj/XkUNj+8eIAzM6BMTHdAazttMUsBIPc83TTzTFiedR2
	VwdLFwx823KT3JB2dqXc/+gOBVdArWjbEzpdDIB9RrAGnmefc4qpMhot8DNFrSPflJsv
	CiVreFOlzrtzq1vUjlftMs+H0/S4oiFFlxnZA=
Received: by 10.142.136.10 with SMTP id j10mr2745220wfd.50.1295561724100;
	Thu, 20 Jan 2011 14:15:24 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w42sm11707143wfh.3.2011.01.20.14.15.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 Jan 2011 14:15:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jan 2011 14:15:18 -0800
Message-Id: <1295561718-19143-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] preferred-slugos-versions.inc: Prefer perl 5.10.1
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
X-List-Received-Date: Thu, 20 Jan 2011 22:16:15 -0000

* We do not need to pin bluez-libs anymore we use bluez4 for everything

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/preferred-slugos-versions.inc |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
index 4649c90..c68d511 100644
--- a/conf/distro/include/preferred-slugos-versions.inc
+++ b/conf/distro/include/preferred-slugos-versions.inc
@@ -38,6 +38,8 @@ PREFERRED_VERSION_linux-libc-headers		?= "2.6.31"
 PREFERRED_VERSION_m4				?= "1.4.14"
 PREFERRED_VERSION_m4-native			?= "1.4.14"
 PREFERRED_VERSION_nslu2-linksys-firmware	?= "2.3r63"
+PREFERRED_VERSION_perl				?= "5.10.1"
+PREFERRED_VERSION_perl-native			?= "5.10.1"
 PREFERRED_VERSION_pkgconfig			?= "0.23"
 PREFERRED_VERSION_pkgconfig-native		?= "0.23"
 PREFERRED_VERSION_udev				?= "118"
@@ -55,6 +57,3 @@ PREFERRED_VERSION_udev				?= "118"
 
 # latest tcl recipe has a bug that overwites regex.h; use the old tcl
 #PREFERRED_VERSION_tcl				?= "8.4.19"
-
-# We need the bluez4 version of the libs, which has default_precedence = -1
-PREFERRED_VERSION_bluez-libs			?= "4.42"
-- 
1.7.2.3



