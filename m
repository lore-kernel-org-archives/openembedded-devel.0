Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88803C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:41 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24806.1785872439515120469
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rIl5jLt0;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cca0c5799eso2564045ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872439; x=1786477239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sc5HsMcazD37/w8+BnIj+Y8MXWv0nwwf8ZfzWhVxfmU=;
        b=rIl5jLt05kXYMvdaFN90lS83DAAgayMjUS4JjTHsUABELM2GfZXOOr2cHoAEB74ljt
         0ixNYMMulf4Arpzt/8wx5getzQzuH4nrkRJYbOXOJWQ9GHUo4srxjFrhI6M5se3W/eNV
         ZLlDX/yUSx5hBJlZm5uVQgcIdO+mJWYSTVw0ZYh+HbV5R3UbQA1vG70P1Wsm8P/CSI9B
         /c/FgAhN4vKxmxsCySjb4tdbPNkXCBLp+FmKpGMRfszG7g22bZJLJIDb/Gq5lM7kuZj2
         atNNQCmyudgeOCwqviw3ig64EC1ENlKKtN70S5WCnUMnGfgwzTL5yPuldRfQ8vl/nlrF
         +ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872439; x=1786477239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sc5HsMcazD37/w8+BnIj+Y8MXWv0nwwf8ZfzWhVxfmU=;
        b=N3tlvBWwzCdL9uIGeItY29ekx0l9HiDIdweGSKamUVCdHwfEDTv5hj/KcqPQ+CKJyd
         amHW+MekH0jcDNZzFZuFGzm7OHtHEqIGR5+lVGG3Vq52ZOAdQdSHMkO3aPOwCMCEzRrB
         zHBJIdiqZpK+HquZJBAl8ZZgnq28Gj64Wx5uTa4EdjDhVXHEKbn+voFmYSVjzNV9wwiJ
         hjqX3M46DFYPnTfrGUj7izk9c+yyW/TajMDsvpEeNMCLUk3gMkvN/Atid8fxMc8BAVSE
         zYUylGonskrgD69OnBvecjhmh/e3ePc81vu/z/QJF+ZyQPxvyrn3Wi9juGxGWlId5jdk
         RX5Q==
X-Gm-Message-State: AOJu0YzgpJE+UOlIKnZmvPwE/0PIuHhJ0bKIhAIWMz0MhIt4E8NiZI9w
	u00D+NhcEJq0rKUh/wUYtNUVN+A4P/h3cv1vGBBA+0ZYZRYqyPLgmsTsf0Wubb8v
X-Gm-Gg: AR+sD11nwhQ4mZYYPF31jgE/MXsAoZa5KXdTRYnBs7c/9pfsbFhg8dgfFlUgy0LPFol
	rOQyFKNfVFoQve92sIAC+EC6P75KGzVejukmcldIq8YmJQVulVOAhQvE6Xo1mZEixIloJwLaGED
	k3hpKgfs6nagLG2W609y49za2AK9moWYp3sALGyS26/KAepniHTeE8ygoq37krAksKaT9x4Sh9O
	olQfxg4T/Lf9C0VOaUlpE/dLQ3XEHEwNzPiY8WAk5CuKQ7Wa3L/vJComZgV0ST/AKRTLB3nwGEc
	BQrcE0SM/LHEQUngIbbCWhZDhfUWVNyy13uUUAzh6ZUN0MG463T2L5yeIal+/KR5foGReA6KgMl
	DsxcDEqyY5HkdUwI/0Nnd0tHmZHOuZGrBYC9baoB80YyfvKpZJMESoToqgOk3YorT1kcKewqbpF
	QTYl3Cj5EtVFAzLhreRPxycJ40+pEyFavXyHzRcHpT1ip7+T5NcRRwX+Q11reyGllLPjqtsOFF0
	A==
X-Received: by 2002:a17:903:90b:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d0ca7b0926mr13898315ad.8.1785872438754;
        Tue, 04 Aug 2026 12:40:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 12/36] swagger-ui: upgrade 5.32.8 -> 5.32.11
Date: Wed,  5 Aug 2026 07:39:39 +1200
Message-ID: <20260804194003.3158916-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128759

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.9
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.10
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.11

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.8.bb => swagger-ui_5.32.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.8.bb => swagger-ui_5.32.11.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
index cd8b56cc01..19000d6f35 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "4e0d3f88de7db0395a80ef0541ff428f0926d484"
+SRCREV = "414a60c9a40408d37821297682b8a190a840a79b"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

