Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D058C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 08:44:47 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.5241.1647679486298206977
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 01:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AGaBHPmX;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id z16so11506843pfh.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AhG8ROeYzHhPQQjX6/uM3/VIC5e8rNXavkiM1O/Yxhk=;
        b=AGaBHPmXjx6YMnuA76PHswmmWuz0/E/36zrLAAbXG/+7pXRtYKx1uNeeNnBxcZcsW8
         p+6NZsVqMY4AiBuooUpsqxO1b37zQh55G5Xp64Xmwb4AbU5uk7QwKVgu8M8JNhANRzor
         4h8f/mtPnW8eOlWgJYBMStL8D/wxcS5v98mCFLXVgsv2hK+LpgZW6js9Nphm00o4JDrm
         JTWBbdsfDnEkVOdwfF24coU2bc6Ri4sNMy4gIUt3nDIc3umMqkM2CGPkSDYUt0aM33wz
         freF4rBKgW538dS4Gsru4+zgwo+jjeTfKhGepM3MiIl1jNJnfg7osKSMbKEvE2rfJNf8
         Ml4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AhG8ROeYzHhPQQjX6/uM3/VIC5e8rNXavkiM1O/Yxhk=;
        b=4iLmvlgIfO4Jvz5OHMAQv03HJSrlUGDCaDp3ORbKxyWv6wOE/4hX9Dm14lvbNPI3Sp
         vvg3GvNRBmke51DlYRB6efkSS15JadSUkK05h+LRZkWTIR8U4YHTJAtUKGkGYvN5D/kQ
         1VJDqDoGTZaPrbFIhnqfS9N17Mb0BRnRs/IZJchQ02sCd3ZpVgZprgVbrVq/nEKYirPg
         tRxdd7xTCb9xOqNDpaaFgwlQwnHoTCzsV7YCO6TDuvBM1pLNzKoPpXpFJzBmCb/IU3Mz
         pUnTEkzerlbKxbG3jbEEXHE5WNi8dtzpdCwG0dsARd+3357kT9F+FifFhgz861f3NcSc
         rErA==
X-Gm-Message-State: AOAM532T4O8rym1w5cGmB+SCxf+R5KiI83wVjfSi8gvx2rOU1Fz+uV3d
	QUarrdYRQshE+WxVX/hhDw6lCJvYrmIibw==
X-Google-Smtp-Source: 
 ABdhPJzeI/BOvfzBpsQ9Pxf7IJdd1pHCMKR7Y+SDXdDXByOgF/S0n+0vOWO6ML+UUhS3RQkVJpr1jw==
X-Received: by 2002:aa7:8211:0:b0:4f7:8b7:239b with SMTP id
 k17-20020aa78211000000b004f708b7239bmr13727983pfi.64.1647679485623;
        Sat, 19 Mar 2022 01:44:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 ip13-20020a17090b314d00b001bfaa1f060bsm15113107pjb.5.2022.03.19.01.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 01:44:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] uim: Fix build with libtool 2.4.7
Date: Sat, 19 Mar 2022 01:44:42 -0700
Message-Id: <20220319084442.425475-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319084442.425475-1-raj.khem@gmail.com>
References: <20220319084442.425475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Mar 2022 08:44:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96062

Delete old m4 macros, so autoreconf can repopulate it.

Fixes

libtool: Version mismatch error.  This is libtool 2.4.7, but the
libtool: definition of this LT_INIT comes from libtool 2.4.6.
libtool: You should recreate aclocal.m4 with macros from libtool 2.4.7
libtool: and run autoconf again.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.8.bb b/meta-oe/recipes-support/uim/uim_1.8.8.bb
index fca914ed67..e0d9d05dce 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.8.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.8.bb
@@ -51,6 +51,9 @@ PARALLEL_MAKE = ""
 
 #Because m4 file's find maxdepth=2, so copy the m4 files of the deep depth.
 do_configure:prepend () {
+    rm -rf ${S}/m4.generated/lt*.m4 ${S}/m4.generated/libtool.m4
+    rm -rf ${S}/sigscheme/libgcroots/m4/lt*.m4 ${S}/sigscheme/libgcroots/m4/libtool.m4
+    rm -rf ${S}/sigscheme/m4/lt*.m4 ${S}/sigscheme/m4/libtool.m4
     cp ${S}/sigscheme/m4/* ${S}/m4/
 }
 
-- 
2.35.1


