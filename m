Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMcD-0004UC-5T
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 14:57:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 03EA4314A20F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:56:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id YCRYNwaY5mTp
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:56:40 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 5CC4C314A20C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:56:39 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 12:56:39 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 12:56:39 +0000
Message-Id: <1288011399-23168-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287320366-17726-1-git-send-email-obi@opendreambox.org>
References: <1287320366-17726-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] libdvdread: add recipe for version 4.1.3-10 from debian
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
X-List-Received-Date: Mon, 25 Oct 2010 12:57:29 -0000

* v2: inherit lib_package before binconfig
* v3: License set to GPLv2+
* v3: Inlined libdvdread_git.inc

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/libdvdread/libdvdread_4.1.3-10.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libdvdread/libdvdread_4.1.3-10.bb

diff --git a/recipes/libdvdread/libdvdread_4.1.3-10.bb b/recipes/libdvdread/libdvdread_4.1.3-10.bb
new file mode 100644
index 0000000..0838fd5
--- /dev/null
+++ b/recipes/libdvdread/libdvdread_4.1.3-10.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "DVD access multimeda library"
+SECTION = "libs/multimedia"
+LICENSE = "GPLv2+"
+
+SRC_URI = "git://git.debian-maintainers.org/git/daniel/${PN}.git;protocol=git;branch=debian"
+
+SRCREV = "e465b500c12be5b4c0b6918a9b98038611f66c57"
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



