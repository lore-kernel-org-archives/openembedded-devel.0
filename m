Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1O30T5-0000P1-U3
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Apr 2010 07:21:42 +0200
Received: from localhost.localdomain (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 65E302FEA5;
	Sat, 17 Apr 2010 01:17:45 -0400 (EDT)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Apr 2010 22:17:36 -0700
Message-Id: <1271481456-9183-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.6.3.3
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 65E302FEA5.63302
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Scott Garman <sgarman@zenlinux.com>
Subject: [PATCH] nano: Add version 2.2.4
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
X-List-Received-Date: Sat, 17 Apr 2010 05:21:43 -0000

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 recipes/nano/nano_2.2.4.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/nano/nano_2.2.4.bb

diff --git a/recipes/nano/nano_2.2.4.bb b/recipes/nano/nano_2.2.4.bb
new file mode 100644
index 0000000..b4973f8
--- /dev/null
+++ b/recipes/nano/nano_2.2.4.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "GNU nano (Nano's ANOther editor, or \
+Not ANOther editor) is an enhanced clone of the \
+Pico text editor."
+HOMEPAGE = "http://www.nano-editor.org/"
+LICENSE = "GPLv2"
+SECTION = "console/utils"
+DEPENDS = "ncurses"
+
+SRC_URI = "http://www.nano-editor.org/dist/v2.2/nano-${PV}.tar.gz"
+SRC_URI[md5sum] = "6304308afb1f7ef4a5e93eb99206632a"
+SRC_URI[sha256sum] = "971b8547be157de5a814cb26c804dc2515b686d7188f4dc016269312965d4da5"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-all"
-- 
1.6.3.3



