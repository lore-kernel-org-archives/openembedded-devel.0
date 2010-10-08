Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P4AdQ-0003Vh-K3
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 12:57:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C36983149131
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Oct 2010 12:56:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id N9+6fHYEkSlm; Fri,  8 Oct 2010 12:56:42 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id E1626314912C;
	Fri,  8 Oct 2010 12:56:41 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 08 Oct 2010 10:56:41 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Oct 2010 10:56:31 +0000
Message-Id: <1286535392-1111-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] libdvdread: add recipe for version 4.1.3-10 from debian
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
X-List-Received-Date: Fri, 08 Oct 2010 10:57:09 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libdvdread/libdvdread_4.1.3-10.bb |    3 +++
 recipes/libdvdread/libdvdread_git.inc     |   15 +++++++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libdvdread/libdvdread_4.1.3-10.bb
 create mode 100644 recipes/libdvdread/libdvdread_git.inc

diff --git a/recipes/libdvdread/libdvdread_4.1.3-10.bb b/recipes/libdvdread/libdvdread_4.1.3-10.bb
new file mode 100644
index 0000000..6f650be
--- /dev/null
+++ b/recipes/libdvdread/libdvdread_4.1.3-10.bb
@@ -0,0 +1,3 @@
+require libdvdread_git.inc
+
+SRCREV = "e465b500c12be5b4c0b6918a9b98038611f66c57"
diff --git a/recipes/libdvdread/libdvdread_git.inc b/recipes/libdvdread/libdvdread_git.inc
new file mode 100644
index 0000000..7ae5604
--- /dev/null
+++ b/recipes/libdvdread/libdvdread_git.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "DVD access multimeda library"
+SECTION = "libs/multimedia"
+LICENSE = "GPL"
+
+SRC_URI = "git://git.debian-maintainers.org/git/daniel/${PN}.git;protocol=git;branch=debian"
+
+S = "${WORKDIR}/git"
+
+inherit autotools binconfig lib_package pkgconfig
+
+do_unpackpost() {
+        QUILT_PATCHES=debian/patches quilt push -a
+}
+
+addtask unpackpost after do_unpack before do_patch
-- 
1.7.1



