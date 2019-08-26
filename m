Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CA0877F2B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 09:16:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46H5wl3Pcnz4q
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 11:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566810999;
	bh=J6SHIZUoB+eoe0kO0t56nwc2qRLaIDSktO3C4iS+D2Y=;
	h=From:To:Subject:Date:From;
	b=oPLm9C1gpjTsZEVRW7guRvOnmG1e9grkLBjPUeR3CVThIq0+OjbjMO52g/6qHW9na
	XWBeAnONzOazNWDvWaGM3mP/QqlEqponNJJLbyKpwU06UF3bo5Fgs2JZo8amQMG4tP
	g6ePgZyXYn/yonWY82xbQ/oQDo38GNQTkFPwuJBsifWK3EELSfE848uGU6IJtHK7Z/
	hd/iGWBOWbGBLJ4umZ44QjNU3hQoNF4tNcnRpNbX5eI0hgBpb13sq/MHaceU+ORq0/
	aHTC0eooHVD7mwx2mtdMbTdf5LstPxZ+6+AZYjQw6pM8q+i7PPVSGq+E4wnopAHbGo
	fuaT5XMUWtsov2FIZEYH+VLe6un/5ThraljxP4So+H02JmWh3F6Ttvkyah6JF6FUFF
	0XhN6jFOmfy47GjmjeBZjWG6sFBrVO7/bikHOKbciD8e1DqYxqhrCEP+QC8Hgc2WVs
	MCExdLgJYwqoisnNs7X6K8d6FEm2gZZ2fb71FSugT08TVRRFtS9B+yv7x3QCXgnvSi
	t/uFfJgDPLWpdz2UXuj2KG9EyHo2OS2b+fZT6cOMJ768c/BQlpjdhPug6qABpHjKgI
	NA4KqXzU3c76Cn1FTAGY3Rtxs3yhHL65ELMZKQjxTkwCQDjzFhINskgmhKOmAVilo2
	9o70mHisOBkMMBHa/hbAWtPc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2019 12:16:38 +0300
Message-Id: <20190826091638.29174-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] libgit2: Upgrade 0.27.8 -> 0.27.9
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
X-List-Received-Date: Mon, 26 Aug 2019 09:16:40 -0000

This is a security release on the 0.27 branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgit2/{libgit2_0.27.8.bb => libgit2_0.27.9.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_0.27.8.bb => libgit2_0.27.9.bb} (90%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb b/meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
similarity index 90%
rename from meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb
rename to meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
index a43408908..3ef7bee43 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_0.27.8.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_0.27.9.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3f2cd5d3cccd71d62066ba619614592b"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.27"
-#v0.27.8
-SRCREV = "2882803ca2b2cdedd069746422155a23fdd002b2"
+SRCREV = "3828d7afdd08b595584048e8e4dab6ddd4506ed1"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


