Return-Path: <fw@javox-solutions.com>
X-Greylist: delayed 6823 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Apr 2017 16:11:11 UTC
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
	[80.67.31.39])
	by mail.openembedded.org (Postfix) with ESMTP id 983D571A8E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 16:11:11 +0000 (UTC)
Received: from [87.78.181.177] (helo=javoxdev2.fritz.box)
	by smtprelay01.ispgateway.de with esmtpa (Exim 4.84)
	(envelope-from <fw@javox-solutions.com>)
	id 1cw8E5-000837-6A; Thu, 06 Apr 2017 16:17:29 +0200
From: Florian Wickert <fw@javox-solutions.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Apr 2017 16:16:09 +0200
Message-Id: <1491488169-27594-1-git-send-email-fw@javox-solutions.com>
X-Mailer: git-send-email 2.1.4
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
Subject: [PATCH] jack: allow empty jack package to satisfy jack-dev dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Apr 2017 16:11:16 -0000

jack-dev depends on jack, which does not exist before this patch.
The empty package satisfies this dependency.

Signed-off-by: Florian Wickert <fw@javox-solutions.com>
---
 meta-oe/recipes-multimedia/jack/jack_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index be5f7bb..61064f4 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -32,6 +32,8 @@ PACKAGECONFIG[opus] = "--opus=yes,--opus=no,libopus"
 # portaudio is for windows builds only
 EXTRA_OECONF = "--portaudio=no"
 
+ALLOW_EMPTY_${PN} = "1"
+
 PACKAGES =+ "libjack jack-server jack-utils"
 
 FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
-- 
2.1.4


