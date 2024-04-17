Return-Path: <wickbergster@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86093C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:24:22 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.10447.1713353052375459197
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 04:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LstJ0vKA;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: wickbergster@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2db13ca0363so11732971fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713353050; x=1713957850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17HMSRkfRj63RTAMwh/J9Wez90CW4k0BcHzdjZ1LGWs=;
        b=LstJ0vKARi2VQXGZDNVFTzklzn7POmcuALO8lJt3DnQMEzqy+VkcQDcvCgAl8LNB4A
         Ua5JzsqJJiut4CEQHdWbrPOqfuo11efaM4JsLfvcYQUstGL9QRckLdPLCudsMEtiK5Hz
         BgTz7byGkr80PdRyTh1SXAQcsa32ttfr8u9w4VxED4mGk9Ituk4yjMGBeK1GO+LaUO64
         1h+lODmo61pp6bifOAiYVfClXiL+s4umUpn5ELdELOrTmOCzAMBSO1eIDB6C+KVgE77f
         +0AxzSAGkyXCzcpuyGptE5yJf9HOZLB2FxNUdgqNbTTHvi4l+UuG69hGFDm7odhSf46L
         v15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353050; x=1713957850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17HMSRkfRj63RTAMwh/J9Wez90CW4k0BcHzdjZ1LGWs=;
        b=qKQShW4IiEuIqhtMLlzZ8QurTqeyF2Ex5qlGDMfod6yUY5LsiH7mjwperyir8+fVBO
         4q9xyk2r+AU8vF9BRj7Ng/xlX/JDR6+RPX29ZbUWQ3I1v/LhEf9pmGACLe44koemXuhI
         AQeNoAPHL5lryVI2iuO0ryB3192fVnQbvkVRnStKDosRHSxX0VO3UfY40AZLUU/WD4WV
         d23UIvUAqEL/pzGrwkBDzMht2a75VPhtatOJ7/jsZG5e5ZFbN95LyhJv7O/Aij8ROqRv
         V0qepOcVnCvwEB4jkMQy66mizB8YVctLGmH3lB8EbNWR8Eb6pEiMFJoVXvLXjuIF8Bab
         yGUg==
X-Gm-Message-State: AOJu0YxyVLAYyb5MYRnvgRblvuOiBl0x/hMO1lcBcVa7jCE7HeIY1oY0
	tG2DJFqhJbJT4WLj2K+dpub21iAjVpLQasMj8vVe+AK/SzODFtdE5UEWYg==
X-Google-Smtp-Source: AGHT+IEfIyF8FddEktq8bbzgV3W3AlcG1rrTaJlOXEoKJ3feyXM+mMgLWWZv7Dkxcpc8SI+HroIPYw==
X-Received: by 2002:a2e:9b1a:0:b0:2d8:d8f4:f6bf with SMTP id u26-20020a2e9b1a000000b002d8d8f4f6bfmr13015219lji.1.1713353049775;
        Wed, 17 Apr 2024 04:24:09 -0700 (PDT)
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id d11-20020a2e330b000000b002d68abf446bsm1845169ljc.139.2024.04.17.04.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 04:24:09 -0700 (PDT)
From: Alexander Vickberg <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-networking][PATCH 2/2] nng: upgrade 1.5.2 -> 1.7.3
Date: Wed, 17 Apr 2024 13:22:15 +0200
Message-Id: <20240417112215.2561234-2-wickbergster@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417112215.2561234-1-wickbergster@gmail.com>
References: <20240417112215.2561234-1-wickbergster@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 11:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110041

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 .../recipes-connectivity/nanomsg/{nng_1.5.2.bb => nng_1.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nng_1.5.2.bb => nng_1.7.3.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
rename to meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
index ab2907110..a6556249b 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
 SRC_URI = "git://github.com/nanomsg/nng.git;branch=master;protocol=https"
-SRCREV = "169221da8d53b2ca4fda76f894bee8505887a7c6"
+SRCREV = "85fbe7f9e4642b554d0d97f2e3ff2aa12978691a"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


