Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q78QH-0001DO-SF
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:44:06 +0200
Received: by yia13 with SMTP id 13so188442yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ACKBhOpybqjtkiwpbsD68uSp8yLXzC9nUlPibabU5oA=;
	b=K76O48+GaeC+TEXqU6kS99VkLmyYcJa/2Fj0T+oTtY/yP59z1p01F8FWD8QrXSTwAq
	I/s7FxnFPPBBmRHgwaUq2x08jv/ji4J4Gn2m7HECeB7t0l/jH5pmrgtl35IU+bPfGzNQ
	EwZcZHB86TxJugNVj0iMnESwvYe1yWz+puOLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xXqwvDHMs9/lyvFTwH2cvHz5bcQ6gDK4b5nlCY5bcHUQKE7B9dy8xuXs1Kf1zbqAka
	XHVyMMngJ/A22p5Qdq3dpQBb49eIRadpl9OjuRf9I6dZ1yvZSkfhZmeFUMY0Q3v0xoFf
	BrmuT1ssc53wn+6brZJa05+bXfHLO7j79NDbU=
Received: by 10.150.166.17 with SMTP id o17mr701831ybe.40.1302018119656;
	Tue, 05 Apr 2011 08:41:59 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r18sm2737519yba.11.2011.04.05.08.41.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 08:41:58 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 10:41:48 -0500
Message-Id: <1302018111-20799-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/5] u-boot: Add support for am45x-evm machine
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
X-List-Received-Date: Tue, 05 Apr 2011 15:44:06 -0000

* Added support for the am45x-evm machine type

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/u-boot/u-boot_git.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 9c5fa13..2cf5b12 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -209,6 +209,13 @@ SRCREV_omap4430-panda  = "261733408a27d14590cf3ec6b596461808050e32"
 PV_omap4430-panda      = "2010.12+${PR}+git${SRCREV}"
 PE_omap4430-panda      = "1"
 
+SRC_URI_am45x-evm = "git://www.sakoman.com/git/u-boot.git;branch=omap4-exp;protocol=git \
+                          file://fix-break-caused-by-new-binutils.patch \
+                         "
+SRCREV_am45x-evm  = "261733408a27d14590cf3ec6b596461808050e32"
+PV_am45x-evm      = "2010.12+${PR}+git${SRCREV}"
+PE_am45x-evm      = "1"
+
 # DaVinci dm355-evm/dm365-evm/dm6446-evm/dm6467-evm/dm6467t-evm - PSP 3.1.0/3.2.0 (build 35)
 
 SRC_URI_dm355-evm    = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=u-boot-davinci-2009.06"
-- 
1.7.0.4



