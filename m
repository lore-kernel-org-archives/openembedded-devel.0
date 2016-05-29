Return-Path: <net147@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id F19A3731BC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 12:30:26 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id x1so2003317pav.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 05:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2oJ58jaM5qyZDCaWKGCX89P2jqIHIX4xRYXFbfxMb/k=;
	b=qbugLJM6Sia1QSGRsfPv1bJG5g+VFUm4BAP7zwllqT03TsH8A/c17fclvfS5qa5lKu
	5G+v2ak8UiELEfFHuTEYmLuHdnOp8XryHPHuf+247bmtN0SvPBJruWF0oTNBjZlesWAD
	mAL8tGfBBKemnYEtZTrAnH891Aq7WR721UF8+Au42fuTvtrSteCHxQewTdGSWUVMFU1r
	ZPHPwMMcemm2OlpgTmUzfV1nYGAUkSuUICBUqmtEWJo5/9XbuYHW/kTvacM94CGB85hm
	zj9A82EOODT3YzsIqkCjnrjeo2oopoPkGvnjroXV01BWAVLr032J0xRE4kCm7PxAoQHx
	KMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2oJ58jaM5qyZDCaWKGCX89P2jqIHIX4xRYXFbfxMb/k=;
	b=Mg9skhGYEcnUKZfQLoncTVdGurjaonkPiDm7hIBSGQ9pPxam0aBVPmOvsanwdB7Hj6
	SYTSFJGt7JZyu97pX6BCByOdA4PUDNMcN7eynadDlKmX4zQeM5i/MVLGFSl/Dr5UBOoy
	p6gRpaQ6wVNHy3VtQmlKOxxdg0TbOVoKQcoug61e8HryUewAqAHfjfMRX71ltHgbER2x
	XGqo0Se8i326XaUJrXkZcIqLKbnaSkN66E5gzf2CuRUEApL2/T9V1KtSpN8v2xW7gbQF
	U9RBve9R/2/c3td4RDS+z+bRyLbyIVhffLGCjPS/JfeXzoRCgs6OQhjDj6kBw7J/XMJ0
	rkig==
X-Gm-Message-State: ALyK8tK2Jl0GFZJ06c663DGxAq2aP0EFnr05D1Ni4aggSRqQrKPRb5GM6mhyMmIPDO1hLA==
X-Received: by 10.66.222.3 with SMTP id qi3mr37935553pac.24.1464525027546;
	Sun, 29 May 2016 05:30:27 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	f191sm25935926pfa.26.2016.05.29.05.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 May 2016 05:30:26 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2016 22:31:06 +1000
Message-Id: <1464525066-31118-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-oe][PATCH] nodejs: update to 4.4.5
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
X-List-Received-Date: Sun, 29 May 2016 12:30:27 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.4.4.bb => nodejs_4.4.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.4.4.bb => nodejs_4.4.5.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.5.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.4.4.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.4.5.bb
index 8c91720..479c973 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.5.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "1ad7915688df85f62a57f43860dc54c6"
-SRC_URI[sha256sum] = "2c9cedc401145a6648877ebd3fa9090c874dfced8bf7a6e7d9d8e9c21827b114"
+SRC_URI[md5sum] = "376140907bbe362f36065a30af04f020"
+SRC_URI[sha256sum] = "eaec2cd3c26a1cc101b829d32fef392268285187d1d9eda3718db288e7be28c6"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.8.0


