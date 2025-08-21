Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D526CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 18:55:05 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4557.1755802502056309768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 11:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ODZL+W/C;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e92b3ded3so732962b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 11:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755802501; x=1756407301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K9/iABjttUSCny8tWOyZnJwaJLkrFNg6S6gHQTDWLwI=;
        b=ODZL+W/CYpuae8QfM1n53CiEfF/MlbFNqKYI1OLsYuglqmSSsr3wJTnbtjHiZ4EuqK
         DekwQtpH3PL2hyqRv+Eut/dB68QGn8u5UGc0Kx0Z4zk194+ThLRX6g6ijcwdlVaOi2Lu
         OJjreawTXr4ey8M3nWW2RTnQqpKAYB7+cK2ZqsIwtr2K5trHolK7fCFZXZhuE52Mz73E
         Y6FcrmW4Mnmnyiz1t96gcy65jYML7dkVzNfTjHm3+W4A8gyiz9gTXduvLYvt62s0Y7aM
         oIAuM4Fj2D4Q9AQFBYsdBNIfXycfS0hDG6sOZInFi4sPOP35ORy6sIGoOPZZSma7CXsq
         0mVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755802501; x=1756407301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9/iABjttUSCny8tWOyZnJwaJLkrFNg6S6gHQTDWLwI=;
        b=eOFfVwlac/40auSlPcMsCwhiOn/rZ6FusRDoCaZttpgit7bwrvjhJ7jqaH5hcMU6NS
         VYPCNQuwi+ZEAha0/Fd1p47Nk/QwZeh+ZA+O6W3FC3caQq4iF4YTGyvkMW+vjR686f8a
         6h9S+f3Cavr1NCRFgystKrCxHS8oNE/dUM3hm6+GA3A6wN+j8okyaJULoMdTDE1mBZHU
         ctwRpT9HcSCIhXUk2ZSQtitP0k9+rITjxIDP8pXcTTBSH+Ey/yU23U5yit3BRlj6ROke
         VpnpNTNqstcSLuE0Z+LHoZe2eO2dW6qamANfTl9fTNWXm8dlNrJYvmkTzcytt43Cbd7N
         6eRw==
X-Gm-Message-State: AOJu0YwAToEoa2hCD7g+wME8SwgYn9Suz8D0ATN3kJPASMYXqYvqK81C
	8sfmUS1oNAkmr1yhKxB/NTLndUPL8gaSqm8qoo3kPvlE5x3koDGtXDtdDAEI2vQk
X-Gm-Gg: ASbGncu76iFa+EIzXlii3B5vjwpDTclJJhvrP/o/InBQr2FAnvtcVSsCf/God0iyAAt
	cD2O/B3kVkqFcdTuHmX5j3ZzkqIS3QzsuBAon2fLNfTGDA1aogPODLFOA70kRfVgS41sqzxVpuv
	P6VA+PgphJVXrxB5C2/+YIcytJux428HzQ5TQtZolcDf8pBfhlnHAum4UEgJohZZNVdNW1fpbDM
	VUtDJz0jbFwMWyVi0ccEGIavvnY0H1AFU3eZLICk9FXOkPneTv3BAvTzCl2fdBRnBcxzpzcOh2u
	YtDwPqtQ7ji+MoVumPNvTf/kzGeV9wR/bDSEvZ7eBJgBnk2W4gt+D2V2BK8xuVu69rOm1hj1WOW
	a92Vktgkl9odMtl9fhHg+pA==
X-Google-Smtp-Source: AGHT+IF1+Fxr4z//5cQnpoMCBCKq4pAAFtUXRMO/pGx+pBZdzwnlD60r3hX3eumHefi2oSQgg2EVIQ==
X-Received: by 2002:a05:6a20:6a28:b0:240:1c56:64a5 with SMTP id adf61e73a8af0-24340bfbefdmr289282637.15.1755802500993;
        Thu, 21 Aug 2025 11:55:00 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640ae72esm5326604a12.42.2025.08.21.11.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:55:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] networkmanager: Fix build with clang-21
Date: Thu, 21 Aug 2025 11:54:58 -0700
Message-ID: <20250821185458.3764243-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 18:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119080

Do not mark Wincompatible-function-pointer-types warning as error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../networkmanager/networkmanager_1.52.0.bb                 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
index b8c6a936ad..5ff452bcf7 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
@@ -77,6 +77,12 @@ CFLAGS:append:libc-musl = " \
     -DRTLD_DEEPBIND=0 \
 "
 
+# networkmanager-1.52.0/src/nmcli/agent.c:88:29: error: incompatible function pointer types assigning to 'rl_hook_func_t *' (aka 'int (*)(void)') from 'int (const char *, int)' [-Wincompatible-function-pointer-types]
+#   88 |             rl_startup_hook = set_deftext;
+#      |                             ^ ~~~~~~~~~~~
+ 
+CFLAGS:append:toolchain-clang = " -Wno-error=incompatible-function-pointer-types"
+
 PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \

