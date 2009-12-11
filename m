Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1NIzAA-0007Gg-BU
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 07:39:41 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 9E682C551D;
	Fri, 11 Dec 2009 01:28:50 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Fri, 11 Dec 2009 01:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id; s=smtpout;
	bh=TGbDAhzHi5Gs1c2RuNLXaX+ffHU=;
	b=Y9KimZa8wVLYvytPDQ0X+srtv0acexuSAgz1WxHf4Qwxh6f5WO+2tzKr5v2dfz22s4afQ2ByOIunuddyDTnuK0N8y4UG4VRu0BR/c0PBYEF0BStiTNpJZUWHo0ViCig6SSKTPmPloPAkeX0WkhgB/b/Hn7T7bKhqJ3XFD2k8ypI=
X-Sasl-enc: j6/Hq3/U3m70m0rENmxvItdOkb1S1LBvmTlYmLZVwffc 1260512930
Received: from localhost.localdomain (p5483A49D.dip0.t-ipconnect.de
	[84.131.164.157])
	by mail.messagingengine.com (Postfix) with ESMTPA id BAD1D4AA1DB;
	Fri, 11 Dec 2009 01:28:49 -0500 (EST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Dec 2009 07:28:36 +0100
Message-Id: <1260512916-12908-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.6.4.4
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux_2.6.29.bb: update to kernel 2.6.29.6
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
X-List-Received-Date: Fri, 11 Dec 2009 06:39:41 -0000

Version 2.6.29 fails on arch powerpc because of a syntax error.  See
http://lkml.indiana.edu/hypermail/linux/kernel/0906.1/00867.html

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 conf/checksums.ini            |    4 ++++
 recipes/linux/linux_2.6.29.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a47d223..f9bc40d 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -17358,6 +17358,10 @@ sha256=ae0d97c55efe7fce01273c97f8152af0deff5541e3bbf5b9ad98689112b54380
 md5=d351e44709c9810b85e29b877f50968a
 sha256=ae0d97c55efe7fce01273c97f8152af0deff5541e3bbf5b9ad98689112b54380
 
+[http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.29.6.tar.bz2]
+md5=7cd24826fd3c7b0f83d9f662731a7865
+sha256=536e69548e27da1f4693867fbbd6eedf6bdaa2e7656c743ce1d0b36b1becc5f9
+
 [http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.29.tar.bz2]
 md5=64921b5ff5cdadbccfcd3820f03be7d8
 sha256=58a5ea16d499fe06f90fcbf1d687d1235d2cb9bc28bf979867bd3faadf38fc3f
diff --git a/recipes/linux/linux_2.6.29.bb b/recipes/linux/linux_2.6.29.bb
index f78193d..8522be1 100644
--- a/recipes/linux/linux_2.6.29.bb
+++ b/recipes/linux/linux_2.6.29.bb
@@ -18,7 +18,7 @@ DEFAULT_PREFERENCE_at2440evb = "1"
 DEFAULT_PREFERENCE_tqm8540 = "1"
 DEFAULT_PREFERENCE_stamp9g20evb = "1"
 
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.29.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.29.6.tar.bz2 \
            file://defconfig"
 
 SRC_URI_append_boc01 = "\
-- 
1.6.4.4



