Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW1iR-0003Ey-Uk
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 09:10:00 +0100
Received: by eaad13 with SMTP id d13so1824122eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 00:03:19 -0800 (PST)
Received: by 10.213.34.202 with SMTP id m10mr357954ebd.20.1322726598845;
	Thu, 01 Dec 2011 00:03:18 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id q28sm14921749eea.6.2011.12.01.00.03.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 00:03:17 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2011 09:03:07 +0100
Message-Id: <1322726587-5992-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-java] jamvm git: use proper PV
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
X-List-Received-Date: Thu, 01 Dec 2011 08:10:00 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-core/jamvm/jamvm_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
index 6d06552..e6b6132 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -4,7 +4,7 @@
 require jamvm.inc
 
 SRCREV = "4617da717ecb05654ea5bb9572338061106a414d"
-PV = "0.0+git${SRCPV}"
+PV = "1.5.5+1.6.0-devel+git${SRCPV}"
 
 SRC_URI = "git://git.berlios.de/jamvm;protocol=git \
            file://jamvm-jni_h-noinst.patch \
-- 
1.7.2.5



