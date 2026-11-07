Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11971.1794070364038118760
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kURTQKf4;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49465892f7bso312846f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070362; x=1794675162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1Mig811Xj4RONQt+UuA2UBjjkFqb/9MQZG9sM2862U=;
        b=kURTQKf4lYPB/EYnWdWglRJSH6GJscrpEwbuH85rm6l0KecXp4lklDVLKzdO1qxO/Z
         fcml1U8GGpdZMdFHzVAimgx4BDmD0l3nou6cFt0vv7YPkkOqMYvADyPcrBTK5X0CnRip
         kQw81/SDdVqIHfbRMH9mYybJQYTyNDi7kZdzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070362; x=1794675162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1Mig811Xj4RONQt+UuA2UBjjkFqb/9MQZG9sM2862U=;
        b=zT2+Fx6k49sic2kEPaioddEZ/KYtvpDhWvDxMLwjQ/8G9oYFVujKrig8Xhzoz/tQ3N
         RahnJ+731yICNaer8Hl5rylXgZB92/Xo/zMgv58nAXujcZzC/dKX2zaLTnTLsU6q1JsY
         RL6WWu9C9phSrcO2DvI6xjvQoiot7f90b/eGomuxmJol7hcbb6x4CPxZcXErg1GKLxZ3
         /Uxyfj2yxS0MP8C+np/r3gnFHQMC58AyM46nXVrPto7BFgn1Ori++FHT3YrSd3zVCGNS
         9GS6LTJtZzeYbgcSxes1AS1kef/VLas+LK0f/AJQy1aB7cunJTOmrUhze6PMkLGSStkN
         1kIQ==
X-Gm-Message-State: APuU4Z8IGL90s2+FXidv2Jw0gARv04iZvpPhEkw8KLhrDSK1JZZRacJj
	yWLJkBRmUQvnlfnj21KcRNXWOGo6yxjTH1pM5Wyi4KpI4CDrlgVd/Z80BR4eCzKlyLlxRrQZcXB
	eW6ww
X-Gm-Gg: AYBFou2CIAo7pZ7DiKDxLm5oWz8Hs1AMwWZpqiIIyrpeek5ABkvdstZKmGqhDO1hdd1
	bXf4AQWzYQA8DQrYSNx17QQWhAVMXVezS62SFKAoenlXrXJTTYACbEputxYg2xVcQKG/XwXCh0L
	OpdruASxy2EqqiEoE4nbRVGmzgaqmpf8iHsYOmurZvQsmWuaAXOyEMBzio7urwSVlXCEADxQjzT
	g1SCVW2AyICxNfMgcHxPMNbyQmsNir9+d0MLG4u4iZaRJWCeYYsWXCCTnF6jgn4MG501/llG402
	cO2T0jhQoVjeOgMinajNgxFVmeXuQcVECKkrt2SHTPLQzWZDNw1NYzLiJvbFnFS6X/Q63rZg0NU
	uwYlegnOPBeKLpvn3Q7aVqfjPlvQDH2ucJlGrbrNV2lm+Fn7jBMKKvDLLV1pDtLVARUhXkeMulT
	/pHa4Wh6/uRUuPB8ckuicfQ6lIgL+07iiCLH4eBRyyUFId/i25LYbSSJ5NJaBURH88Svv2p0sgO
	Zw3tx8JbgOImY7QEvoemt3m/VfKaEz6BGT7nia4Dyx5FU3yMiE7tihkyavyFyLNCV0uNG4+FHzY
	XN9oQuHaybN8TnvOkXsL6grhPGXCWX5OvoI8Ach9UT3RVoKbTsI6AOgymRK7H9Z5c+iSBvTzelB
	rt21gH3NRjSFAK/PQ04cC4WCjwBsGu96bwwTFuqOkqYNabFLNdoR2Bg==
X-Received: by 2002:a05:6000:40c9:b0:48e:6812:5ef1 with SMTP id ffacd0b85a97d-492765a3fcdmr13553227f8f.25.1794070362341;
        Sat, 07 Nov 2026 08:52:42 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 19/22] mbuffer: Upgrade 20260511 -> 20261024
Date: Sat,  7 Nov 2026 18:52:18 +0200
Message-ID: <20261107165221.122340-19-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132004
Content-Type: text/plain; charset="utf-8"

Upgrade to release 20261024:

- build fix: dependency generation lacks CPPFLAGS

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../mbuffer/{mbuffer_20260511.bb => mbuffer_20261024.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mbuffer/{mbuffer_20260511.bb => mbuffer_20261024.bb} (90%)

diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20261024.bb
similarity index 90%
rename from meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb
rename to meta-oe/recipes-support/mbuffer/mbuffer_20261024.bb
index 1a498286ed..9174f5c0f6 100644
--- a/meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20261024.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
 
 UPSTREAM_CHECK_URI = "http://www.maier-komor.de/mbuffer.html"
 
-SRC_URI[sha256sum] = "13bab36f39408f7a08fb368913290ad0f117c934bab602094e18fcc123ec5783"
+SRC_URI[sha256sum] = "ed9b717f9517b0ad0a0c1fb42c809dfb615db442833b7b5c8442e224b45d86bf"
 
 inherit autotools
 
-- 
2.47.3

