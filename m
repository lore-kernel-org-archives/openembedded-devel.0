Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35611CF64AD
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 03:29:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25892.1763609380600848914
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 19:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BpsT4+zM;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso340571b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 19:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763609380; x=1764214180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elfUvSzOfbY4AZVRoPFUZIiBEvbMBwz33npolb8xX6c=;
        b=BpsT4+zMsPMtpsac1fuW/T50SNzdJyqSVSFMNOSKgYCWfjht7iRM1FTvXncU1mMR7N
         4Ej87hb6K5dr6xTajKR62wzsdwuLttnKg0L/c4QR8HROCrDx1lDmSYDiZP0VqQmBHeDt
         MBi0WR0WqQqNiFAia5OcTydCd2hkmeAbKRVbPY3ksj+2WAhF+5tXkBov9Nxi2SF0+/io
         npzjus65I1EBMtKdxnlZzsTwUJGtjMYe7qI5HOQPhuu5M2eN3RCsAKSTW631YHOB8ksL
         VBN2ySxSPGuWix5OlGVGw0H+rcSfvFRZm/+rGdJWjuA7JIt8XnsMYKZGYzR1HAaEkvYL
         V/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763609380; x=1764214180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=elfUvSzOfbY4AZVRoPFUZIiBEvbMBwz33npolb8xX6c=;
        b=ZX21qFFj90r2UwenrLgYi79WCDUCcwQuicLVlTiM98stbQCwo4BS6ecwKrDwe/fD0D
         WBfEFmvsFNCMavRJJT7soT0hdX3uR8jPBwu2390ubLOi+azxgeyDKbV4vgIAXgf3SbPS
         80IVtbPKddqKqXvAN2RiF/M63m7YvmSfXSgbs4tFmsfA8otZiKwxFzNkvwpK7E2phz5I
         mqrjyjouRc+pdskVQJtJDPe8j1qfj6LLYdWIrR7b84oRfuuXTtxZF7TRH3+JK3EJhBke
         JeZwRHBCHuX1aXbnWHypHEbBeMBWRMLKuCi/UKnezA6HHrQ0lLMwnHOstcdCCkLbPK40
         I44Q==
X-Gm-Message-State: AOJu0Yxh4bs3pvPXd1Vbu8r/fvYbX0c2InW8X9qKhJ1P4lfT2+s2L/KU
	c2UJt4boMJ+RegMWMG9V+Mh4MRmIyP10WJWsOrsX6SSC3klzDrbZiqZngd3aQw==
X-Gm-Gg: ASbGncvi3iHkzOfYvlNBuzKCwY5vbZENP0ua1C3M66iaYs2Mk74+n35/PzgF+dOYKJt
	lnzve1H8YeC7rzIBK5+iKN/7nVhAljqEHkvWPOYugfCnblNtuzriCv5o4UWa6yagaRWGkkISG72
	0oSqAVOWhGCyNtFA1FN2E7q59PcKkBrrPPPcGboORuyc/sod87RzGQEwhMGaJpvGaYVk7V+97ts
	LuNmQoQPzqHVhnOG7pTMMTdYtTGw9O0WBq777C4KTA6h9ykldv1FNWD+znU+xcEmNeDuNeseeOn
	5eQAWWAJ7YXaePIhi9oi3msY524jLI2Vc/gjUl0DiD+ZtykMSTT8ModGCYsfHBHo+8Ov7utfOZb
	nIpWh3zvWAetNJCED/eEGcHYZ6QXF4GDCri/vmDj95YIR2+xVTGqGqKGNAgqLVoVop/7iOvXPTy
	qJQ0q1Jhh7ovZawEm3cgYrZuAJ
X-Google-Smtp-Source: AGHT+IG2te9OFA8L1d0uBy4pioqlIN36i4qKWTnABct31SWcoRO4uzS8k62JwEdtGvZEsG3BCuFkiw==
X-Received: by 2002:a05:6a00:2e9f:b0:7a2:7bdd:cbe8 with SMTP id d2e1a72fcca58-7c3f07672bemr1687902b3a.18.1763609379798;
        Wed, 19 Nov 2025 19:29:39 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0243633sm865111b3a.35.2025.11.19.19.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 19:29:39 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 2/2] libplist: update SRC_URI to include tag
Date: Thu, 20 Nov 2025 16:29:31 +1300
Message-ID: <20251120032931.3639995-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120032931.3639995-1-ankur.tyagi85@gmail.com>
References: <20251120032931.3639995-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 03:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121922

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
changes in v2:
- no change
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 831b74cd1f..17b1d7cfd3 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 inherit autotools pkgconfig python3native python3targetconfig ptest
 
 SRCREV = "2117b8fdb6b4096455bd2041a63e59a028120136"
-SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master \
+SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master;tag=${PV} \
            file://run-ptest \
            file://0001-test-fix-operator-error.patch \
 "

