Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB8ECAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 19:46:33 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.35834.1758483989116171630
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 12:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F92U46oJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0473327e70so696610966b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 12:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758483987; x=1759088787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNvTxUqKRnm9onhgTt7EdtTgI7bsEst3FTEOqL4npCI=;
        b=F92U46oJnZ6XLolcmrGiCgNfV3HQU+Eh5R5A8Z/AUmqA54A+oG1jEzUv+2AtGpkoUE
         zCUAZv3NmvKkWQiuyFbN8YGYTMIADTAKi7UknqRiRwjgReP7jJ9kmlrZOUYwiWLDg2qx
         aFuidKhuNBbp0VY12CpvQpBhpdR28YfJav5zPFYuR3crha3ZT05mwNP0t8URx6IfXMbg
         dCYOiyNbIlh7Vye2eEkOIlDd2C+QSaFgV1T/8va6zprkVJAxRXTAELqttXc4IyAL0oc6
         0ycMFMIieIsyHHWdJM8V2taaB7ajUerCwPoZwN3qY8HTUHUyD7gRX/QFst3/z6+zHUBn
         kG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758483987; x=1759088787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNvTxUqKRnm9onhgTt7EdtTgI7bsEst3FTEOqL4npCI=;
        b=uzYQb4P6hiwKdlPxZZzeMILTQX4TwWoPz/HgYiN7YwAC5K+eoPBLGhr+o5biw2yy2D
         JhLbNTXmu+oZTvQ1JbZLkws6AAd49tnzk1su++Z3pTkLnldFeYqzJd6cGG4ULtQHJ1Hi
         LPRnWmdra/K21BI5sC2KBfZ67yH33UmYGklUxlTf9lR8LXlgPfEapWf/iJfaYvY0JXsO
         aEC4PTuEoRmXC6jynIiLiyNJAa5wbcIKpv2cCOzch5th4JNJ22GUcl9Uo8+FTcMYyitv
         0NkWZM3LrOfL6e/LGGltCr2No7Wffv/4GyvqSywkyid973+0dZXoF10aeXIzfu+ZFF14
         30pg==
X-Gm-Message-State: AOJu0Yw5I9LtLLEleAATnzxJCG1GiwfyZPpj8VI18sv+Yg6JSl9qPcY4
	6OhXx7NQPRKoJVy7YlolLkkb4OvUQnCKJkHccjeFVvW3B5+E2TXLDW0xWjnFlndV
X-Gm-Gg: ASbGncsM/Af+nGoHSk74ZU2ZOXETRmr1QIS/9ZWnXLoRTWUjWNQRdhKu6ZXBhLwQgsh
	uHUuzNGIG9a086/tfdsdJLQeiDXkaLhXelPP3SwPfr4PqN4JQAF6oOnSEBwxVOf17/tvDwv3c2y
	cW7ZDrhCaw4mr98e/Z5wc/YVBjosd+hOwUiOQQnb3Fae3Ia1QSii/WszqjL2hUb2bxhZG8Ansnd
	N00DWaH5T5+kR60QmQg4RYd5aLEWyWYr8MM5kklgj6S8zn/ZbySH+WIhpd5F7V6GBL0yMZdH2MD
	I0eZ90lo73JJXJW1hZ8uecIXCkws101jalqMF4w6xFPvFSEKSpD2iRb07fwSyAf0iGW7tUnvSXu
	1bghafwmxbCltxodOYycxXidnohR6z4ntat+TilBWAv9F9l5hRt0mshMQZhi+JjC3DwWnNcK77M
	g06uItrgZ0Ev0ce3/+aiZA7WNiLVlobLg8iha8wvvI5is=
X-Google-Smtp-Source: AGHT+IHpvxgsiI72gG8D18YYNxIr8vIUBRjaR7XDp9BpVpaZVma0poWxLvVJ5hXbneQdtEQamDYnWQ==
X-Received: by 2002:a17:907:94c9:b0:b2b:c145:ab8d with SMTP id a640c23a62f3a-b2bc145b5afmr196389866b.24.1758483986640;
        Sun, 21 Sep 2025 12:46:26 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b29abf51da3sm315549566b.75.2025.09.21.12.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 12:46:26 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-pytest-cov: 6.1.1 -> 6.2.1
Date: Sun, 21 Sep 2025 21:46:02 +0200
Message-ID: <20250921194602.1207268-5-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921194602.1207268-2-t.f.g.geelen@gmail.com>
References: <20250921194602.1207268-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 19:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119636

---
 ...{python3-pytest-cov_6.1.1.bb => python3-pytest-cov_6.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-cov_6.1.1.bb => python3-pytest-cov_6.2.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_6.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-cov_6.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
index 292cc8a063..f3f4bc3e86 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_6.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=cbc4e25353c748c817db2daffe605e43 \
 "
 
-SRC_URI[sha256sum] = "46935f7aaefba760e716c2ebfbe1c216240b9592966e7da99ea8292d4d3e2a0a"
+SRC_URI[sha256sum] = "25cc6cc0a5358204b8108ecedc51a9b57b34cc6b8c967cc2c01a4e00d8a67da2"
 
 inherit pypi setuptools3
 
-- 
2.43.0


