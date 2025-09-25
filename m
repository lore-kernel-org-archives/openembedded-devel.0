Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378CCCAC5B7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.9710.1758801837414519937
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UYrYqdil;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b256c8ca246so171788866b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801836; x=1759406636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqbb2H6evvSt1B7gLwf9jsaRw8nxfx1X7ahQsSNmLa4=;
        b=UYrYqdil8S2+Q12YcW+e3f8j1QrYl+lwgAkzeHgKQm8QSANxKUscKo4+vBejUGatN7
         12pC4LdnVbV2idry0bpdyt+tMojQfuKBENPEDab68MFV+QFGPgoRl4qWdOSl8nCaiaax
         4LSardI3qs4i09yP7lMNENH4O8nGEkbo1ICKI8Dhnv55JOtPIyUeSPga3RJgJUukVkKH
         7CAU9FbXt/4VRYq7UBblwml9yRkSlF6Raq1dttERxOziaJpTZZ7dNgtkdtry5aCMVCRj
         y6Is5xu9iEkz1/jGi7tpnguLaAWQGFhinAWy2iczxzXkAP51ZlRdTr78E1uhnG8zAiyC
         XwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801836; x=1759406636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqbb2H6evvSt1B7gLwf9jsaRw8nxfx1X7ahQsSNmLa4=;
        b=bP1sC8e7M6nWmdvYebBBWjwvdX9952cXVY+XqafHTjxdFuhn8IHvCbSinUni3MuF8c
         ipQwHpnjgSBvQ0Kfaj3ygEx/yclm/BFi7aGmz9/2/cqCNBRJ2CkGgexgrpvZ0Clk1eTn
         KNjeLledAzfGI+dCFaEVQ/ZtDGx45yLRwXdf3qRYWlvKi8Jq6fJxiFIxU6vA20I8O28y
         UxfaYlnBu555R2wLlY6dUp7vkveHVwbpnKozdbZYblsKloccSxlPBXoQW8lmvl0nJsF1
         KZmZs7aE0P5woS0PZb2dHNu4qfmNyEy4gTnI5aC6XFmo5zj+Nx6a4nlRbaSFv5fjpg2G
         tTFQ==
X-Gm-Message-State: AOJu0Yw4IRuZjsyyOKqphiDEk6ePFXtSm47ZNr+h/6CjTLhMigxb8rSl
	YlEa3fNOotgx6z2aC/uHYcbSrI8Va90zK3yKA6Xp45YsCRckhPb05xjaEvDrFlkG
X-Gm-Gg: ASbGncsQkx2rreJHM/3h7PQcNs5qBGDqs1DrrfZQ3013w2tTFgihjNNp6A2vQEwZIu3
	EMuyx3hWwOLK/EGjru0G9CSqr9r3XLeEAJu2ZFV6nE0aa9u9vcsNbM5C/ef2rSFfRzIdu5yQO5u
	qwtI4uPGwI9EaTAG1UmyzVP5y8jOxu7yZWpDdQI8yt1mDoonYnnTwrfcFjpZqkG64lpKzNNKSs8
	diXcR5NX2+7lu/A+A0c0nF/6Q8sVEsmkgUFPOFI6tadN3Sf+XRl3qf/13tkrxun6+iCA4D5D083
	472KXDs/k5nQgtLF+4RFgW2pUAL6YzGv6RuQFmdoHsUpY0oA48rdy/01cJNa08S5S4uHrutFrHF
	Ipnj6ShZsfU93pBblkCek
X-Google-Smtp-Source: AGHT+IEIl2FyDPRg4h6gpaWH7T1tGdwEZCP2VjGm04ns/UjsWYxnIpGhavsASKkPLq21tSjj6+Yt9g==
X-Received: by 2002:a17:907:970c:b0:b2d:e514:5348 with SMTP id a640c23a62f3a-b34bde10157mr370951366b.33.1758801835580;
        Thu, 25 Sep 2025 05:03:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 15/21] libdvdcss: upgrade 1.4.2 -> 1.4.3
Date: Thu, 25 Sep 2025 14:03:27 +0200
Message-ID: <20250925120334.1670367-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119875

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ec8615001521dd485fcb1b68a9453181d8d81afa)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../vlc/{libdvdcss_1.4.2.bb => libdvdcss_1.4.3.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/{libdvdcss_1.4.2.bb => libdvdcss_1.4.3.bb} (76%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb
similarity index 76%
rename from meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
rename to meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb
index 0b472b81d9..42c771e0ff 100644
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb
@@ -9,5 +9,4 @@ inherit autotools
 
 EXTRA_OECONF = " --disable-doc "
 
-SRC_URI[md5sum] = "7b74f2e142b13c9de6dc8d807ab912d4"
-SRC_URI[sha256sum] = "78c2ed77ec9c0d8fbed7bf7d3abc82068b8864be494cfad165821377ff3f2575"
+SRC_URI[sha256sum] = "233cc92f5dc01c5d3a96f5b3582be7d5cee5a35a52d3a08158745d3d86070079"

