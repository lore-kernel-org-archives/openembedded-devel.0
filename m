Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AED9C5DF9C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:28 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12916.1787485940984196635
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p03RTS1w;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ccf2360620so21322375ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485940; x=1788090740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPOpnD8W8DDAYCs20uJvtX29WCXeIrQvUJtAiDlMIss=;
        b=p03RTS1w4bmp+Zj43I+UD3qJ/wZTQG6wCF40j0gKJYL7Z613LJO5F8VM/F4Xfhveg7
         SJT2yXE8EsqiXfw2mhfPS1rm9//SpuwcAgzLZQ7yEQKBqfYkGBTxZKQlbR3Q6XeMtIa8
         eDjaNRBANfqJzCNhHq3ERE+vHKne2ezwUZ54zjG22YhkCgCGhEFCyn86MXtv4rYNRNej
         riiIJpcUl+WiOwrb/oclv14z4VhHfAjjSyueQQzJNalHM58hWp1MvaB7Rfs8baRWdmo4
         hZTAnrqCzhqyMtrrmNH4ZmwZnL+3ODER3g3KcQYYP9lXwb76kaeSQih3ihaCCqLSlUiH
         r29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485940; x=1788090740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPOpnD8W8DDAYCs20uJvtX29WCXeIrQvUJtAiDlMIss=;
        b=i+EOwoaD3nE/c29ZYSPw58bcHLHgF3TK91xZ5ImrZpHRgJJAobVn0fvstcGcZirYtv
         JjfqqAkMMRjdC6WPSuckJqprVXhm++cDRjmsjNq30uzuP12nElTJzH+pic5xEnAy55zI
         QH+4/CHBWBLp2YUN7FqIf/I0FqRg0JnzrBRKa56vFqbGW5giDvdsNYiTUFBp3GmCgCnC
         DkyC7SI/WYB5UIHk2ojxJ3jHcbKw+IvjOM/KFlnZvU0oYoJROSNx/DE0zMPO0xNPipp4
         K4V3uGwHy5oItEjn8prLrqYv9dZMjpVkfDuCHHKhbO5xBE7jPvjxIk+zGoZj6YZatkBg
         ac4w==
X-Gm-Message-State: AFuF++l2FpPmiOfvr8DTWG+t1r/p/ziunQG0zpfFSvc6sG97kSaNYnur
	JawiUYzeUgL7VJC5zF77SATXWhwkX2QD8h0h5lKbEstbTbY/jL14DAsIBjRQ7A==
X-Gm-Gg: AR+sD12WKxhYdCEOIFyi1k4TyNQy9rCFHT7o76+sa7wvSNL+b1eyU46ttvZ4j8fjuS3
	U7OojvTJ6AFBaxjhsGpvjDf+VlAiaKQZEmEptBPpmhbk4lwt5I0Z8Lotts4zeJIRTKx7tX6jIEQ
	KjU/pykqtQYbaRT3H6TjLMRhL1ru4UzPbBEcyAR7lEdQn6hZND6VzpwRBo7HtRCgFjHn2N3lCTx
	qIMcyeQ3FAWzazdiiqZc3LaB/IE+deg3Djw5q+QWvV7JNRr6f0E5CU0nd+I3rmp0tXNEpDDJG12
	nB4K+P/vvCKwORa/ZdZvL9eLcTryMIj7mXI6gAV7Vkquz+y6LKAcV47s7z6PIgSmTe5gwluEoo8
	tbCZkj+sEvxQT0+eu+sPvS6kwsr+gw29dZymEXn7vs0DTDILBgiFhKVqajqz7LYuMuV0Df9QYiK
	tz8f+Hfjst5HJEjrMver+Zlpt2arb0Y7g+eX9aqG2pg8VwGpIebBG5WF6DFZSl70kFfzFcmXKz9
	A==
X-Received: by 2002:a17:90b:54d0:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-395c353ee4amr36709213a91.6.1787485940369;
        Sun, 23 Aug 2026 04:52:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 6/20] firewalld: upgrade 2.2.1 -> 2.2.3
Date: Sun, 23 Aug 2026 23:51:44 +1200
Message-ID: <20260823115158.1582363-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129439

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/firewalld/firewalld/releases/tag/v2.2.2
https://github.com/firewalld/firewalld/releases/tag/v2.2.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../firewalld/{firewalld_2.2.1.bb => firewalld_2.2.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/{firewalld_2.2.1.bb => firewalld_2.2.3.bb} (99%)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.1.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.3.bb
similarity index 99%
rename from meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.1.bb
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.3.bb
index 0c670a2caa..e77df2ddbb 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.1.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_2.2.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     file://firewalld.init \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "5215ba30236ee1e3df2c2292465a9ff605b9c445dcab2e37da4961cb27c7f36e"
+SRC_URI[sha256sum] = "06ecef53b317f7a05796b261b5d8ee7ff2537bed08e1b3bf8c96a6a52f0f7679"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native nftables"

