Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9B6C47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:24:30 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.155962.1703877864124594879
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7bade847536so187840539f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703877862; x=1704482662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJiWTmybyy61nFi+M8sBOgz52XCWp7S+PMLMsFVZg/s=;
        b=i4shBbQC3x1kAqtEihd220oNfBSTwxholRSV7DVnOUJ0Zrn6ZrLfaTaDpM+jMA0LMK
         WJRMe4tvKb/Y0tVk3SRGNP3Zzm8c94gg9d12d2PQRYdblaU5LreTE6XZrDFUXqaNm4LO
         beg4twJHT+8RS3kKSxQvTmo9w2rLR2ixZCzGsyks6YvUC6HIjHXdg7bvww7BVJY/13RT
         ftre5OjR2GGk4Av6v93nHJ5xLz2W0Au2RL/jPIlveAAQkQQjjdfETszQaNXicEBXv1UN
         FWTZXFYiO2N9cuOUR4fEwzXzVqbXOrHJkaXLMrmg1FYKHfs3pbqylNZd2rbR6HHbq1TV
         IT/w==
X-Gm-Message-State: AOJu0YyEGFPsLXvYvY6CiKKXmIODdHn5YHRnw/XcvAwthc0xn4tCXuLb
	yCL/Ib4ZwaRkEAAwML+j8ciXhjgjXREFHA==
X-Google-Smtp-Source: AGHT+IF59OkWe5mR4rr8nRybseFC+I4bK9ioB21cnkgP6pVzSgc3J7VujaMCs2VO/Y8X5e2N7OaCaQ==
X-Received: by 2002:a5e:d714:0:b0:7bb:398d:d789 with SMTP id v20-20020a5ed714000000b007bb398dd789mr3821427iom.11.1703877862610;
        Fri, 29 Dec 2023 11:24:22 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id cd8-20020a0566381a0800b0046ce5f7e87fsm4884599jab.136.2023.12.29.11.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:24:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 5/5] python3-cantools: update to version 39.4.1
Date: Fri, 29 Dec 2023 19:24:07 +0000
Message-Id: <20231229192407.2736363-5-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229192407.2736363-1-derek@asterius.io>
References: <20231229192407.2736363-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107904

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-cantools_39.4.0.bb => python3-cantools_39.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.0.bb => python3-cantools_39.4.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.0.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.1.bb
index e7cafe14b..e26405dd7 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "e38cf3972388436aa8e19ab985bfb19c2cb400d9ba882a5c070c3497629674cb"
+SRC_URI[sha256sum] = "98c4d007a6d9803c6433c743c0240e73de930530f8255e1e21d2e20e8991a30b"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


