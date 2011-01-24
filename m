Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgarman@zenlinux.com>) id 1PhUEf-0005LD-0U
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 22:46:06 +0100
Received: from localhost.localdomain (c-76-105-143-140.hsd1.or.comcast.net
	[76.105.143.140])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id DA2DF301FA;
	Mon, 24 Jan 2011 16:45:08 -0500 (EST)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 13:45:01 -0800
Message-Id: <1295905501-1948-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: DA2DF301FA.00A24
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-Spam-Status: No
Cc: Scott Garman <sgarman@zenlinux.com>
Subject: [PATCH] sudo: upgrade to 1.7.4p6
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
X-List-Received-Date: Mon, 24 Jan 2011 21:46:06 -0000

Addresses the following CVEs:
* CVE-2010-2956
* CVE-2010-1646
* CVE-2011-0010

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 recipes/sudo/{sudo_1.7.2p4.bb => sudo_1.7.4p6.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename recipes/sudo/{sudo_1.7.2p4.bb => sudo_1.7.4p6.bb} (72%)

diff --git a/recipes/sudo/sudo_1.7.2p4.bb b/recipes/sudo/sudo_1.7.4p6.bb
similarity index 72%
rename from recipes/sudo/sudo_1.7.2p4.bb
rename to recipes/sudo/sudo_1.7.4p6.bb
index c2818cf..8afee8d 100644
--- a/recipes/sudo/sudo_1.7.2p4.bb
+++ b/recipes/sudo/sudo_1.7.4p6.bb
@@ -1,4 +1,4 @@
-PR = "r4"
+PR = "r0"
 
 DEPENDS = "libpam"
 RDEPENDS_${PN} = "libpam libpam-meta"
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz;name=src \
   file://sudo.pamd \
 "
 
-SRC_URI[src.md5sum] = "3989e5a00538247d7dcef8b514076752"
-SRC_URI[src.sha256sum] = "57d9adbdffa881e32894231079da7d68ffe99f46942818b63baadf6c795b7bdd"
+SRC_URI[src.md5sum] = "1ae12d3d22e7ffedbf2db26f957676f0"
+SRC_URI[src.sha256sum] = "20091ef71018698c674c779f4b57178b2ecb4275fa34909b06219d2688ad14d5"
 
 EXTRA_OECONF += " --with-pam "
 
-- 
1.7.1



