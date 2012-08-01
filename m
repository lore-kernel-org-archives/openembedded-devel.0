Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhTZ-0005t7-Lv
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:33:09 +0200
Received: by wibhm11 with SMTP id hm11so3914952wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iDRxWtZ6w/2nbvIKSpnuMwSM6quVZxWjlhX6YNS9SL8=;
	b=yitRGUz7QY43RuLY/DxqewtNg0E34mzlrHmoB95HJufRGefhy6dvpEFhBQ+kiH8VGV
	2K6Gcyg7zdus+jtd/hK2inLdDfbPMRqQ2wgg0+x5lSK32MKP7YSdhFo+Z5Mw9dkSYrPE
	UfWWW3fvDT9IUGFgrE43h8WIT5zR/F4zcfamdnEV4D3pqttITZyqzic0TBcKrMYY7r15
	Rlk7Ng0ygxXNmDPtAgr3i2vm5+eslTpOf08KulYi0Vou2e1ZNEix2pNJJt39+58x3Brd
	Hl6HZ1hZ9BE21LDKXe/+MLUF9vjQWskElkjXxMtIWSiecfVmuszcufBQN7t0xp+3MjCY
	ZJEw==
Received: by 10.217.1.7 with SMTP id m7mr9588890wes.158.1343859690897;
	Wed, 01 Aug 2012 15:21:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm12061952wiy.4.2012.08.01.15.21.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:21:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 00:20:59 +0200
Message-Id: <6acd2f1fca2ae91134888375ee86da8303a8d941.1343859304.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/8] emacs: rename TUTORIAL.ko to TUTORIAL.KO so it's not picked by package.bbclass for striping
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
X-List-Received-Date: Wed, 01 Aug 2012 22:33:09 -0000

* with http://patchwork.openembedded.org/patch/33365/ it's not fatal but still anoying

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs.inc     |    6 ++++++
 meta-oe/recipes-support/emacs/emacs_23.4.bb |    2 ++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index f6cd461..150658e 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -65,4 +65,10 @@ do_compile_prepend() {
 	fi
 }
 
+do_install_append() {
+	# freaks package.bbclass and whole bitbake call returns error code
+	# ERROR: runstrip: ''arm-oe-linux-gnueabi-strip'  '/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/emacs-23.4-r0/package/usr/share/emacs/23.4/etc/tutorials/TUTORIAL.ko'' strip command failed
+	mv ${D}${datadir}/${BPN}/${PV}/etc/tutorials/TUTORIAL.ko ${D}${datadir}/${BPN}/${PV}/etc/tutorials/TUTORIAL.KO
+}
+
 EXTRA_OEMAKE += 'QEMU="${QEMU}"'
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
index 625a4b9..65cc3a3 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -1,5 +1,7 @@
 require emacs.inc
 
+PR = "r1"
+
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
            file://use-qemu.patch \
            file://nostdlib-unwind.patch \
-- 
1.7.8.6



