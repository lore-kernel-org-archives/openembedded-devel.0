Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6D3C2A097
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:47:40 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61629.1767610051028798451
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eNamvRnU;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so15632878a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767610049; x=1768214849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu2LhFslQtgTt9yCPdp2hTynP3aTnZfMDhDO9W3yucQ=;
        b=eNamvRnUuzhw7W+kBrX+eTOdW19TNx2Dk4I3/gMnx7CM84kWc7BeTUPW+qLdtWf1Yv
         OYWVphEG/tsZYc4jZ24dE6v+mceKNTwvaLVSS42szTxJi5f1ZSP9dbwwRAWDzBBv2Q0Q
         dI9M8ZhBI8xBE7OutTPE2bdlKfMCs5jgnSQS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610049; x=1768214849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mu2LhFslQtgTt9yCPdp2hTynP3aTnZfMDhDO9W3yucQ=;
        b=L6DeXofmAHDc4g4ktweWAgkMpNbjcqGFa+PESfs6OckZlDUqxVgK//SjfeYjkeIcUs
         O3XTHxXrvnoqhSbL/RbwkR0Ge5a9kvpGPuWH82ABuC++GeiH1n4AImPu8sUeZoz+64sm
         tWOQUDPhyazSBScNuIeu+m7c0IOWMIvTSjttLQ5kxPn8rcJUiJJkpOlgI434et0cT7a4
         lweu9TLXMFXnGoXzeiyoSrjjum1oLCQtr0BE8i9W4CuKcCBi9sV0AbUMOvq2JYV7C+3Z
         2BJHxXDME83t4CCmyepqsnlYlH+wBgjAb/FG2cFLMpghmjIlIFxVyMjj2D1WZ9hivWz3
         +wew==
X-Gm-Message-State: AOJu0YzHgxOeUtq3wAgzaH3dBsrlMvWSfPeI6Q4lEPtPBUNajcM28mV4
	qXop+uAC8L7CHLIDGAnXxbEESjjFqeqFopXVhEsH8KDK3+kdUM3tSE4oOEu7W+OAwuq5UAE5RHV
	HnNe3
X-Gm-Gg: AY/fxX6WNAkksBOyTWsqFX5xrVHhjzKxct4/G9js7GKMgDcCrInnw9AiHucBEuxzYRg
	zb/QZtVs0jtsahQuqprpPjiRoTIk1eT8Xcr/VZFya1uAQoxEMvJhxDKljmz0qwmqKrYZF9sBf1t
	MsvV66HgcAxQzxeI6nwa5/2jDIQpFyK7I/PfYLSBApODMyup3VhomnjXQuGPP5srWezO7OAwr3p
	YubszHvRskcVFJnVtEusRlsh5qi1TvRzIH12Wpk3fk1ZM099b126sgaIK5z+PHowFe4RGsdtFAh
	+zNisVud03RTSKXbXxXC173Omr96QAZ376B6KNJAZYzlUhkw/uT+Iwu5D5mDewge2ghesyMHygj
	4vRTz1mc35cC6xciN3kwiUtKr660nu2w2/7JrP6FOh/0O4532KeW5g5P7jeK2f2B6ssFwEsm/go
	NaKnffITdjZMpc84/zqMss5RsA+8ONTaVFpI0=
X-Google-Smtp-Source: AGHT+IE/xyTFKC6JaF34lWUdRjFZeEvBVeNACKom2g73JshFygze4zz1Y1zQkxYV27Vvm0Wp3QwX/g==
X-Received: by 2002:a17:907:3c87:b0:b76:3476:a83c with SMTP id a640c23a62f3a-b80371d7dcbmr5151338966b.40.1767610049065;
        Mon, 05 Jan 2026 02:47:29 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de1421sm5591905666b.41.2026.01.05.02.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:47:28 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-filelock: Upgrade 3.20.1 -> 3.20.2
Date: Mon,  5 Jan 2026 12:47:24 +0200
Message-ID: <20260105104725.3914225-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105104725.3914225-1-leon.anavi@konsulko.com>
References: <20260105104725.3914225-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123150

Upgrade to release 3.20.2:

- Support Unix systems without O_NOFOLLOW
- [pre-commit.ci] pre-commit autoupdate

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_3.20.1.bb => python3-filelock_3.20.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.20.1.bb => python3-filelock_3.20.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb b/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
index a499b79c07..75eb16635c 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "b8360948b351b80f420878d8516519a2204b07aefcdcfd24912a5d33127f188c"
+SRC_URI[sha256sum] = "a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


