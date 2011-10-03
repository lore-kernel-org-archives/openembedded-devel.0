Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifV-0005A2-Sa
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:34:53 +0200
Received: by bke11 with SMTP id 11so5356292bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SJ37JS9bsCUzhwyz5oRp5mg5vr7VYRzW84a0rUP/Gqk=;
	b=MVMhOQwyM7h+W6M2CK1dL0MGRshDJP2iI7RMPqHnhsZbd5BsZRpFO+nAmdS9M4X/uQ
	UkNxv6O4R8h0HDufKOLD7PtJI+GLZB2Ktu9q8Z3KBpfjh01REazm2DBlNj5i0fYlyFUZ
	RfhiwRCJtr1e/AEuT3Ptccu8jLq6gWxav19PA=
Received: by 10.204.130.19 with SMTP id q19mr9609096bks.88.1317648560632;
	Mon, 03 Oct 2011 06:29:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s12sm13231006bkt.4.2011.10.03.06.29.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:13 +0200
Message-Id: <60d1cf8be7372cd2c1ccdd1d33c3dc1f91213c21.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 15/25] python-cython: upgrade to 0.15.1 because 0.13 doesn't work with python-2.7.2
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
X-List-Received-Date: Mon, 03 Oct 2011 13:34:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...thon-cython_0.13.bb => python-cython_0.15.1.bb} |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-cython_0.13.bb => python-cython_0.15.1.bb} (73%)

diff --git a/meta-oe/recipes-devtools/python/python-cython_0.13.bb b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
similarity index 73%
rename from meta-oe/recipes-devtools/python/python-cython_0.13.bb
rename to meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
index b547de6..f22a473 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.13.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
@@ -6,13 +6,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
-NATIVE_INSTALL_WORKS = "1"
-DEPENDS = "python"
 
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "ed2ec5e0df60a6b8e500bedf93bb1feb"
-SRC_URI[sha256sum] = "a30d5e26c82ec65d65703c7cf312161a21b30339addc1a42d3b2965dea254ca6"
+SRC_URI[md5sum] = "171021b3845c9ca8bd6d8185b3cde664"
+SRC_URI[sha256sum] = "248123f2f02f2701a28d9452132ac835533b396a273cda9d361cb65c26067edc"
 
 inherit distutils
-- 
1.7.7



