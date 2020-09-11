Received: from mail2.skidata.com (mail2.skidata.com [])
 by mx.groups.io with SMTP id smtpd.web11.5095.1599819691985015125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 03:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=D5aoDkom;
 spf=softfail (domain: skidata.com, ip: <nil>, mailfrom: prvs=516bca272=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1599819695; x=1631355695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DVhy7czyxRZ2vZIms5QG/kiNamFcxza8m/gJ4LKxf44=;
  b=D5aoDkomm/xNChhzzO+BamRT3Zj6GHm3Gf3wviBJ2vKF9xyrR5eyO0bI
   WtuJC9PK/x2bJBYYfCCWNny5SG/k1xgb2FoE83HgTv7I9qlWMgJLHU1CE
   CHzE7UM+eql7jx5EaxzMgz9ajvJMxIFpa6ASHRx8KYwQIJZvuav5ed8/v
   LL9IPdR9MoKfGQgedl0YFgfRyFJt0d507YQt0qGii3h6NB0mYK0ecObPj
   4due/0TIbrwtTy5Kgl8ZzfOL7OZrOLz11teMjqYQFExuB7TTq0gelJ4of
   3R9X3ydwS9RFT8/oqqC64Kf+L2qUtb4/iKhELJeOkBXA34ZkS49AGimYR
   g==;
IronPort-SDR: gvyzLFaCKAG3Icq6uicLtuLsHTVADszVCv1Ld0ohe8xXNxNJs208Hsfd6LMxznadKueKdmLexj
 pOwToD2Fd4ken/u0zpE0ZczERIWZyevaaV5NP2q7y3O0iC2ispZTGOcnZ9f1etMVf7SVPbjY0u
 +wRVNU0hlNs0ke5a+HyvPS75F+hBVAdDPNfbU00I2xFRbjdquxtNZvjZC+K7Kvk9LLWFFPgrmQ
 uiWi7Et9DA9xIqYsvmGoM8mA9cd6fQ2caCKn1iQo5eg8q058rng9Pmpv/NVf+7XGMKFWEKtrlI
 lmg=
X-IronPort-AV: E=Sophos;i="5.76,414,1592863200"; 
   d="scan'208";a="2665879"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-java][PATCH 3/3] openjdk-8-common: fix soundless evaluation
Date: Fri, 11 Sep 2020 12:21:16 +0200
Message-ID: <20200911102116.597001-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200911102116.597001-1-richard.leitner@skidata.com>
References: <20200911102116.597001-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If only alsa and not pulseaudio was in PACKAGECONFIG soundless was
configured. This is incorrect for obvious reasons, therefore set
soundless only if alsa and pulseaudio isn't set.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 04acc59..70585a6 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -111,10 +111,7 @@ def package_config_option_cleanup(d):
     if not option_headless and not with_cups:
         option_headless = True
 
-    if not option_soundless and not with_alsa:
-        option_soundless = True
-
-    if not option_soundless and not with_pulseaudio:
+    if not option_soundless and not with_pulseaudio and not with_alsa:
         option_soundless = True
 
     options = {'make': [], 'cpp': [], 'env': [], 'configure': ["--disable-ccache"] }
-- 
2.26.2

