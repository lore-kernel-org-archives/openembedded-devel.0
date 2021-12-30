Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1106C43217
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 21:31:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.3771.1640899891082629713
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ITAOY6n9;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 c9-20020a17090a1d0900b001b2b54bd6c5so7377129pjd.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=04cI5KXpvUEcN0AMLFUa6XHEc2GQh06PPONG3Y72DkM=;
        b=ITAOY6n9Ptgj8Jhb9HIxMEfOYNQgfZfxJSDpNDf8vEBZInHEMi27UtEzBg4NC332uG
         uXK5nFTFT7Klva7iS/zjLe5++mw0CIQD5DeF9d6K21UN+6NqgsPcBe97wSh5JsF2N6NJ
         errVYbaPuzy2NeJvlUK3l7K5FquGGDvsmcH1kNIMFqgeuTvGGnlqwXDHe/IjTYyiYpoW
         LqeeT5GG9wBHzzPl0ctHiE/2Woij6XFPWoknrAkiuZBRvdOUsc7N6FgDihN+Dax95cAO
         MvhA2vrdOSZcG6+Bg3UOxC2WxXnTCSFcbR877DrAFgHfUvT8Oj49GpHTroZbZoUQOZEg
         40WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04cI5KXpvUEcN0AMLFUa6XHEc2GQh06PPONG3Y72DkM=;
        b=gPXNvpMf3SWINh3Z2oZtRrMuNlgfdkojHZ85IiOgsFhF1jPERP98u1idH+080CPC7n
         Pu0Jx06Djk7dbEV41jz9C8mE2j8eYCZRVaPSRCXfpT6/RGjXYChsn0vWYJLa9WkZQJHx
         goLW9fAUQ1KcBhVgVvj/eJcCRQQJ7Bk7pp9GOq4l6j5yCuUscXXbBlyoIqz8dnh1w5fv
         ISjpG7A6ZITHeKHZZMf8lDTsVnlCwxFTxIznDGhUmerNvcj/rN+DP/z7MEBzr7wyCxh/
         Ozopx/OEWzP4b7PBDGP55/v7hvZ4x+Qtml03kZ9GUO/zGnpsr7rsnWV+LW4N2e0z4n+I
         PRwQ==
X-Gm-Message-State: AOAM5329FFLIRKkWzRPVkFjU1KRNsV5phevCqxx7TF1dI6t8uRAFRWJL
	Q0824ML3D/6vtR8IwW51Ebhzv3lABRw=
X-Google-Smtp-Source: 
 ABdhPJzkZV6gOHY1bwWbULe01iD8MqnYbqq21n2XyenyrcmPJ+c+Flo+5aeFrGhpt/urZ2M224WjnA==
X-Received: by 2002:a17:902:c652:b0:148:f1ea:a2ca with SMTP id
 s18-20020a170902c65200b00148f1eaa2camr32421337pls.125.1640899890520;
        Thu, 30 Dec 2021 13:31:30 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:a625:8af4:d190:e823])
        by smtp.gmail.com with ESMTPSA id
 t27sm9348384pgm.52.2021.12.30.13.31.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 13:31:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Honister 5/7] openipmi: upgrade 2.0.31 -> 2.0.32
Date: Thu, 30 Dec 2021 13:31:21 -0800
Message-Id: 
 <7fc335961a90825e3124d18461bd608052cd1c74.1640899794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640899794.git.akuster808@gmail.com>
References: <cover.1640899794.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 21:31:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94574

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 35aa5959c6bc2fa0458b90f4892cffd1da8189f0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openipmi/{openipmi_2.0.31.bb => openipmi_2.0.32.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.31.bb => openipmi_2.0.32.bb} (96%)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
similarity index 96%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
index ecc98dd8be..0b4244022e 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
@@ -35,8 +35,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[md5sum] = "ce8eb27da016dcad7543d0128fcb3b0a"
-SRC_URI[sha256sum] = "7052f37726ff454b0dcac49f35dd030bc12c9570ca0ba5cd2d17774b8e9d9717"
+SRC_URI[md5sum] = "532404c9df7d0e8bde975b95b9e6775b"
+SRC_URI[sha256sum] = "f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766786945"
 
 inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
 
-- 
2.25.1


