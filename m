Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712AEC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:49 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.2734.1633977708922630724
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KlpvfFD3;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id v17so59067229wrv.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fvV4GpbRkTtUvLxzS7uujcV5pN554EkSIet5k3nW0hc=;
        b=KlpvfFD3mFQBwiUNLMl0enzRM8jvUCj/FalNZ3nVPbm+jS/U2k8gOcH/JUpaKMi8Vk
         EfH8vpJnK4BX2V924C7CiMxMn8WvzTfeJ+kxmaKeB9odj3F8B91EpbqotkR9+ml+XB24
         3shWtxTysudWcAuEFmbYrGGKbeR3as69EciFqrhqW3CvtZp8bRwsuiJKfB67LUTQWmeh
         EQN2yf14tIBM5CsnZrgvHu49ms6QYugT7XY5QiYK0canaX3w9XMeggrXeTv+3D6kZ0ag
         CleCAciyr9q+4tgXaE/4TlT2EZmfKxueySUJUO0E+lKN4TjbPpaxme2QhKTxsvoj7AW1
         XOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fvV4GpbRkTtUvLxzS7uujcV5pN554EkSIet5k3nW0hc=;
        b=4O7schLi84Z2G/PaL0gjuhBhpinwFikHU5Ab08rMxKTNSM+vkmIDKgXu9H1wAiL7Ts
         msSSx84iDhxT8fe1fkjU/loXSJua4YvUO3cdsCajhXevys7bfbLjDECQDMRIZ2wsl0UA
         x7FHeZ3M/RNGda0iB4IXQxLM/0k7Gf+FzLdh8nY86lZFtxKgBr8+zHSfSAvfb3gRXIDX
         UrLS3eS8Bcb074pC7RtywpBmHWrPxGudzGRdCc4zlHQWlMd/P1Md1XtWKugU5xFl5msb
         rl+vbcQSrITaI8uHn8Z+fgdfmgkSAmGE2BBVxAYo79XBuvaUUOYhqYmkeB7HARSnV6s6
         Olng==
X-Gm-Message-State: AOAM530UGoZl5QXlK+A4Eu12+ytAKR5g9HdkUO88XjCqupmD/Z/pclxl
	GBUQIaQiXZP0aLQYR5Xh7Tvh7VZTJbz/Hw==
X-Google-Smtp-Source: 
 ABdhPJx7kG/aEPSAjTDEv/BrfvX3ZpCAn75oLD//OT4x0CKqo+VnzrMvKfEm2tjqLRTDSlXXzj4C+w==
X-Received: by 2002:a1c:9ac4:: with SMTP id c187mr741379wme.18.1633977707201;
        Mon, 11 Oct 2021 11:41:47 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/24] kronosnet: update 1.20 -> 1.22
Date: Mon, 11 Oct 2021 20:41:19 +0200
Message-Id: <20211011184140.653609-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93217

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../kronosnet/{kronosnet_1.20.bb => kronosnet_1.22.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-extended/kronosnet/{kronosnet_1.20.bb => kronosnet_1.22.bb} (96%)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
similarity index 96%
rename from meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb
rename to meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
index b19482c79..3d49a2365 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa88
 SECTION = "libs"
 DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
 
-SRCREV = "b8d18c8360fd39cb04748e8bc1ee26de4afa4cbd"
+SRCREV = "0123ecebce0ad6aba3cdb320027192e15fd71e23"
 SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
 
 UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
-- 
2.20.1


