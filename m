Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.233.1617899810288580531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hRe9ia9W;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso2953234otp.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=06zRtbJvJDFVWACs/U9BaNTzBLk8VkqOXnoBRI7fnS0=;
        b=hRe9ia9WFh/5jQ9ztcun3PfjHElZmDGs2FIZm6xD3JWVO77DS0Y85q3jpovPDIOX74
         m295wY+G3WxHAYMIwql1Nr8L7m/4iicWqK6x0D/wTg9P0VmwGwBrkiqqzlfWENx0G02r
         Ihfw4vk35nBPK+C7nfr4N2BBEY6YgjS6vPx2lWscB5A9/dSJMPIUoYymt8xQms0jktYE
         /+WTDGw9Sfbof5D9OYnuPEqNjXCGJtcqM9fAteJJlJHMvATe/Og7BgUZbORZJYKYGvGZ
         ZSqC4Xumzu459L2hJmfiLmi6N3B9AeXZ4putMWCdMk+sO/tdD/UtmODqoGXilPdwLied
         QxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=06zRtbJvJDFVWACs/U9BaNTzBLk8VkqOXnoBRI7fnS0=;
        b=TbOYC//tUo07nY/cYALSf9i2Nkn7gWuPowFQYwSitURA9SWezJbnN/1AXdom0wFPu8
         3waNmLED0+nsUsfuCKEexTJs2SVwhiI/DBp7dQCwOb1mwtGKUpOP+wvLfEU2IxqoTMem
         GD5K1w6pijzJkHk9PBPP4DvZRLNC7zFPhlIK/VU0rDYDOibJb2td5b2kB1FbHVZoHR7F
         XWtEHFqSs/pGcxyEL/0k5i6OR8POoBuoM9KNat/hsy85BPvqEroR8XoIxcSv5eQ81XZi
         0oHzyZYsSsWCJqfnsJHPKyy9ebJrREOZfKQ/gX36avnyWG8T/76+JMI/SlLgv6nKZ7Ol
         U2pQ==
X-Gm-Message-State: AOAM533NhL7zNxgP3I2iEs7JY+X4mNsSPK+CRWQ67o40Kwu9rivu7ef3
	dB+kIqUI62+LFu357qzLWidHWa2nZN8=
X-Google-Smtp-Source: ABdhPJymHDCMQLYFHcClS1GrE8WFioOplpEaPvYJLfPByFspPuKojhkMSDFtKk7/KCg2vpnT9ySLeg==
X-Received: by 2002:a9d:67c2:: with SMTP id c2mr8583093otn.343.1617899809511;
        Thu, 08 Apr 2021 09:36:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:48 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 39/64] python3-tqdm: Upgrade 4.58.0 -> 4.59.0
Date: Thu,  8 Apr 2021 09:35:46 -0700
Message-Id: <5e1202f5b63518ee5c4fd7d35c7c6e621a546c97.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 4.59.0:

- add tqdm.dask.TqdmCallback
- add asyncio.gather()
- add basic support for length_hint
- add & update tests
- misc documentation updates
- update contributing guide
- update URLs
- bash completion: add missing --delay
- misc code tidy
- add [notebook] extra

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit d35780c181474bd1b214ec2e17d5efee7b9c042f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-tqdm_4.58.0.bb => python3-tqdm_4.59.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.58.0.bb => python3-tqdm_4.59.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
index 771016962da..32e5cf053a4 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "c23ac707e8e8aabb825e4d91f8e17247f9cc14b0d64dd9e97be0781e9e525bba"
+SRC_URI[sha256sum] = "d666ae29164da3e517fcf125e41d4fe96e5bb375cd87ff9763f6b38b5592fe33"
 
 inherit pypi setuptools3
 
-- 
2.17.1

