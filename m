Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OoKd4-0000Rj-II
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 20:23:19 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 788F823EFA; Wed, 25 Aug 2010 22:22:51 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Aug 2010 22:22:40 +0400
Message-Id: <1282760560-19990-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <AANLkTinQqY=C+7ES=qZ8vRuQi_UOWOKX4PHQ7XFtqH2k@mail.gmail.com>
References: <AANLkTinQqY=C+7ES=qZ8vRuQi_UOWOKX4PHQ7XFtqH2k@mail.gmail.com>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] squid: remove version 2.6.STABLE14
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
X-List-Received-Date: Wed, 25 Aug 2010 18:23:19 -0000

Very old, buggy, unsupported by upstream.
---
 recipes/squid/squid.inc             |    2 +-
 recipes/squid/squid_2.6.STABLE14.bb |   11 -----------
 recipes/squid/squid_2.7.STABLE8.bb  |    3 ---
 recipes/squid/squid_3.1.7.bb        |    3 ---
 4 files changed, 1 insertions(+), 18 deletions(-)
 delete mode 100644 recipes/squid/squid_2.6.STABLE14.bb

diff --git a/recipes/squid/squid.inc b/recipes/squid/squid.inc
index 477335b..daeeb55 100644
--- a/recipes/squid/squid.inc
+++ b/recipes/squid/squid.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more"
-LICENSE = "GPLv2"
+LICENSE = "GPL"
 INC_PR = "r10"
 DEPENDS = "openssl openssl-native openldap"
 
diff --git a/recipes/squid/squid_2.6.STABLE14.bb b/recipes/squid/squid_2.6.STABLE14.bb
deleted file mode 100644
index 9707ccc..0000000
--- a/recipes/squid/squid_2.6.STABLE14.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-PR = "${INC_PR}.0"
-
-include squid.inc
-
-EXTRA_OECONF += "--enable-storeio=null,ufs"
-
-SRC_URI += "file://fix_epoll_check.patch \
-	   file://squidv2-build-cf_gen.patch"
-
-SRC_URI[squid-2.6.STABLE14.md5sum] = "eadb138d48320df8b99349121159c6bf"
-SRC_URI[squid-2.6.STABLE14.sha256sum] = "dcb0c10965430862721b675e2f9f6a30819880e03124b5e9403bfce2c7f3b69a"
diff --git a/recipes/squid/squid_2.7.STABLE8.bb b/recipes/squid/squid_2.7.STABLE8.bb
index 039f986..26e0d55 100644
--- a/recipes/squid/squid_2.7.STABLE8.bb
+++ b/recipes/squid/squid_2.7.STABLE8.bb
@@ -2,9 +2,6 @@ PR = "${INC_PR}.0"
 
 include squid.inc
 
-# GPLv2+ since 2.6.STABLE18
-LICENSE = "GPL"
-
 EXTRA_OECONF += "--enable-epoll --enable-storeio=null,ufs"
 
 SRC_URI += "file://fix_epoll_check.patch \
diff --git a/recipes/squid/squid_3.1.7.bb b/recipes/squid/squid_3.1.7.bb
index de0ddcd..3c831df 100644
--- a/recipes/squid/squid_3.1.7.bb
+++ b/recipes/squid/squid_3.1.7.bb
@@ -2,9 +2,6 @@ PR = "${INC_PR}.0"
 
 include squid.inc
 
-# GPLv2+ since 2.6.STABLE18
-LICENSE = "GPL"
-
 EXTRA_OECONF += "--enable-epoll --enable-icap-client --with-dl --enable-linux-netfilter"
 
 EXTRA_OEMAKE += "DEFAULT_STYLESHEET=${sysconfdir}/squid/errorpage.css DEFAULT_CONFIG_DIR=${sysconfdir}/squid"
-- 
1.6.4.2



