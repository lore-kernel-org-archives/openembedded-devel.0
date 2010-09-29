Received: from mail.multitech.com ([65.126.90.84])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jgilles@multitech.com>) id 1P0zJ5-0002Rb-1l
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 18:14:59 +0200
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from localhost.localdomain ([192.168.52.113]) by mail.multitech.com
	with Microsoft SMTPSVC(5.0.2195.7381); 
	Wed, 29 Sep 2010 11:13:22 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 11:13:45 -0500
Message-Id: <1285776826-27535-2-git-send-email-jgilles@multitech.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285776826-27535-1-git-send-email-jgilles@multitech.com>
References: <1285776826-27535-1-git-send-email-jgilles@multitech.com>
X-OriginalArrivalTime: 29 Sep 2010 16:13:22.0577 (UTC)
	FILETIME=[3D064810:01CB5FF1]
X-SA-Exim-Connect-IP: 65.126.90.84
X-SA-Exim-Mail-From: jgilles@multitech.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] ruby: remove 1.8.5
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
X-List-Received-Date: Wed, 29 Sep 2010 16:15:00 -0000

* old version that doesn't build

Signed-off-by: Jesse Gilles <jgilles@multitech.com>
---
 recipes/ruby/ruby_1.8.5.bb |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/ruby/ruby_1.8.5.bb

diff --git a/recipes/ruby/ruby_1.8.5.bb b/recipes/ruby/ruby_1.8.5.bb
deleted file mode 100644
index 1561fdd..0000000
--- a/recipes/ruby/ruby_1.8.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ruby.inc
-
-PR = "${INC_PR}.0"
-
-FILES_${PN}-dbg += "${libdir}/ruby/1.8/*/.debug \
-                    ${libdir}/ruby/1.8/*/*/.debug"
-
-
-SRC_URI[md5sum] = "3fbb02294a8ca33d4684055adba5ed6f"
-SRC_URI[sha256sum] = "19590e972b80333e26a6514c34d976c2037138361481a16f27b75e5d33f33a58"
-- 
1.7.0.4



