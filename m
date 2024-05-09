Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391F6C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 09:31:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.6143.1715247101322623821
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 02:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FAL+IuHS;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4196c62bb4eso5447885e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715247099; x=1715851899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyJu/cZd2yMs06tQPlFylnx5kwGVl5PdON0bvMd1j8w=;
        b=FAL+IuHSOZQQgG3RwEqxUA3vRkwe6yI1b8Orx5PUi0qBv5uxwlWv8hPvUG/pHPiw2n
         K2bPMBJ3vO2nkyrYKecsQ97Fje1AnVkMEyIAeMtimsfdz4DhbGtQTZQqSQXJzIwaOhKI
         a6bqTEaV/H9pcWASa6/MqpvEUQ5TWrJ4b2NJTdBOfKNgJYd2fzQ9eEGNcOiEarD/uGhe
         fFTqMWRvopxN/jWYu8H+SoT6CQbT7w3mY9diHonk/lMCtmT7OxZzUlB95zLtXOuUGLWl
         o7ZntoqX0gwsIv8m+sucmHvj1Cg+F4Q+r1tSkIZ1aSou1tRtQWxbOdi0v4V/XgSSCkxy
         mnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715247099; x=1715851899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyJu/cZd2yMs06tQPlFylnx5kwGVl5PdON0bvMd1j8w=;
        b=IzSrGpwlLc38m99gc3j52JJUjeYuNjlCBml8fbHVGdWVNSbzoU+CKNGU7YrCNRbk6i
         abFIZqv0ZKY8U/XZk2kzHu8P0tuaqAPBF3ujiaPXtHfuZ3of3gFDIM71YiCmp9NYbTws
         y57N75fD6AS/SguFOtb+cgqKkVyuV6xk/HR021dcnO+OKvLiRcd2RDrvyP+xu0tWYmLz
         5kSCl3E8WDHofeFbJiu+TRsGe1d5PK/ShDYNVSnRYZoJf6AfLDHrWw0evzxK9/qt1Hen
         vLLUPSqvHKHjvGiEZeNedqQ8XZttPsWb8fvpAuNT+T1c59mj6brWVttX0IY+3jWLn9xn
         2hJQ==
X-Gm-Message-State: AOJu0YxpkXbui7e1u0DgNUlXf4OAYHLJT0/E5PEyzyhvhJ215ScjHkDn
	gH3Ssej5GJcHXv/og/phd2aM5BsmQHp0VMg/5qcVCmMnICXm+6mm09kySA==
X-Google-Smtp-Source: AGHT+IHCpVel0Ij8csFi4EtNa0s/dVAKLKuWLnP/UezvoYVD4dPc8Qs7bh6BiSKN9r/xPxaTKc15Gw==
X-Received: by 2002:a05:600c:154c:b0:41b:97c5:ccc7 with SMTP id 5b1f17b1804b1-41f71302dedmr34248845e9.8.1715247099448;
        Thu, 09 May 2024 02:31:39 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f42e74625sm62391655e9.0.2024.05.09.02.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 02:31:39 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][master][scarthgap][PATCH 5/5] composefs: add native target support
Date: Thu,  9 May 2024 10:31:26 +0100
Message-ID: <20240509093126.503764-5-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509093126.503764-1-jose.quaresma@foundries.io>
References: <20240509093126.503764-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 09:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110290

The next version of ostree v2024.6 will be available soon
and optional will require composefs-native.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-support/composefs/composefs_1.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
index 5d4fa9c31..38fc8d267 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.3.bb
@@ -27,3 +27,7 @@ EXTRA_OECONF += " \
     --disable-man \
     --without-fuse \
 "
+
+LDFLAGS:append:class-native = " -pthread"
+
+BBCLASSEXTEND = "native"
-- 
2.45.0


