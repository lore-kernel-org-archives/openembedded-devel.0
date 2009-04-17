Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LumL7-0003lj-4h
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 13:34:39 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 57D02683CB;
	Fri, 17 Apr 2009 15:30:24 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Apr 2009 15:30:24 +0400
Message-Id: <1239967824-19483-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tunctl: new recipe, version 1.5
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
X-List-Received-Date: Fri, 17 Apr 2009 11:34:39 -0000

Tool for controlling the TUN/TAP driver in Linux.
---
 conf/checksums.ini           |    4 ++++
 recipes/tunctl/tunctl.inc    |   14 ++++++++++++++
 recipes/tunctl/tunctl_1.5.bb |    1 +
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tunctl/tunctl.inc
 create mode 100644 recipes/tunctl/tunctl_1.5.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 948a4bf..fc17727 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -22682,6 +22682,10 @@ sha256=d91b4addcbb241b04b6cf795447163ed890a436b10205d2cd9cc1885ea3d9433
 md5=ee74158c6c55ae16327595c70369ef83
 sha256=ef5e9bf276b65bb831f9c2554cd8784bd5b4ee65353808f82b7e2aef851587ec
 
+[http://downloads.sourceforge.net/tunctl/tunctl-1.5.tar.gz]
+md5=fdbedc263b3e85bb0e087cd567414607
+sha256=aa2a6c4cc6bfacb11e0d9f62334a6638a0d435475c61230116f00b6af8b14fff
+
 [http://alioth.debian.org/frs/download.php/2241/tuxmath_w_fonts-1.6.0.tar.gz]
 md5=3aa0e0e488719611f0bc4441b63a6f56
 sha256=f3aae7e2f67cf12f3da98325388c7b2f6718729aa69c5c804d1866d6a49f8592
diff --git a/recipes/tunctl/tunctl.inc b/recipes/tunctl/tunctl.inc
new file mode 100644
index 0000000..c9c7e95
--- /dev/null
+++ b/recipes/tunctl/tunctl.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "The tunctl tool for controlling the TUN/TAP driver in Linux."
+SECTION = "net"
+LICENSE = "GPL"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tunctl/tunctl-${PV}.tar.gz"
+
+do_compile() {
+	oe_runmake tunctl
+}
+
+do_install() {
+	install -d ${D}/${sbindir}
+	install -m 755 tunctl ${D}/${sbindir}
+}
diff --git a/recipes/tunctl/tunctl_1.5.bb b/recipes/tunctl/tunctl_1.5.bb
new file mode 100644
index 0000000..8a988a8
--- /dev/null
+++ b/recipes/tunctl/tunctl_1.5.bb
@@ -0,0 +1 @@
+require tunctl.inc
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



