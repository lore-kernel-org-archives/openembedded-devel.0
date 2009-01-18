Received: from [85.37.17.114] (helo=smtp-out114.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRi-000544-Ko
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:30 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out114.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:38 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:42 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:37 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:29 +0100
Message-Id: <ea6b4f404328c7722af631e1fcf6050a184eef42.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
	<a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
	<45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:37.0986 (UTC)
	FILETIME=[E9289420:01C97913]
Subject: [PATCH 09/14] linux-rp: unlock 2.6.24 and 2.6.26 for Zaurus clamshells
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:30 -0000

---
 packages/linux/linux-rp_2.6.24.bb |    3 +++
 packages/linux/linux-rp_2.6.26.bb |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/packages/linux/linux-rp_2.6.24.bb b/packages/linux/linux-rp_2.6.24.bb
index c498708..3cc4df8 100644
--- a/packages/linux/linux-rp_2.6.24.bb
+++ b/packages/linux/linux-rp_2.6.24.bb
@@ -6,6 +6,9 @@ DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_collie = "1"
 DEFAULT_PREFERENCE_qemux86 = "1"
 DEFAULT_PREFERENCE_tosa = "1"
+DEFAULT_PREFERENCE_akita = "1"
+DEFAULT_PREFERENCE_c7x0 = "1"
+DEFAULT_PREFERENCE_spitz = "1"
 
 # Handy URLs
 # git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;tag=ef7d1b244fa6c94fb76d5f787b8629df64ea4046
diff --git a/packages/linux/linux-rp_2.6.26.bb b/packages/linux/linux-rp_2.6.26.bb
index dd12628..b977cf3 100644
--- a/packages/linux/linux-rp_2.6.26.bb
+++ b/packages/linux/linux-rp_2.6.26.bb
@@ -7,6 +7,8 @@ DEFAULT_PREFERENCE_qemuarm = "-1"
 DEFAULT_PREFERENCE_qemux86 = "-1"
 DEFAULT_PREFERENCE_spitz = "1"
 DEFAULT_PREFERENCE_collie = "1"
+DEFAULT_PREFERENCE_akita = "1"
+DEFAULT_PREFERENCE_c7x0 = "1"
 
 # Handy URLs
 # git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;tag=ef7d1b244fa6c94fb76d5f787b8629df64ea4046
-- 
1.6.0.6



