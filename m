Return-Path: <niko.mauno@iki.fi>
Received: from tulikuusama2.dnainternet.net (tulikuusama2.dnainternet.net
	[83.102.40.151])
	by mail.openembedded.org (Postfix) with ESMTP id 405466B074
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 18:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id A2C5D2AF27;
	Sat,  1 Dec 2018 19:57:38 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.652
X-Spam-Level: 
X-Spam-Status: No, score=0.652 tagged_above=-9999 required=6
	tests=[SPF_NEUTRAL=0.652] autolearn=disabled
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id e-YNSKxQH8TI; Sat,  1 Dec 2018 19:57:38 +0200 (EET)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net
	[83.102.40.54])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 4F8DF29392;
	Sat,  1 Dec 2018 19:57:38 +0200 (EET)
Received: from localhost.localdomain (82-181-15-94.bb.dnainternet.fi
	[82.181.15.94])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id DCCBF2A9;
	Sat,  1 Dec 2018 19:57:35 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 19:57:08 +0200
Message-Id: <20181201175714.119435-1-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/7] python-pygobject: Fix invalid install path
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
X-List-Received-Date: Sat, 01 Dec 2018 18:04:45 -0000
Content-Transfer-Encoding: 8bit

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta?id=1dccb37d89f54d7284b6a81957ab228906f24e1c
has replaced PYTHON_PN references with hardcoded 'python' and 'python3'
strings in pythonnative.bbclass and python3native.bbclass, respectively.
Associated commit message states: "If both are inherited then both
native Pythons are available, but the last to be inherited will be the
one to set PYTHON."

Since after the above-mentioned commit this Pythonv2 recipe installs
wrongly into /usr/lib/python3.5/ directory, move inherit of
distutils-base.bbclass (which inherits pythonnative.bbclass) to right
hand side of gobject-introspection.bbclass (which inherits
python3native.bbclass) which changes the install path back to
/usr/lib/python2.7/ mitigating the issue.

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
index c444fbf05..70c7b9eb5 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
-inherit autotools pkgconfig gnomebase distutils-base gobject-introspection
+inherit autotools pkgconfig gnomebase gobject-introspection distutils-base
 
 PYTHON_BASEVERSION = "2.7"
 PYTHON_PN = "python"
-- 
2.19.2


