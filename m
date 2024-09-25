Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC538C369A1
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 07:11:05 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9664.1727248262448961143
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 00:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LPOm/QlP;
 spf=pass (domain: linaro.org, ip: 209.85.128.41, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cae4eb026so62746955e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727248260; x=1727853060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLA1pfxcGbA72cCNc2pgl67gnEmLwoAvQdPRggY50GY=;
        b=LPOm/QlPH3NklE6kkbsy0yCepIAzVbGwyCFLy3ULNSwk6YuEpRDIwhEDYCMqaPGcJy
         mnx+8zEmmyfNYHXdwyjnhVg1vFWw1gQfCGcJcJtgjI93ZuVY2aW3HjunXzS+DmsDYpxH
         vw9lzNEa9Y6m0LGoUjX8v/JQOO7Md2vpPM16Y/TJW1VtDAVHmc0bbdLzjTj8Ky5Z725P
         PbeXzyTAetXfM2BYpmg8n38yudf8ivok8xNfgwPSBgrFGi3hwoYw+VLanP83BeF29La/
         7Fr97mj7Mfv8EgeRltgricH8AfEaROoBM7coBeGT50PF7iAR62oGloW1RvOAyoyTMJ2o
         JChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248260; x=1727853060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLA1pfxcGbA72cCNc2pgl67gnEmLwoAvQdPRggY50GY=;
        b=R5xrPDvo8hku5CGPwwfzOI9g1IAn1pdXUuJ5CYhhCP2Tzf1hvw5w2ObB4wBv+OUiKY
         huKTs3ZhPxG8cSdAxx/yIzrrUgKEUHHIN3BnVX07VokvROn+0olJ4KII2nvlO+zDGLN/
         ACbu4K1TVYuPd8+/KucK+ZlspyP81l0v0BZGYEO2+voKn0JWBdInlw5acDpEcJ476EEm
         6XqJrHu3uA36bFiasHZZuWRdzu4x8+RntL53Q84/AyyQAXZRxFmZOqmgxX1hLio0ZinO
         sgQ8D5JWj2de448yV72ZdsGrXMeCpfDuB3bJqacQ1uwuc0eqFm8+VqrNfLxSseDcPHHW
         9BzA==
X-Gm-Message-State: AOJu0Yym4Wsaac8uNORU/4Uk5DvVZGRorxQg+sMwME9h2Tfn1OiPdgNm
	ep1JmOYVy5AxFfXSJBt+NE48mTwnxY5F44DMi3H7w/M70LyZu3D/+8H0yJbOW09QVj9Vu2nFrYn
	7Jd8=
X-Google-Smtp-Source: AGHT+IGMdNj/t3E6+HmOfqZvmZi0OoesvVkIKyPCZ9ND2wlIwLnsetcGyAh5jjR9dqDtgKBcdqi2ng==
X-Received: by 2002:a05:600c:1e27:b0:42c:b45d:4a7b with SMTP id 5b1f17b1804b1-42e961465c2mr10076145e9.25.1727248260351;
        Wed, 25 Sep 2024 00:11:00 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddb4csm9201745e9.6.2024.09.25.00.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:10:59 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [oe][meta-networking][PATCH] htpdate: upgrade 1.3.7 -> 2.0.0
Date: Wed, 25 Sep 2024 09:10:55 +0200
Message-ID: <20240925071056.26013-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 07:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112494

From the changelog:
* bugfix: incorrect "estimated error" (relevant for "-x" option)
* improvement: make all implicit conversions explicit
* improvement: take network latency into account and compensate for it
* improvement: faster synchronization
* change: log to stderr instead of stdout when using "-F"

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../htpdate/{htpdate_1.3.7.bb => htpdate_2.0.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.3.7.bb => htpdate_2.0.0.bb} (92%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.3.7.bb b/meta-networking/recipes-support/htpdate/htpdate_2.0.0.bb
similarity index 92%
rename from meta-networking/recipes-support/htpdate/htpdate_1.3.7.bb
rename to meta-networking/recipes-support/htpdate/htpdate_2.0.0.bb
index b6dfab085..16d35794a 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.3.7.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_2.0.0.bb
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=2b6cdb94bd5349646d7e33f9f501eef7"
 
 SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.gz"
-SRC_URI[sha256sum] = "88c52fe475308ee95f560fd7cf68c75bc6e9a6abf56be7fed203a7f762fe7ab2"
+SRC_URI[sha256sum] = "52f25811f00dfe714e0bcf122358ee0ad74e25db3ad230d5a4196e7a62633f27"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.45.2


