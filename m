Return-Path: <nickdademo@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7AACF65FC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 11:43:32 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id r10so9272687pdi.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 04:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CdTY1yBguG0Eu8OuKRhJp/s97etpJPtm9y1u+aPqscw=;
	b=tFB3ZFjZIZOQedq2i4WcsWnN6jAwIFszPKPpt97azMi0oO6opiq/5/d1Qh4h4rCwpN
	Iu9qztAnxiNcipbCB3nEsTTkMev5GaLtjdCp3z9XFBZ6wOqyPBFbYOW5XAtkkj1XeWmH
	usfAobC6JvJe3alt7SEBud4vkTyautKbBe+vfEsGG0BxczMjKxtw2XpU6Xs+rfsVgbGZ
	2SLTJiVAVYBAJm4Bq+9HpIh+52GNzV0z+t+824dHA6Kau43WU+o7OzR0xTaug8SZICuz
	p1tecp4ylR4d9mZWF6obmkUqUvmv/4ujWsGrZM0Z8fQtbcryFjdfUJWKO8SCTjqqRg7S
	BDaQ==
X-Received: by 10.66.252.135 with SMTP id zs7mr5393126pac.13.1399376613906;
	Tue, 06 May 2014 04:43:33 -0700 (PDT)
Received: from localhost.localdomain
	(d122-111-84-3.meb803.vic.optusnet.com.au. [122.111.84.3])
	by mx.google.com with ESMTPSA id
	vx10sm96253567pac.17.2014.05.06.04.43.31 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 May 2014 04:43:33 -0700 (PDT)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 21:43:13 +1000
Message-Id: <1399376593-8768-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git. Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
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
X-List-Received-Date: Tue, 06 May 2014 11:43:34 -0000

---
 meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index df512f6..43e6a2b 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
 
-SRCREV = "a4b34e7ae10351fc4d30dc55995679340efc488e"
+SRCREV = "df8e28283f09825cca0c2902160b7abebcfe1b64"
 SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
            file://opencv-fix-pkgconfig-generation.patch \
 "
 
-PV = "2.4.8+git${SRCPV}"
+PV = "2.4.9+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


