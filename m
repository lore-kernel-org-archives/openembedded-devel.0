Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C18D609DD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:26:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.69766.1732706785386936750
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 03:26:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=T60GYbQZ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so11763405e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 03:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732706784; x=1733311584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlExFZ6/gC/sU1TLugdtCFIN5ohpcEfim8oPSKF7y4Q=;
        b=T60GYbQZdP+LcAhRPBRxmW52ASZ3w7bajx/hwYjzmHQ2q2C75fcbeugh3vVioLwAx/
         e7KVXwykzHIaq1wAyRSsx/kgXPDvQ5MU3OnRYymUZUQiPH0cJID+oJJnkq3bK/+jLvqU
         ayEWmHT3EPVH5doKApigldk6Svvyu0Sj22CDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706784; x=1733311584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlExFZ6/gC/sU1TLugdtCFIN5ohpcEfim8oPSKF7y4Q=;
        b=onnPE8nOoBmUW3CJ50fcykS1N6+nLReAeEm37yo90klTMCw0mz9/tT0D9UxuGTGQ/P
         y50/h4RXpjl5Ce0UlRH4WKF0Moo0YHO44H5o4tNcrYeQKaA3FoZuLBPbDmvlRKr5JbH9
         wcpIN4qxMU3fsKvk5AVkbkeZ3gtlCHOjis/1S5+nK6ujZ4XNamMYC2hbYdeN8ZuWyUYR
         pb8aREQobZlvNnG26PiPIT/WCNsdQdeMoBJ9/Em/338vAbNCWpiwyay2/BhX7YsIsJvy
         xaC9E99bpHeraQ8XILACP6AcfFmlub75pisMnzdblZQ+7OOMr34Um9+Zj2BlOIzILUcX
         C79g==
X-Gm-Message-State: AOJu0Yz1GD/5TF008FpbI676tMuOpamp3BWH17spSZtbXUc9fTYW7uQn
	UA6E8y20qnI8wucUO8zfRrNIkEKqXzYQtKN3nC+WWLGoLYtuG/vY44gHGEdbSCpQAct5oXXgCea
	H
X-Gm-Gg: ASbGnctTNvjoMSJt30xMuuPGPOhn6HOFc5iAmCyrxbIHOInXltkRLRuYSSqoyJSxOXq
	TOtBPrIkoepC6RFN3E4KpRru74t+unUOSWfQfIUMfB0LHPoKE/khfgJK8YYE/2gz0xLqkc2CUdF
	aXXgDgu/grYe86KwVka7r8xdMqqtDb3Jk0fxfOQRC00n5W1ZScd/a7qoWa1dJ7WOw5gOHqDUNd4
	ewlHBegJytC3akGvU8yTF21TWWn2sByYLwCNbDJEINgBzMzJhMp/DwQXDKRJnmO
X-Google-Smtp-Source: AGHT+IGHIevsX0uisbz+lEZp9yUvHsriDxfYrFM+KbNoaFfn/eXPvHz4p13tYbMQK0FbufiGg5UJ4w==
X-Received: by 2002:a05:600c:1c8d:b0:431:4f29:9542 with SMTP id 5b1f17b1804b1-434a9db845bmr21921445e9.6.1732706783644;
        Wed, 27 Nov 2024 03:26:23 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5b9csm17951645e9.43.2024.11.27.03.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:26:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-gmqtt: Upgrade 0.6.16 -> 0.7.0
Date: Wed, 27 Nov 2024 13:26:17 +0200
Message-Id: <20241127112617.789120-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241127112617.789120-1-leon.anavi@konsulko.com>
References: <20241127112617.789120-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 11:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114091

Upgrade to version 0.7.0:

- Resend QoS queue only on reconnect, not periodically
- Fixed server_keep_alive
- Try to use github actions
- Fix github actions badge
- Added the ability to pass your logger
- Properly handle already encoded topics

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gmqtt_0.6.16.bb => python3-gmqtt_0.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.16.bb => python3-gmqtt_0.7.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.16.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.7.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.16.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.7.0.bb
index 20cdee80ff..f4dfaa345b 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.16.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "ddd1fdc1c6ae604e74377cf70e99f067e579c03c1c71a6acd494e199e93b7fa4"
+SRC_URI[sha256sum] = "bedfec7bac26b6b4ce1f0c4c32cff3d663526a54c882d323d41560fc3b9b44a2"
 
 inherit pypi setuptools3
 
-- 
2.39.5


