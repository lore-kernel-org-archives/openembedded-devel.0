Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P6jDR-0002xU-P0
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 14:16:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 38D183149E83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 14:16:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zYA0ksYbLbpM; Fri, 15 Oct 2010 14:16:14 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id B04013149EA3;
	Fri, 15 Oct 2010 14:16:13 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 15 Oct 2010 12:16:13 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 12:16:02 +0000
Message-Id: <1287144965-6419-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287144965-6419-1-git-send-email-obi@opendreambox.org>
References: <1287144965-6419-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] pango: update to 1.28.1
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
X-List-Received-Date: Fri, 15 Oct 2010 12:16:54 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/pango/pango-1.28.1/no-tests.patch |   10 ++++++++++
 recipes/pango/pango_1.28.1.bb             |    6 ++++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/pango/pango-1.28.1/no-tests.patch
 create mode 100644 recipes/pango/pango_1.28.1.bb

diff --git a/recipes/pango/pango-1.28.1/no-tests.patch b/recipes/pango/pango-1.28.1/no-tests.patch
new file mode 100644
index 0000000..dafcb20
--- /dev/null
+++ b/recipes/pango/pango-1.28.1/no-tests.patch
@@ -0,0 +1,10 @@
+--- /tmp/Makefile.am	2007-03-01 13:29:37.000000000 +0100
++++ pango-1.16.0/Makefile.am	2007-03-01 13:29:52.545251000 +0100
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to create Makefile.in.
+ 
+-SUBDIRS= pango modules pango-view examples docs tools tests
++SUBDIRS= pango modules pango-view examples docs tools 
+ 
+ EXTRA_DIST = 			\
+ 	autogen.sh		\
diff --git a/recipes/pango/pango_1.28.1.bb b/recipes/pango/pango_1.28.1.bb
new file mode 100644
index 0000000..b48bf8d
--- /dev/null
+++ b/recipes/pango/pango_1.28.1.bb
@@ -0,0 +1,6 @@
+require pango.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "bab5b4eb3fde6b0a5bfe98d25e668741"
+SRC_URI[archive.sha256sum] = "8f3eaab506f613dd25bb1fa65ea87a145d523d066d90c227bdb3016523451bc2"
-- 
1.7.1



