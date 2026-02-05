Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAF3EC1E95
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 10:20:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17591.1770286821540910402
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 02:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TXK4hHqZ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee0291921so6997625e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 02:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770286820; x=1770891620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fnnH9swJh4UkQGrQg0HbGhRIJxk0CjZswrq4a0F6Wo=;
        b=TXK4hHqZvvbRc16vM9YZ5ZFurHB3sIydN+SWT39MdE+K4RJbgdmDP40MimQ3RoUB6N
         j4poS/yzz6GfCwbOmSU8llFutTi9rB0ut0cfRDPbNoalZNKVoXwVLoVXxEb3W/2szTvX
         vUCXDN47uRi69raRw1TPhvrdKcRNnBfYDmgeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770286820; x=1770891620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2fnnH9swJh4UkQGrQg0HbGhRIJxk0CjZswrq4a0F6Wo=;
        b=kintLqHdVFBRuoReKg8XCcJdFd4kAVv5nb6bKukHfBBnJCORZga+ZMpvwfVezWRdwq
         YgaC/9Bafzfb4VUrOGcw5SQqLxoCBgzctiFB2LLPzqlXwKwntaiGn4NM8GpoxDOCah0A
         4A3KHzeSsToUSGB9vKxI6N8w9ulBXb/35YY0OeBpolfxcwxjHgyoyCWK5jvU44Cyqpl6
         2eEBhrCc5pnZkU2Xmp7hTswP9fvGgfELiQjNjs8Sc1t2DjNHdPQo3iDBqbxjnhlMaUxq
         8ektRRDhe2lAiUMSbrDF7ZITJnjst74GlliWJisE137KbCUt1dTdrsn6dUzBw+mdOGaJ
         /tBw==
X-Gm-Message-State: AOJu0YzuqUUeL4jYM1rbilsDMYzsMrY9S/jTcMW6+2xIH83lFdgDRFBe
	RMtvK9g2AebPXMCNJHzSsjgohpvon/I3uQI4wyFWD7gEU731cSshEpncYtLbfzib43TXgL5sAEf
	SqovA
X-Gm-Gg: AZuq6aKmupKsxAWzo0g6Ma4Mw0jARel2uLl4eDCHwkZ0jor5LoROHOxCbnEBxWeW/AD
	+oa7H3T6LQJ6B0yeXiueVUfcnhPVY98dK1caH/RjpmkC0kri2AHUXgepRHSUgXtxkxluRmYuFzQ
	9F09HnGRye9GNzzN6LFxBd3239QCe+JgqxJBQL+QsC8v4xYfH52dvF5XoVS9C6g/gnYQt0cX2sI
	HZlXH93RxCewmnfp9LncqNwcVNOKeT0DXMedWmEVivrpWL8n4UNWRzHNjn6/r7vf5taJxKV99+F
	EOSmeoHQt7eSdiyJxs8J2Aus+PgsnvLFRXRBVgSKIZTWuzHwwsZic0xPVBJncykuS2L6/hocCgO
	0TpKnt8A/HBH8Eyv/yD9Qko5FBNw0NkBLAmNok8xe0fMaq4CVgcSchtNOd2++m1CD86tOq6Ed7G
	bfrKNcqnGNL3PY5ZGjSvFDDDwT
X-Received: by 2002:a05:600c:8b44:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-4830e98acf7mr76694095e9.33.1770286819419;
        Thu, 05 Feb 2026 02:20:19 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a963sm40625055e9.9.2026.02.05.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:20:18 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-marshmallow: Upgrade 4.2.1 -> 4.2.2
Date: Thu,  5 Feb 2026 12:20:14 +0200
Message-ID: <20260205102014.1462884-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205102014.1462884-1-leon.anavi@konsulko.com>
References: <20260205102014.1462884-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 10:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124208

Upgrade to release 4.2.2:

- Fix behavior of fields.Contant(None)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-marshmallow_4.2.1.bb => python3-marshmallow_4.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.2.1.bb => python3-marshmallow_4.2.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.2.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.2.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.2.2.bb
index b35c3f74ee..4172a3e745 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.2.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "4d1d66189c8d279ca73a6b0599d74117e5f8a3830b5cd766b75c2bb08e3464e7"
+SRC_URI[sha256sum] = "ba40340683a2d1c15103647994ff2f6bc2c8c80da01904cbe5d96ee4baa78d9f"
 
 CVE_PRODUCT = "marshmallow"
 
-- 
2.47.3


