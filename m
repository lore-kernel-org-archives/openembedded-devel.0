Return-Path: <nickdademo@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 788BD60889
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 22:21:23 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so113134pde.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YgkI2iTa6LHt2RlbHd8ANHXDNjMUE3k5vpudyuKkirM=;
	b=zOkV+G66G4tt8BzAvLjzoQ2mOBhp2+Ibt3UeeUYSu+snW+dxOnOxf/Ptx1hAXHuTIU
	Rcyhtd7+igbMWvX8qiZtG9QV7TSDbFB8xO1XCBeq8b7T17aFVO9Rw9XCQI7AX3ir1pCv
	323naYnQkxGy/wg+ICw77QzrZpX9cZUaTNAcORGwMoilf6mfus+MHnS6FNAkTOTFgZvq
	IXlRce6SMWSacnuHLN/RQKQaRCANfEitksmn6USaXaP3UqMKCWcpT6u+xt68ylAzCkzW
	F30l5ewi7hOTCEGsPUyXjJss0CfrzbIMiD6u6a0Vd1fRA1B+wlCsA5jOTleLDwstcxJY
	BDJA==
X-Received: by 10.66.124.163 with SMTP id mj3mr11205520pab.38.1399414884462;
	Tue, 06 May 2014 15:21:24 -0700 (PDT)
Received: from localhost.localdomain
	(d122-111-84-3.meb803.vic.optusnet.com.au. [122.111.84.3])
	by mx.google.com with ESMTPSA id kj1sm2533147pbd.20.2014.05.06.15.21.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 May 2014 15:21:23 -0700 (PDT)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 08:20:36 +1000
Message-Id: <1399414836-16702-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git.
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
X-List-Received-Date: Tue, 06 May 2014 22:21:26 -0000

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
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


