Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87550EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.7364.1687180952873223770
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=jMmsrjlU;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3112d202363so1879359f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180951; x=1689772951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzXfM15YYjj2+bISNUR81lPKe1Mmm1a4ElkQf0ByiNg=;
        b=jMmsrjlUmY2ZB4sD57fJ8hBOmv8OkKBgbbD+BT/LsY4eGqQPP9D5X3bxDd2GYhjsst
         wAG+s7Xuqrzg7nX0Z4CsOUvA4dP6vcY4vVJich0YtgiyGf3zkCowvSbeqQGZqYIcOUuV
         LDiU8h/KPmC//Qhzn/ZSEvvbCbU3jsqTwImC58pcxCVYE+f/S9QU+5DccbcOO8oYdsDY
         U9P9YxIiyyoVcON95DrjkTeAO8z7kA8S0zh4g4nWmyqnjOF8lUmZiBnTrCrgLTWXrIyY
         /JjXV5GINcHbcce21X9RkvCPqenf5LVKmcNo1jRy3SjTTiMVMp1W6Ips5lwINNUXTvIk
         lc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180951; x=1689772951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXfM15YYjj2+bISNUR81lPKe1Mmm1a4ElkQf0ByiNg=;
        b=RlTmzhFUhVKWvv3cn9rd219yN5AlRW5RBa96yGlXLQQtnLg43NU4U9lSi/lsR45JHp
         4sNMbGAHOlMT+YZ8xmt2Zov58yhlAOew5QwZNDBIetcnYHwlK39niH1lrVn8938WUK98
         AbmmmG5Hf2Azp1uVozuyCHQGPBN5OuCjd75J/ZK+guj90QZ2zYUvP93xILQJxHZsWdld
         G5T0D5PEQnPdy7w5EmEMJrggSVUF1wgsoUddMYbUPxFppSa3wz9sRtfheK/HnzKNXysp
         fzyf9qWzWemVkwEnKhD4+E/5NGX+KjxwKDGlYZAU5uLd0FDph3eCyAgknUQwdgvqE5e4
         NvIQ==
X-Gm-Message-State: AC+VfDwvm7e29w5v/2UCyOUcxKi3nFhc6nCJxbUjvDWZMZRHKH+QZgxx
	/O07qF8MBqBB1v2aX3jXPL7N1Q==
X-Google-Smtp-Source: ACHHUZ4D84e2586RhERWN573h9IuYcc193p1tVNdofruN4GBRCFX9j2sM23rete1qyx7KJ1KjSOHkQ==
X-Received: by 2002:a5d:6884:0:b0:30f:b1e8:8896 with SMTP id h4-20020a5d6884000000b0030fb1e88896mr6259229wru.67.1687180951425;
        Mon, 19 Jun 2023 06:22:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 12/54] python3-et-xmlfile: fix coding style
Date: Mon, 19 Jun 2023 15:21:32 +0200
Message-Id: <20230619132214.213417-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103396

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Don't use PYTHON_PN and split RDEPENDS into multiple lines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-et-xmlfile_1.1.0.bb    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
index 7c66342ec..fbebf4869 100644
--- a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
@@ -10,7 +10,12 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 SRC_URI[sha256sum] = "8eb9e2bc2f8c97e37a2dc85a09ecdcdec9d8a396530a6d5a33b30b9a92da0c5c"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell"
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-io \
+    python3-pprint \
+    python3-shell \
+"
 
 inherit setuptools3 pypi
 
-- 
2.39.2


