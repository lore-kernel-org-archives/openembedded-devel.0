Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 75DC276E70
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 00:20:23 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj10so3444649pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 16:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0T+R23FlkRNJfyBX5itdZqHXmoKboRYgAf8bCcoHnEE=;
	b=kEFOb9zsycSB6IikummiGhfwd6IKOpaeiIKZ5Ld8gAvtzKPAjnX5jY9SRKoKKvxjX/
	QkJ2pTyZAoT4M0L5YZnwzLZq9IVW9GIAMqxsi0SDgbyq0CAiNo5BS7I2BARHao8dOhUs
	j5bkQM4g9NkFVzXl4vkNv/IWIOxNa7p6Bmh6R5dsJUP0BURncWxEbhBgeylqIUA5J+R8
	1jbxfeoYEvr9gur/ye/T7HEdVgX+ZQAUdbNrvurogXEF+rIhAPxWgZWYk+k1rNlqYB/t
	oXCSSQAiiE83pgFK11MyW9IWr27dOx9NqmRF09AASwmbHT3Regd6bDJ31+K8r1psOp3j
	L6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0T+R23FlkRNJfyBX5itdZqHXmoKboRYgAf8bCcoHnEE=;
	b=B59BscVEmsgAUnl/oRz1arpeZyI7AyOoG7PV1JuMdZLdHPp6ROYnMkOYzRrA+6v8mv
	9DOZpUEhJcro/YUqfy4g3hnuyTfiB39ozuFTHvuGccTu7TiULhEV4XkI2EPaar1eBqKw
	GSIbxqrLj/BVdC0xKWrhS3h+eiwWOIu15z+1XG3jB+Pfh3AnYPJNJio+FC5dKPAy6+7N
	YPSKuNWYegef/PJ+Fbj29f2zFxm+Hm7Clmo48a8U9HuPQG92beJWeBnCB3LOFogHsBQm
	Y5bvrSTwFCOlenmEqr0wTSMDYgmqAiASTmC0tHYRF6ochJGsHnJkOUbnKEwEr7g5vJ8q
	6wZA==
X-Gm-Message-State: AD7BkJLyMnsYCFHu+asc7bIcSfVUW7g/iVyfvFEhf51aHkZee6VkcGeWLdegyxmzAy2gmQ==
X-Received: by 10.67.6.72 with SMTP id cs8mr42572821pad.138.1456964424153;
	Wed, 02 Mar 2016 16:20:24 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	r29sm19459442pfi.9.2016.03.02.16.20.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 16:20:22 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 11:20:42 +1100
Message-Id: <1456964442-8368-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [meta-oe][PATCH] nodejs: update to 4.3.2
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
X-List-Received-Date: Thu, 03 Mar 2016 00:20:25 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.3.1.bb => nodejs_4.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.3.1.bb => nodejs_4.3.2.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.3.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.3.2.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.3.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.3.2.bb
index 44a4a51..c58fad5 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.3.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.3.2.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "8032419325e619d7fb04fd22c29810a2"
-SRC_URI[sha256sum] = "9f2fb884655add686a0414800ec2a58279a973520d42f18362f492715625ffa8"
+SRC_URI[md5sum] = "03f1424a1cfd322b5ba89da507d4cf07"
+SRC_URI[sha256sum] = "f0c5761a7e4f520ab8793cb2dcabbd7dfd7f5839ce4f2cf79d9d52d1c2da5bca"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.1


