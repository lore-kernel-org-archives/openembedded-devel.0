Received: from mail.multitech.com ([65.126.90.84])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jgilles@multitech.com>) id 1P0zJ2-0002Rb-8N
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 18:14:58 +0200
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from localhost.localdomain ([192.168.52.113]) by mail.multitech.com
	with Microsoft SMTPSVC(5.0.2195.7381); 
	Wed, 29 Sep 2010 11:13:22 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 11:13:44 -0500
Message-Id: <1285776826-27535-1-git-send-email-jgilles@multitech.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 29 Sep 2010 16:13:22.0358 (UTC)
	FILETIME=[3CE4DD60:01CB5FF1]
X-SA-Exim-Connect-IP: 65.126.90.84
X-SA-Exim-Mail-From: jgilles@multitech.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] ruby: fix socket extension compile
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
X-List-Received-Date: Wed, 29 Sep 2010 16:14:58 -0000

* fixes building socket extension with ipv6 enabled

Signed-off-by: Jesse Gilles <jgilles@multitech.com>
---
 recipes/ruby/ruby.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/ruby/ruby.inc b/recipes/ruby/ruby.inc
index 6ef6535..cd8d2df 100644
--- a/recipes/ruby/ruby.inc
+++ b/recipes/ruby/ruby.inc
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 DEPENDS = "ruby-native zlib openssl"
 DEPENDS_virtclass-native = ""
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "ftp://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
@@ -18,6 +18,9 @@ S = "${WORKDIR}/ruby-${PV}"
 
 inherit autotools
 
+# fix building of socket extension
+EXTRA_OECONF = "--enable-wide-getaddrinfo"
+
 # This snippet lets compiled extensions which rely on external libraries,
 # such as zlib, compile properly.  If we don't do this, then when extmk.rb
 # runs, it uses the native libraries instead of the target libraries, and so
-- 
1.7.0.4



