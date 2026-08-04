Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BE5C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:41 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24805.1785872437478954858
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TlHX18yK;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so109839a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872437; x=1786477237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/IhZgsx0aXJ7RhgSejxwsb4b3FydUzdeYNcmYNIG4A=;
        b=TlHX18yK9IpmzpRzN7huW5Y6/ldIkqp5eav5BU4dA60MrjSs2zkAUQRciAu/3CsTKg
         i9aKJ0v51EVYTe1XI1nkaulLUpfKwdTFE0A6GhHnuOF6kR4t/kZyjD+vDM0ulcLVEm3Q
         qlJmeOOPhQ1/rOcGr7fWxmlojWqtAR8OibHSYvECiSPh9aXwPRx44ZOkxZVPUiH4gQGB
         v47N4SY9HEGlQBa/0or/tfyh9J5Wrmol4WOrZLL3QsC6XgkkZJkdjfuH1F1iz5uwcWoa
         dqyc9TDdxsNzeNjeCAuCzI62usOEIn0YLXjb+xAiuz1k/nhiWjTGOkD+zeCH0dmR6Wo2
         k+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872437; x=1786477237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/IhZgsx0aXJ7RhgSejxwsb4b3FydUzdeYNcmYNIG4A=;
        b=cNOKW1awpMRX58VC/tVcCbBPKxM4blLQhQogxKcoS0Pz7n+e0D1I9GLyotJki7uidV
         oUEeIdChgjw5cVVll2h0Sh497LYQqyW1ezl9YmxbzKyOr74bnBGhBvS20MbR5yP+5Ywd
         AJolCWqeZPwwyBHMfHQCTPmyry0PCJS1yCrx1pAKQew3y5rTYtr2eRWFObSl520tEB/5
         YBBlp3KXUPWVF/FlRMy/h2vcqDSAFSegfZpyF52XrZV1b5zqYPLl7LgSahC0fHf14pq0
         9qrTVnCOtCIQIAaFMQmmpOPGKpH+k18dbS6PY0bMvc24DN2ETr1TNaIb8UGyt/xOApo+
         xOWQ==
X-Gm-Message-State: AOJu0Yw/8tG2oRplalgwC6n5v0i1ss1Zxk0tpYVPTMyTZFtwJCmviI2z
	y+xd+j99kRP1ZCceur/ZO2Y4JQxCUKdq2CUJQylGDf3eZsjf8kKZs4oY5BODtQTH
X-Gm-Gg: AR+sD1183vkv1Vcy+j8oXWxaI6FKnOGaO7XZjslCpmvxJBWXwzAQs+iktsWWuQ1rcsu
	LqyApsL/Q7hidjgghRPvhFqT5xDUPNeippB5k3jkQZ31kOTi4ZbI4sU7UsmzsEsEWmoL1uP9qCG
	1DQWRiN+vmYYvV5vcvJQW9zDhDoZhfItZXLfPURpRVNk8jIor4zX4IL4iXV7p/ounpG4JyoBEM4
	Zpnn3tdjcqsTCnUZkczxXRQ3Ar9zK+NnSaui71GlbGBBCR27CLakXWapG0Yo95IG8qodJoUGoh5
	mXtQMOTDtLJbT2dUUlLdbSMDHacYcRYNS9eA1rGz7rUjFQghuHSNtkVPWxeR0L1C2X49i4JExsk
	Lh99IPcHQHfbZ/GkV9vg+RepN5QIweB1f1DuSdgYQVbPJYRyscFXho3mAujDzX+G5JosoeSYzJp
	ztC9cW1HZlfpbW5qGTwp5hlKCl17CCm6C3CH/3Olc4PqEWBh3KwJXzc/kAkKGZM2yOJ4SLnnjd6
	0p/bdm18cdS
X-Received: by 2002:a05:6a21:398f:b0:3bb:21ad:40d8 with SMTP id adf61e73a8af0-3cb85f4a5f0mr1105682637.39.1785872436684;
        Tue, 04 Aug 2026 12:40:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 11/36] xrdp: upgrade 0.10.6 -> 0.10.6.1
Date: Wed,  5 Aug 2026 07:39:38 +1200
Message-ID: <20260804194003.3158916-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128758

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.6.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/xrdp/{xrdp_0.10.6.bb => xrdp_0.10.6.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.10.6.bb => xrdp_0.10.6.1.bb} (98%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.10.6.bb b/meta-oe/recipes-support/xrdp/xrdp_0.10.6.1.bb
similarity index 98%
rename from meta-oe/recipes-support/xrdp/xrdp_0.10.6.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.10.6.1.bb
index 152b37cb37..396d769d1f 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.10.6.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.10.6.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
            "
-SRC_URI[sha256sum] = "dfc21d5d603b642cf583987b36706b685bf05fd3aaaaacefb8f57c5f4a448677"
+SRC_URI[sha256sum] = "2f7beb5a3b2529c8d72dc0df9b8cdca31ab0e0c14d1e3421210f5e6ec0ab3b75"
 
 UPSTREAM_CHECK_URI = "https://github.com/neutrinolabs/xrdp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"

