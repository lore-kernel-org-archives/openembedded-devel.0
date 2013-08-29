Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF896BE01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:43 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so340915eaj.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=bKjTh29tstWUVDK0d8xb9tM68gwrcEw4m9rLW/0AQPw=;
	b=oLYd1z67rbAsyRFmxid/V/TmfwBRM5FgRxVrBl42i47prNoh+QEDJPSLj7I0bnm4w6
	/5n84E5xEj2oPua/D6tTLAh+poEluzRr2cP1kfaV120a1TptRFwlIU+bwv0htL7P24mn
	VgfF89vRcLeqvepz/LwkNOA+Rn4KgwP+cQnJjkAOkExt2tTcfVzF0dubOHuU2JIzmoWT
	ax4UZOg3FzHKtoFK9FQ2wZhnpF623LS2+0jSQTs2OgPGUxU8qusujkJJJQGPT4MfRgC/
	GhdhOtkuCNYiNE6BHuPPSUSabBdsbdfrD7iP6XadP9Gv8pK80GN2savRTKXDZ2Syy8nI
	apJA==
X-Received: by 10.15.41.205 with SMTP id s53mr4622786eev.63.1377791503948;
	Thu, 29 Aug 2013 08:51:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i1sm47160971eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:34 +0200
Message-Id: <da1d049a705fcfd8bd25bca79c5c612a48038274.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 41/66] libungif: Add dependency on libx11
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libungif/libungif_4.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb b/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
index 3e4b78b..6a0fd51 100644
--- a/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
+++ b/meta-oe/recipes-extended/libungif/libungif_4.1.3.bb
@@ -3,6 +3,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
+DEPENDS = "virtual/libx11"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-${PV}.tar.bz2"
 SRC_URI[md5sum] = "8c198831cc0495596c78134b8849e9ad"
 SRC_URI[sha256sum] = "59e835a57e6df03e4d2253b2357253f3d13da9473ff465563a3b9833a744fc36"
-- 
1.8.3.2


