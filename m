Return-Path: <magnus@minimum.se>
X-Greylist: delayed 600 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Mar 2015 12:18:10 UTC
Received: from mail.glesys.se (mail.glesys.se [195.238.77.166])
	by mail.openembedded.org (Postfix) with ESMTP id DB34B73A01
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 12:18:10 +0000 (UTC)
Received: from DEV095.hms.se (smtp.hms.se [88.131.56.171])
	(Authenticated sender: magnus@minimum.se)
	by mail.glesys.se (Postfix) with ESMTPSA id DB8A9600DB9;
	Tue, 10 Mar 2015 13:05:15 +0100 (CET)
From: Magnus Olsson <magnus@minimum.se>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2015 13:07:57 +0100
Message-Id: <1425989277-21852-1-git-send-email-magnus@minimum.se>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] giflib: RDEPENDS on perl
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
X-List-Received-Date: Tue, 10 Mar 2015 12:18:11 -0000

The giflib utility "gifburst" is a Perl-script, so make sure Perl
is a run-time dependency for the giflib-utils package.

This will silence file-rdeps QA issue.

Signed-off-by: Magnus Olsson <magnus@minimum.se>
---
 meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
index 1f85308..e59d0e5 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
@@ -16,5 +16,7 @@ FILES_${PN}-utils = "${bindir}"
 
 BBCLASSEXTEND = "native"
 
+RDEPENDS_${PN}-utils = "perl"
+
 SRC_URI[md5sum] = "7125644155ae6ad33dbc9fc15a14735f"
 SRC_URI[sha256sum] = "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"
-- 
1.9.1


