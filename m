Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5629DEC874D
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 18:43:35 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.21350.1694112209698384471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 11:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PFvTil6D;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-26b41112708so979985a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 11:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694112209; x=1694717009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQmOtwuDPak7CnBbx6Ehfa6tJrOp6joPIXRBpxCnkwQ=;
        b=PFvTil6Dwm7UkIJIqqJnExh709htPQIRSET/8UZUEBRooEUHh0RM5vrIcOJTUqvRRX
         Dsf9ESnzCcp3GTgYSs5YGLfgC8Rvxl9c8Q65fuL2YTZgf2/zI6gL20/EsawaHjpm4Ezi
         7D0W/Jna+L8c3qGTKYln16mjdLl67XuNJ4gJsJWH2FTMy4MHKhsLTvUHKRhlQXccZMWN
         YkgCUf+hTqc4vp3x0b8y/p/4C33yyhzGsfYmGJzZ75aGQgbnUqXjkNZxYwpUIsu+Dejp
         46VV1fEpV5PoPIgfsxpySZ/Ad7CRFrpZq5aS6PJC5Ge+4LILRcVckpiIfP6gKffu14BY
         QNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694112209; x=1694717009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQmOtwuDPak7CnBbx6Ehfa6tJrOp6joPIXRBpxCnkwQ=;
        b=b7+cAhNTJAvsxXpNr2voiY3jeJgSaGNOdRBoTqMNVRn1dKhK4mR3xjDM2MHh9wou0V
         P4fAr1qEGJduP7mQBC7uPki/4U/4I/B7NyS8fZBOzups9gG+r3J33K89HgwsldZyCQEH
         GBk1fd/0DmSCMX0YnT8fMRULbn1HgjKzr9J0TWpxfvjZNpMK0bUA39cTWPU/p34IIQjd
         kreMJ4dDMuG6BHyqfcMEnaULmjbUhPG3cSOVfRhxkGTwef/BeDh6Z+//CHK0dHnMIBtr
         HTCeGTyG6djY2wAQ2krXVJqoPOutNvH4EXesHtuBO1ntZSigL/08vet4gNqgTNhNCoKx
         HTHA==
X-Gm-Message-State: AOJu0YwKFvDicLLOZz49UEPwH1+NWb7u7oyRkpSLAhltQ80fJm/omTzz
	vR1AsRT1oVkWXcR4jlsMwhClu7FhpOWbjw==
X-Google-Smtp-Source: AGHT+IHbx6BGVY+wle3hHRvNqNBXyDliU6rJCtIDGg3DLzfitpieTJ+ZS6eS6R/Oh6H6hn6LMpy6eA==
X-Received: by 2002:a17:90a:e00c:b0:268:14d7:bc34 with SMTP id u12-20020a17090ae00c00b0026814d7bc34mr447616pjy.20.1694112208668;
        Thu, 07 Sep 2023 11:43:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id v6-20020a17090a458600b002680dfd368dsm1562pjg.51.2023.09.07.11.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 11:43:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] openconnect: Upgrade to 9.12
Date: Thu,  7 Sep 2023 11:43:25 -0700
Message-ID: <20230907184326.498115-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 18:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104794

License-Update: Update LGPL text to match original license verbatim [1]

[1] https://git.infradead.org/users/dwmw2/openconnect.git/commit/8c9a353b4930dc081222ae05b3bcd42d0c78b66f
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openconnect/{openconnect_9.01.bb => openconnect_9.12.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/openconnect/{openconnect_9.01.bb => openconnect_9.12.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_9.01.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/openconnect/openconnect_9.01.bb
rename to meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
index afdbdca4e3..f2650e0eb6 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_9.01.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Open client for Cisco AnyConnect VPN"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=8c2e1ec1540fb3e0beb68361344cba7e"
+LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = " \
     git://git.infradead.org/users/dwmw2/openconnect.git;branch=master \
 "
-SRCREV = "5695cd6b0c7d42ca293ce0f00abcbe3d1ec4e609"
+SRCREV = "59f2e59eb3e436364ef82e630e5a2f88f32acd58"
 
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
 RDEPENDS:${PN} = "bash python3-core vpnc-script"
-- 
2.42.0


