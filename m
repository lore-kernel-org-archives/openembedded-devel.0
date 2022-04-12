Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FA3C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 17:00:40 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.80.1649782344711982504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 09:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ycs9P6w1;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id u2so2497019pgq.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sYf6n90vHyfFYEvfsLCA4d7BvW42Wme65QCHIKqRrhw=;
        b=Ycs9P6w1w1DOFZ0cVWowT3+36Xvmz+gcU/CxhoidzdmFaW2BWNF4UVcQ7YjvfIQkBP
         5IhGfKxon1ZaTFcNiZCrOJ54gj/4lCv6+nTGtuSoeWUUMmAtSWv8cJ7ha4tAAahk/DIG
         1fetgcQCwtAvHU2AWoeU6D8AvP6uYoVzApoq26ERP6Gjvb7+K/+TWfP3xjFbP7E035bC
         PHGdD8SYOGA+tKVAztLBR033KUNuIAD257FmQjwQItvXATALjblHxGknBXBcugpX/4it
         q4lOerV6AR13KvRqyOuOxSRF0tuXpRl0pMflZ617YOL6f0Wb01h4u4VVIbSu7eIhidI+
         35nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sYf6n90vHyfFYEvfsLCA4d7BvW42Wme65QCHIKqRrhw=;
        b=KsOIa/6swIBhtOxpl6knGNHiul/vXl2giyTmjdzjyjNWrNs8zbOS7mIRgqzzawT9GU
         8YiWQ6ap76s0RNq2Yw0vZqTM89+QwSEAt2H+HsoxnGWlphMAD7WQPulyX/sE0ewa6ODo
         0jQyJfW1YaaAoDHNzKiXYEm9euxVhYm+oD1bscvnjOKCHX7cWOxQ+fpez8Ba5VpU65cu
         /rWTYyE1JqmPsK/DBTAlk4Wr1asc+WOdm+q9loL7PVAIHE9idLFeooN+MWvvEAmm7EH/
         HCBxu9XC1RP0UkhBrXT26cT+LOP6F7/fOZuEVQcwaBgzQIAfQ+P21V49oPU2qeCLTiTc
         wd4A==
X-Gm-Message-State: AOAM532A2novy7b+9hNuzbzsbk9vC+IUj5Gy3bFws0OGMBrt5RKs0SHt
	WJeGyRQvFd3eaBxGviGN3gFdw3t+fwVuLQ==
X-Google-Smtp-Source: 
 ABdhPJw52IjJcOEu7KQ1izuIy96cwcBBujmfjef5zazRRxypveVWYM41hbmCGkJ65TFJ0HyPcAqlog==
X-Received: by 2002:a05:6a00:1a10:b0:4fc:d6c5:f3ed with SMTP id
 g16-20020a056a001a1000b004fcd6c5f3edmr5440526pfv.85.1649782343794;
        Tue, 12 Apr 2022 09:52:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 bd11-20020a656e0b000000b0039da213aa72sm1757486pgb.5.2022.04.12.09.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 09:52:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] safec: Upgrade to 3.7.1
Date: Tue, 12 Apr 2022 09:52:20 -0700
Message-Id: <20220412165220.3230353-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 17:00:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96591

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/safec/{safec_3.5.1.bb => safec_3.7.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-core/safec/{safec_3.5.1.bb => safec_3.7.1.bb} (87%)

diff --git a/meta-oe/recipes-core/safec/safec_3.5.1.bb b/meta-oe/recipes-core/safec/safec_3.7.1.bb
similarity index 87%
rename from meta-oe/recipes-core/safec/safec_3.5.1.bb
rename to meta-oe/recipes-core/safec/safec_3.7.1.bb
index 4b121599e0..5ffe7d7528 100644
--- a/meta-oe/recipes-core/safec/safec_3.5.1.bb
+++ b/meta-oe/recipes-core/safec/safec_3.7.1.bb
@@ -7,8 +7,7 @@ SECTION = "lib"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-# v08112019
-SRCREV = "ad76c7b1dbd0403b0c9decf54164fcce271c590f"
+SRCREV = "f9add9245b97c7bda6e28cceb0ee37fb7e254fd8"
 SRC_URI = "git://github.com/rurban/safeclib.git;branch=master;protocol=https \
 "
 
-- 
2.35.1


