Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55917C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 16:18:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.24901.1739549901502462037
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 08:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Bgxrsi7f;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso1854562f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739549900; x=1740154700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dA+kYZdztZbNy1pO1cnq8EYQqemeWnOabGC+9wLndvQ=;
        b=Bgxrsi7fRCpMavsSMxqJZsnJ8vOUqFpYuagmpJn84cC9zSdNF+lTc6toSnOWOaIEn3
         SpFCfJtmwTm9hzmrqOCGiUnGJAnxEKiYbrJLSrnE5sQ/eGVCfN6IHn00dJSrfsUyAKxB
         mqXB9LZgv46xIK/fykwauDkM5Tfx1qHWewwlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739549900; x=1740154700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA+kYZdztZbNy1pO1cnq8EYQqemeWnOabGC+9wLndvQ=;
        b=kGMWtUur6Ng5tAlsmzrUZZx5gF9LB7jML1/kCFJVeNiV5Pd9BeTaCc789KcS2f4Q3j
         QK/D5kzX9/pvvyU88GkHfqB8y5IC9g1efhJsXwleY8hfnX+SrQy4D2tOV0BSI558j5Tu
         FZLf4xKIKA9FyqA82cJoNzTyTmv0w7Sg6Zdeiwn+83pgQicRggVZKd0nQFI/I6X7Emq/
         8/mXn7IRtk4NrGxe3xMuW2ioJS5viNWGhI7+gTaZcSEVlIKgjafDSwZFtnDdkTgklosI
         p3vqj5/Qxtf0nXEUwgCdZRlTfnZINgEQ6azWqz1tXn/w/hGort5ajlNj4CGgvxGaZoRe
         xiYg==
X-Gm-Message-State: AOJu0YxSRmMJ6ZG5JuOtM6AUoutMVhm+6JbBrJa3djKttBIDGr0D2gMX
	FTAowbkHmGSvjHyDsKHbiUUv42TVIM03ZxQxf94/En5PchGQ0qRaTGnlAnpWQl299RgAV1wv0aG
	B
X-Gm-Gg: ASbGncuKLOAu5v1cbBjBXrK9ldRnDlE03ri6ijgv7S3jQ2uMy2FgkQrSAzRxUdBr2pF
	iPOVZjorJK4s34wfK7O2X4kfcucRyDf/cKdb8Efpft24bsIt44wf5SjxwBt8HItxXJOjaWvvtNh
	6iuhGlvEr0QO8erA7wwn+Rur3iYhlarjuiW7mcaROtcgQUJizNokbog1e7zW8A0SFUF3CKsd+j3
	MP/Pe6nnTrIe4D30o/dILgyQBu6IUcSffpEyKeH/XdTedZSFIhADmZsqohM20EnOtRA5rL+q2FK
	rXG3x63WHwnKAszzTtjxxP3m4N5nuA==
X-Google-Smtp-Source: AGHT+IHF/0b47UJIn2SOuFDiZjbsaJYUPcGiLAboyc0NwePFF2riLNIVMvNNJPhgSUeqT8Ddi1KZRA==
X-Received: by 2002:a05:6000:1f82:b0:38f:2766:759f with SMTP id ffacd0b85a97d-38f27667d4emr10300005f8f.41.1739549899758;
        Fri, 14 Feb 2025 08:18:19 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fb6sm4915287f8f.44.2025.02.14.08.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 08:18:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-requests-futures: Upgrade 1.0.1 -> 1.0.2
Date: Fri, 14 Feb 2025 18:18:15 +0200
Message-Id: <20250214161815.3120205-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214161815.3120205-1-leon.anavi@konsulko.com>
References: <20250214161815.3120205-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 16:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115488

Upgrade to release 1.0.2:

- Correct setup.py email addr

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...sts-futures_1.0.1.bb => python3-requests-futures_1.0.2.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests-futures_1.0.1.bb => python3-requests-futures_1.0.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-futures_1.0.1.bb b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-requests-futures_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-requests-futures_1.0.2.bb
index 28f034f7e3..5714c3498d 100644
--- a/meta-python/recipes-devtools/python/python3-requests-futures_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.2.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/ross/requests-futures"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e1e50798d0afe0e1f87594c6619a2fa5"
 
-SRC_URI[sha256sum] = "f55a4ef80070e2858e7d1e73123d2bfaeaf25b93fd34384d8ddf148e2b676373"
+SRC_URI[sha256sum] = "6b7eb57940336e800faebc3dab506360edec9478f7b22dc570858ad3aa7458da"
+
+PYPI_PACKAGE = "requests_futures"
 
 inherit pypi setuptools3
 
-- 
2.39.5


