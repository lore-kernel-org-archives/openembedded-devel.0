Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A01497E085
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYf0zpSzJs
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489318;
	bh=UGCzjDDZoFaqvifCt2HlGRoJ/JPpm+R1fbkDl8Gpa/I=;
	h=From:To:Subject:Date:From;
	b=bRD+7dinBcgF4lcjdG8hK6gFVFk9wqeY4r2OEoeS0KzRpNDGykZ0jwFLqfO8LGUte
	KmrZG9GB9/rP0hBDk8xqUB/Cn2GCvlTCWkqyNt8d5dBigJtvskS0Gk15upGM/Lo2vj
	n5jBfWd2vjiPv2ETlSVPMLZQTMzXAcCOTy+TE328/nqRBB9La4AcZvkuPXf+4NmU2a
	tfg9M0xeuIF6fMmf437K5RACabq8ifjaTRG8Tx+7k7JVUguhekLB8Qe9/T2NZF0kNs
	7KebWcCTw2RT0WWjzcJW6PJenGPDf8/PTEkzemG35pIxu85lZY6b7epoIrhzpylEOV
	sI3nvVX4s3jT5wpNFyUykeosgmKZWVP0WYKQjkw+EJrtb3E13p65Z0ZXLkp0JhIJL5
	kp9SYI44m6aAOsUBqxN6OfNasvs3TaciYmjf6zf19JGcVUzjDf7Nj/f/tOY/0a8fjd
	T79syljcOND8V6YJhVvxa8OBWfchhX3Wh0X0u1o8Zx8IN34GVVnWYxiQeTcNThVqlK
	NTp8tAId9nI4KEAOUnUzxz9bNmLsJfDk5wujeQT+MtD3oPNd74+yIC+TEhEQp2DO20
	eebCZK71iNo9Jae/Tx7rs+2qZSM+7tHdoeInJWoOd338jvsID36nObRGSzPJo6F71r
	kPijEx9cnokwTB8cUdQCz2AY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:02 +0300
Message-Id: <20190510115515.19491-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libqb: Upgrade 1.0.3 -> 1.0.5
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
X-List-Received-Date: Fri, 10 May 2019 11:55:17 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libqb/{libqb_1.0.3.bb => libqb_1.0.5.bb}              | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/libqb/{libqb_1.0.3.bb => libqb_1.0.5.bb} (93%)

diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
similarity index 93%
rename from meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
rename to meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
index d857344e3..b205186e0 100644
--- a/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
@@ -9,11 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
 inherit autotools pkgconfig
 
-PV .= "+git${SRCPV}"
-
-# v1.0.3
-SRCREV = "28dff090c74b6ba8609c4797294a5afe3fe73987"
-SRC_URI = "git://github.com/ClusterLabs/${BPN}.git \
+# v1.0.5
+SRCREV = "d08dbcf08b0da418bce9b5427dfd89522916322a"
+SRC_URI = "git://github.com/ClusterLabs/${BPN}.git;branch=version_1 \
            file://0001-build-fix-configure-script-neglecting-re-enable-out-.patch \
           "
 S = "${WORKDIR}/git"
-- 
2.17.1


