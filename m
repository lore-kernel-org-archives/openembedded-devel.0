Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14657.1793092853469483340
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PRfIdgqo;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so4417825e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092852; x=1793697652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVUeZ+z/SRwS47mCL2OIv87yBPCqN95YDLCcsM5Fr6c=;
        b=PRfIdgqoKclZdmB8TkWAQElT934Pr5mfghJx9lSnIe9mZ9sPfu9AWPi5q1xRPnB7xy
         uxTq2hS7X8FCqkEgNTNAJ2WwSiKG3mhGU2/aarRctpvluL68LH9uFkUKvLtDQ3nTWuYr
         WdAZJfgEbHd7KbytvXnzwsOMrUIwS7vX0fjjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092852; x=1793697652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVUeZ+z/SRwS47mCL2OIv87yBPCqN95YDLCcsM5Fr6c=;
        b=LJg/BrBdaEZ6QWUh0VqBIi2FWTj3m/zyikttK7X43tJLguy5LrzhQNhwuc/3Gmfp7G
         +3jXVe5ebQV7zaakI+zOZ8LSajufeMdbRVEmjtYZy4ki68uR/wnnQOpYUamPW6E54hru
         F9HGGWzhbrNYGHyw/JTTOgh4ysxNJ/8dqe1UnSPhRnEd5vMrG1fAI3GhJDh6beZgjJFy
         2ztoDGCp8JiNAg9slGrOWX4dr6REGSQ/ulhBZ1Jkkr36yQjBsOU2jnEjmYifqKITIv+m
         t8/eOKU+LDANrekzwhT1fs3TQFIxS/VKmUKu7FvjKAwwWoJEZIxelhnPP4UW5Ceeav8U
         k7dA==
X-Gm-Message-State: AFq9FYIF6SFtXRIbRO63zuvdTvtMX+jQFlnclLla5v7A4Lw50bOTXKi1
	X6mSKHtqbMJ8CRhmWD44iZdRrAHguRCbAcdPiAZqSPg8kWUWAHjORht7VLxS0+Scl1Xj6g95nLX
	vQ+RU
X-Gm-Gg: AYBFou2iXiZ6/81x4MtyNBmRN4bJdLjtpkLYe/z4koO0nyLb+rv62SsaN3iWfL68KIc
	I7PH30er1p6eCyMSZt8g8ODVVdCmYrbQ/LP1nUcb6Tv5QgBPKYdO2drSe1j2O2vwcTqZPFx5hCe
	TF92BnxIOjn40RgR+D0hgAjOSNbfM7zdCcOneN7BAPv06rR4VRna1s/HMEfcdtuqE2A4TGODiSU
	K7CvHyjtfozuChDnmfcKi12nEo7ILB4DfwmhZCCCUUWNCnxw0oxGylOcIHpWq72m0BHzZ20OCGr
	LeLdacuG4JyeWOEzskXXNPTies5j+yNf3kEKOcdsPjyaZ+NqPXpxIO00h3y5dF3ljn5NrhoWJXf
	UuFm2GYa/ry2fZhCw2azHmc/uVC4L5X7FYYYfJKepR5pTgdxrIG8nnHfLBj3E8r3MuRWO383Kce
	tnGby39aP71MWRnfl3kG/Ij/EsGwVqUdERkzESINnlavBNWb/TYw4TCAjxwJnJXRdJfO7nMJDyJ
	yaGtcK+mUHBPkmYP22vat6zI6cn3ubZnvyoGxp0Ac8UlKq6KeLxomTBJJwwSXv/Mbu7vhrq+rzK
	Ho7EDyJ8PrLvTDdNIhpONe/vJ0yBwzICFEBXbC4T5eLlF93PPNwL+Ibwl6HFt2J3UKzUXOFn5nO
	jwVEG
X-Received: by 2002:a05:600c:530d:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a7c100c816mr46263335e9.10.1793092851751;
        Tue, 27 Oct 2026 02:20:51 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 19/61] python3-pyflakes: Upgrade 3.4.0 -> 4.0.3
Date: Tue, 27 Oct 2026 11:19:46 +0200
Message-ID: <20261027092028.782979-19-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131483
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.0.3:

- A few performance improvements
- Fix handling of unconventional NamedTuple / TypedDict argument 1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyflakes_3.4.0.bb => python3-pyflakes_4.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_3.4.0.bb => python3-pyflakes_4.0.3.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_3.4.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_4.0.3.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_4.0.3.bb
index a946a008c2..5fd08b65ab 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_4.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "b24f96fafb7d2ab0ec5075b7350b3d2d2218eab42003821c06344973d3ea2f58"
+SRC_URI[sha256sum] = "94762a3a5a343a79b28754f96c554bce057a592a4896907d73f0369fe824e053"
 
 inherit pypi setuptools3
 
-- 
2.47.3

