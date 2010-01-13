Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NUqyz-0002KK-Kf
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 01:21:12 +0100
Received: by fxm4 with SMTP id 4so19535214fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 16:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MOt0/RTDRipkTYG//npX96aRvjW3O4Fev9QWuOlVkxw=;
	b=uAnqH1K/FQpIRxfnV5Or3Zq55D6NNTYPwsR5E0VDuSkw3oZiaehtMaduqPf0xG/yBW
	ZYQq1/jvCftdyEr4B1sL9jFDAeLiqU9XPIv5gkOOfEdmMyNGV1cBLD/o1sBfwGCl1uor
	EZrGv14qkMO6DM+J19rEryXn7QUGeKqrY/ESY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bFus/J062t60LIiqPgRkPjtLRFHn1i8YagNPiOg+py6Giubh9K/bUiuYcYnftMrHyE
	VUcqkfLHdfBiGuPTgyhLa1JOMJGG4f/p/CLJ/PxiQdmCNVhGCQFQ+ZxZ+6CDrSJMFoN3
	sckG1vf9UhbyRzbDfpmg0oN2jzEgqHtflXr2s=
Received: by 10.223.2.205 with SMTP id 13mr7834396fak.83.1263341940034;
	Tue, 12 Jan 2010 16:19:00 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm10514235fxm.13.2010.01.12.16.18.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Jan 2010 16:18:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jan 2010 01:17:19 +0100
Message-Id: <1263341840-19186-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1263341840-19186-1-git-send-email-Martin.Jansa@gmail.com>
References: <20100112222121.GD10781@jama>
	<1263341840-19186-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/3] task-boot: use DISTRO_UPDATE_ALTERNATIVES instead of update-alternatives directly
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
X-List-Received-Date: Wed, 13 Jan 2010 00:21:13 -0000

* Images built after 2009-12-08 9b641bbfed07c075ae5cbe84082a85f1ba703447
  probably use opkg-native, but also ship with u-a-cworth

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/tasks/task-boot.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes/tasks/task-boot.bb b/recipes/tasks/task-boot.bb
index 04c5535..45d50ef 100644
--- a/recipes/tasks/task-boot.bb
+++ b/recipes/tasks/task-boot.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Basic task to get a device booting"
-PR = "r51"
+PR = "r52"
 
 inherit task
 
@@ -13,6 +13,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
+# update-alternatives script installed in rootfs needs to be the same as
+# u-a script used for building image which is defined with
+# PREFERRED_PROVIDER_virtual/update-alternatives-native
+
+DISTRO_UPDATE_ALTERNATIVES ?= "${PREFERRED_PROVIDER_virtual/update-alternatives}"
+
 # Make sure we build the kernel
 DEPENDS = "virtual/kernel"
 
@@ -26,7 +32,7 @@ RDEPENDS_task-boot = "\
     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     modutils-initscripts \
     netbase \
-    update-alternatives \
+    ${DISTRO_UPDATE_ALTERNATIVES} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS} \
     "
 
-- 
1.6.6



