Return-Path: <fw@javox-solutions.com>
X-Greylist: delayed 2076 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Apr 2017 08:33:39 UTC
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
	[134.119.228.104])
	by mail.openembedded.org (Postfix) with ESMTP id B2C4D77D83
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 08:33:39 +0000 (UTC)
Received: from [87.78.181.177] (helo=javoxdev2.fritz.box)
	by smtprelay07.ispgateway.de with esmtpa (Exim 4.84)
	(envelope-from <fw@javox-solutions.com>)
	id 1cwOnP-0007IR-FX; Fri, 07 Apr 2017 09:59:03 +0200
From: Florian Wickert <fw@javox-solutions.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Apr 2017 09:57:47 +0200
Message-Id: <1491551867-17722-1-git-send-email-fw@javox-solutions.com>
X-Mailer: git-send-email 2.1.4
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
Subject: [PATCH] jack: remove (non-existing) package jack from dependencies of jack-dev
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
X-List-Received-Date: Fri, 07 Apr 2017 08:33:40 -0000

jack-dev depends on jack, which does not exist. This patch removes this dependency.

Signed-off-by: Florian Wickert <fw@javox-solutions.com>
---
 meta-oe/recipes-multimedia/jack/jack_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index be5f7bb..f0e91eb 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -34,6 +34,8 @@ EXTRA_OECONF = "--portaudio=no"
 
 PACKAGES =+ "libjack jack-server jack-utils"
 
+RDEPENDS_jack-dev_remove = "${PN} (= ${EXTENDPKGV})"
+
 FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
 FILES_jack-server = "${bindir}/jackd"
 FILES_jack-utils = "${bindir}/*"
-- 
2.1.4


