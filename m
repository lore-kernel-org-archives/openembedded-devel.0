Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CB6CF5385
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:37:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.7969.1729687013906494715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=II9BpD8A;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so48372075e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 05:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1729687012; x=1730291812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHFegL83eFbVXvCAfzjWXicpNjo1AEuucMNHETredx4=;
        b=II9BpD8AkiGPlRYLZOEjA47TsxHEF3uahoELFVlc9Z3x95HBykXYWeeFE2nLcXgohv
         w9TZMA2DTCPN/kWdO4HK1oy2WzPZMYdUuICUK5GxORoh0ocap/aDulUmcLU0hw586Zof
         iUyns3G3njIMcIuA14gaicONvuEh0MYhh3/yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729687012; x=1730291812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHFegL83eFbVXvCAfzjWXicpNjo1AEuucMNHETredx4=;
        b=cgYAYr1mPv0cJsJEja0r129PbvCxiZxK8jzhrb5g5/xuF3HfccYy9m1iKS4FEHH6EQ
         /zbSATCjF6ntkKGCCEBX43BoW47vNRxQU6zQCoDIaH/EOgfIQhAng25XYvqA7kqD87yp
         mXooVOTFd+7tgmZQUsVN4asBLHcD4OVxlPN0sWt07wyVJeUWLU9db65kWaryxJ9/yhQf
         wXdgR5CQb9MaKvP8/RwRs5uuOYDgJpuCNcyzSkoiKSwKjJjRtBL5uQiuEFbZjjv955UY
         /IsneubzN2UYquc0k6e32OATH8+DZ5k6YAxT43ZgW+7ect7yUlP2lyjocrOkfkCmvsao
         o34A==
X-Gm-Message-State: AOJu0YwSZO95TKiPzdVngVDcGqRL+w7P2xT96x2qvGf9s++egJVvJXI2
	sKKDbMuHZ66p/BI1fjy4oQDDaBwqQJnn2l9AcuOE4w1G5oMY9QiF809h808laHtKUofhzbs3XDi
	0
X-Google-Smtp-Source: AGHT+IGkKfmtWE5KfEXu60noOgXdXDeVJbRo0SeuofbRAxlC7MWaEjvjP/D0KDPQSTI7H3TiuF3D6w==
X-Received: by 2002:a05:600c:1d06:b0:42c:b5f1:44ff with SMTP id 5b1f17b1804b1-4318419a118mr22697425e9.24.1729687011348;
        Wed, 23 Oct 2024 05:36:51 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bc90sm8751248f8f.100.2024.10.23.05.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:36:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-rich: Upgrade 13.9.2 -> 13.9.3
Date: Wed, 23 Oct 2024 15:36:46 +0300
Message-Id: <20241023123646.1067047-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023123646.1067047-1-leon.anavi@konsulko.com>
References: <20241023123646.1067047-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 12:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113150

Upgrade to release 13.9.3:

- Fixed broken regex that may have resulted in poor performance

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-rich_13.9.2.bb => python3-rich_13.9.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.9.2.bb => python3-rich_13.9.3.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.9.2.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.9.3.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.9.2.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.9.3.bb
index b279edfec..9458e4137 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.9.2.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.9.3.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "51a2c62057461aaf7152b4d611168f93a9fc73068f8ded2790f29fe2b5366d0c"
+SRC_URI[sha256sum] = "bc1e01b899537598cf02579d2b9f4a415104d3fc439313a7a2c165d76557a08e"
 
 inherit pypi python_poetry_core
 
-- 
2.39.5


