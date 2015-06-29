Return-Path: <net147@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 437D060670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:24:52 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so101501925pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2015 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3hNgkINLG4buPUVB3oPfAffjBrOTVq7HUsM9/1q15fs=;
	b=gG2GJ2q6qsZCQm8yp8nZ6t/5ERrMMB5+pHG/u7u5oN2TUaKmKcJG6BA8LBi+wJX56+
	lv2U9ayjkaexwdW+i+1Yami4af5xKTPR8nfYDb6OhmVEc4tuukPZUMbvXdcezISSrote
	kKGXY3T4kzZQLt/3GQxIUbhkAMtIGDoOkRXfregQeIphkh3e4mNplrquy4hND3G6sVx2
	j6O0tdsJiF8NzqMq5hHVWCwPHGr/WAKWt3VKfuvnWC6R+cJr7uf+EtSMCIUFa6m+y5EC
	2JAJ9WtDMt0I3l0O3OEDv/UyC97MZDyKK9qJa2R3UQQH1R2jCLodGTKDL+fY/kMUdUTd
	1Erg==
X-Received: by 10.70.54.196 with SMTP id l4mr29248256pdp.2.1435566293436;
	Mon, 29 Jun 2015 01:24:53 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	db1sm41384474pdb.50.2015.06.29.01.24.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 01:24:52 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jun 2015 18:24:27 +1000
Message-Id: <1435566267-5070-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-oe][PATCH] nodejs: update to 0.12.5
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
X-List-Received-Date: Mon, 29 Jun 2015 08:24:54 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_0.12.4.bb => nodejs_0.12.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.4.bb => nodejs_0.12.5.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb
index 81b8c0d..9bcec08 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.5.bb
@@ -8,8 +8,8 @@ DEPENDS = "openssl"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
 "
-SRC_URI[md5sum] = "c2b4deea212c0b7c2f86368c65fab312"
-SRC_URI[sha256sum] = "3298d0997613a04ac64343e8316da134d04588132554ae402eb344e3369ec912"
+SRC_URI[md5sum] = "aa6d22762e70b4f46293a17373788291"
+SRC_URI[sha256sum] = "4bc1e25f4c62ac65324d3cf4aa9de2d801cd708757c3567b6ad2ced7df30cdd2"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.4.4


