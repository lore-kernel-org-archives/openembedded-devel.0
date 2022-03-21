Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676A4C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:51:07 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.24906.1647823866616579556
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kgaQIO8O;
 spf=pass (domain: konsulko.com, ip: 209.85.160.180,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f180.google.com with SMTP id i8so10886618qtx.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0vkT48nEcHJtANDzZJxJOVLy6lhfBqmmPKDWab95CM=;
        b=kgaQIO8O7rWszm2ZgMCdGyToHGe4Kkvha2ZeGrzn7z8W4XLYwcnv0cF/91qZzKub7v
         A192HNQWWy9YeTGt9kap+ACzGiBaNigoVd32iB+Qn9EFwgnEebzUhnf++d6BEdb6Psyl
         1QakM2WU+F0o2mMjBVjLlLlNxPrIteg16ft2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0vkT48nEcHJtANDzZJxJOVLy6lhfBqmmPKDWab95CM=;
        b=ogX2+SnQjTWM2K7GiN+CzjpuFRqI+TJ6W5EIOhQT7UkWWtinbVEZAF2Qij/oLfydVj
         WcJ9csy1VJypXbUfsblA2/2T620nhVa7XimbITWS6hHJYgpba3EvB8gPxXlHTs8kUI2U
         Mt6STxEu58y4jLuPpqYx7tllTtzty52GJKV5HbZfdVISNeJVofANjVM7zHJDn/XNChbI
         nM12qUB/q2MLO8hvUk1cR294XRbPSEs75LbFKHbFJKUGhrbZ4E0F5Pbo/K1wbO2zNWG6
         vdpip9SxCBuT1EWRals7lZZWVD7sXWBj2HMCTqGOfXAjvAtjFyFEuA67hpPzlCkolVyw
         UGVw==
X-Gm-Message-State: AOAM5304L47ZYpeE/pziN0ybp/oH7Hxl5RAH51Q32vVR+qELhoKz3dMQ
	+G51ZTGN3VqBtpdpf6kv4s8OBMSL5Hwjaw==
X-Google-Smtp-Source: 
 ABdhPJxUZ7ITo9kKHlpubcmgxiybwSNTt/TxlRc99+1K1yOEmPHyeUK9j5F2JMsMo4s5M14LdWT10g==
X-Received: by 2002:ac8:118a:0:b0:2d8:a3b2:7501 with SMTP id
 d10-20020ac8118a000000b002d8a3b27501mr14786448qtj.354.1647823865302;
        Sun, 20 Mar 2022 17:51:05 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm10493790qtx.15.2022.03.20.17.51.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:51:04 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/8] Remove recipes moved to oe-core
Date: Sun, 20 Mar 2022 20:50:34 -0400
Message-Id: <cover.1647823458.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:51:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96091

I didn't see anything queued in master-next, so here are some patches
to remove the recipes that were moved to oe-core this week.

Scott Murray (8):
  python3-babel: Remove
  python3-certifi: Remove
  python3-ndg-httpsclient: Remove
  python3-pyasn1: Remove
  python3-pyopenssl: Remove
  python3-pysocks: Remove
  python3-requests: Remove
  python3-urllib3: Remove

 .../packagegroups/packagegroup-meta-python.bb |  8 -----
 .../recipes-devtools/python/python-pyasn1.inc | 31 -------------------
 .../python/python3-babel_2.9.1.bb             | 26 ----------------
 .../python/python3-certifi_2021.10.8.bb       | 14 ---------
 .../python/python3-ndg-httpsclient_0.5.1.bb   | 31 -------------------
 .../python/python3-pyasn1/run-ptest           |  3 --
 .../python/python3-pyasn1_0.4.8.bb            |  2 --
 .../python/python3-pyopenssl_22.0.0.bb        | 23 --------------
 .../python/python3-pysocks_1.7.1.bb           | 20 ------------
 .../python/python3-requests_2.27.1.bb         | 25 ---------------
 .../python/python3-urllib3_1.26.8.bb          | 22 -------------
 11 files changed, 205 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyasn1.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-babel_2.9.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-certifi_2021.10.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyasn1/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyasn1_0.4.8.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyopenssl_22.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-requests_2.27.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-urllib3_1.26.8.bb

-- 
2.35.1


