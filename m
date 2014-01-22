Return-Path: <nickdademo@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 433ED6E367
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:05:02 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ld10so176279pab.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZOL7fTT014Fzg2kFnVO21cCeQcieyFy2yBdxNyF2Iao=;
	b=xKshjyuWVHjLPMyIwatbhlF+63+jCzxxrI3YWblTyTb916DMqiGsqf/8cHiiSHZW9w
	TIAE1m+/1OxO4cz+Bk/6evK6C/KI7hzegERdRhfxVminzx0TTjnSQZ3rJ6OEuYk8ghFJ
	ULOGaCS0EEK9uIOlu2XJEidXL1J9Awt0gQ6e89axPP3hDThdQ3mJTZpVUbVBSFWtMEJn
	8nN5PJCfs/7f37rT64EzkflTSC6yqNZCMGypS32Vf/PoM05AZ6izm4gjWtEY4YBMckSa
	D+oF9QCQrtj4XAMz7ftYQGVwIKdEuZ1SoSoiqJc8rdmokgvv7lCIIY8M6BTf26xKnU4T
	a+Qg==
X-Received: by 10.68.231.5 with SMTP id tc5mr652908pbc.154.1390385103174;
	Wed, 22 Jan 2014 02:05:03 -0800 (PST)
Received: from localhost.localdomain
	(d122-111-78-105.meb803.vic.optusnet.com.au. [122.111.78.105])
	by mx.google.com with ESMTPSA id
	gw11sm21100431pbd.17.2014.01.22.02.05.00 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 02:05:01 -0800 (PST)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2014 21:04:32 +1100
Message-Id: <1390385072-19636-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] Bump SRCREV: PV is now 2.4.8+git
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
X-List-Received-Date: Wed, 22 Jan 2014 10:05:02 -0000

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


