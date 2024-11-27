Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EDCD609DE
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 11:26:29 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.70017.1732706784800230031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 03:26:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZYOarYjV;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3823194a879so4562656f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 03:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732706783; x=1733311583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tml9OvvvQVqm2iqwRbFtq+L8EXWLQY1ZMjN4H8LY89E=;
        b=ZYOarYjV2/3bOoLj2JahUaTU9+9vE1MYySJKSi2uaQDTe+s6A6ijTi4HGZmQHk43eU
         /Nsds9CiQBsiVPl9w9SzTFGPeQQ9XPxwpQH3GT5zKmdScL52ejh7VHbi+JVN7xjGs+xK
         1MHQ01xjVlSA20phopNzvDpcUJALEqN/xl/q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706783; x=1733311583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tml9OvvvQVqm2iqwRbFtq+L8EXWLQY1ZMjN4H8LY89E=;
        b=lgqgooWnz2eJCtsDPiA62/hU31pHxtllHGsC9LgJdvsG+7YVogHvUFD21bwYfuN9Xs
         gdMmV9ycG2YuxkJsP0ar1D1qj5XvzNjBfywPihUINqR47W1oTCFhY5XKWO50ct/fmQXb
         oCwVUR/frgRFyEe5FIcvsYT2a4173MFvnnYQVbJKV/6kAIUjxPX30jdAQMXHi9vQ96kb
         jOn/1hNDsRYHTAJy0F8Dr1PAUXa/TpIilKzkXTt9YvucGxtbdEXAjty0/ca8dHPG6X+B
         V5glACnaadgJeDPHRj+a8p6AxpnGX8gqbWohGqzPtNGPOmm3nuquvwfFqzrQmclIgMFM
         XD7w==
X-Gm-Message-State: AOJu0YxUl7yVTKAiN4fQVoDS5EsXM5Ye/DxRsFxZVrHhb4OobCHgkO1/
	aPdiuCyl0aEWM1CNYaFFnZAPIA24Fxld4cKnbumCOfjSFYCytZBvYWX2AlODAp+DNabpHTGI7Hx
	9
X-Gm-Gg: ASbGncsKHT5HT9HPijTCVQQ/cibGS50D5Xi6MWQIJBmfLRIO8qo9Hc+8v0EVMDwwo84
	Drs08IPTbYmxVydxgoxhX6k1WlpXyeW3YhWf2ozZAszyPg6iHdBdB5v3SUMznzbpIo8ZKhZjnxm
	DHz1Qr1DMU6y99Uh2JnZdB6sx1JDYoCiIKLercu8DDsoG4hnLbmsrIrFb5TqqYIaRUIrx9PRpI3
	HjJ2IGqgFV6T0LJJIyR0Fw1DgDuzDAtWQ2Vy6OgUB1DODQbpwWeXfVZfjXHZjhW
X-Google-Smtp-Source: AGHT+IGhA8sxoTNDwO8kBrZeJK57txV06OiHCkiU6He+GiQpsgjNRMULehNss5ANFeDeFawPoYDpqw==
X-Received: by 2002:a5d:6f13:0:b0:382:4eef:26e with SMTP id ffacd0b85a97d-385c6ee2226mr2329057f8f.51.1732706782835;
        Wed, 27 Nov 2024 03:26:22 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5b9csm17951645e9.43.2024.11.27.03.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:26:22 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-frozenlist: Upgrade 1.4.1 -> 1.5.0
Date: Wed, 27 Nov 2024 13:26:16 +0200
Message-Id: <20241127112617.789120-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241127112617.789120-1-leon.anavi@konsulko.com>
References: <20241127112617.789120-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 11:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114090

Upgrade to version 1.5.0:

- An incorrect signature of the __class_getitem__ class method has
  been fixed, adding a missing class_item argument under Python 3.8
  and older.
- Rendered issue, PR, and commit links now lead to frozenlist's
  repo instead of yarl's repo.
- On the :doc:`Contributing docs <contributing/guidelines>` page, a
  link to the Towncrier philosophy has been fixed.
- A name of a temporary building directory now reflects that it's
  related to frozenlist, not yarl.
- Declared Python 3.13 supported officially in the distribution
  package metadata.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-frozenlist_1.4.1.bb => python3-frozenlist_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.4.1.bb => python3-frozenlist_1.5.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.5.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.5.0.bb
index 638bb20786..a3aebc59bd 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "c037a86e8513059a2613aaba4d817bb90b9d9b6b69aace3ce9c877e8c8ed402b"
+SRC_URI[sha256sum] = "81d5af29e61b9c8348e876d442253723928dce6433e0e76cd925cd83f1b4b817"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.39.5


