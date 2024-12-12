Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361BEE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 23:35:49 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.4649.1734046543745564579
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 15:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a817ee9936so4181355ab.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 15:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734046542; x=1734651342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJUB4EqqhNO5Z8yHT+WCkDgOjQtVNCp305UkcOfijJo=;
        b=X1zFqNcJ9pyLdNy6hcPTWlPBuLdkTVxgjyboQUE6oXAUqcevhIw9cBFj4r/aX81d8N
         qEE8a+RWrcr/baongsowFImogoWxydiaOISJZ4M27QcdE66NSKqL124wVCHBXHWZ0i6B
         +wYR41UGTDN/MWQOvkvwBm+BIeFo0T05HiyPEnMJmXLmcA157FsLWfHHN4HFljq1Vu2O
         y6jVVMFhnJWv+LXQngi2FPPwfb7ceSPVF442Ofjmtlrn0QVa+6Ni/mbNnF3mS5VlTA3u
         xK3MJSaL3GrP2Mx4h7fTqgEoUAd8VRmGxNAH/OWNiGkAtzJ11sAuHdVkftmqda5WgDL2
         zO4w==
X-Gm-Message-State: AOJu0YyaRc259PJV+MEIOTXt+MmjtISnOMGmfxmnpPSrr6vHjQfaXM0j
	rEDjed7IQ4+iZMTBq5tLR2enpig3KvwKJxaf6pwijGVoPwAZ/MoGiqdLqw==
X-Gm-Gg: ASbGncv3P+Mt8WoNP4ocgx/eYx82uFYrnvOKKXLahuxnjtwOODXMERDz1+WjkMDzfr4
	0MSBuYv9X+BO+sqdg1EBjfW7HvPIV/9RfwskHQAx0nam1VnuvTosL9tCsHRhLmeypBm0LRbrYmm
	qv3/B6p+78BYB55jp8b6FyxxQEgG1+s26OmXd3QWdTAaULsv50SFj2hCzd1I7yFSZwE9zSJia1U
	jqPU/8WcUUzomz6Vjef5NukUNKGQq+gNQ+qcAPdeXU8uJ6oboCs5Q1RsAHT8rHVUh+B9ZZfBJVT
	u4TQ41xmmqbBpjixKNCOZ8f/ew==
X-Google-Smtp-Source: AGHT+IFq7nHEv9SQBm0XGuR1NeCyIbCMftw7CXHKwQUFKsfWrkplkjmUpQ6Zq7QnzduNUT/aFrsukw==
X-Received: by 2002:a05:6e02:1568:b0:3a7:85ee:fa78 with SMTP id e9e14a558f8ab-3affab6221cmr5036265ab.18.1734046542496;
        Thu, 12 Dec 2024 15:35:42 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2c70d66dfsm2017722173.19.2024.12.12.15.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 15:35:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH] python3-ipython: update to version 8.30.0
Date: Thu, 12 Dec 2024 23:35:34 +0000
Message-Id: <20241212233534.3584346-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 23:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114307

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-ipython_8.28.0.bb => python3-ipython_8.30.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.28.0.bb => python3-ipython_8.30.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.28.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.30.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.28.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.30.0.bb
index f290971cb..41aa0dadf 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.30.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "0d0d15ca1e01faeb868ef56bc7ee5a0de5bd66885735682e8a322ae289a13d1a"
+SRC_URI[sha256sum] = "cb0a405a306d2995a5cbb9901894d240784a9f341394c6ba3f4fe8c6eb89ff6e"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.34.1


