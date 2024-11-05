Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328B9D2C12B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.19559.1730817432775717594
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aykI7Ugq;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e292926104bso4745555276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817432; x=1731422232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex5vdFrBlbxwQzZUHb5nIisYG1dAe76GfuUsaNcQa2Y=;
        b=aykI7UgqHqAJuCjJVJNAWhoYAsQUf6pDTQ9SfVeydeXpyTIzY5ixqLxkm50zkNBRAJ
         xvTYH+q71kmj1xpclCthrP+ntYjBtd+342NTQ0CxL+daMcL0JTmEst2hxTYXihN0epaz
         O+DmWe1BjfcZMEObwiUotWgozuEBfeyN6BbNldsjHFvtwSFRzIQTAF71K7b7wHYyrt/d
         17BlDnL5WuVLiupnP5YRlvo/i9QGbspc5vYToaa1wsodNsL17gLF1rM0AzhH6AgDvvGM
         DmLzaj1o8tq35ZhKBqB67gpc6nfydEeax5qWfCbw8kpEUgQQE2llcMygIsvb2gZf1eV0
         okQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817432; x=1731422232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ex5vdFrBlbxwQzZUHb5nIisYG1dAe76GfuUsaNcQa2Y=;
        b=gleXBYRc4+mhyIoHOIxfN5O0h/WyMipd9JfeoPaLmQccQSJFA80D8t3Ndub6c1vyiE
         msqFATqJAr0R8DTW1p9Di0aVdLbca8qAndl8gnhtBN+tqCfvk80LHyFoHbuMcwaWQohN
         n49RxjUpLGHsQ7hfiaGy2xcrgMLRy0c7m7dGEZZApgfklSI7/yjaFiuP2BbCjEdyJrnv
         o8UUUoUDDPNfOap3/vxmzik0JE1mmquLs5LyGgP4m3Xio0nFbWpnX23/Fa9gNEI1SZis
         UthEtTLY230kxVAZHaLEQnvyVdU2MTzmkMaWHoHUqaN2AwND29PhyrhLgysvDIa9zvnk
         lPhg==
X-Gm-Message-State: AOJu0YyoM9rNVCJ+vqHQwjAH8K91AmTmWCt4AdRMJZ+r9wTGWafLXk3d
	G0pDWnPAQ+QEFrIQHxygbXch1ZVDL38paLaYIvI+G/oRkK2/eZSLX+UPdQ==
X-Google-Smtp-Source: AGHT+IGAokarPv3nY48xLZztchYzMqyYYu5Znf9G26fAFTWXrpfrbJwY7JhXxWx1QTA2p/2y9jJ3ww==
X-Received: by 2002:a05:690c:6312:b0:6ea:95f5:2608 with SMTP id 00721157ae682-6ea95f52ff2mr70656227b3.7.1730817430170;
        Tue, 05 Nov 2024 06:37:10 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 66/90] curlpp: Fix build issue
Date: Tue,  5 Nov 2024 09:35:31 -0500
Message-ID: <20241105143638.2301245-67-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113487

From: alperak <alperyasinak1@gmail.com>

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 56010090ef75da2a3d564e16ee046a709da4a650)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...id-conversion-from-int-to-CURLoption.patch | 36 +++++++++++++++++++
 .../recipes-support/curlpp/curlpp_0.8.1.bb    |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch

diff --git a/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch b/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch
new file mode 100644
index 0000000000..1712a53462
--- /dev/null
+++ b/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch
@@ -0,0 +1,36 @@
+From ebe9144fdfdc8154661b93322cec4a1c43aa75ff Mon Sep 17 00:00:00 2001
+From: alperak <alperyasinak1@gmail.com>
+Date: Tue, 1 Oct 2024 19:45:38 +0300
+Subject: [PATCH] Fix invalid conversion from int to CURLoption
+
+Options.hpp:281:74: error: invalid conversion from 'int' to 'CURLoption' [-fpermissive]
+  281 |         typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
+      |                                                                          ^
+      |                                                                          |
+      |                                                                          int
+
+Fix invalid conversion by adding explicit cast to CURLoption
+
+Upstream-Status: Pending
+
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ include/curlpp/Options.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/curlpp/Options.hpp b/include/curlpp/Options.hpp
+index c705c9d..7c9a501 100644
+--- a/include/curlpp/Options.hpp
++++ b/include/curlpp/Options.hpp
+@@ -278,7 +278,7 @@ namespace options
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_LIMIT> LowSpeedLimit;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_TIME> LowSpeedTime;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_MAXCONNECTS> MaxConnects;
+-	typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
++	typedef curlpp::OptionTrait<curl_closepolicy, (CURLoption)CURLOPT_CLOSEPOLICY> ClosePolicy;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FRESH_CONNECT> FreshConnect;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FORBID_REUSE> ForbidReuse;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_CONNECTTIMEOUT> ConnectTimeout;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index 131f1873a2..cacdc9773b 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -8,7 +8,8 @@ DEPENDS = "curl"
 DEPENDS:class-native = "curl-native"
 
 SRC_URI = "git://github.com/jpbarrette/curlpp.git;branch=master;protocol=https \
-           file://0001-curlpp-config.in-Remove-references-to-absolute-build.patch"
+           file://0001-curlpp-config.in-Remove-references-to-absolute-build.patch \
+           file://0002-fix-invalid-conversion-from-int-to-CURLoption.patch"
 
 SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
 
-- 
2.43.0


