Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 776FE75D17
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 07:43:00 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so108999552pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bU/Jm2eA+m9Px3kLuOJyYgVp6KcOxxhlSVNJDaFHrcY=;
	b=xvbq74cKCyngUBfD6P7v/NZi7XdnP9/cybf2Ih0eI9/SYZ7GHcUvXKmxp0+lNiOwEA
	pws87cHWqNF+ti+ZvPM+G3njjQidU3VNkhCOMDk+0RvE27xwkSD3nOR+w0BkKjuZEnwW
	DNKIgLFIbqi8hMZDb2u9C4hcOp7l64jrTwozqkpk4a526VEMY5zyuUEvwS81cMj+yhSV
	qTgs8iC2OA04b0oj/VOT0PJMLNTwP8N/2/OPe0ChsFyqooOio3jFYsHWEujachABbn8W
	Okr5P4qrcN+zhdpD52W267ZpfsHPV3B7SoDaaNNvwqqI9Qo0U2EK4sNC4Ql6vgxhk/q/
	tTsg==
X-Received: by 10.68.185.37 with SMTP id ez5mr6251538pbc.74.1436254980985;
	Tue, 07 Jul 2015 00:43:00 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	nl10sm20815365pdb.38.2015.07.07.00.42.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jul 2015 00:43:00 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jul 2015 17:43:06 +1000
Message-Id: <1436254986-18539-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-oe][PATCH] nodejs: update to 0.12.6
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
X-List-Received-Date: Tue, 07 Jul 2015 07:43:01 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_0.12.5.bb => nodejs_0.12.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.5.bb => nodejs_0.12.6.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
index 5685721..73c0557 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "aa6d22762e70b4f46293a17373788291"
-SRC_URI[sha256sum] = "4bc1e25f4c62ac65324d3cf4aa9de2d801cd708757c3567b6ad2ced7df30cdd2"
+SRC_URI[md5sum] = "698ebd8ecd5c9c61091875bbd54401f4"
+SRC_URI[sha256sum] = "7a3b5ac351973a9dee8edbf0684bc8d0dea44b231e42274ffb008141ffa19ad2"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.4.4


