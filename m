Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1306DCCF2E4
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:56:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33755.1792414591040013068
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MhqhPNhX;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1420508f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792414589; x=1793019389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5nCl5Xk9zEfUSnFgxFLIr+Yr7h2VaNMDAmKxVkVg2w=;
        b=MhqhPNhX53KpEXXtnwnMJrq8kjE7XWTZfVn0usZ3eJxNCp0Beswxms0VjnRvS/+dYn
         NnziN3vt0/2WlryqAtiAzZYUjag1uZflNAGyfxEbVjys8ojs6/xt5rytprAYK+10KUfX
         /U+Q6Z5kYdNlAsW1UongZ9Ko8iKMgAmlzI1wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414589; x=1793019389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5nCl5Xk9zEfUSnFgxFLIr+Yr7h2VaNMDAmKxVkVg2w=;
        b=fe9PiEJ23oV8lbaexJDaT7uUhY+e0XkJqj0BGuS1WXZOWQWT4QmvENZgc/nkbQIoqJ
         OSWLrO6ue249qQNd8LwTRAWdpT9fFSFq/ArYj0zA1WVFad24VLLUxdvHktHF5Gi5nRDy
         V3C0KJyS9qR+D7AEOfW856ZTdllSEKzt9DPu0MInjrLuqaqURP2GpzyyKc2bQ2wq1e9H
         9hKGRc1FU3bPW2KYJlIFx/ne0Oni0Laz7gVoqytIFmv/p9ci5TuKIorJfwavOtKSh4YO
         cm9wX1Ku/TsnoY7kBBVZht3iaClXw/ggAWnWseWcLHEumEaIlHCJeo5r6i2zzCSOWeAN
         7wBQ==
X-Gm-Message-State: AFq9FYIl4LEbsbhJ8SXUTwTRZSOAVvCJZdIngo91qjGeiTzaOy30yKJt
	QfoM2yihcDPsRxKRqhZNVryGeF8GlpvGYdzpaFmTPXzMIcFvKNJzebbF5U5q8NxMyggQo/H1s8i
	WZGGM
X-Gm-Gg: AYBFou2o5BKMCB8xKBKR+gK4Vla5tOOz/BAex4PgpYeQl8wJIdZUpZRbidjsEsVY9G5
	HbrlnfsP7x6subO97TkQTdv4R2SBj9SsAvSfR0qIk41i3jgUNorZ06VHr1dIkxRZcX9bq1cgDMo
	56bBOFzZTqukPmPtgOwSyPgOiYRCear0RVvVKMXQ73sQ15jl9zY/FMkzqkZVM/lOsgYnrjz3TvI
	jRTnh6hmNknBsru3rJwvSDxqvHn1B6H1Zq5dfNg4C1Y0qWHglpX7FPTZHwWcbU9LpxKQpY/fc31
	Fy2lMxbcMxNxHlVchbVEh1xCN2oH/yRTyMgDAZkSqJ5iH5A9VOQl7FveCgRjwKuA1rFIXrTTRmc
	GtvYsCoRKs/BAtI7xpd9lL5gMyn9M5xRVTkYbiW2ugtdMVbuhb0pCzku6c2OvzRQx2bz+1XH/fO
	2TZpyrmmCtm8KZop+mwpH50oAFhChsb1iirXwhLMIljaXsnSJfSi7Ekywk9iJfoVzhsXa2yib8t
	a7rIab8Ng4MbL9jH0fPuyf6Dw1FPo4GHmGUueu6BwtVIZPgQFBcM1KUmIOJSlifrp3KagL69R7h
	febILPxuPhV5yI5L7/wWMxjMC5RywESKZg==
X-Received: by 2002:a05:6000:230d:b0:48b:60d:2b28 with SMTP id ffacd0b85a97d-48e07f9c1acmr16171785f8f.39.1792414589328;
        Mon, 19 Oct 2026 05:56:29 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1afbf534sm1527565f8f.35.2026.10.19.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-cytoolz: Upgrade 1.1.0 -> 1.2.0
Date: Mon, 19 Oct 2026 15:56:16 +0300
Message-ID: <20261019125616.3888504-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019125616.3888504-1-leon.anavi@konsulko.com>
References: <20261019125616.3888504-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 12:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131125

Upgrade to release 1.2.0:

- Match toolz 1.2.0
- Support Python 3.15
- Build Android wheels, upload Pyodide wheels, and test iOS wheels

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cytoolz_1.1.0.bb => python3-cytoolz_1.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cytoolz_1.1.0.bb => python3-cytoolz_1.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb b/meta-python/recipes-devtools/python/python3-cytoolz_1.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cytoolz_1.2.0.bb
index a75948a006..0bfa72327c 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_1.2.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d422ebce3e9c6447563bd410e9b22f2e"
 
-SRC_URI[sha256sum] = "13a7bf254c3c0d28b12e2290b82aed0f0977a4c2a2bf84854fcdc7796a29f3b0"
+SRC_URI[sha256sum] = "fdd8ded8a93e1be009577fccddaacf78aa21cbe7dc6ec53c229def0198a1ffa5"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.47.3


