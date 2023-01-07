Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EEBC46467
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 03:07:11 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.13022.1673060823743205869
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 19:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dmFWI/wO;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id g20so2425577pfb.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 19:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ss7roi24uwGRcTjc/vT/2kuj9pH4s3ERT6O54algho=;
        b=dmFWI/wO6zEsMaMcKPKxpIL46nx2hmVpZlzycjL0Bz3rkCdOlaNeP1I7ODoj4it1TU
         sZuOnpvLS0X0KjY9ZSs34dWaEqpqPjFEZaPzYmzjwrKAQeBnDuxYjwnajS8wRyZWR2Ns
         EGdDm7Gnx0KtbaBYS/0L0+ZUWXH1lU8ADb5jFseaB4xKiWSNJmyItya09WmnW/An6veq
         O9+jWUC6uDBFw28Z2jhMXTTFHrpSefpvARJVX+ANBIZeH8YijzQ7aaAZx704LE1MQRdp
         y5Em79ppCuDV3S8T8f3fhn8kNCK2drGzmhYo/WEM9hAsXx4QR2JomnkJxmbvUZ3CjCQF
         o71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ss7roi24uwGRcTjc/vT/2kuj9pH4s3ERT6O54algho=;
        b=4CY2DyLsScP4QyzY/eTBmQUgoomcZhxnmjiYGmr1bx8Vf5S/gnMZE63jysrY9XVGor
         Ih3UKz2nNsmlONsIOnnOkvm9jcB0ED6SLVGBPVs6dGPK1W2cSeNeJiuUl37yelXWFBw5
         mqpHc3/+pE9S8xCOVQD49E+rGnEa3YQZyFmjVPa3A1qJ071+KZUFhFrt6NpiSZnwaAPE
         TQ8tyd2ibM6DF66oAmdLVNDk8uvcgMxplvX7nt5T+A2Ak9mQNAXyTxc+PkCwwIPq3MdA
         QJh1RpkIIys2zlNwAtwqN3GYGlpKzk4W99EWnQjUh3A2AVmdHn5Gqt87n2v43AxaXoHG
         P2bg==
X-Gm-Message-State: AFqh2kq9gMBaBzvMwkHz1FWK69hoxIcsY+9QYNjh/C6vDTWpEYPfrDU/
	BSFLsjKtxRv/aj+w3vLsPD7ER71ECB9EWw==
X-Google-Smtp-Source: AMrXdXuKhJMuniblzNi4o5tq12VwgGTx5x6hDt+7eh0WGwCb3neKQJtmj+LpqWfV0/5J8gav7pCjCA==
X-Received: by 2002:a62:1791:0:b0:578:8533:9573 with SMTP id 139-20020a621791000000b0057885339573mr49003033pfx.22.1673060822735;
        Fri, 06 Jan 2023 19:07:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id q1-20020aa79821000000b005821db4ff2csm1786180pfl.69.2023.01.06.19.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 19:07:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] libtraceevent: Move plugins into package of its own
Date: Fri,  6 Jan 2023 19:06:57 -0800
Message-Id: <20230107030700.1371576-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 03:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100429

From Peter Bergin <peter@berginkonsult.se>
see https://github.com/openembedded/meta-openembedded/pull/632/commits/cf672ba52f8c4d983ad9a74b67f226ac753a50f8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
index bae84c7242..cff86722e4 100644
--- a/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
+++ b/meta-oe/recipes-kernel/libtraceevent/libtraceevent_1.7.0.bb
@@ -20,4 +20,6 @@ do_install() {
     oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
 }
 
-FILES:${PN} += "${libdir}/traceevent"
+PACKAGES += "${PN}-plugins"
+
+FILES:${PN}-plugins += "${libdir}/traceevent/plugins"
-- 
2.39.0


