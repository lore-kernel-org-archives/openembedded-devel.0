Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9DFC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 13:30:41 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.17024.1746019752259878147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 06:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=MISxe3e6;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.44, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ace3b03c043so1157587266b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 06:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746019750; x=1746624550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9IhtD7dQmCzuGb7gaDEnp9+NM2iipJ4aQyqEk0Oh0g=;
        b=MISxe3e6g/o7CZgC3EcPAKjDP0MmozbcUks4Ng9Z93TqbOMHFySzkceZPKdkihVlk7
         6+kc+2TUXeny5YRXcY+Ng0hU6mVxsqY7UeB+PStyW8WBuwbtE1wAaX/liNMz/0tjIQHw
         9jbyu+hd2px6utcWgJKlmqOer6i267RZcxnaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746019750; x=1746624550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9IhtD7dQmCzuGb7gaDEnp9+NM2iipJ4aQyqEk0Oh0g=;
        b=KHzqXtn4VzChFpF5F3f+rUuyYLNzXicZUi8181GWt7JtOxh8dPcQM1xzrK51AUj2tO
         zuUtgOf/XKcozkAPTxYH9oZJ0a4XWAJlXd6dgkzX6M2UYM9/gUtxH2bVzRoXmfLrSMjK
         m120GiMPYn1LCzUOTDaTBHCQDVRoHaQ+wSvLGzXo2KeOQW1e3VN+RwbSkhwm5qy87k75
         Pceucz0VtdE6aCGXQl5p9LDDW90kwbCpmCdYq1w9me4LLH4geJBwfRWo7BB4uR3bDOnR
         Hp1QGiQzieb9a1HeLN23mwCJ9nFZAr4C3+KNo45O24/fx2WDjw/fcNE+4pAkuzroodLs
         rdpg==
X-Gm-Message-State: AOJu0YzF5EBGHyD75nPtLsJx/x1WiLU0+XFETHaKVEUnGBl6FBJGuTXI
	B2NhB/rD2qhJLaMkN6MmicVrR+u+nh45b5tHQWUJwiyEVwItmDbFXuYvNPMZrAtBJk0mzZH5g2b
	I
X-Gm-Gg: ASbGnctKGHUwkECe3WjRqQcHYytKHwbmDEeawsWCTHpz8tei5aK/oDipCRMhDJ/sVpV
	Wo4apvXk4iXOdLPBcE7qG5m3710+Sfb0BBxluEmKhSuXCSh8QXP8pHBtKBz5HbFl/uzcaR70tbV
	5Gjt6NmgWO2DAuzei8bF2cogGE9o56NIZQclSKCZBsBvyJ7zyhOaDjMSF1/w4HvdxvW5jX81waj
	VsK/Hc2rzY9Zb3bpw7BEtNNPAN8ik1VdQE01Nn7LIPS/gtBBl5jaCgqGka03g8ygjfJnCzVNZan
	Q0GJou8PsKb28Gq+8d7ez+9uIWzrP/RPWcBuwg40dXnVRjbdkca8vSTWXjkzYPYdfm9YP4rAl4a
	BgnSx
X-Google-Smtp-Source: AGHT+IENpfoRzAxsb9GgYb+xa22Qo4bBzlrI9kQry7pc9CauGxldjt4FwEE+9AViVEv+iHnqbijpQQ==
X-Received: by 2002:a17:907:268d:b0:aca:cde4:fac1 with SMTP id a640c23a62f3a-acedc613a62mr372390166b.31.1746019750214;
        Wed, 30 Apr 2025 06:29:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acecf27a79esm224710066b.24.2025.04.30.06.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:29:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [meta-filesystems][PATCH] ufs-utils: upgrade 4.13.5 -> 6.13.11
Date: Wed, 30 Apr 2025 15:29:06 +0200
Message-ID: <20250430132906.2800391-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 13:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117256

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../ufs-utils/{ufs-utils_4.13.5.bb => ufs-utils_6.13.11.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/ufs-utils/{ufs-utils_4.13.5.bb => ufs-utils_6.13.11.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.13.11.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb
rename to meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.13.11.bb
index 7126684e6126..a6cacdc3c082 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.13.11.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
 
-SRCREV = "18c0a8454ca1cf8969170049f8c628d88627beec"
+SRCREV = "538b147481ee0995afa3dc57443efd4366acdeab"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
           "
-- 
2.43.0


