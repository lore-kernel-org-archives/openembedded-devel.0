Received: from smtp.tibbo.com ([81.171.42.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dvorkin@tibbo.com>) id 1PI3gN-0007D2-Oj
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 19:21:56 +0100
Received: (qmail 16026 invoked by uid 508); 15 Nov 2010 21:22:32 +0300
Received: from dvhome.kansstel.ru (HELO localhost.localdomain) (79.171.10.83)
	by smtp.tibbo.com with SMTP; 15 Nov 2010 21:22:32 +0300
From: Dvorkin Dmitry <dvorkin@tibbo.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Nov 2010 21:20:31 +0300
Message-Id: <1289845231-29982-1-git-send-email-dvorkin@tibbo.com>
X-Mailer: git-send-email 1.6.4.4
X-SA-Exim-Connect-IP: 81.171.42.199
X-SA-Exim-Mail-From: dvorkin@tibbo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pstree: added reciept
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
X-List-Received-Date: Mon, 15 Nov 2010 18:21:58 -0000


Signed-off-by: Dvorkin Dmitry <dvorkin@tibbo.com>
---
 recipes/pstree/pstree_2.33.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/pstree/pstree_2.33.bb

diff --git a/recipes/pstree/pstree_2.33.bb b/recipes/pstree/pstree_2.33.bb
new file mode 100644
index 0000000..f875f46
--- /dev/null
+++ b/recipes/pstree/pstree_2.33.bb
@@ -0,0 +1,23 @@
+SECTION = "base"
+DESCRIPTION = "pstree cli tool to nicely show processes tree"
+LICENSE = "GPL"
+DEPENDS = "libnl"
+PR = "r0"
+
+S = "${WORKDIR}"
+
+do_compile() {
+  ${CC} -O ${CFLAGS} ${LDFLAGS} -o pstree pstree.c
+}
+
+do_install() {
+  install -d ${D}/bin/
+  install -m 0755 pstree ${D}/bin/
+}
+
+SRC_URI = "\
+  ftp://ftp.thp.uni-duisburg.de/pub/source/${PN}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b0a85caacd85f78bd83700afa86ec2e9"
+SRC_URI[sha256sum] = "0f06116208cf15932cf99785d001c053e523e0aed474b936858f1b7f61a6c990"
-- 
1.6.4.4



