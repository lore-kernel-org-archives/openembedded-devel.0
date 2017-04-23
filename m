Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E65BF77BCE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 06:55:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u65so11652042wmu.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 23:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GAlwN5gejjmq7egHiLkkqa1hknIvfY3SzQMDNOlN2hU=;
	b=leDy/D9NAzanZWDW3ef2ScY+VHHV//Y1Q1tLmgwpXwbcHG0Rk9lO8VdSfhjmwyWiyo
	kyV2McoyWU540XPOXS27l576u8MK6gPzaHBnZPHKf8gZC8Tndx3BD+zATDfP69ZuwJrq
	1iFFiTvNAHSA+ov56RbPUi6aEuGT24iOc0VxyXSpZ/7jw77cHbm5+vjlXjc3QXnnZzRB
	V76FxnHSgdKWzM+BCwE1gwZeC3NGcECjT+sWhosEJoaIARELw5F4A62ErPFst5XVuKh+
	zSeFBwAijJgv2ItyXT3YspijAstUvuyJIOkDfMZ/Vca9qKLmPGQ3q/FFj3/SKwmmLt73
	kGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GAlwN5gejjmq7egHiLkkqa1hknIvfY3SzQMDNOlN2hU=;
	b=umX/Da4j1dq+kYm/K6OQDGi6/b/bsSGbhwj98nPkdfcRlhOMghX4g1WUtkITG8lGyh
	KcZB3QLa1psJuqz/gl6Y+wIF8yklYusPJEVML1+wmq45K7/zxehYbI1rsAUAvRq7bunP
	qgYYYP/s76CWPHbTMOAYJmeQ88IguPfp11huYlX08C3+5Kl4m2Kr3nci2XS3qAFIkrgy
	YTeQP83hvDUhpRUg7brZ6SJG058dynZIZPdiOHxmAgU1iWAbY02GcqXRIiVet0DjklPQ
	Hbv4r7qK2XwqGEoUv2ys+ofDFDTxREVg/o3nvNNK1vLbjqickT+yV6c+sPPFi+UyALAJ
	GN+w==
X-Gm-Message-State: AN3rC/6f+tqqL4Qujjl5tR7VIWLv7fIOR2RwME0FAvLErcoP7SwLyAe5
	VT9ET0N1xLAquvdX
X-Received: by 10.28.7.137 with SMTP id 131mr4800760wmh.49.1492930514447;
	Sat, 22 Apr 2017 23:55:14 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.154])
	by smtp.gmail.com with ESMTPSA id 81sm8059503wmj.9.2017.04.22.23.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Apr 2017 23:55:13 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 08:54:52 +0200
Message-Id: <1492930496-6082-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
References: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-java][PATCH 1/5] openjdk-8-cross.inc: change a dependency alsa-lib-native to alsa-lib
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
X-List-Received-Date: Sun, 23 Apr 2017 06:55:14 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

For cross compiling, it should DEPENDS on alsa-lib instead of
alsa-lib-native.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 47fe35d..b328395 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -18,7 +18,7 @@ PRIVATE_LIBS = "\
 PACKAGECONFIG ??= "repack"
 PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
-PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
+PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib"
 
 PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
 
-- 
2.7.4


