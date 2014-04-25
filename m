Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id A490065D99
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 22:19:33 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kx10so3640460pab.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 15:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=t6ivp0YMXfsagcvl0GCDhMUcb0yTFJpj4YvsJkx2OKg=;
	b=htm9XPkJb1ct6Nihrx97R4iE2ikgzLiG7UmmsPUCJZxrnTcaxUJ2ERC9m8oINDvEPH
	XrvZJgEzappCSmNLwqIWvwIDEkLR78XPygvB2PljsTooN4dwSermxXA7jDPy2dCLdor+
	tdaL5I1pTZy/SWOLg6uzG0LMdAIA2B4gnTwbWHIOWUcCkmHy4v3PNnpdROPqWWpXTlId
	dSAKh2k1Ija66yoq/2B6c2lyjI0W8C2bjP0g5bpD8ySsTcmWiCEquvxIn9Z4XL8V8kOM
	u6Nuy9+V+6PGTu8VIufzlw0kMSe5B5kYBiU21d9zRkALdWfdX+NhvowFk3rjzVZYgJpB
	S15A==
X-Received: by 10.68.197.8 with SMTP id iq8mr14448318pbc.124.1398464374851;
	Fri, 25 Apr 2014 15:19:34 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id tu3sm44965888pab.1.2014.04.25.15.19.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 15:19:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Apr 2014 15:21:43 -0700
Message-Id: <1398464503-23657-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] esound: Fix build when B != S
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
X-List-Received-Date: Fri, 25 Apr 2014 22:19:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/esound/esound_0.2.36.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
index d454384..035358d 100644
--- a/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
+++ b/meta-oe/recipes-multimedia/esound/esound_0.2.36.bb
@@ -22,7 +22,7 @@ EXTRA_OECONF = " \
     --disable-artstest \
 "
 do_configure_prepend() {
-    sed -i -e 's:/usr/include/mme:${STAGING_INCDIR}/mme:g' configure.ac
+    sed -i -e 's:/usr/include/mme:${STAGING_INCDIR}/mme:g' ${S}/configure.ac
 }
 
 PACKAGES =+ "esddsp esd esd-utils"
-- 
1.7.10.4


