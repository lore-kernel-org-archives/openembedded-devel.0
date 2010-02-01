Received: from mail-yx0-f178.google.com ([209.85.210.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbsLI-0002TN-Oe
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 10:13:15 +0100
Received: by yxe8 with SMTP id 8so3739123yxe.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2010 01:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Yxi6FrLzkHCmFhICPDiiYvFV5i9A98ZwDb9ylSxH0V4=;
	b=h1zzWtrR9hg9VB280F0pDqUMnjkV7JiQ6aNAkUeRAaczb7dx7DvR7UaKau8L7S8y6E
	us7jK221SatBGjaKvhLavTVGW7q6NICo0YZ2lVzLCBuKxdl7nayCd8PmegBcNFkej2jp
	AP953dk8gz/BNLa4EaflprNEMsQRJmzNxpS0Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hMiYvHu6lCO6uHf8YXMQxZdMJagniSnrGKteYXTTY8dVgS0ZO+aXH0sU+AoNgsVMRZ
	Xxmf79jlfpFm6IEloAdn8eO6ONd+9KXoWa0bst3k04HTaNe6hvhnMQ3qv/6xtjsr6ono
	CZGH3aJYvi8mnFxQSD3MtiCkXDmh5PUqEA2js=
Received: by 10.101.7.29 with SMTP id k29mr4850304ani.12.1265015446436;
	Mon, 01 Feb 2010 01:10:46 -0800 (PST)
Received: from localhost ([123.162.69.234])
	by mx.google.com with ESMTPS id 7sm1680714ywf.55.2010.02.01.01.10.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Feb 2010 01:10:45 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Feb 2010 17:10:18 +0800
Message-Id: <1265015418-8090-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.210.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] chumby-kernel: add a patch to remove hard setting CROSS_COMPILE from Makefile
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
X-List-Received-Date: Mon, 01 Feb 2010 09:13:16 -0000

* linux-2.6.16-chumby-1.2.tar.gz set CROSS_COMPILE as arm-linux- hardly.
* It causes the AR used to compile chumby-kernel is arm-linux-, but it should be set dynamically
* according CROSS_COMPILE passed by openembedded

Signed-off-by: Guo Hongruan <camelguo@gmail.com>
---
 ...akefile-remove-hard-setting-CROSS_COMPILE.patch |   18 ++++++++++++++++++
 recipes/linux/chumby-kernel_2.6.16-chumby-1.2.bb   |    1 +
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/chumby-kernel/Makefile-remove-hard-setting-CROSS_COMPILE.patch

diff --git a/recipes/linux/chumby-kernel/Makefile-remove-hard-setting-CROSS_COMPILE.patch b/recipes/linux/chumby-kernel/Makefile-remove-hard-setting-CROSS_COMPILE.patch
new file mode 100644
index 0000000..9a0be9a
--- /dev/null
+++ b/recipes/linux/chumby-kernel/Makefile-remove-hard-setting-CROSS_COMPILE.patch
@@ -0,0 +1,18 @@
+Makefile: remove hard setting CROSS_COMPILE
+
+* linux-2.6.16-chumby-1.2.tar.gz set CROSS_COMPILE as arm-linux- hardly
+* It causes the AR used to compiling linux kernel is arm-linux-ar, which doesn't exist in openembedded at all
+Index: linux-2.6.16/Makefile
+===================================================================
+--- linux-2.6.16.orig/Makefile	2010-02-01 16:19:36.000000000 +0800
++++ linux-2.6.16/Makefile	2010-02-01 16:20:02.000000000 +0800
+@@ -173,8 +173,7 @@
+ # Note: Some architectures assign CROSS_COMPILE in their arch/*/Makefile
+ 
+ ARCH		?= $(SUBARCH)
+-#CROSS_COMPILE	?=
+-CROSS_COMPILE = arm-linux-
++CROSS_COMPILE	?=
+ 
+ # Architecture as present in compile.h
+ UTS_MACHINE := $(ARCH)
diff --git a/recipes/linux/chumby-kernel_2.6.16-chumby-1.2.bb b/recipes/linux/chumby-kernel_2.6.16-chumby-1.2.bb
index b6cdf48..4967c1e 100644
--- a/recipes/linux/chumby-kernel_2.6.16-chumby-1.2.bb
+++ b/recipes/linux/chumby-kernel_2.6.16-chumby-1.2.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://files.chumby.com/source/ironforge/build396/linux-2.6.16-chumby
            http://files.chumby.com/source/ironforge/build396/align.pl \
            file://chumby-override-cmdline.patch;patch=1 \
            file://disable-fbchanging.patch;patch=1 \
+           file://Makefile-remove-hard-setting-CROSS_COMPILE.patch;patch=1 \
            file://defconfig \
            "
 
-- 
1.5.4.3



