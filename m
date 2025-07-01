Return-Path: <yishai1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B797C83039
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:44:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5715.1751359447767068239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 01:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ScMywwoo;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so44799015e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751359446; x=1751964246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWIxl1I+iFYWqoHK+ENLtC+M/NkNocdsTtZdPI2VOmY=;
        b=ScMywwooilkNjXOrzJm6DBFK50tYHGcJfsnZ0df0C/c85i4Vhcma/v5Hv/0eMKgcqI
         bloEdGFlshxeA9wVmPtzxFyckN0waN86oEEYNK+PNGzDPVglIm8Dp+8zqjyfliNqwpAt
         6Gn/rdieNgHb5R6pE0J0ieCnH+VKGx83B4uDWppvwRa2wLRgdYAzRhUfquDsx1hmGQ8N
         SXMwXDEcx/OpuJLVRraU0cTyQHwP8FRRWpa6m60Z6c5y9PX532cQh+IUxGX2BstF9sYS
         /7brC+yV/vKIrbsvmSXnoOD7/x2cSu7/Mj2hdL33h0SuOuWicTvGD/o0tRZ5mlBS/Bs0
         gYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359446; x=1751964246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWIxl1I+iFYWqoHK+ENLtC+M/NkNocdsTtZdPI2VOmY=;
        b=mEnIk5k/KT3PwTuGfXhSJz9dWTyYOQ94sgaS5wkdSVNzW+cQG2+esGMlXnoTUpWB8W
         1mvoRzLUexJ9lDhKqx1GzmNPiAQWbPCkb0WN+t81cZfAhDfMBAzRLbDEHxQ6pslcu1D1
         CKC/d7YGzwxNEXkNiq0qZYM636tyrfF7fcle1oyB+04nquWKNerdfdv+dJlpFMfNI7Gq
         kc8JeDrOs1htn1pIjIV5mAauJnyC7UqXnlepSaqcOG2zMeWSsDpg7b+98wG6rgYTdPdo
         afQG6xh5/GqwG/PPwoH7BINF5TW98+LoR+YAR0U8p5pkFaSvuBNYiNtplOEcoPzw2wmG
         QXWg==
X-Gm-Message-State: AOJu0YxjeXknqjfvTM8yGmL8fWXwPHGEiEGP+nqgMh0hl4jcArpwXckp
	tOPS3C/P5q7RVU/hagxU8yIkZLE9LwNlGrnSKB4sb0e8rQaQCjvMEDwacTiKGw==
X-Gm-Gg: ASbGnctuL8d68jXOzC7SPgKEp8i7JN4LuArHv6aoPk6gSx/gTXMM9hz8UIv2vJypHB4
	Aois+ebW4ZyqqVOY7F518zL4McwXJnoGFfwuDFPMl6Ap5qDbJoUCnWoy5V22WvLWwUCaiu7IA3m
	ELRTLhC4m5XIQVh4R4hCe8pq5RqJFfPeCUXdCGjh2NaQ+490/9lJ1vxfm1GhVNkxirm66KYq6IA
	HplbWNPgNZIYqzywFQl6rep7xvUL4UI0A+b/2Bdud99frP1RbWpvLCKfWQv3vC+f7LNmx3+FLeQ
	iX6YDYsMt95DEFawGy5qUJJPNAUkjuqhXuPzI2MY/mxerOgMn3LvUFosDvkv6ZXjb7Xth3zo2fz
	MkQ90
X-Google-Smtp-Source: AGHT+IF/sIaWf7jZ070zXpoVN7FfP5ZUxDeU+SB+6D1NYBB24lSpncdnbgGMPs4LSQcGf4lLYI8x5A==
X-Received: by 2002:a05:6000:402a:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3a917603734mr14768816f8f.29.1751359445608;
        Tue, 01 Jul 2025 01:44:05 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59659sm12597880f8f.77.2025.07.01.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:44:05 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 3/3] python3-pybind11-json: support native build
Date: Tue,  1 Jul 2025 11:43:52 +0300
Message-Id: <20250701084352.4165484-4-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701084352.4165484-1-yishai1999@gmail.com>
References: <20250701084352.4165484-1-yishai1999@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 08:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118191

Add support for native build of python3-pybind11-json

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 .../recipes-devtools/python/python3-pybind11-json_0.2.15.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
index fa4a74f92..8ad7dba76 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
@@ -11,3 +11,5 @@ DEPENDS += "nlohmann-json python3-pybind11"
 EXTRA_OECMAKE += "-DPYBIND11_USE_CROSSCOMPILING=ON"
 
 inherit cmake python3native python3targetconfig
+
+BBCLASSEXTEND = "native nativesdk"

