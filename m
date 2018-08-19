Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id AC09B79159
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 16:32:01 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d4-v6so5592687pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xZJAGBtZdc4mZ7NCZYJG88YH5fy8g2REd9F9DSA4Vao=;
	b=ndtDJB4PHWdviv/b9dBo6uOoT097EcoVFzRdOHXpnYbcfTbaARKvUtiOQ8Vm3x+qn8
	DlHlHEYzLwrDEG7XAPtIAUTNE3UbVy31FIFvGxvFbqe26dX6Hmp7yLn07tgIK/pffdVD
	hK0gZ0gC3CQpXBAgx2cn088uDOFkupE3H681BDh9/WUsMa5dT9NDM7cu0NCAyjPYnlV3
	a5edI0+fOcwLCIQKdX833tY+xIYDnT1BGxMvBGQARYj5GoytQd5OPyArmFywhB0KvOLC
	9/pfBz4Vr31hk0E7fkhqKNh/j8sHCnaO6zZj4FN/kyjN77uiWGjoQq9Z3Aa2elo0amdn
	GHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xZJAGBtZdc4mZ7NCZYJG88YH5fy8g2REd9F9DSA4Vao=;
	b=l4OTqwRdxU1I6ZnGjtnri72v8q3wi7aKyoVVP77aJCVQD89HoGiWb/BZyCDaKbpWMd
	YrxNTDx/2FeQevXvStfQ8FJZfrRYklB95/16W5tkt83JRoutMjQ2h06irYv85itKFLjH
	jpAi+oQOABo45dAq5rOUqyTdU7KCxTyRsUm9GIWFWHe+LGs4IzP+4i+d0Yxkkpvlw+Bt
	wVCNEvLBMGfM31m70lW0WFtVlqJ1oTaiagPZvba3TwPOoF85RI0MgTxBpY9SGL4utuv8
	J7+g7XrYbPa6/nHsdiod2oRzw7w8JqofDspPj/dMF8WAyd5gfIq+67Q5IT89uot4Rfr/
	KdOg==
X-Gm-Message-State: AOUpUlGwMyWwj5WMxfOwWcHGJPpBm6kePECiJaIbgudW3olO0ZH3snLK
	CpVHLTV+BHVORQf4GrLDP/ORBc8P
X-Google-Smtp-Source: AA+uWPyHVyAiCJH5sYTXYaGY4V9Igo25vB+a/XHnDSB7NrXmRyd4Q9Tc9hwjs2x/FLQ7eDA1ozyDTg==
X-Received: by 2002:a63:ed4f:: with SMTP id
	m15-v6mr40058034pgk.147.1534696322424; 
	Sun, 19 Aug 2018 09:32:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	n83-v6sm14190520pfk.19.2018.08.19.09.32.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 09:32:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Aug 2018 09:31:52 -0700
Message-Id: <20180819163152.28471-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180819163152.28471-1-raj.khem@gmail.com>
References: <20180819163152.28471-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] umip: Add bison-native to build deps
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
X-List-Received-Date: Sun, 19 Aug 2018 16:32:01 -0000

Fixes:
| ../ylwrap: line 176: yacc: command not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/umip/umip_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index 0c120bfd84..8db252d237 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://umip.org/"
 SECTION = "System Environment/Base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33"
-DEPENDS = "rpm indent-native"
+DEPENDS = "rpm indent-native bison-native"
 
 SRC_URI = "git://github.com/jlanza/umip \
            file://add-dependency-to-support-parallel-compilation.patch \
-- 
2.18.0


