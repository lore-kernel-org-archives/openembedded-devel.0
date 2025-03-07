Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B06C282DE
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:24:20 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.15334.1741364653971470551
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=O8e8FnxF;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so3967909a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 08:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741364652; x=1741969452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2aC/XmKZ6DnJO8umY/rV7tIOs0cqYnFv2PRpnmz4Uo=;
        b=O8e8FnxF7GkMU4Klkq29WNO37MjOya5b+DWl3CfLDEqjNU8bMaAp7k7cXLWTFNTLCO
         ty9Ti7ewsRYY8QybNQKqy2scYYWGv2t2CfwsxjoIHQ+Hsn3c9SgrKaibqLkWvjTreK56
         KYf5AZ+5LEZhPSmtbvlIC0nRotNLxyF0ztRxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364652; x=1741969452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2aC/XmKZ6DnJO8umY/rV7tIOs0cqYnFv2PRpnmz4Uo=;
        b=Bdv/FBeaJV9bVEpBKCX/dUzKl1w0AUZ9i58QEYkSgSXvZE3psH6/+nclTfr5rcL0J4
         rPS0Xx1dHHrIRrdfKi2jxyWod0RbOCqatqm4GdDeBobLkiDHyBUsHQFkLOxMlRMYOb+v
         jLij53sFucWAKKBjvhElwZSiNkRvC3hE6RybaiHMyBhaJ+h6fEHxL6ZWN1ajkIwNKHy1
         r0XIEzShuY8F5mh0RND9R4ar0z0QUFpe63QgYa52Y6g1G0V7LhmbqUoerd2tCyKbMrc2
         UaVNAd/uKU7KWTwe2wBASas9k+1/SzQH9yIUJG0dCDPHDEPj8wuE9Q4gISHpvCqwTNEE
         hkBQ==
X-Gm-Message-State: AOJu0YzQ/NONeMJX7a6iRNpVD46PZYMav/ISjvHdc3nArJDhRlAfnCW1
	8+rtlvgFb10AI4Hh8AkXS/p/ckj4e+kj+NDoebM/5UV1vlUGBLbYqqm1IYoDnPQNWg5XKqQPTej
	G
X-Gm-Gg: ASbGncsS4Yj3DcgNeV19pTrnTSwLg6dZ+MFVDwdp7AAp+FANCSK6RtPMKDRilsCs6kn
	e0NArVG2osHogebrsCCYH5fBnBFh0fk+bVXoaqnm89Ln6klZRJ2OOIL9QioWnbBzrPv5kwGBwHV
	MLIEVzdvngeLd6BedOH1nhKKmj16/baqiP188sQWeI6IwP/4NXKTfbngtmd074LZIqB7rhi4jyr
	TvrphZVb/W63cCxPwwQCOb9TtJf5ORC3LqO2g32ZVD0JGKAGw2eONhPs76lEW6CULrQP7K9EDOP
	cJy8ZA1Gc76afWppCHIo7UiMbMLPfNrcbh0HduQufiYdp2CwQzO6AvLrGNY=
X-Google-Smtp-Source: AGHT+IGzfdlGl4UMgiVGTh56pCGnnCK+Lwuro4la60jinW+v3ZNSm1aCoaN069p3O5dd+vP54UiLNg==
X-Received: by 2002:a17:907:74c:b0:abf:4550:9764 with SMTP id a640c23a62f3a-ac252b33560mr478584566b.24.1741364652106;
        Fri, 07 Mar 2025 08:24:12 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438f9bsm300831966b.11.2025.03.07.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:24:11 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-eventlet: Upgrade 0.39.0 -> 0.39.1
Date: Fri,  7 Mar 2025 18:24:08 +0200
Message-Id: <20250307162408.966423-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307162408.966423-1-leon.anavi@konsulko.com>
References: <20250307162408.966423-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 16:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115792

Upgrade to release 0.39.1:

- [fix] Make LightQueue and derivatives subscriptable

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-eventlet_0.39.0.bb => python3-eventlet_0.39.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.39.0.bb => python3-eventlet_0.39.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.39.0.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.39.0.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb
index 99f11b104f..08080ec2ad 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "01ba0aa6ee2452690fc02b274a2409598a13b997c7b5af9dc66600fa42015a79"
+SRC_URI[sha256sum] = "4a8a6475282d4021edde06ba335228c230b911b8d014577ddb33114c2b0c0510"
 
 inherit pypi python_hatchling
 
-- 
2.39.5


