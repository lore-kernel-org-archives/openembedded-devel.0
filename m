Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A34DC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 17:15:19 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.153090.1703870116322434071
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 09:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b7f6caf047so309748639f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 09:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703870115; x=1704474915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVrU0yrh79zLpDID+h0naE0C5VNfHAzoch6Yuu1X9+4=;
        b=xKO/8SOKopQ7aI4Nh0eYnM7BdYa/X5ONFyrfklPZE1UsBtU9YtJrNKe4DzFJx8LDxS
         4CrdiQ+j4soPVgR/XbIY5uXV2N2RRNAKuMqQoTmdXGIw03wK3nqU+QnxiwNdKzs5kNSv
         AHGhccga7rATUoyAzE1IoaYWw8Nx8bLy9URsc9cr2PUM339IPBo0PknaMHvGSovrZa5e
         GIri/3KLp3IZyUYylx0hiqwxdo8eBGguwsA9vAOKM3l88OaLfbZljxw1wBMPXgdqc8Pb
         dpyn06CILr++CJoj+gdJPNNF2KHOBGWVxe+d98LAfZ5cT8q0oiH08n1cG/J4EmxmeiPz
         pgjQ==
X-Gm-Message-State: AOJu0Yy95X59Q4YHGOMQpWZrrW8HGAANb+CA92cMSfhNQ6/O4qOMyoSl
	RWjCFSsnjJA/K81VA8K1t1MgV7AG78uCwA==
X-Google-Smtp-Source: AGHT+IHrHhLdPTQWvkJuSK5kBWK7f8TEsNoAuDzwt1Hs+H2EwB4woUYs37YEySCDRF+H5JHWLT4NRA==
X-Received: by 2002:a05:6602:3051:b0:7ba:d195:1aaa with SMTP id p17-20020a056602305100b007bad1951aaamr8676524ioy.16.1703870114668;
        Fri, 29 Dec 2023 09:15:14 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id fa5-20020a056638618500b00430245071ddsm4891244jab.176.2023.12.29.09.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 09:15:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-argh: update to version 0.30.5
Date: Fri, 29 Dec 2023 17:14:54 +0000
Message-Id: <20231229171454.2651032-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 17:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107881

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-argh_0.30.4.bb => python3-argh_0.30.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argh_0.30.4.bb => python3-argh_0.30.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.30.4.bb b/meta-python/recipes-devtools/python/python3-argh_0.30.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-argh_0.30.4.bb
rename to meta-python/recipes-devtools/python/python3-argh_0.30.5.bb
index 82cfa3b8e..78e614964 100644
--- a/meta-python/recipes-devtools/python/python3-argh_0.30.4.bb
+++ b/meta-python/recipes-devtools/python/python3-argh_0.30.5.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
                     file://README.rst;beginline=261;endline=275;md5=39ec83a704aed9f33618c5d04e478a08 \
                     "
 
-SRC_URI[sha256sum] = "9fca8e69c4dad4f8d2a7bdfbdd80b0754462b53510a03e1b5cf2b43a87e6e960"
+SRC_URI[sha256sum] = "b37dfd617a09d19a4a7bcaed0e060b288bc7ac8dfdc0facf886a49a25ff33728"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


