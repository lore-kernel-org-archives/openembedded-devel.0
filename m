Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P7SqP-0004fH-AC
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 15:00:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 8068F3149F81
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 14:59:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 5V1BheeYiCkH; Sun, 17 Oct 2010 14:59:32 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id BA3203149F79;
	Sun, 17 Oct 2010 14:59:31 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 17 Oct 2010 12:59:31 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 12:59:26 +0000
Message-Id: <1287320366-17726-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286535392-1111-1-git-send-email-obi@opendreambox.org>
References: <1286535392-1111-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] libdvdread: add recipe for version 4.1.3-10 from debian
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
X-List-Received-Date: Sun, 17 Oct 2010 13:00:10 -0000

* v2: inherit lib_package before binconfig

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
index 0000000..568e3e7
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
+inherit autotools lib_package binconfig pkgconfig
+
+do_unpackpost() {
+        QUILT_PATCHES=debian/patches quilt push -a
+}
+
+addtask unpackpost after do_unpack before do_patch
-- 
1.7.1



