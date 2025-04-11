Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F666C3601E
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:27 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.14152.1744332138454013240
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l6mWsZ1w;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2241053582dso19870425ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332137; x=1744936937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VE5JnvSDiw0jDvbKj/Y11HOf7ETL4kkTj8RcHUlNhA=;
        b=l6mWsZ1wPbaz399rwlMjd4xPGOIQ8VOGfK26GOYELrW14TGXr/NUms2+xB4aSDka1V
         80ApU27+g1QuX+HVp5y7DR82qeL7k6Ly25EHPHnQL+Xq5JvjSfx915MZ5qQMavWeMgfQ
         3GPrRLujXz3jHAUKTWPIOAxS0iV67QCqA2PwHxnEJz5vHr9u/8RqA6N+p26m9XNUzGLH
         xebzso7r69AWPR5MkV0c2eijZzCMMj9EIUvxuGAzDSlDJRV1ReytdT9S/pW5AD0c4wWG
         UiDSSMNrV6l1VpHMEaAdN5VjsbwFobmrRvoSi8XChHL7LovyiTq/0R80p1q4aooyVTBA
         d0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332137; x=1744936937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VE5JnvSDiw0jDvbKj/Y11HOf7ETL4kkTj8RcHUlNhA=;
        b=BU/QKm7KzQ9KJHwYPzac/GSmXepeG97D6aAYWhaj7GApsa1h1EweiXeYpADW2P6/Y6
         A+VfiR7fY4xbznQ5NdFEZzYp1VXLi+NN3wPxOV+2648J5KHHwO+SH6QlABKhYXMu8rif
         7mQNDOObx+OCs4cxmx66Hr5FHiy2RvBnnK50ZGpohA2UDgD4nJ8VF0OO4pZ+GABUaG3J
         xjtageuVS4cyvwqG3bo4xOzXGWfZEbVZuf0TqIXjWJ8VhHdr2qIDbxCXl8x+DEO45c+D
         /CdumCvbYQ/SMY8I2NfZyl9D51FTburh4vQzQZ1LMipGVZ33ifnk/ia54SB68nWClfVQ
         T2jA==
X-Gm-Message-State: AOJu0Yy5nu4lr5o0mgSpigvv7cFc60zkjJbftOXQlcpy4XZ5diJMT1Rx
	GKRBVjR7dgIEvQ013jV/06uyOtq3x6Nacgjc72wb2QroyP5KGtFtYvt/XpKh
X-Gm-Gg: ASbGncslSOprs+V2ucfdNi3mT65cHRMDGEGiytJ82ygOPHP6P3sfUesrtoeRu9SWw2I
	ZLMAq/lc9bZBUZeuoZkcjyfY5/3dO0R2bimGItfwnn6VwSMNnE9OjGTjLGWf+aqoLeohU/LVZeZ
	BcOtfDqf+E9PSpIPDwZTJYiWQdfoFH3oPQagUE7hM790tfgwO4dNh6u4v3I52WTz2YZkyc6C0Bi
	pEaN8QdwVJch3beYdB5sxyU27Dt4KxPeHBlPhysmKJAkZ4TjdFsVIhAZ6aBRFtQH3Z+36d6TAxN
	DLWusNwWPqJYac0QXTqqlHio/Hrxha1z
X-Google-Smtp-Source: AGHT+IF3Y1OdBm6Bd1+oFq5jr6guiw+KiLm3YYSyvSouH1zIcxFakqnJgnqRef2BsWDhlDIKh3UV8g==
X-Received: by 2002:a17:903:3c68:b0:224:1001:677c with SMTP id d9443c01a7336-22bea4a19f8mr10788825ad.9.1744332137304;
        Thu, 10 Apr 2025 17:42:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 12/12] python3-twitter: Switch to use PEP-517 build backend
Date: Thu, 10 Apr 2025 17:42:01 -0700
Message-ID: <20250411004201.3826913-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116786

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
index 19c4b8680c..c35b97a9e4 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.15.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "1345cbcdf0a75e2d89f424c559fd49fda4d8cd7be25cd5131e3b57bad8
 
 PYPI_PACKAGE = "tweepy"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
     python3-pip \

