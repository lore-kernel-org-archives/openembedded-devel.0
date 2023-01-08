Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D25C63797
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:32 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.46808.1673191284781846381
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VpjP2DFZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id j16-20020a056830271000b0067202045ee9so3842106otu.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqOy8WPKInJ7/et9OyPGtAs1D8XG1hVP4jo+FZG6hm4=;
        b=VpjP2DFZnk2P9nKXhIQGqxH6ErgCkfWbRWTjUiwYMi63W0aRF+pZSg1q0BnOSKzn4q
         oIsyrcRmhbz6SkvzWZZE91XtjirXKg/BbwmlHgCbJQ0H3/q9bOXvn/ea1Mj7EFYpwEqx
         Wp1QwLH7lm7IH65dwXNLQ/NSfp5X67D92Yokp3NedGTH/UCrNplsMx+x2W0/T+EqHYTc
         u29fb+RQ+/bd/sSQpARlNefQD9FcpYxXlJ4Y25mfJW5BVrksAUOhIoHLOpTiRokHAp9/
         7F5zYlIuUU9YpCDjAmRrxfxdBIM8VKDVkhMuYPIf6ZQVe69Mg1zzrObxiIMq8oUsVCwb
         EeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqOy8WPKInJ7/et9OyPGtAs1D8XG1hVP4jo+FZG6hm4=;
        b=8NKzjbPbNwItacEIpL4eiQkPgJcplZvb3JWgNrys0oLB0Aho9UPDe+AqL5Fvynj5DQ
         NlExIZor+JLQtFMlKTHTmNMWuS6g0EyQkwx7pKxg4tKomYr7uPLiNu9BBI3pDRVTYMTg
         TxWP19xpNxhvrkK7HLtCzsN08ltQfiVKBlLX5r4upbppZOFbiMeD361wwsjHasc0shKQ
         8gzw/juEody7iYRvHyM6OPQo17F/MvBr/ex4tIHODFwAHURKd13yeNjzz9xOTvFJ/eWF
         MmLuvyMKxyS6rQCkCSqONjDOxfg8q6xOHV5Fq0JLAsdklMcaNI0z7AChKaz0UNC6Wd0H
         zPIg==
X-Gm-Message-State: AFqh2kobkRIb9KBfnB+pL3TGt8OvtSJQozR0muxl8ldZ+JX8z3bjTMRA
	kOS15cbZ5RzfCS2PKJBzaWDRlCcsHe8=
X-Google-Smtp-Source: AMrXdXu2H0oTDJpmHyo1HLO0pwzEU582m+M++0BCIer/oOHTOlOnbLltdEjqA6ZUHoL2+6TkNVVVGw==
X-Received: by 2002:a9d:2c6a:0:b0:670:54ec:7d6e with SMTP id f97-20020a9d2c6a000000b0067054ec7d6emr26295007otb.35.1673191284032;
        Sun, 08 Jan 2023 07:21:24 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 12/26] botan: upgrade 2.19.2 -> 2.19.3
Date: Sun,  8 Jan 2023 10:20:47 -0500
Message-Id: <42fbcc64a1f66f1ee6e9a887f5c5574c16dd29e1.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100457

From: Chen Pei <cp0613@linux.alibaba.com>

Version 2.19.3, 2022-11-16
    CVE-2022-43705: A malicious OCSP responder could forge OCSP responses due to a
    failure to validate that an embedded certificate was issued by the end-entity
    issuing certificate authority.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2392dc79254a223da260c4b3b639d738e81b06a5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.19.2.bb => botan_2.19.3.bb} (93%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.19.2.bb b/meta-oe/recipes-crypto/botan/botan_2.19.3.bb
similarity index 93%
rename from meta-oe/recipes-crypto/botan/botan_2.19.2.bb
rename to meta-oe/recipes-crypto/botan/botan_2.19.3.bb
index 5261367db2..8d9d423ce7 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.19.2.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.19.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=f4ce98476c07c34e1793daa036960fad"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3af5f17615c6b5cd8b832d269fb6cb4d54ec64f9eb09ddbf1add5093941b4d75"
+SRC_URI[sha256sum] = "dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55"
 
 S = "${WORKDIR}/Botan-${PV}"
 
-- 
2.25.1


