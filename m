Received: from mail.multitech.com ([65.126.90.84])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jgilles@multitech.com>) id 1P0zJ6-0002Rb-OK
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 18:15:05 +0200
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from localhost.localdomain ([192.168.52.113]) by mail.multitech.com
	with Microsoft SMTPSVC(5.0.2195.7381); 
	Wed, 29 Sep 2010 11:13:22 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 11:13:46 -0500
Message-Id: <1285776826-27535-3-git-send-email-jgilles@multitech.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285776826-27535-1-git-send-email-jgilles@multitech.com>
References: <1285776826-27535-1-git-send-email-jgilles@multitech.com>
X-OriginalArrivalTime: 29 Sep 2010 16:13:22.0795 (UTC)
	FILETIME=[3D278BB0:01CB5FF1]
X-SA-Exim-Connect-IP: 65.126.90.84
X-SA-Exim-Mail-From: jgilles@multitech.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] ruby: update SRC_URI in ruby.inc
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
X-List-Received-Date: Wed, 29 Sep 2010 16:15:06 -0000

Signed-off-by: Jesse Gilles <jgilles@multitech.com>
---
 recipes/ruby/ruby.inc           |    4 ++--
 recipes/ruby/ruby_1.8.7-p302.bb |    4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/recipes/ruby/ruby.inc b/recipes/ruby/ruby.inc
index cd8d2df..cbae809 100644
--- a/recipes/ruby/ruby.inc
+++ b/recipes/ruby/ruby.inc
@@ -11,8 +11,8 @@ INC_PR = "r2"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "ftp://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://extmk_run.patch \
-           file://openssl.patch \
-           file://disable_wide_getaddrinfo_check.patch"
+           file://extmk.patch \
+"
 
 S = "${WORKDIR}/ruby-${PV}"
 
diff --git a/recipes/ruby/ruby_1.8.7-p302.bb b/recipes/ruby/ruby_1.8.7-p302.bb
index 8c9da40..13a6652 100644
--- a/recipes/ruby/ruby_1.8.7-p302.bb
+++ b/recipes/ruby/ruby_1.8.7-p302.bb
@@ -1,10 +1,6 @@
 require ruby.inc
 PR = "${INC_PR}.0"
 
-SRC_URI = "ftp://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-           file://extmk_run.patch \
-           file://extmk.patch \
-"
 SRC_URI[md5sum] = "f446550dfde0d8162a6ed8d5a38b3ac2"
 SRC_URI[sha256sum] = "5883df5204de70762602ce885b18c8bf6c856d33298c35df9151031b2ce044a1"
 
-- 
1.7.0.4



