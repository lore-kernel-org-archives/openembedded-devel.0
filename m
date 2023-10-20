Return-Path: <david.pierret@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE56CCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:04:46 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.49752.1697789078398622223
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=QOTmP1q6;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: david.pierret@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32dc9ff4a8fso355344f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 01:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697789076; x=1698393876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zhOCririqF1JGyoAwqKz3cyvqt8pLiWi7BLqAyPTHo8=;
        b=QOTmP1q6ZDsFSJR9F/oqx6NY8Wj7cUgU5A8FCDKIp829EQXvR7P5eWRgSR8NS5FaeE
         KUA4/+Wgv4H7IIl14QMt5ib5EL/frJb2Z30b/lzIerOyfKdlXxXiiaUjj2KtWjdF85FH
         i9EnAKmrV+hrqUge61EVWAKobKQDCmCYMtM4q3zuICtAA2dEUh44Vyf0Ta2eqmi1IIBx
         N620lkaJE0KWUnWMBfTrx2DD2AcEBzwGYTzv7ZW/Jk/dPM6Jiz+4gO47dnl5ccomG2HY
         mfgSbckrfEZ17X1hiJHHAwn5gMHjgVJypJcvnvwEtch/IbWbmvGKO3zZfdFjdU9S8xr9
         Az+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697789076; x=1698393876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhOCririqF1JGyoAwqKz3cyvqt8pLiWi7BLqAyPTHo8=;
        b=V2s5+J1V8krVN2+cnW1Dt5sO1jirD7sPoMsGSpz9Vhb2ZtBD8c4+aXyAzB7FWfwtfn
         K8IJHxq1rILolh1ks9jXBs88NZZDnz3eZB9+bn/Ez19VWx8BzxyBmKd0AnVmmWQppChC
         EuK3kCbdCacM22TynFaLUjgrbanMVB7jByVxduay8aeWP30KEna6GVOhiixpW6eJ3tVx
         SR0Mn4+zFkRq2dsvILNtzeGL/yS/m3pab/deZ0gsoXBVNKRoWHTkIXExgrSNicUY4JR5
         hyO1/s0ixwh4Yb0+VActJ9+YkA4XLt9PPgFRsC5hFSONX2o6gfb9xsgvhUSQtrSKcQVV
         VF6g==
X-Gm-Message-State: AOJu0YyW5zWCPZAx/jglKGGXjcQiHMi0zGkA7qnMgtXUvKa0hcFHMQvJ
	mGl4Xaq5Zv7Cql3CMJsWTlEu0O/B80qR5LWAPzc=
X-Google-Smtp-Source: AGHT+IGNTuPLKeWjYmu2GAa6BGS11oC12ZANUe+9CM/L1jKxMlCxeeMXpkP9xQaa0GNZMNQKNDyvZg==
X-Received: by 2002:a5d:4c8a:0:b0:32c:d7e6:4054 with SMTP id z10-20020a5d4c8a000000b0032cd7e64054mr620600wrs.53.1697789076557;
        Fri, 20 Oct 2023 01:04:36 -0700 (PDT)
Received: from P-TOU-PARSEC.tailace47.ts.net ([2a01:cb19:9313:2700:7490:fa4a:1f26:167f])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d6843000000b003143c9beeaesm1128668wrw.44.2023.10.20.01.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 01:04:36 -0700 (PDT)
From: David Pierret <david.pierret@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	David Pierret <david.pierret@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH] python3-rapidjson: add missing ptest dependency
Date: Fri, 20 Oct 2023 10:04:49 +0200
Message-Id: <20231020080449.1426391-1-david.pierret@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 08:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105615

add the pytz module dependency.

Signed-off-by: David Pierret <david.pierret@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
index 3ea559488..74e46ca5f 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
@@ -27,6 +27,7 @@ DEPENDS += " \
 RDEPENDS:${PN}-ptest += " \
     ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-unittest-automake-output \
+    ${PYTHON_PN}-pytz \
 "
 
 RDEPENDS:${PN} += " \
-- 
2.39.2


