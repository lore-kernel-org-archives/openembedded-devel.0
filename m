Return-Path: <net147@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE4F700EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 05:45:37 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g132so412699pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2016 22:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SCkJQVFisw7AsFPrSMG/Z3WH9hxYMDWqcEkpc2yrCHM=;
	b=pfLIrbJHycCIuyUDfGQGENtc8Vz4S95FcvZqZqjLVxaj1Q9ifSr5cNwAl+aI3pYxXf
	8NR2pYJycyBVHxx1RPY+8t0Sgs1IdvCqGjxAgHYLxRd1ZrOHH5gCmykSzsQ0n9UxBKTp
	uW9PY/XN3Zv7LEaGD3b6DTvLmCEZha76BfyBkOuNat/Gbm8G7WV7VmF3423ni6Xbz5oK
	8dRihKihBPisxZjcmLPcg+l/UDhLTp682G6q+VFU7Se2jUuVB2ZOIc9v4xBGCg7YNhv4
	T2TOz/N/vc4iwnateIV9g5LdkATYp0YRI6/zG8y8KKPgycMY0GKSLIX+ZwaSZWkrE2Uu
	aN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SCkJQVFisw7AsFPrSMG/Z3WH9hxYMDWqcEkpc2yrCHM=;
	b=MjO1IhCbzs28hoOQ3PoDMO/lPu59ui6dJE7Kmq4paxnkEPie+t3fC2Xcv02Q0VEeOb
	Fj0UMlLADNouG2ItADVtDEoa8hsmWDrPMwUKCOJzFp/BHMJF0NoMRJXsZR8r3HOrullZ
	MfyMv9LgR44YCIMgNpv8/dxZuG+nfysLz0oBk83QGzRGueWFKXP0ja150uNhE4MPIEtf
	Jv6MW2tYQ6Sccm/0peDxLv21h2XMeD7LtWi1OK1j1LS1e+IJWGE4SdU8NYbPBQPC5XLR
	WiBxg3Hb7JDhxpcX3GflT/DPKdo7ZBQNm/SXriH+P0GXtXWdiW4uvBdPni+AfFTxFomD
	gIRQ==
X-Gm-Message-State: AOPr4FUR9Y+I82LQbZeVAfYC+ucUdSUrqQs4xkNqPNtH1miJo0AbUPjGOOAnf4LexHyLkw==
X-Received: by 10.98.55.133 with SMTP id e127mr46757527pfa.81.1462772737833;
	Sun, 08 May 2016 22:45:37 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	d13sm37103537pfd.80.2016.05.08.22.45.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 May 2016 22:45:37 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2016 15:45:22 +1000
Message-Id: <1462772722-11626-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-oe][PATCH] nodejs: update to 4.4.4
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
X-List-Received-Date: Mon, 09 May 2016 05:45:38 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.4.3.bb => nodejs_4.4.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.4.3.bb => nodejs_4.4.4.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.4.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.4.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.4.4.bb
index 43761ae..8c91720 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.4.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "74e83c9c512bd99b38a02edd740b4334"
-SRC_URI[sha256sum] = "57499bb0b1b86080459d4066e3c138579a278b2d0b1f5b2f19e66c69b4e8433c"
+SRC_URI[md5sum] = "1ad7915688df85f62a57f43860dc54c6"
+SRC_URI[sha256sum] = "2c9cedc401145a6648877ebd3fa9090c874dfced8bf7a6e7d9d8e9c21827b114"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.8.0


