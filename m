Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39BBE7718B
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 22:58:12 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.15861.1734821890021985197
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Dec 2024 14:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ffDSiD5M;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aae825412a4so222171566b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 14:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734821888; x=1735426688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AluVhUKvc31RtrnAQ+dLEj5AVqCnGy+8lgJVHwR+ZtI=;
        b=ffDSiD5MQSaLZkmOZXcrDkJDJGazHoE0sxyCLNxr4PLXCKVXveMDitLL7q++s1OTti
         PJlX+hHHcC9gh3HN7fAdhGICTiZSC9S28bnJi1Bx7T2+nj22wdUrrGCB6ij2VV78h3dz
         KnC1QqpYVqzc58CZ/JlbrfN1EYijq5q14omfJFeXsmME/GEqbRNXaysf6xMXAQkOomY1
         NQyyNhemJKv7iVNHkuWjhD8IQRWqNC+KBgAPIS8ERckCkyWl5+n7kOZZhP2z/KOVGphI
         fewJtk/TmvhvDn19pqTwYei+RExrVHk4HiRN589bXNvVu3qTRtW/j8Z6rFmMkEzaO/46
         r/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734821888; x=1735426688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AluVhUKvc31RtrnAQ+dLEj5AVqCnGy+8lgJVHwR+ZtI=;
        b=d3GL4mRe3ByO2aKPuPOXhfacspId0ZX2n1LxYGeolZ+ipImZtqj4wlSgU+yYUpWBWT
         OLLRaLfQGSf9Z7rd47mAF/De+WQJtku99AQSfN0HC4wk+vMTVxNGuBTXxvkYBCxIoRwZ
         3xx1/G7mvRK7n3WtdLMVuaMjB0qywH6ZMMavS6S19PhggZBv94nbOBTFd2RL8fWH34Ji
         GJqrOrQchA/t71GJyQfmc6smmUMU1EZM35FZR/5pGOi0ceQCB6gYeXt8eU5Jk7N+TQzb
         1LMb5x++9+aAOgHjXa2UdvPPVyNviildcz0PS3WjOTaOD4XpWJmYWAeLh0XlCA8dkEXB
         yuGw==
X-Gm-Message-State: AOJu0YyLLCHxd6V9sdjqh9CvyTXCxNqsJ8QhAq4OP5Gya2uVMCaoK5V2
	MpzyGKOMWa6JpesxTUiW+Cl6cm9GgpUDBz4CzKxa7kiEufohoGMUGSNjXRW2
X-Gm-Gg: ASbGnctZcoLyqjZTgdsdiKMBveaOZPtEjY0pRE2XMWAmsf8zEkVDsPfdmZIZL1oHh/v
	d20kGN3jZikQ+Y+W6K2dTL76I7ELjalCYNEh4TXmHEgP6ntmwtAW4Yx7ozih22c0XPaxWqrZjhh
	+cZYFBbLN4Pr1SvONsaVbVrEqbDiTXrdBrVAwCiQvgKTHkTFWZUWumoMWmL/BDlBXSZZL7ul700
	PO33OrGe2LGnSH9fLPFLXrmMpjjGU2j9mmiHLU8XxmHumfMcEJK8xOYAX7V09bv+bV3EsWatBeN
	xe1vW4QMsF7AmNz6n/oPkLHZ+HSFNKy9fq4=
X-Google-Smtp-Source: AGHT+IGZKxYHOIWQ6LpQfJCaTb5a+7M+vt4ydhmGtQ/ce5vLsbn/sQfXr6otKRJGncNuWNZjeABlSw==
X-Received: by 2002:a17:907:7288:b0:aa6:a9fe:46dd with SMTP id a640c23a62f3a-aac346507b2mr691086566b.38.1734821887620;
        Sat, 21 Dec 2024 14:58:07 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f858sm330717666b.21.2024.12.21.14.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 14:58:06 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 7/7] python3-yarl: upgrade 1.18.0 -> 1.18.3
Date: Sat, 21 Dec 2024 22:57:07 +0000
Message-ID: <20241221225704.2712991-10-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
References: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 22:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114457

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/{python3-yarl_1.18.0.bb => python3-yarl_1.18.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.18.0.bb => python3-yarl_1.18.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.18.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yarl_1.18.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb
index 8cf74f1fd7..8db97093c8 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.18.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "20d95535e7d833889982bfe7cc321b7f63bf8879788fee982c76ae2b24cfb715"
+SRC_URI[sha256sum] = "ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


