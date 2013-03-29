Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1ULerO-0007T5-Dx
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 20:21:10 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 20:04:00 +0100
Message-Id: <1364583842-21471-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] libyaml: allow native builds
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
X-List-Received-Date: Fri, 29 Mar 2013 19:21:10 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb b/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
index 04c6f77..32d45b0 100644
--- a/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
+++ b/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
@@ -11,3 +11,5 @@ SRC_URI[libyaml.sha256sum] = "7bf81554ae5ab2d9b6977da398ea789722e0db75b86bffdaeb
 S = "${WORKDIR}/yaml-${PV}"
 
 inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4



