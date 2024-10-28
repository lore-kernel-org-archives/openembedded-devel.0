Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E74FD5B172
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.1056.1730142296436938667
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IQSB6+ag;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e5cec98cceso38554387b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142295; x=1730747095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMh6yeh2XEab3M0l8OLohj/YvEIUDemtq7v7t400Udo=;
        b=IQSB6+agy6DtzjAItzKaCU/u2TMPGc8iapPotxwJs/N9CX9gn1d2KNtJ1b++Ecbmz/
         1hA7fQpLWts/nxSdO51HHj5oLvEcJsMBtkkdwoB24ugzdF1pLzT7f7J8LlxB52wCQ/Xx
         mQT9D7S/X2NznN+ptbbRHkxXvNsQqyei1WqrScRu4yPAYPzsbBL22y3zLRsEK40JCh1w
         balJiJY5DfLKrgjmL8fXTk/hjNhzTSQn9vZgz4OPfXHsL1tCuhRxGuGOo9QLElocBmiN
         Socq4xWJ9XP9lTnXBAxluqjaZJtH+kivZtgo3x+BSYnhKZp+SIJkZv3u+HbsCXQIFtXt
         ldqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142295; x=1730747095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMh6yeh2XEab3M0l8OLohj/YvEIUDemtq7v7t400Udo=;
        b=mGjyG0do7yjU5bl1k894MuG5AIcZDXfyaZMPvbIraQe+zY4i1BUOHpehj91T57++yR
         PJGvwn2PTomLcxYYpu6BdtN8qnwJOdkthdKupkGIaKlLSF14y5wYxCOnxO1bvt74pWbx
         zp8p5SJE+v8Qj2iTsIbrmsFPKHc9dC3rtpAqGpXJuIcw/b8B76m0bdbeOA+aL9WQWphD
         djHTrlxlCMg6F4OFydqHCggfx+2HhCqAb9w/4H+y3iNK62N/UfwUvzNtd2YDJ3RQJFsd
         qnOCRzPf8O0jisBNG8iBiST6iCIB8KiPzbsTqWNA6g9yPwwCitDudFQMRP/LUvokc4Nh
         mKwA==
X-Gm-Message-State: AOJu0YxWMPMqgPgEF57UuLpBqVPzZQPQyRe7Uq0y8hCheCSjFgL8ZOLG
	3WEBfnXvs7Nz5/vWyKPKeWcaorV3+YPy3R4/Dy5kkALzxjSEoasZURontg==
X-Google-Smtp-Source: AGHT+IE+59SJ+DCIk5xt/+cYYzz/sB+1trNHkHT/AHJkX+0NTxTbIAK0Hr5gecAgo22Q87ffu7HNZw==
X-Received: by 2002:a05:690c:fd2:b0:6b3:3520:a45 with SMTP id 00721157ae682-6e9d89ae44bmr89809807b3.20.1730142295115;
        Mon, 28 Oct 2024 12:04:55 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:54 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 03/22] libconfig-tiny-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:39 -0400
Message-ID: <20241028190444.10522-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113294

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
index 620659abd..f232c3585 100644
--- a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
+++ b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += "perl"
 
 S = "${WORKDIR}/Config-Tiny-${PV}"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tgz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tgz"
 
 SRC_URI[sha256sum] = "b2f7345619b3b8e636dd39ea010731c9dc2bfb8f022bcbd86ae6ad17866e110d"
 
-- 
2.43.0


