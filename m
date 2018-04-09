Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 841FF7451A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 00:25:31 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id c188so7527360qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 17:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N/NUg/itAUAdAdEyi63BhUsAuV/QM1vp2ukIZ5O3cpQ=;
	b=DCTEcUO2MV2MAWdp3DJCEav7eTCJ033fXXeJZJRsG3pEMwkU7LR1KAKZxE6sMfZNQ2
	vMhGWINioFANpFdEoEz98f2lVWDF7e+i3/+JUI06Y5Dr36Ln/TNUT/Cb8d5+MePbEE/X
	oSNmUiAK0e1Ccc2tVnoeo925TBtYdohJ7jfk1x4CmwKVPvWk+Y8CnLFBmJwFZQO73jHv
	nSrnQ9MvNe7TZ4+6ivUOZMqlqXnhkQq6L7SkATfS8asJ2KU/PO3fruJ4WX4g+SVKlOpo
	N796Lx3lalSufczhv2ZX0m87phP7vD7eYZjbieoqHld//9aeUMhOfWT22UE8FM7gFXXW
	v9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N/NUg/itAUAdAdEyi63BhUsAuV/QM1vp2ukIZ5O3cpQ=;
	b=ECtvWgPxJ2U8YasDhssfclmPAer3uBEsDjr/MmhgzLU8F497fs31NELBcBIzT2ucx/
	WN0BMFlI5X5uBpUf2xRrhIXHhhN7EiYsEEOUC+RhcFR7P9uBV+vtoscaV8AFuP76+ePf
	vN5ueY2x2hQ4GXhILb1s7zdwSwf3iVaT+/ShYddi1TevuCa704M6JgdPo/t1KFlVMDpI
	ea53FCbETyWrv4kvqbCmKKHmR11HvhLyGLKL5f3uX+UD/nch7DJ1mmcV+9z+Pz1T0Bd+
	t2t8vrOJ0EK7AH4iOa+NdoZfQ+pZ5gXZpm5RIdyR6i4bbRPgvt+QCc5mC27yUymuEFcH
	dM3A==
X-Gm-Message-State: ALQs6tCYifyoYguskFUN44n7ZpuX7SUL4mtjrnJrTz2KcRSjFjOvnhZ+
	xfTr3T+uQXJryn6QS0y0/woJIA==
X-Google-Smtp-Source: AIpwx4/Oxjt7RGqggm1oX9TRmlXFR+fFBznPO4onwi8SJrgYlYj0JfkYasb6HKrfMZo7nu8zhN7+uQ==
X-Received: by 10.55.171.6 with SMTP id u6mr44842952qke.331.1523233532137;
	Sun, 08 Apr 2018 17:25:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	b125sm12601480qkd.62.2018.04.08.17.25.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Apr 2018 17:25:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  8 Apr 2018 17:25:29 -0700
Message-Id: <1523233529-31839-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH]] update layer maintainers
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
X-List-Received-Date: Mon, 09 Apr 2018 00:25:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/README | 35 +----------------------------------
 meta-gnome/README       |  3 +--
 meta-initramfs/README   |  3 +--
 meta-multimedia/README  |  6 ++----
 meta-oe/README          |  3 +--
 meta-python/README      |  3 +--
 meta-xfce/README        |  2 +-
 7 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/meta-filesystems/README b/meta-filesystems/README
index d2716f8..97d0e94 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -27,40 +27,7 @@ Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
 with '[meta-filesystems]' in the subject.
 
-Maintainers List:
-  physfs      Andreas Müller <schnitzeltony@googlemail.com>
-
-  fuse        Koen Kooi <koen@dominion.thruhere.net>
-              Philip Balister <philip@balister.org>
-              hongxu jia <hongxu.jia@windriver.com>
-
-  ifuse       Sander van Grieken <sander@outrightsolutions.nl>
-              Koen Kooi <koen@dominion.thruhere.net>
-
-  sshfs-fuse  Philip Balister <philip@balister.org>
-              Koen Kooi <koen@dominion.thruhere.net>
-
-  owfs        Otavio Salvador <otavio@ossystems.com.br>
-              Koen Kooi <koen@dominion.thruhere.net>
-              hongxu jia <hongxu.jia@windriver.com>
-
-  ntfs-3g-ntfsprogs  Otavio Salvador <otavio@ossystems.com.br>
-                     hongxu jia <hongxu.jia@windriver.com>
-
-  cramfs      Koen Kooi <koen@dominion.thruhere.net>
-
-  smbnetfs    Sander van Grieken <sander@outrightsolutions.nl>
-              Koen Kooi <koen@dominion.thruhere.net>
-
-  fuse-exfat  hongxu jia <hongxu.jia@windriver.com>
-
-  exfat-utils hongxu jia <hongxu.jia@windriver.com>
-
-  f2fs-tools  Martin Jansa <Martin.Jansa@gmail.com>
-              Koen Kooi <koen@dominion.thruhere.net>
-
-  xfsprogs    Koen Kooi <koen@dominion.thruhere.net>
-              hongxu jia <hongxu.jia@windriver.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
diff --git a/meta-gnome/README b/meta-gnome/README
index 482f457..2a682e7 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -35,5 +35,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnom
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
 
-Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
-
+Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index e24acf9..7185383 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -25,8 +25,7 @@ with '[meta-initramfs]' in the subject.
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
 
-Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
-                   Paul Eggleton <paul.eggleton@linux.intel.com>
+Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index cbdc1b5..20f4fb8 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -5,7 +5,7 @@ branch: master
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-layers: meta-oe, meta-ruby
+layers: meta-oe
 branch: master
 revision: HEAD
 
@@ -16,6 +16,4 @@ When sending single patches, please use something like:
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                        Martin Jansa <martin.jansa@gmail.com>
-
+Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
diff --git a/meta-oe/README b/meta-oe/README
index 6ad87c5..7cde0a2 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -11,5 +11,4 @@ When sending single patches, please use something like:
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+Main layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-python/README b/meta-python/README
index 905d5ee..0566e49 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -47,8 +47,7 @@ When sending single patches, please use something like:
 Maintenance
 -------------------------
 
-Maintainers:
+Layer Maintainers:
         Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
         Derek Straka <derek@asterius.io>
 
diff --git a/meta-xfce/README b/meta-xfce/README
index 33ef509..7431e8b 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -19,4 +19,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
 
-Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
-- 
2.7.4


