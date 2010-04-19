Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O3s6r-0005Uu-NK
	for Openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 16:38:03 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 771FEEB91A;
	Mon, 19 Apr 2010 10:34:30 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 19 Apr 2010 10:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=UTBReuwvhxkOBv0m+8R304p4Vbg=;
	b=KarVtwcb7iu1pSwhtNm5m/9U8lptxOZr5hPDnup+2KqfQlKOpz1V4w/aFFJWuFK6FglaNE5nar0t4tv7A/9y7eyU5RcrSB+rdHvT1OGgoB6AU214QEnRcL8PACOpGm8JHGdT1QKRefub2gXe/X7FLDgJS1REj7RScNWH9Q/JRmk=
X-Sasl-enc: U8FG5dBwNbg97fsHkxfE5x9wgKsz/SS6LHL80dYvMKzP 1271687670
Received: from localhost.localdomain (unknown [212.144.247.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id E2D674C5067;
	Mon, 19 Apr 2010 10:34:29 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Mon, 19 Apr 2010 16:34:25 +0200
Message-Id: <1271687665-23003-2-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1271687665-23003-1-git-send-email-vjensen@gmx.de>
References: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
	<1271687665-23003-1-git-send-email-vjensen@gmx.de>
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH] angstrom-2008: make PREFERRED_VERSION_linux-libc-headers a weak assignment
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
X-List-Received-Date: Mon, 19 Apr 2010 14:38:03 -0000


Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 conf/distro/angstrom-2008.1.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 2b03e71..00f1a01 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -81,7 +81,7 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
 #KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
 
 #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
-PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
+PREFERRED_VERSION_linux-libc-headers 	?= "2.6.31"
 
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc 		?= "2.9"
-- 
1.5.6.5



