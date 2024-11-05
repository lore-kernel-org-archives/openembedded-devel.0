Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EA1D2B93E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.19526.1730817411320086431
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F4wXNqBI;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e35bf59cf6so60227557b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817410; x=1731422210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IYBFJrFy6dKoxXBKqol9KammMiJ9l4Lk6EapWeAzyE=;
        b=F4wXNqBIlo3QmxGquVdn1dSJEvbLD8NIR/s7Viuqlsu6v/C2ptATwsnOo/FThTUiJy
         EBUR8P0XJ8Ho0Cmw0SdcVmz6LYU/0cy5a2emU6m837GB/TrLgnQY2qCsXincYep/Bi+T
         0UNGQS1uMmqfWZY7SW4shU2f6IsX3/v/riG6zCE+bqhykgkDxpJxrhFNq+Vkuxwi36Kr
         C0TpDPw1XXD72XGzT9BZs74vn0GboN5p3PWdLb4Nc2Z2/oRcZv5MNwCvr3N06mrcoG0A
         VvM72bkzsdMHwVqQjMsG0JGSbWSrMWmttCRKgPwpnGBlHLk3524JWR7EY4JceDc0vxY/
         MWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817410; x=1731422210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IYBFJrFy6dKoxXBKqol9KammMiJ9l4Lk6EapWeAzyE=;
        b=md4bQabU2m0vvXyTjlR3xpze0LFL8IhXkonbxWzjSQY3zDyz035J4llZn4SwgxnRBY
         OLbLpLrBqjtZRpNgIA/SFL40KbvTeEeKCqYdO/3MAihM4Hpgnm+/Dqdh2gxphItRDC80
         V50WS0oWC8NdjWxdE26ndk628/3NQQS3ZGSuoBzghFB4uCW/axQWXk3olkUmHvfV1YPr
         Cp4FI67Brs/m7gPQo54i9TSovXRvNJAkRqVTmlFS8Sa9WbXK6se6bn0szlW5sbYRcXA5
         OCOeii1ZlkkCOd9xhupEUhh2oN3StIG72Wev9k0V/WEWrYFgOuT32fqG1NsBo5ET9fhA
         JkHA==
X-Gm-Message-State: AOJu0Yw870SlQlzI0cay1NPnXkrCHP9qSKWuVoXjmNHaVCpi9a6QuibB
	1aMdSiz63mY7u+j5YG/Ferb6KQUX+QqTNRiv8P6up5f8kJSU9VICeIZ+BA==
X-Google-Smtp-Source: AGHT+IHuxYvSF24mkwiERFSaC0pIxbX9PSYJBbcNFAi2Ny3U25XsTY/tqRJ9gfTEWWsf/l3Rt45Auw==
X-Received: by 2002:a05:690c:9b04:b0:664:74cd:5548 with SMTP id 00721157ae682-6ea642e5c1bmr131753977b3.1.1730817410396;
        Tue, 05 Nov 2024 06:36:50 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 25/90] python3-yarl: upgrade 1.10.0 -> 1.11.1
Date: Tue,  5 Nov 2024 09:34:50 -0500
Message-ID: <20241105143638.2301245-26-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113442

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Allowed scheme replacement for relative URLs if the scheme does not require a host
- Allowed empty host for URL schemes other than the special schemes listed in the WHATWG URL spec
- Loosened restriction on integers as query string values to allow classes that implement __int__
- Improved performance of normalizing paths

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-yarl_1.10.0.bb => python3-yarl_1.11.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.10.0.bb => python3-yarl_1.11.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.10.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.11.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-yarl_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.11.1.bb
index 0ff3041db3..37d77b7183 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.11.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "3bf10a395adac62177ba8ea738617e8de6cbb1cea6aa5d5dd2accde704fc8195"
+SRC_URI[sha256sum] = "1bb2d9e212fb7449b8fb73bc461b51eaa17cc8430b4a87d87be7b25052d92f53"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


