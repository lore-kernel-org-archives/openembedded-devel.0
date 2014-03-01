Return-Path: <mike.looijmans@topic.nl>
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id F38E96ED65
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Mar 2014 17:54:50 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id 3F512663ED;
	Sat,  1 Mar 2014 18:54:50 +0100 (CET)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104]) by smtp08.online.nl (Postfix) with ESMTP;
	Sat,  1 Mar 2014 18:54:50 +0100 (CET)
From: mike.looijmans@topic.nl
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Mar 2014 18:54:47 +0100
Message-Id: <1393696487-30736-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Cc: Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [PATCH] musicbrainz: Build with B=S
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Mar 2014 17:54:51 -0000

From: Mike Looijmans <milo-software@users.sourceforge.net>

This recipe doesn't work when B!=S, so force B=$S to fix the failure.

Signed-off-by: Mike Looijmans <milo-software@users.sourceforge.net>
---
 .../musicbrainz/libmusicbrainz_git.bb              |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index f6a8f53..4cc04b8 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -37,3 +37,6 @@ do_configure_prepend() {
 
 EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir} \
                  -DIMPORT_EXECUTABLES=build-native/ImportExecutables.cmake"
+
+# out-of-tree building doesn't appear to work for this package.
+B = "${S}"
-- 
1.7.9.5


