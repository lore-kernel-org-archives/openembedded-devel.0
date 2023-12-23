Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6423BC3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 07:12:29 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.2915.1703315544969510796
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 23:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=loEpjLsn;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3366ddd1eddso2196173f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 23:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703315543; x=1703920343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjtTBI2y5abRn+NCCBFYnsv9ET02vVoQhslCivLXXsU=;
        b=loEpjLsnY2glTn/sQJyIbNL7MD97StsntDBs6NfMPU99lZaXitLnOCasUqRXt3VoId
         KmVMDdKFgDsmQFMswipTv8yB4M/E4GGW6KhlqEtyklqDyd+iHdrY2nk/RJlwEQE8oCFP
         muyVI64TTXw4PAtq3DACoWcgR0c1aVkK0Z/DeLOuNxCtMKSvsqrlvxWwFtGpRZEFqVzb
         mvgMZsn1C7VKEeaotEHPRn3BSFr6hfxefkYTs4J+PTCXIFTTFF7HEaIkxmAsn03wvlo9
         SHC1dRV7XvZrZ/I2Pl3LX/l9JmqODPxeXGTiCNuiS47XL6BDJ6jqjpTSmXOVGgJj8vnl
         0eAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703315543; x=1703920343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjtTBI2y5abRn+NCCBFYnsv9ET02vVoQhslCivLXXsU=;
        b=BlBKf1Tge+zV7AhzQYTwyWc3H+m1iiIT+ztnXVOitM9VN+KiRKLvqBUP190QoJMe0R
         GPgw1SBmZy0462Jauah4aRzgDun8MNt3evvb4pozllDxcloVUf4BoxaLSwSLxllGYa3w
         wdd5r20j16FBT7w6Va8gC3LgxYsdc0bi8UQucANu8JHA4aaKdFvJQqFjPmDHWmX9xk1S
         RvR25Dd4kfwjsRAHefpd6+gVQQgjiDoExC3Zwy+Nsw9mwyaV+M3zuHsF2lqjyGY6ZSK+
         MJBjldMGsozM9IPsM3mbgOJzlURQ2vkZ5FdkGuvxuG7HdSgq0OJYBJtvm0dZ4ilg4e0+
         0gug==
X-Gm-Message-State: AOJu0Yxfviw2Ulp58f+X/CKgm0tqYdktarRmuMSMDJsHfu1wo4+qVaZw
	MVWTYwiSet6ag6NZGngac0UCDHd2mHA=
X-Google-Smtp-Source: AGHT+IFrQs86FlTh4SArqS7VByIGSx+Qwf6XdWQnyfHjGaGoENDhqMdDU0Rflchtg0vGqk+8O1+rkg==
X-Received: by 2002:a05:600c:354d:b0:40b:5f03:b3b5 with SMTP id i13-20020a05600c354d00b0040b5f03b3b5mr740630wmq.215.1703315542525;
        Fri, 22 Dec 2023 23:12:22 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id c18-20020a05600c0a5200b0040c6d559490sm9585543wmq.3.2023.12.22.23.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 23:12:21 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] edid-decode: upgrade to latest master
Date: Sat, 23 Dec 2023 10:12:14 +0300
Message-Id: <20231223071214.14099-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107768

Changelog:

1e99fe8 check for more dummy serial numbers
08b5ddb improve Speaker ID handling in cta_sldb()
a1fc8c8 detect dummy serial number values
d6d86cb some minor HDMI 2.1b updates
c6802ea add data/samsung-qp85a-8k-hdmi4
385c6cb safely terminate edid vector with 0
1668825 show Serial Number also in hex
100437c check if DTD == HDMI 2 but VICs HDMI 1
e0c5b96 report if a DTD matches an absent VIC
bd071f1 if offset < 4, then check for non-zero padding
f07c0ea CTA-861: check for invalid offset, always show byte 3

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/edid-decode/edid-decode_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
index 48b52eefc..44671049d 100644
--- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ef696d66c156139232201f223c22592"
 
 SRC_URI= "git://git.linuxtv.org/edid-decode.git;protocol=https;branch=master"
-SRCREV = "5920bf2a756b2f748c49ff6a08b9f421026473c5"
+SRCREV = "1e99fe84c08d2cea5d86668ac6948e382ef545e3"
 PV = "0.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


