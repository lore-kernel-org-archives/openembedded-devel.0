Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAC8C46CD3
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:09:16 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.48805.1702919353947472881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nDZXnGHj;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55114c073b8so4233240a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1702919352; x=1703524152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az33UNTpccNOUJwZanPF4/RSYaD3m7EsWT0gBLqZnnU=;
        b=nDZXnGHjlXQsCIMBvq/19deCUQKAmLrVvflswX3e/kU89y0KblNG5hGKmaBSBT8jkB
         RQ9LrCiyhWjWhJvPsQWGOOauTMakE6YqLRb1Yk1GhIftBRvFHzPDgpijeJOiEC8zW+EU
         aHxw99qftDFtyEjAPVZoD/cB5A8e9DzUMpZAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702919352; x=1703524152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=az33UNTpccNOUJwZanPF4/RSYaD3m7EsWT0gBLqZnnU=;
        b=exKaSaTyHtZhV2w6gIK0n7eIApm6Mm7ni8t8v1Rizb1lzid/GDmyhNSeWxegTh4UWs
         R5YeOF2+grxIv+GAppU2bKndJcGctfc7r04RgDioWrVhjitrEyP8msxkgTWQNF6LJnog
         3QmzSR5IDf4mg+NbYATOXcD+3Dn8/Hiv/fexU0jpZ6uneJcNUvyTwNHNAt5ZOKzabysQ
         AIjYz3uavYqi9Txx50eFOWf0oS33MGJaQTiGuFPaRp/TWADzSounGMoOojuuHrca0x1v
         EizFTNJcROkgrj6aT20lsr8UCL8TESDqUpTGweAwimGqyDekXfk05ErmR8RyaC1qkWxf
         qI/Q==
X-Gm-Message-State: AOJu0YxrTgjb8HZdhPmTahzV9JR39/kJSFF2iW8ubcQ0IPd7+PC/yLPl
	LLJngoNZA6Pl3crr3y9m6nL4o1/w8Z6aazHXBNg=
X-Google-Smtp-Source: AGHT+IE1FaRNfn7j1WTud2YLIkbGmilxDL52gxL8/ijA6OfEEnjMWwpimP+bbRlLxB15ujvwltEyIQ==
X-Received: by 2002:a50:d514:0:b0:553:2fce:a5f8 with SMTP id u20-20020a50d514000000b005532fcea5f8mr1092950edi.106.1702919351957;
        Mon, 18 Dec 2023 09:09:11 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d12-20020a056402000c00b0055344b92fb6sm1380419edu.75.2023.12.18.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 09:09:11 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-zeroconf: upgrade 0.128.4 -> 0.130.0
Date: Mon, 18 Dec 2023 19:08:59 +0200
Message-Id: <20231218170901.1378254-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218170901.1378254-1-leon.anavi@konsulko.com>
References: <20231218170901.1378254-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 17:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107546

Upgrade to version 0.130.0:

- Make ServiceInfo aware of question history
- Small speed up to ServiceInfo construction
- Significantly improve efficiency of the ServiceBrowser scheduler
- Small speed up to processing incoming records
- Small performance improvement for converting time
- Small performance improvement for ServiceInfo asking questions
- Small performance improvement constructing outgoing questions
- Scheduling race with the QueryScheduler
- Ensure question history suppresses duplicates
- Microsecond precision loss in the query handler
- Ensure IPv6 scoped address construction uses the string cache

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.128.4.bb => python3-zeroconf_0.130.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.128.4.bb => python3-zeroconf_0.130.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.128.4.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.130.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.128.4.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.130.0.bb
index bb3a163c8..8ae169c52 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.128.4.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.130.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "57590a48e36897a04ea4b1a41ba6bbf833637b99ac6fa9530a2f70783d916c39"
+SRC_URI[sha256sum] = "db96a3033bc2ece2c75d873796e82530e092e250d03d07dd530828cf84ae16f0"
 
 inherit pypi setuptools3
 
-- 
2.39.2


