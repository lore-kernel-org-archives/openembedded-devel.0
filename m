Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 82E226AC33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2015 17:02:00 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2015 17:54:18 +0100
Message-Id: <1427129658-31707-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-pyyaml: enable native build
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
X-List-Received-Date: Mon, 23 Mar 2015 17:02:00 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-python/recipes-devtools/python/python-pyyaml_3.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb b/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
index 100e1c8..7f20e8b 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
+++ b/meta-python/recipes-devtools/python/python-pyyaml_3.10.bb
@@ -20,3 +20,5 @@ do_configure_prepend() {
     # upstream setup.py overcomplicated, use ours
     install -m 0644 ${WORKDIR}/setup.py ${S}
 }
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


