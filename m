Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A140C54F46
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.16205.1648932667209591789
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Apr 2022 13:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ioTKIXVN;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id s11so793799pla.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Apr 2022 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0BqTR3MBOZOV4z3D/Kum64x+o/wDdekT1jGxee8onQ=;
        b=ioTKIXVNOb101Sklb2R4avdYSR9N/A+ecOmK5IqfuUfCLs+rvwsJaMXYFrKksodFrT
         kRSqNTZw9YrY7daXNj+dLJdlBYKnknkByip1WCrPafKot9UbjEYtmALfP5huF6/3NLBP
         vKGLVGgHdeyoTZfSiyKwfaCE1bNVpX2ODlXccRjNQRUii6OHXTVh0LNCcjXOmhCnCLnh
         2THH3ZwfMDHxRtd/qIB0ysD494QONWKeDYDUuLh+QKFJ/TQI0oSsTmE2YhDCIs2HItgd
         0VlW4le8rP3TVe7lSXDybtqpgDC/WfAuN2S3dfX2cRDF0cB8qtfwH1k8GjVlMHdMb5jO
         +7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e0BqTR3MBOZOV4z3D/Kum64x+o/wDdekT1jGxee8onQ=;
        b=jOtie/zSJkSPfTcrFBIOzwIC/4MbBbHxz8Bso2n8MDiyqJfjCG8sn8rS4Pl8Sdk/RK
         30+f7miTXcnjDb7OUH25eD6e/yiXe3YJ5TqX0m/4VJSD+/yT66acH0r5ZGTdTgEcI8if
         SUG+JWQ3RX9vSgWZSZXW5+1I20gvvyayC/ylBCi7CUbUkNDAaoLTHszshwu8RlwD3+7a
         O61W/1wNZWoPq4Y1fYT5G0nkz6xYOzgAYxRqY4IpTT/w7Fz6t23dPgiahLrGuiF6ECmg
         43+45wHNNdQlnw1q+hUco1snnD9m2zUmrkLuibPy5CxNs080EvdGoT34cEwiRfY7MOhg
         Dsxg==
X-Gm-Message-State: AOAM533FqUQK2uGSEjG4281O7sxIUabHf+de1GduEai/8phRY80tFSrq
	HXmL1TGF4P/8csSUnp4AcDXzsoDj+xTzPQ==
X-Google-Smtp-Source: 
 ABdhPJyHAhayVnvDQ2wMxeA9+Edh3jDYcACxSvwS9jEvzrBqmdII8LzIFp3UMH+npa2kSAZg0oJnug==
X-Received: by 2002:a17:90b:1642:b0:1c6:c6d0:fbfa with SMTP id
 il2-20020a17090b164200b001c6c6d0fbfamr18153806pjb.218.1648932666236;
        Sat, 02 Apr 2022 13:51:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a056a0023d100b004faeed2dfaesm6844685pfc.180.2022.04.02.13.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 13:51:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] open-vm-tools: Use specific BSD-2-Clause for
 license
Date: Sat,  2 Apr 2022 13:51:03 -0700
Message-Id: <20220402205103.786774-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96349

Thats what the sourcecode actually is using.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index a3e090fbd5..1c3545f960 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -17,9 +17,9 @@ for better management of and seamless user interactions with guests.\
 "
 SECTION = "vmware-tools"
 
-LICENSE = "LGPL-2.0-only & GPL-2.0-only & BSD & CDDL-1.0"
+LICENSE = "LGPL-2.0-only & GPL-2.0-only & BSD-2-Clause & CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=559317809c5444fb39ceaf6ac45c43ac"
-LICENSE:modules/freebsd/vmblock = "BSD"
+LICENSE:modules/freebsd/vmblock = "BSD-2-Clause"
 LICENSE:modules/freebsd/vmmemctl = "GPL-2.0-only"
 LICENSE:modules/freebsd/vmxnet = "GPL-2.0-only"
 LICENSE:modules/linux = "GPL-2.0-only"
-- 
2.35.1


