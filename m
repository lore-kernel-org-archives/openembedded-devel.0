Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB18FED9FA
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 17:23:52 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81722.1773768230555399209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 10:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lhSFHP61;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso51083615e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768229; x=1774373029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YjjzR+b9PRpeOQRmh/HGohXtdPjXtwNAzn3XqBY13I=;
        b=lhSFHP61XFc/0owpnaPwJSEtYueDgA0KzuMIeCIPcHDsSqEKndqisxDuNXw52bB2Z3
         uw8ja/B2o7gwzuEXSPAqQ7hQH3KZrGdp4ud8utwDa1aFgDVVvshw828TZ4a5UV+IRsxR
         7S+sBZjDm9JdxmEPWS6mLJ3z7PlYML07d5dbdCbDvzZxImXw9LTRUZ2wASHwuHNE54hc
         o8DuRpuEs+7z08aER+I8iqXNP8WZNaKAY6qmxEiVjA9wUiP9JSqLSXdRVbmpaZRDZUZh
         mlzYjWue+x9sNJtQmO2GKLiKCyhiSBZodK/NYWIN8IZMCM1gcAbsDa7i5syXFqQomdBd
         TETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768229; x=1774373029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9YjjzR+b9PRpeOQRmh/HGohXtdPjXtwNAzn3XqBY13I=;
        b=PZi895YbspKF56SqC+5CJa7hEVfAaN6dLijj7QAC8IrOXXwbfpgnfo0vNFLBBsZvLE
         eVW9P4ACntdBknnMVtrqwB7uJBohfwH65ydERIcOlyq93TxDTfQXkAAAz5cMnJndBDyA
         ueTJwGm8SGLNBe20OsinDAT8PS1DWjLyRjUpMyL9+yb8YQnGn6EDap98G1JuAcqtJpHE
         pNljqj2A4dmYTiYYJm7jsgH496elDD+EQ8HfhxhQHDj/afiklo/P6LQRthevnXv01nUB
         KSXtscfhAA29Zbn1U/UaOTG4saK56p12YmO1NhI1uH1XQwAGA+s7LQAD3u+5tFBk4m2l
         PwZg==
X-Gm-Message-State: AOJu0YxYkqWmRgNnORRAdQM/l61tpSxI/7V5DcUH16//OfsmA4NzJIrc
	dtVicTeh7wtcIJlqn3V7Q1DhXvBga1qZtccrAZCZ9pqOy6UxhEL4oHNTc1ZHsA==
X-Gm-Gg: ATEYQzyINxxPFpNpWlJPQ8gtCDePimfw+R5+adcGm1jkM/BFzLbyb708Kb8VA8DhFDP
	7y62rxeTxYrjT0CqZXXRl1IVmK6ViWy5APM38qcDod24OzW9mpG9ECEp9NVF4Qy/CX834QQ/h/l
	dgtQy94wdHmoxtgCX5IyDep6cJa4yWbtxAz3dThyWIa4vY2r/4rMNGr1QRoth6z4z6EtDsdKxhG
	pxDjyYoYRPX59li/dLlw4TLiyeJLXv+OH3SBaYTU6l/jU0yttCNmjq9lhiRgd04zPr3+j+Hrgy1
	+z511GkXbmPRM+vf/QuTRLhG0DrT5mkRoONFMqu/kEWpPxbwKte6mnFiAV9clbLOHAua7wtuhWy
	rkO4N5m9Cvc26veKhtsA8o456tQGsN1v0r2fK/55wz31ZhLYcvwFS4UtuYJgnxc3DdSA/ma1Ko6
	/xKOIfEifQEmV5dxEemCzr
X-Received: by 2002:a05:600c:c494:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-486f4579716mr5712665e9.24.1773768228743;
        Tue, 17 Mar 2026 10:23:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac93sm61717385e9.2.2026.03.17.10.23.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:23:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/7] exiv2: mark CVE-2026-27631 patched
Date: Tue, 17 Mar 2026 18:23:42 +0100
Message-ID: <20260317172346.2862459-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317172346.2862459-1-skandigraun@gmail.com>
References: <20260317172346.2862459-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125325

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-27631

Though NVD indicates that 0.28.8 is still vulnerable, that does
not seem to be the case: the fix that is referenced by the advisory
has been backported[1] to this verison. Due to this, mark this
CVE as patched.

[1]: https://github.com/Exiv2/exiv2/commit/21d129c842212c198dd887dbaafc5ce734e9dfad
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb
index df0e72f5d6..9369daa805 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.8.bb
@@ -36,3 +36,5 @@ do_install_ptest(){
     install -d ${D}${PTEST_PATH}/src
     install ${S}/src/canonmn_int.cpp ${D}${PTEST_PATH}/src
 }
+
+CVE_STATUS[CVE-2026-27631] = "fixed-version: fixed in 0.28.8"

