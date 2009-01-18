Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRg-00053q-H8
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:28 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:41 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 18 Jan 2009 03:24:40 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:35 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:21 +0100
Message-Id: <b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:35.0189 (UTC)
	FILETIME=[E77DCA50:01C97913]
Subject: [PATCH 01/14] linux-kexecboot.inc: revert 71d21c5e379ab3f5d754a967a52240963552a71c
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:29 -0000

- setting "console=tty0" for c7x0 doesn't work...
---
 packages/kexecboot/linux-kexecboot.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/packages/kexecboot/linux-kexecboot.inc b/packages/kexecboot/linux-kexecboot.inc
index 7a899f1..924a83a 100644
--- a/packages/kexecboot/linux-kexecboot.inc
+++ b/packages/kexecboot/linux-kexecboot.inc
@@ -10,7 +10,6 @@ CMDLINE_poodle = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_akita = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_collie = "console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1"
 CMDLINE_spitz = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
-CMDLINE_c7x0 = "console=tty0"
 
 PACKAGES = ""
 PROVIDES = ""
-- 
1.6.0.6



