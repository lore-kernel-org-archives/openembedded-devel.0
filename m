Received: from [85.33.3.5] (helo=smtp-OUT05A.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRg-00053p-Ep
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:28 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:21:02 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:40 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:35 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:22 +0100
Message-Id: <98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:35.0752 (UTC)
	FILETIME=[E7D3B280:01C97913]
Subject: [PATCH 02/14] linux-kexecboot_2.6.26: revert 71dade0cdaef0220d31a309d8b6d28b99eb25b29
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

- set default preference = 1 for c7x0
---
 packages/kexecboot/linux-kexecboot_2.6.26.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/packages/kexecboot/linux-kexecboot_2.6.26.bb b/packages/kexecboot/linux-kexecboot_2.6.26.bb
index 4ddc7c8..a0d00ab 100644
--- a/packages/kexecboot/linux-kexecboot_2.6.26.bb
+++ b/packages/kexecboot/linux-kexecboot_2.6.26.bb
@@ -6,7 +6,7 @@ DEFAULT_PREFERENCE_qemuarm = "-1"
 DEFAULT_PREFERENCE_qemux86 = "-1"
 DEFAULT_PREFERENCE_spitz = "1"
 DEFAULT_PREFERENCE_collie = "1"
-DEFAULT_PREFERENCE_c7x0 = "-1"
+DEFAULT_PREFERENCE_c7x0 = "1"
 DEFAULT_PREFERENCE_akita = "1"
 
 # Handy URLs
-- 
1.6.0.6



