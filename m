Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 84E1065C78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2015 12:35:07 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so5263125pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2015 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=K0yTc4ozABznLx+AS8KuNwDqZ6450YoH795xNeHeE4k=;
	b=kQ+uV81wfLql9APagA9v5M/faDNiAMET23lkzHirzoVPbSLStBG+LSGYBdYGt3vJUR
	NpeWZDxobi7QKVXsuh9BfSJcPCBwa9x2ygJuNcUu3C8ruXHHbj6dlzSu6cHw1lraaygY
	Yqq8UjC6GsV1hbMTOJexF7BAdcW1X6Y/UEricJalSonpn+2AC+t3y+Eq2cy7TUBV4HOC
	NGWLl4htdpJ3aXLWnsFMJzzGWtWYQJb/yhP/gMsuc32lzNmWIYU2E9rc8SgHtaihv6aj
	9DqtBlrLPwE2eBSKdCEl/oE2m6rSmil1YK/fhpnRtdDO2r/jv7hNTCx34E6/XDpWsHcX
	BSiQ==
X-Received: by 10.66.132.16 with SMTP id oq16mr79988035pab.89.1436877308201;
	Tue, 14 Jul 2015 05:35:08 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	ll6sm1288885pbc.28.2015.07.14.05.35.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 05:35:07 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jul 2015 22:34:55 +1000
Message-Id: <1436877295-23939-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.5
Subject: [meta-oe][PATCH] nodejs: update to 0.12.7
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
X-List-Received-Date: Tue, 14 Jul 2015 12:35:11 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_0.12.6.bb => nodejs_0.12.7.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.6.bb => nodejs_0.12.7.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
index 73c0557..2194510 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.6.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "698ebd8ecd5c9c61091875bbd54401f4"
-SRC_URI[sha256sum] = "7a3b5ac351973a9dee8edbf0684bc8d0dea44b231e42274ffb008141ffa19ad2"
+SRC_URI[md5sum] = "5523ec4347d7fe6b0f6dda1d1c7799d5"
+SRC_URI[sha256sum] = "b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.4.5


