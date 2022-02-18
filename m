Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1662EC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 21:16:13 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.2944.1645218972130041426
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iTayKSuo;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id qe15so9633953pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kvd4yzJXh3C9ySmACRv3BdqsWjgPKniCytc9EB3QbTc=;
        b=iTayKSuo8pnAOf6kAvD+IJMEpKbOo8Ve1PDmcCFcqu/BDa/zA7cMbjoeLJ5OVR6Wty
         qwAj1QOc5wMK3FFbscGE60G8wXQW0UpOqYMijVUvFE1CU79Jmc21Pi6Tfi2ptwgwtdYs
         Dmnzk/of76Lw8WMB2D+IDOmv1iNYt8U70PZEPMFRlEECGtHG+cJB9bUPJu11GERUsEuz
         DiHrk3gKZ0xP8P/7IaTioTbPz9PrtbBSmudVQfZ+BvMREUAgVV9nmlOQDaw3cmEljdot
         GAbF6ZQ716F/TLubms5L0+31dR9dQ5FpjMzl2Q/4yYSjy4jLYyOSqn2coMojf0fsZCKE
         givQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kvd4yzJXh3C9ySmACRv3BdqsWjgPKniCytc9EB3QbTc=;
        b=f/+Hjn/buI4p0yHUIcDHKAVsJ6JtLvXkz4UKTa2LnMMXa7Bs7pCmuQ+o5KHny8VGI4
         D3hqUtaKBPHYvaGAJaquUZ4tAHgw04NbXP/TTcNGQGl4SVb/u6LvtTVLDQ18LTdGdZRh
         De9DeK53DPkEBKQ3seJ1qAX+yb8cBYlYzRYyAIPtKwaztbC2W5JXIdWWhi7PXjo8+T4B
         +Xi90yQn2aqmXoFvt3Yhjuctwl5shmtLMCWqEE17bOnKCdJW6J9wJ3OmABoTOF1ljgk5
         mcav2FP2HRwnOSIWONsQDyJ4kMsxQ37z1mU25Is3kaTJaOlSQp/gBGeCO6MSXH6NZlK8
         NtDA==
X-Gm-Message-State: AOAM533iD66Dxr/YhEAmnVum2DHFtZRbREizYFa5x+NNF2Ot2ahzfOVf
	laafHqFUYU/ll5Z0EC/RQ3LOWRqK8WzR1w==
X-Google-Smtp-Source: 
 ABdhPJwEtUCYyMVnZPGpILhg6mxbnW0QXLsmjVhGZCxYgAb4Q4t8O3QDtrYPwPxObcwDMHGKYttYZA==
X-Received: by 2002:a17:902:930b:b0:14d:b0c0:1f71 with SMTP id
 bc11-20020a170902930b00b0014db0c01f71mr9253935plb.113.1645218971101;
        Fri, 18 Feb 2022 13:16:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 nu11sm274252pjb.36.2022.02.18.13.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 13:16:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] libsigc++-3: Upgrade to 3.2.0
Date: Fri, 18 Feb 2022 13:16:05 -0800
Message-Id: <20220218211608.1625215-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 21:16:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95382

Changes are here [1]
[1] https://github.com/libsigcplusplus/libsigcplusplus/commit/baab13fd40d90dc0a33241a4bd517f985479a0c5#diff-7ee66c4f1536ac84dc5bbff1b8312e2eef24b974b3e48a5c5c2bcfdf2eb8f3ce

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libsigc++-3_3.0.6.bb => libsigc++-3_3.2.0.bb}           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-3_3.0.6.bb => libsigc++-3_3.2.0.bb} (67%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.6.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.2.0.bb
similarity index 67%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.6.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.2.0.bb
index 1549c6ad0f..3726dd0b2b 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.0.6.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.2.0.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=959bffe2993816eb32ec4bc1ec1d5875"
 
 DEPENDS = "mm-common"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.0/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "8cc0c1df6b7d9c466555f4a2963ab06a"
-SRC_URI[sha256sum] = "b70edcf4611651c54a426e109b17196e1fa17da090592a5000e2d134c03ac5ce"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.2/libsigc++-${PV}.tar.xz"
+SRC_URI[sha256sum] = "8cdcb986e3f0a7c5b4474aa3c833d676e62469509f4899110ddf118f04082651"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.35.1


