Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.26592.1611141368281887147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pbYN/T5H;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id 6so15438774wri.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IFM4wiDMIZuHGSHggWQn8MHn4Fi83+J/eQ9wFo0KuBc=;
        b=pbYN/T5HhpBNVoLedw16JcoKixjt2ooBRGUW9pMQn7a1NAOnQSQLA2b5FYnxYD5gXW
         dCgrl4fkyYfgu08QfAH6yXjHI+v4B1Hax/MaTwptPsml+FWOhIBSExPvqAnuUdHmnU9L
         42ReXU4yjsddUZHjkbE3s8sVcBFGihCl/nugsVW4xxGwAS28u5De3XpayKYU90/Tzs/l
         iy5nrE5LLYqWYbaFyIxEr4jns+TJFhZBgrZfDAIFWHo50Sg6PWR+7mefK3hfICjEvnOE
         uI/116SgKc5wRZEQUEawoj1/75PmS/f8UDpIi5/sYMWQBXxW/3J12HRkpV29VLw2cfXv
         xdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IFM4wiDMIZuHGSHggWQn8MHn4Fi83+J/eQ9wFo0KuBc=;
        b=JPVuTI1qPziOLsSVLZvIngjbzwiXmejaTLd464tZRyyiJHt9idu+QIcRU5Rp0FcoQ/
         vBMwxPJNQc4tus6/ZcV4jSOsqvP2CEMi5evpBz5yrPpaQT4yJzJtN/x9Tn2Mr3vsR+Na
         Krk28A9vbABr0uHZ22ADftrf+HyxSeSZblT82FWCY6BN9TFXFDmNELyql1Wr2ZnYsCkR
         FEmCq8+EZhjxgEy/yT/48V/Q7SqesQaTh6oOTAeSJqS1ZOrqMKSP7Bab/KJUfgHAQ2I2
         bCzVkNzZiHoxgPfRswphZ+jYpvI+ynjWrBB+L24yjdedcB60eLvO0Mmmp/p7dqB+scsx
         Jnkg==
X-Gm-Message-State: AOAM5306ZQ0U61H7SM15zY1eElmb3OiN37YbxI8ZUY/Fb9F3HjvIsiN0
	OwG+do2Xsfxv99yvsm88ltI1xB+hScI7YA==
X-Google-Smtp-Source: ABdhPJx8Xzz1HKn8NERm3Q/h1QqI7x4kIw4CjEBeYAae2DR3Tv7HhrtrMsn4GSpeziKJSRgRsm5K2Q==
X-Received: by 2002:adf:e511:: with SMTP id j17mr8701043wrm.416.1611141366347;
        Wed, 20 Jan 2021 03:16:06 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id z6sm3083076wmi.15.2021.01.20.03.16.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 03:16:05 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] fsverity: update to 1.3
Date: Wed, 20 Jan 2021 11:15:59 +0000
Message-Id: <20210120111600.879308-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

---
 .../{fsverity-utils_1.2.bb => fsverity-utils_1.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/fsverity-utils/{fsverity-utils_1.2.bb => fsverity-utils_1.3.bb} (94%)

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.2.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb
similarity index 94%
rename from meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.2.bb
rename to meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb
index 4d5dbafb3..72b742fec 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.2.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb
@@ -9,7 +9,7 @@ SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
 
-SRCREV = "406187bb3a885e083b448b2c2aa42c22957ae629"
+SRCREV = "a92b1a54b003879322c044adf0ae3ea3e95e7348"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

