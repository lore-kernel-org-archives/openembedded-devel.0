Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Nsc6g-0001Ol-Hx
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 14:19:23 +0100
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id BF4C868774;
	Fri, 19 Mar 2010 16:06:44 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 16:11:20 +0300
Message-Id: <1269004282-10732-6-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269004282-10732-5-git-send-email-khimov@altell.ru>
References: <1269004282-10732-1-git-send-email-khimov@altell.ru>
	<1269004282-10732-2-git-send-email-khimov@altell.ru>
	<1269004282-10732-3-git-send-email-khimov@altell.ru>
	<1269004282-10732-4-git-send-email-khimov@altell.ru>
	<1269004282-10732-5-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: BF4C868774.D698F
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] squid: enable ssl support
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
X-List-Received-Date: Fri, 19 Mar 2010 13:19:23 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/squid/squid.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/squid/squid.inc b/recipes/squid/squid.inc
index 9004b6f..2e8e0d3 100644
--- a/recipes/squid/squid.inc
+++ b/recipes/squid/squid.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more"
 LICENSE = "GPLv2"
-INC_PR = "r4"
-DEPENDS = "squid-native-${PV}"
+INC_PR = "r5"
+DEPENDS = "squid-native-${PV} openssl"
 
 SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar.bz2;name=squid-${PV} \
            file://fix_epoll_check.patch;patch=1 \
@@ -11,7 +11,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v2/${SQUID_MAJOR}/squid-${PV}.tar
 
 inherit autotools update-rc.d
 
-EXTRA_OECONF = "--disable-epoll --disable-nls"
+EXTRA_OECONF = "--disable-epoll --disable-nls --enable-ssl"
 
 logdir = ${localstatedir}/log/squid
 EXTRA_OEMAKE = "\
-- 
1.5.6.5



