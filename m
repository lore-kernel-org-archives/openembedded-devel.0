Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B2EC48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 20:09:16 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.2362.1706904554309468765
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 12:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e118b528aeso1254176a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 12:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706904552; x=1707509352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7z+K2mToo53Y2DbxagFXQ+ruJGDAtQW2C9YcNj0mhE=;
        b=JjAEq9A4bKJqEI+l9EN7LNJgsEKOkXwbVLoqfzopLJJ03xIlfumUyDXhKCjH3jbrIa
         BfriE6Ni1oLR7Bh33rYqgomr3EXpqzEqxupuB8KDUy7RSGJe8jOGMj214jn75ZWLdWtI
         oSwTIi2ylYVYVX5wxzPyBzEldsNTDw846YsCJUgDt7Wp55hhSRNneYB0ULoc+AqWHBy3
         WB8bXxZoOPTMKsQHoYDJKACBhMjMelBxTowjY+NJ6ygoe3GaunSlFNJizh0nchEq0kjq
         HoLCykxP0w5QEQILYtQGJwpHuXMLkmpaGUCphiFewdXWJKEVpUP4vhYFT2UitjpBWC1w
         XQbg==
X-Gm-Message-State: AOJu0YxfNpsRU+Y9tqE0n5hz87KXeui2mCRYgkphlhh1VzLdJXyG4wfe
	Naox6Ndp0ksqvPPJrxsUQbsG3W14muLaEPCKk9CIgwfgV09mgsKaJNOckas+UMv0TQ==
X-Google-Smtp-Source: AGHT+IFEC04Uj+CbpaI4kH1r66ExvcRcJUTHvO3HZnJ1Jui+swe8SY5LCvcO5OZXiT8K9NbMCEvdyA==
X-Received: by 2002:a05:6870:d627:b0:214:a08c:5220 with SMTP id a39-20020a056870d62700b00214a08c5220mr833782oaq.20.1706904552590;
        Fri, 02 Feb 2024 12:09:12 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ny6-20020a056214398600b00681785c95e0sm1109758qvb.46.2024.02.02.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 12:09:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/3] python3-google-api-python-client: update to version 2.116.0
Date: Fri,  2 Feb 2024 20:09:00 +0000
Message-Id: <20240202200901.1570392-2-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202200901.1570392-1-derek@asterius.io>
References: <20240202200901.1570392-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 20:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108540

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...t_2.115.0.bb => python3-google-api-python-client_2.116.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.115.0.bb => python3-google-api-python-client_2.116.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.115.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.115.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb
index 63628904a..e4de12bae 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.115.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "96af11376535236ba600ebbe23588cfe003ec9b74e66dd6ddb53aa3ec87e1b52"
+SRC_URI[sha256sum] = "f9f32361e16114d62929638fe07f77be30216b079ad316dc2ced859d9f72e5ad"
 
 inherit pypi setuptools3
 
-- 
2.34.1


