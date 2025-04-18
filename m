Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE07AC369CB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:32:16 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.9662.1744975930723994360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ep42B6hE;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso5102786a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975929; x=1745580729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEWEekuoW5fPi+aQH5TIjP93X8WtuP5O82DWN+6gO6s=;
        b=Ep42B6hEdOkeURO45hQDZ79JFnzsSHRLJ8dwt9TQHEYPFLaGorRpoiDt5kXyTExHG7
         pcu37tmF+vvjfsjVRyw2DhzLhL7tKFAO/6+1oScmTz1UzyDKTSiRVZXlJpIdIajxdBlL
         n7yVVu1tPeAjipZkFNFd2nIx+lQF/Hee8H8N8eJu/FsQhRjgbk2OQ2SXuI6HpH/BKdqj
         d/+C2+Nj2kMMg1F6F56/BNPehG0nQmoYREukHJXmE0xUCDcLJVsnbpv1UDdk5SwcfgeN
         E9kHhYcJDdQ+HeJ7hP2sf2loP7tShhqGr+vcztNYWfbsooDChgHeSrLSnvgar6siwGXV
         7kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975929; x=1745580729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEWEekuoW5fPi+aQH5TIjP93X8WtuP5O82DWN+6gO6s=;
        b=vS9Exvt11G7Iqx/+Hxpv0vVy7PJK0QNJ6smKK9Lye17jbtmv7qv2k0NjVXTUszq0rp
         T3p5vw3MretlmUxGfq3EPmT1KcgOmLEGBy7AXPtznqNDKTBTomtIj7cybPQhwKzz2Q5l
         FB8io6k3gBcFAnG9FUXqo+ue/neQpngdKIl1BL5k3RNxYBqdrMsMnM6CmdfidYI/O/xV
         bKv/s9BGq40S3sXnRDcIfTzZLobTcIUjPFNvScP7jbKlIxqHwbEXd34j2sU/njWdRuT2
         ueutJ0fuHmccmJywQYd+mdiTLUY0ST2wszK6IiZXUtcKQ+WyaUKf3p6XhwRDLwTaPJUD
         SPpA==
X-Gm-Message-State: AOJu0YwAQd7dXDGojjwraTW4Y9mcB0fqmE2leVzlpcrLYxRubqFddWVH
	/g986X86oTSaq2PposZMRWJDo3ziJD+q/GxD0qjxnJm1VBY3qfdR
X-Gm-Gg: ASbGncsogIFr0N26XOtmQd+/Lr/OGickX+sfkUWJ3TDsdTUrTL7xZWRvO98AFtjmV4b
	VjtwJhOUa8txID5wNE8S2szx+Gahjn8Zo/uif8vHS2/r6hYEZEHFzn0russMY6TtwwPi2skXcN1
	C5gGYvrcUOk5qILVokAlG2mXYKlZSrkHr+3q9v+IOcispgIO89CSgvP8mDfOTOWbjqS5+SbXmfz
	tHhzklhGKmZ3nC/MR44usg58Mfb9FxsBH2O5ZUQPaWAHadb0ms0lkJJK/+HlgKDNrOB2tTo6tMH
	9rGTw/BFJ/wOhmD9g45V2sznkC+ZeBLShpzp29XQdiIlY4C90AlgqAHN6SO6p293xYFc07PqQlM
	lLcLX3Pu6j90Z0o7oAfdJIl2U+toDT115Zf1C+t5C4xYSRcBzfUHZ
X-Google-Smtp-Source: AGHT+IHskoAgIIl+ey6XXO+hi4doA/YHT1ADW6uxjBh8nfiAvCqqPKykyEiQ0XUUUCC7g0F4InqZRA==
X-Received: by 2002:a17:907:940f:b0:aca:c699:8d3c with SMTP id a640c23a62f3a-acb6ec13f50mr294539566b.2.1744975928864;
        Fri, 18 Apr 2025 04:32:08 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm108313566b.43.2025.04.18.04.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:32:08 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	amerciai <alb3rt0.m3rciai@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 0/5] Upgrade 2023.03 -> 2025.01
Date: Fri, 18 Apr 2025 13:31:43 +0200
Message-Id: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116951

From: amerciai <alb3rt0.m3rciai@gmail.com>

Upgrade can-utils from 2023.03 to 2025.01
- adds support for CAN XL including VCIDs (Linux v6.9+)
  https://github.com/linux-can/can-utils/pull/504

Khem Raj (2):
  can-utils: Fix build regression on musl
  can-utils: Fix build regression on musl

Ricardo Simoes (2):
  can-utils: Upgrade 2023.03 -> 2025.01
  can-utils: Split mcp251fd* into sub-package

amerciai (1):
  Remove can-utils_2023.03

 ...ime.h-for-timespec-struct-definition.patch | 28 +++++++++++
 ...-utils_2023.03.bb => can-utils_2025.01.bb} | 48 ++++++++++++++-----
 2 files changed, 64 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
 rename meta-oe/recipes-extended/socketcan/{can-utils_2023.03.bb => can-utils_2025.01.bb} (63%)

-- 
2.34.1


