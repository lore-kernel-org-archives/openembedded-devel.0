Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu0fs-0007cH-Gj
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 10:40:55 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 58E4B683CA;
	Wed, 15 Apr 2009 12:36:56 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 12:36:55 +0400
Message-Id: <1239784615-19928-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libpcap: weaken bluez-libs dependency
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
X-List-Received-Date: Wed, 15 Apr 2009 08:40:55 -0000

libpcap can be used in distros where no bluetooth support will ever
exist. So this dependency should be weakened to only exist in distros
that explicitly need bluetooth.
---
 recipes/libpcap/libpcap.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/libpcap/libpcap.inc b/recipes/libpcap/libpcap.inc
index 4468a4b..81bf826 100644
--- a/recipes/libpcap/libpcap.inc
+++ b/recipes/libpcap/libpcap.inc
@@ -2,7 +2,11 @@ DESCRIPTION = "Network Packet Capture Library"
 HOMEPAGE = "http://www.tcpdump.org/"
 SECTION = "libs/network"
 LICENSE = "BSD"
-DEPENDS = "bluez-libs flex-native bison-native"
+DEPENDS = " \
+	${@base_contains("COMBINED_FEATURES", "bluetooth", "bluez-libs", "", d)} \
+	flex-native \
+	bison-native \
+	"
 
 PR = "r1"
 
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



