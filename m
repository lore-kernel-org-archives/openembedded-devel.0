Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCraC-0005m1-Ls
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 14:02:32 +0200
Received: by wibhm17 with SMTP id hm17so5422536wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 04:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=v+cyVh7nKBc4cWJfRj1ueO+/AUROioRqYMTTdnyC3+E=;
	b=iwT47npjrrDiWdk6O9j1rtRVnLsCmQ5v5n5gwKBCU/lCiUZ/M//7GpYxbg0Isn0iRb
	KXVz2regssjag5p7b0qDr8xYMGZyjtAOXFPtyoFniZUi6VJcZ6rGEjOPDmb2RxQ4LC/8
	aY6MLbnpDbllStaDxmwzKJxRB02AvevYzRyeaOs0m4vRMTqc65XRdNhI5m4RROCiVKRy
	0g7Z0YdGBD5CE4iYgYxrY8g8ZyAKH/vGyiQAROrsGR8Acnjx+zkZLRJ2CHRLmdd4H8IY
	GOAv18LTIc2qiqYlL0Bm+uoAjiUQx1NwamiMkZbbj79aOP94EYOULAvg7kwtMHOcPTfe
	lHVw==
Received: by 10.180.97.41 with SMTP id dx9mr6384757wib.9.1332935610822;
	Wed, 28 Mar 2012 04:53:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm1278973wiw.5.2012.03.28.04.53.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 04:53:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 13:53:16 +0200
Message-Id: <b30d8e20d1266b48766704a0dfc0b6c06a5b2b16.1332935553.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <79dc4a79b7c57d77cce43110ba011012a9b39f6d.1332935553.git.Martin.Jansa@gmail.com>
References: <79dc4a79b7c57d77cce43110ba011012a9b39f6d.1332935553.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332935553.git.Martin.Jansa@gmail.com>
References: <cover.1332935553.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 2/2] formfactor, keymaps, udev: use better form of PRINC
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
X-List-Received-Date: Wed, 28 Mar 2012 12:02:32 -0000

* this way we can stack multiple bbappends from different layers without overwritting PRINC value

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-bsp/formfactor/formfactor_0.0.bbappend |    2 +-
 recipes-bsp/keymaps/keymaps_1.0.bbappend       |    2 +-
 recipes-core/udev/udev_173.bbappend            |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
index 5152da5..e406684 100644
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -1,4 +1,4 @@
-PRINC = "1"
+PRINC := "${@int(PRINC) + 1}"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
diff --git a/recipes-bsp/keymaps/keymaps_1.0.bbappend b/recipes-bsp/keymaps/keymaps_1.0.bbappend
index 039b30c..ca8e236 100644
--- a/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -1,4 +1,4 @@
-PRINC = "2"
+PRINC := "${@int(PRINC) + 2}"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
diff --git a/recipes-core/udev/udev_173.bbappend b/recipes-core/udev/udev_173.bbappend
index 4770c5b..446ea84 100644
--- a/recipes-core/udev/udev_173.bbappend
+++ b/recipes-core/udev/udev_173.bbappend
@@ -1,5 +1,5 @@
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC = "1"
+PRINC := "${@int(PRINC) + 1}"
 
-- 
1.7.8.5



