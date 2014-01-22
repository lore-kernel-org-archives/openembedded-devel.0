Return-Path: <nickdademo@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0AC60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:14:08 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id w10so411093pde.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZOL7fTT014Fzg2kFnVO21cCeQcieyFy2yBdxNyF2Iao=;
	b=YwncMSo2p+NBpWUt9GsLLrq1+fI2Q7nSlHqI+S1SHE9jpidItoKOITLwtV292HcI5R
	VGHQBQVMzgVY/3j5Bm0Vg+Ws0AGZ7lTslcFYEO4wIZ28khuuv6wGv0v8dw6NhrBxKPfT
	oK4QIQ4ogUcjbNf4scPmNdBtxCsz03oijwex4XnaJhR3VUw8IGpdD+2rxDgSv//UURl7
	vsD4sBc45iSXUuM6J32puNLqyRGspF5angiZIyomNSDVb/Ma2QwjI9Hl5zinLesmafGO
	vRxfiBmpHA9vSibXgaT1O+JfiuiB+GgyMLrTzQl3JjHuAFsJuPNnN7KZyL5YDh1x/pCO
	SsGA==
X-Received: by 10.68.172.196 with SMTP id be4mr1946226pbc.12.1390400049317;
	Wed, 22 Jan 2014 06:14:09 -0800 (PST)
Received: from localhost.localdomain
	(d122-111-78-105.meb803.vic.optusnet.com.au. [122.111.78.105])
	by mx.google.com with ESMTPSA id
	zc6sm48123537pab.18.2014.01.22.06.14.05 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 06:14:07 -0800 (PST)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2014 01:13:37 +1100
Message-Id: <1390400017-8070-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] opencv: Bump SRCREV, PV is now 2.4.8+git
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
X-List-Received-Date: Wed, 22 Jan 2014 14:14:08 -0000

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index df89b0a..538c7a3 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
 
-SRCREV = "1253c2101b22b9e89400553fd220858cda8d6ea5"
+SRCREV = "a4b34e7ae10351fc4d30dc55995679340efc488e"
 SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
            file://opencv-fix-pkgconfig-generation.patch \
 "
 
-PV = "2.4.6+git${SRCPV}"
+PV = "2.4.8+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


