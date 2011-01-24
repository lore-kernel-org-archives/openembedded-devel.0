Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhBnH-0002eg-OW
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 03:04:47 +0100
Received: by iwn8 with SMTP id 8so3971102iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 18:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=urQV9T8EquWxqw68W8xoIOprkFjVPyeIKRKvp1e13J4=;
	b=NEnndJLv7tOOBAX2fGG3pOKPipqT6bFamM9mdJVe8CKy9OOT277lUP6okcbCafbdku
	FOwcjFJTggYMCAplcINevj+zU6qSmwPT+UR0w0cRIG8VRuSUWqcjuzs5R081wIulylrV
	h6RA8n0qW0ZFE9YU8z91OuxEbiLbuyamvEa1A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=J79VSsxc6ws95d7UV15WhCF7l+cs+moxmzqihmNPxuQ0kC2g8QLJ4bfWZHLYNqT8bQ
	gqf7OqOQYlhoVNoL3Rzt4PasbyplGd9vPMpBAy1C5nfjq2ka8XFNfDsaSB6CSDa42eP1
	wGk+1bWqQScN1KA2M7iUoOGxZEMsRr6q+KYWA=
Received: by 10.231.32.130 with SMTP id c2mr4019065ibd.35.1295834632365;
	Sun, 23 Jan 2011 18:03:52 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id
	gy41sm10535616ibb.11.2011.01.23.18.03.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 23 Jan 2011 18:03:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Jan 2011 18:03:49 -0800
Message-Id: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] angstrom-2010.x.conf: Prefer binutils 2.21 and uclibc-git
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
X-List-Received-Date: Mon, 24 Jan 2011 02:04:51 -0000

* no need to pin older udev with uclibc/git either

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/angstrom-2010.x.conf                   |    6 +++---
 .../include/angstrom-2010-preferred-versions.inc   |    1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-2010.x.conf
index c6fb07d..3ac3847 100644
--- a/conf/distro/angstrom-2010.x.conf
+++ b/conf/distro/angstrom-2010.x.conf
@@ -71,8 +71,8 @@ PREFERRED_VERSION_linux-libc-headers-native = "${LINUX_LIBC_HEADERS_VERSION}"
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc 		?= "2.10.1"
 PREFERRED_VERSION_glibc-initial 	?= "2.10.1"
-PREFERRED_VERSION_uclibc        	?= "0.9.30.2"
-PREFERRED_VERSION_uclibc-initial	?= "0.9.30.2"
+PREFERRED_VERSION_uclibc        	?= "git"
+PREFERRED_VERSION_uclibc-initial	?= "git"
 PREFERRED_VERSION_eglibc		?= "2.12"
 PREFERRED_VERSION_eglibc-initial	?= "2.12"
 
@@ -95,7 +95,7 @@ ANGSTROM_GCC_VERSION_avr32		?= "4.2.2"
 #Everybody else can just use this: 
 ANGSTROM_GCC_VERSION                     ?= "4.5"
 
-ANGSTROM_BINUTILS_VERSION                ?= "2.20.1"
+ANGSTROM_BINUTILS_VERSION                ?= "2.21"
 
 PREFERRED_VERSION_binutils               ?= "${ANGSTROM_BINUTILS_VERSION}"
 PREFERRED_VERSION_binutils-cross         ?= "${ANGSTROM_BINUTILS_VERSION}"
diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
index 5532f29..66ee5ab 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -66,7 +66,6 @@ PREFERRED_VERSION_samba		= "3.3.9"
 PREFERRED_VERSION_tiff 		= "3.9.4+4.0.0beta6"
 
 PREFERRED_VERSION_udev 		= "165"
-PREFERRED_VERSION_udev_libc-uclibc = "141"
 UDEV_GE_141 = "1"
 
 PREFERRED_VERSION_usbutils = "0.86"
-- 
1.7.0.4



