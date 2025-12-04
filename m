Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F88D1F9AE
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 10:26:04 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40295.1764843961562029913
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 02:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Yszucxia;
 spf=pass (domain: konsulko.com, ip: 209.85.218.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b72b495aa81so108395866b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 02:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764843960; x=1765448760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLH6N4gPHhUhmcQBMXaLx3q1TasuornzQCFUz9vwXww=;
        b=YszucxiajixZXbs/FDJcYugAb55+R7Alhiclni/m0+H/NkfJXqpMejpdXhAx+snyL9
         0o8bfM/eOl9sMyAs3+0MVVIk1CoelOtSbkXEr6XLt4i/dQhLFu3NczBQOL3o1dTLJAZg
         fSakLF1hGGB1/ZcovJuIt5h0/IdRmijV9iGR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764843960; x=1765448760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLH6N4gPHhUhmcQBMXaLx3q1TasuornzQCFUz9vwXww=;
        b=Fdo5sgrq++X7k14W+do7IV5IVoZ/THzUfmupgYWyRbxk11q5a5gmKbDoFZbfuz6Sq2
         XoiiKMSa1auT4wZUnqEOp+ClH8YfxzJ1GX9JpM/hL/ceQ5rdAVVWknwpIOl5KOtAEsYE
         dOtp10QOL0ckZj0trO+liSd/TO+yPtWJtfODnpZGI2cnyxqniYyE8Ye6qmJU0Z8JBAed
         U1d6de2MbwZ49OwQdxnO/5tMrhy2SIn+AvUSvsTUW2DSzb86vfseEZcPtCUcCD8lBwrg
         n5ldRAdbhYCEJ1INiYMn4ge0Ob0/vVD2MaWUA3gtAAoyoiUSX8x9VX9+tBuTACB61GbF
         XrGg==
X-Gm-Message-State: AOJu0YyTqOwEsilKiUKrYGxVFbrloZNMCxInNTXshc9Md9/g+3aOg3GX
	EgRWh7Pu5RIpaAA4NSI2dGbqYG5G6UDYcaUXC6e/P3zKct+TzPZb2P3SbFVR4TMoiaywxhoCJf+
	xq5+2
X-Gm-Gg: ASbGncvT1Y+qkRbKaW2b2yhaKe6eDtfxpbohVMBojmfkgHpwplPBL8mYs8kgTzPKQgu
	Z7ozINsT73q5Es7QR5G+GUwqAOJUdsezEYuFoaQeutMsUIKPgmJz+IdS747HPbMHoLYSGdYsO+R
	07+bjnYz1WCLOEuFYLr557G2RZNSwkM6pNo0YfIdDhqnd5dfkEj9zijo1AVWbCHrMMqB5kIC8m8
	cX7xrEcWuxzW6XzcplmyYiKP6lDjSiarv6cnqojsDKUYV2bmyyl/2Nc9/ow/5jistbvxeiHukKB
	dAShUOh4JjMOdxhRclK49rdUbIlHJpk6jFqjfMUosWuPlTsHOh9JpI9LR2isS7ZVmURiM97hcdR
	heTyXtO3vguya1QEsGpp038L6cbHmRiqJmeZ78+WRmjgHwsM57z//SnZsX3rYwqJMK/wZJhzZjl
	tDsM9/hNjO9KAn/ah/1ICvGGxb
X-Google-Smtp-Source: AGHT+IGavfDf4zu6lAxe4gNxaFEgTsfzps+GViPSfc2lFASBbDcH1dUbTRdwKAwKPXftKueYzCRgBA==
X-Received: by 2002:a17:907:3c94:b0:b72:8e31:4354 with SMTP id a640c23a62f3a-b79ec49e5c9mr259399166b.25.1764843959552;
        Thu, 04 Dec 2025 02:25:59 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f449d0b9sm98826366b.28.2025.12.04.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 02:25:59 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-autobahn: Upgrade 24.4.2 -> 25.11.1
Date: Thu,  4 Dec 2025 12:25:55 +0200
Message-ID: <20251204102556.1702492-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204102556.1702492-1-leon.anavi@konsulko.com>
References: <20251204102556.1702492-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 10:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122316

Upgrade to release 25.11.1:

- WAMP Flatbuffers serialization test coverage; WAMP message
  classes refactoring
- Add WAMP serdes functional and benchmark testing;
  WAMP-Flatbuffers; WAMP Serializer Composition (transport/payload)
- Add vendored Flatbuffers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-autobahn_24.4.2.bb => python3-autobahn_25.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_24.4.2.bb => python3-autobahn_25.11.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
index d785a76cc7..69613313d7 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
 
-SRC_URI[sha256sum] = "a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9"
+SRC_URI[sha256sum] = "52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1"
 
 inherit pypi setuptools3
 
-- 
2.47.3


