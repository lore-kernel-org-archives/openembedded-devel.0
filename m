Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B912EC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:03 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34521.1790506263542993814
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e3dS9Evh;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86212a185dcso1582565b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506263; x=1791111063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATl7jJVgspeKWLT8RBC/buUE7iXaEQ4Ymbrkiy+ZBQE=;
        b=e3dS9EvhFPrhY/AuCQagkLLLsjNp+oFhXucxlxfvnOZTJsMtivYyuQPk/mo648j3wT
         aOrlskgu12Wxwl+ZM8Vko/vhdZ8GQjrlau3A68TjQK5ZsEvTEr/qIfYp6ViZye2M8sJW
         TMOgeJY2QI0NBe7Td/v20/qu4bA1Tgb66ncTNqSm4Sg3LnDTGVGtAIFgALqAyTAuz+b0
         UaCiZKlAgH+HNpdVisPicgVu/Czie/YUuhv8/bbkHbxwt2b5snZspGujAY4VeFFDB9I3
         YMfHkzuOA4KHnPnZbgSyAVXL0bA1p6ra6l1SmeRnz1O4CrSu1+ZCLui8Lo5jZBIUT0A4
         WcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506263; x=1791111063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATl7jJVgspeKWLT8RBC/buUE7iXaEQ4Ymbrkiy+ZBQE=;
        b=ymmfXtBiZqI/96+ZMg8sepfv6MprlaYv+J3AqX4bN/PLiUxwESnG1qykjd1+EKkM2p
         dWnrkKWxdMydrXvxj06wMa7c+UejlxPKKNb/U1zGo0/6tgXWYmCF3IjXXwwhBxuRDJqj
         N0GIAqs829IOA7D75palMmQBvzA7jehWfWTHTOUusu+lcrQlzt0sO5+sSepN4u9z1GIB
         /L7MpW1xY1yaFlKVEAf98HU7Ru5T8XzI7ilvPrniR/KGPDa2jVULIFg7ZpiQ6okGgVSK
         fxFiZekjKcuw5hd8TCSXDviYnqXnf0heWEOxeN4EtOtUboAIxicgN9EGtZL5GrGXslIq
         sJUQ==
X-Gm-Message-State: AFuF++kKlKjjL2JATRIsJpOxX9bNfKdGN2ud1/Tra0SnuBnyg6dJQQF9
	kFdbdWcBdEIGOwgjzlxEK4ny0Gde2sErIetdmFgIrpBQCyXAimeiBM8aKI5oHw==
X-Gm-Gg: AYBFou1y8UG4aRIhcruOTUrVOvF4tKq9duUJ9IV1pdCCBLbNecRQNDzSycnCW1Pc+Au
	ieEY/M9ByufoDSHNFtUxW/43osc+uy3gkZbF/MGoj0y1yWkBspk8xz9vR3KKYoG0UPap0+uCZ/a
	ZWXcLpFYiHCqjk9U93XqAeiXdnSDERb9jnBoyzY1nNzXZgN+Ge4ayP3u50+KBo9JkkQv5OycmPv
	EJqOn2migffXIJHUyf/d0NO/9PeUIrw0FbsCPGhXxQhpiLdmqOtWbWB2KChG44hocoPxmvk2vG9
	y7yZ7GLDeIte/gDJz4VcWrozhbcNzmy/VcyDla+liLfe4ldhesehdeRYZAnl5ZTfmf+DGvYsvhb
	T+lcoCpNCIvaZTNg05Q2Va2yGz+Q/R4qysMJ8zXMaRrnC/5fzr5Kg0Gqsm6XLHSSwksR7tlLVje
	DxHR/F/2swx5CdU7uByjAmW4Ts7fMhYlWwXFC1gKkJBoCv1xfRezQM1fXaNuwWRQiHc5pumqGzj
	0kWTNI8KaM1Qdc3U0aFWj4=
X-Received: by 2002:a05:6a00:1bca:b0:879:27a6:cc5b with SMTP id d2e1a72fcca58-87e9c543038mr7930111b3a.6.1790506262964;
        Sun, 27 Sep 2026 03:51:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 20/35] thingsboard-gateway: upgrade 3.8.4 -> 3.8.5
Date: Sun, 27 Sep 2026 23:49:47 +1300
Message-ID: <20260927105002.1832451-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130354

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/thingsboard/thingsboard-gateway/releases/tag/3.8.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...hingsboard-gateway_3.8.4.bb => thingsboard-gateway_3.8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.8.4.bb => thingsboard-gateway_3.8.5.bb} (98%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.4.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.5.bb
similarity index 98%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.4.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.5.bb
index daa6b29a57..8dc725b445 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.5.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
 SRC_URI = "git://github.com/thingsboard/${BPN};protocol=https;branch=master;tag=${PV}"
-SRCREV = "a735a2d654a218c007b5db7759ceed44794253f9"
+SRCREV = "c51e032432a1f9fe8fa47af9683e077da98e41c0"
 
 inherit setuptools3
 

