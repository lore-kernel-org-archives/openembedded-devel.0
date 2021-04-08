Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web08.262.1617899814460301208
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=epWpmgQv;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id i3so2788884oik.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EHeQcuP1n2xug0T8jrKXrJ4sfx4qd6kIhY5QrUgLSyM=;
        b=epWpmgQv5Q6x+JYnK59u3Lk9w3SdSK9T/c0K7fsb4cryzQAvajr4BxgvxOqGDyDlVP
         FQuFnMSaV4Zt3iQJcpJUPM+NiAn0ucHn7yooOn85borHeYci/l0Gq4YMI/j4Z8BMNAA4
         OI0cEleOKDgeGgNVNQe8mZR0Q6WmOhsNodrwxYJDClBxbSPj3gSf3uQdwJXKhjcCOX47
         JcONapIMKBfmxJT8nHnE8GTYXW2SSPg2bhVaTXLf1xOMeNbCEq2Lo74ou9z5+TaexHny
         Df7TlraNVRORCqh258FhB5Bk3IamkxxMaBCD0+ZKCFeoXOWyAknihVx+YASl/1+7zvzL
         fvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EHeQcuP1n2xug0T8jrKXrJ4sfx4qd6kIhY5QrUgLSyM=;
        b=Zrdv3rb7tZ946taC2dOEyIeePpHTyswXdyWTlG2StL3NaiBQSkWxmmjquE0IqBh8IE
         saUbqyvuG7A9uxGiz0IDH1iQ3c1XDb/JLK+QCbbif6bzZDmC+ecZ8uXnU4wyXRsjdsoH
         1xHPe9zw9o//x8RCA8+goeaz1t+Lw4pgh6u3PCo9iKWVKTcU4S9e8zap5qyTb9dRLWgf
         VYmNVN+9YFntVXR6gxXoDEsFY7oBEVYCgIKIbBHr9UCXCJCvb9Nker52Hgtpe/I+wGTr
         c75F7xRjYbruxlNgikTXEVh6Gplw1fftMnIg6IoVW7++y5KBBqwQWv2KhZm0ERXX+6Az
         h3hA==
X-Gm-Message-State: AOAM530geIVAffZ52GPQB6Xmu/CIrxaSus1jnJLbZkpkriun6p9G+eZ2
	na2pxnwe0Ct/z19tEb0UnjgQ2uETmPo=
X-Google-Smtp-Source: ABdhPJyAGvK9dkq/Kijofp2IyT09wadsyMR9Wrw4Pwv5ONCxq3jignkg+biyp8urZVaWRoFP2qBnnw==
X-Received: by 2002:a05:6808:8c8:: with SMTP id k8mr6697263oij.140.1617899813693;
        Thu, 08 Apr 2021 09:36:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 44/64] python3-aiohttp: Upgrade 3.7.4 -> 3.7.4.post0
Date: Thu,  8 Apr 2021 09:35:51 -0700
Message-Id: <a5ddbfff65ce9814ea2c055d405db5e4cedd5eba.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.7.4.post0:

- Bumped upper bound of the chardet runtime dependency to allow
  their v4.0 version stream.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 6cfe535f40e4e987b5b755ee59918643178a79b2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-aiohttp_3.7.4.bb => python3-aiohttp_3.7.4.post0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.4.bb => python3-aiohttp_3.7.4.post0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.post0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.post0.bb
index 63d67838910..8bf129d30c0 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.post0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
 
-SRC_URI[sha256sum] = "5d84ecc73141d0a0d61ece0742bb7ff5751b0657dab8405f899d3ceb104cc7de"
+SRC_URI[sha256sum] = "493d3299ebe5f5a7c66b9819eacdcfbbaaf1a8e84911ddffcdc48888497afecf"
 
 PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
-- 
2.17.1

