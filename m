Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249AEC25B10
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 19:25:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.492.1715282745484333046
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 12:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y4deIQFM;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ed96772f92so10592685ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 12:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715282745; x=1715887545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvILus228S+mP9cPw1jaLtA7pQxaucn/vBjktlLis0I=;
        b=Y4deIQFMHuGl5aub8jo/KNO8auUEg+V07zcBTTUqDIBMCsb6VIHqA8SRTpMvtjfNnR
         0MZnANfNofB+RFdO8Rf7ulmpYILxrzmBnUd61n0LR9SDFjDOO0dC+Of6Z//54RbbRdxP
         UqIctjxs1esuHNtg6XQ3W9OGQZPm6GB0OPf2lCxcFadzyuNwMbMSNMpWxxXGXuTLP13X
         +qcUr3o9QC0HCRIB2DHufxIZTiXqIq8Z0+2UOxr9dhGKBcbnUWX+uNG/pkCVfJZHE7Cf
         oY53CukNslII+b11GWPvrYxPwLXIWyW0bS0KlmI0mtwfQV0Tvl9wX35ymTCinaJb0tTX
         9LCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715282745; x=1715887545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvILus228S+mP9cPw1jaLtA7pQxaucn/vBjktlLis0I=;
        b=PtAekT+/WbjWPznah+L+5gtmLtNdi2SpFaptBRJZGitTHfVxXHBnxn2sCDZwx8WUzt
         1Dhz/M5K6G6o6lMDfQKDvucwTGyDMfHvjJDqowVLJscN8aqSTTRr3WaXQDTX6LSqX/R1
         Q2UWUFviq/kTzEFEmRWpR6hZJvvdecElXMPKKSOQSpxX0gfKJFzRiCTm1GphqPb01xZD
         gadvGp5HDAIMlmONSsjJi65N3nL5my/7hiTFpnvY9QzTGCLQQj5+0AKcKf/Ccx5B7xGW
         qrrP4YvKV1aYFEDOc4/hiMC4ZLEk25le+uCjLZXP67I4k8ZoC3odoLofHEIwNb0gHtwF
         32Pg==
X-Gm-Message-State: AOJu0YzvT1l31od76KMZrkoHKt4/vpeaJHKV99M+oWJiWI3pK2Zfm5PF
	adED/uDqHtqvEF0cjmhW2SVWDlZ7sKSQVPCaxOusEAwJXWd9o+R+tQHyOE2aCQ4=
X-Google-Smtp-Source: AGHT+IF10KQlpq7USEFC0+67cUulPSsFRz/ArqFfz/AlNdLw7sKeB1UDQCDB1c6N16s5KwRX+MW9wg==
X-Received: by 2002:a17:902:f80f:b0:1e4:7adf:b85d with SMTP id d9443c01a7336-1ef43d17fbdmr5128575ad.17.1715282744685;
        Thu, 09 May 2024 12:25:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f4db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad62fesm17991855ad.83.2024.05.09.12.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:25:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] freerdp3: Upgrade to 3.5.1 release
Date: Thu,  9 May 2024 12:25:37 -0700
Message-ID: <20240509192537.1639358-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509192537.1639358-1-raj.khem@gmail.com>
References: <20240509192537.1639358-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 19:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110295

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../freerdp/{freerdp3_3.4.0.bb => freerdp3_3.5.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.4.0.bb => freerdp3_3.5.1.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
index 537d19263d..b6974af739 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg"
 
 inherit pkgconfig cmake
 
-SRCREV = "708f3764897e06297469a7b0507b3c9ecc041ad7"
+SRCREV = "eda5c99686e15327f2f37b9cadf307e852b96adf"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.45.0


