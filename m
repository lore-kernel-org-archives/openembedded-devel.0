Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06102C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 11:59:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10861.1783684751926290481
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2026 04:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DA5pqgBj;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b1710405so4198195e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 04:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783684750; x=1784289550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LZPlAmH3iO4BNvbX5S6THu5dAhG0Q6+1J5SB5btD/8=;
        b=DA5pqgBj/w4i/fKVUiKIR8s54dRThsycpP6h9Lgq2UYD1nUzP+DwoWfhZke/RKXN4v
         syMZ1RWB+6E8/REBtPFboByj8mUE6zofsBovqv7lZlkPSDwY+sLtcYQYis/TZBOlPPfw
         qjHO0o8XS9TcCNkj+ZfYzOxWM/IBALRzT9jAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684750; x=1784289550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LZPlAmH3iO4BNvbX5S6THu5dAhG0Q6+1J5SB5btD/8=;
        b=lCb2XikVsA/k3bq9+76DFpcohGMuF12WA++A/tBOmCt4TWZYAYFqEpsiiuhq2I6+s6
         trNjJeuI9PMX7qz6HCsrciXi6MJJGNSfrT/INB1wW0e4z5Bkp7H0ZM0NOiQ8wWnb3+5V
         VDyKn8mLpbfWYh5jXyECBo4C+H+hRf0xpwHwCE0YVDV14mf9j99yDiEvR6BC2EHlCSTw
         9SztEcthvMcHXLjSGcwshdP7w2H5DYQFlufyHqdaXAN7vsXfS6CTxSq49u5kgufVXYSn
         Hv+muCwUjC+XthpCP/beSX4JFdjKIldlwSKuHmMjFIoMLEw6UvVp5CnS3iaHhtD/oA9J
         ixjQ==
X-Gm-Message-State: AOJu0YyRuVDGV1+u2QgvVBDBzNAqKO4J4kUZog/v04ZiKoZcYpjmKHlP
	BnOYD0WPEmZB7QBGxg6CZlhTVluDtmiNEMqkMsP2MACVMtTERqquz86Lz7gEtueECt5iHU7+4Wt
	Y1jqK
X-Gm-Gg: AfdE7ck5rRl1ekxbk3nHudPoKlllMssa3vIIToJVzqseoajfoZgBpvHJk1u8NBZFsEC
	4K/52Mq0tzw3+VsmERIgWp98kPd2J8eDzyhI8KmlJ5b/5QKDIpx8k+slQPB99uNE+sus+YKV0LQ
	nNB5YPvGlver+FAfl0W/Zb0kfLCeQWXDLpNJ8n/xmCHrefOXlhINcYU4q66gZheu2Bq9H/mJzNm
	+u+zs+4bNe/GwnIrrOJBzS26NfdHNkfyXOsNYW+UeOqF7rNcQc4khPAs9JYRFQ4ykJLckf2rViX
	yYASvSts6owUISXTIDA904wN1NDHqCkh3jLWNsYjRySlGyJlwx4eJEeCsKZbZz19qHqOHzxW2tD
	1944PyR3iWiKMm053hQs48iPXrOWPDWRPiMyjj7FraKpBSBRCTFQKAhX4UBNMsAGQ8UAh101ejI
	t9syjJIRPiUSGjEytqu4F2X4A2UOTr8czFYaUCuFByquEpZF0C01mlef+RnoBQ70jVKHuKP0mth
	EkwJIOBbKqADpO/rUQShovnarIf2HVtYBX3nScLnw==
X-Received: by 2002:a05:600c:46c9:b0:493:f750:f7fc with SMTP id 5b1f17b1804b1-493f750f87cmr2314985e9.35.1783684749644;
        Fri, 10 Jul 2026 04:59:09 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb66beddsm152078415e9.0.2026.07.10.04.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:59:09 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-rarfile: Upgrade 4.2 -> 4.3
Date: Fri, 10 Jul 2026 14:59:04 +0300
Message-ID: <20260710115904.1222632-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2026 11:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128128

- Disallow extraction outside extraction path, in case of existing
  symlink.
- Disallow creating symlinks to outside of extraction path.
- Apply length limit to passwords, so too long password give same
  result as for unrar.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-rarfile_4.2.bb => python3-rarfile_4.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rarfile_4.2.bb => python3-rarfile_4.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
rename to meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
index 3f4423a71f..f051e63b62 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1916695551f7eec48dfd97db9467b831"
 
 inherit setuptools3
 
-SRC_URI[sha256sum] = "8e1c8e72d0845ad2b32a47ab11a719bc2e41165ec101fd4d3fe9e92aa3f469ef"
+SRC_URI[sha256sum] = "0d8b5a7ffb9f8e9a7b002f2398905e4420c0cb373e799b48e48f418db9c8816a"
 
 inherit pypi
 
-- 
2.47.3


