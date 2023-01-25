Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE41C61DA2
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.44851.1674653492172135514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NCLeXYyk;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 123-20020a4a0681000000b004faa9c6f6b9so3130250ooj.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUcJr4VUKXZsQWLpcMd0/XJNx76hx8vfTLr8H29kOs0=;
        b=NCLeXYykMK19TlVf8UautADLun2x7mXvUKHU93E+c79m64NWiCOOmBWCyp43ttJI0v
         iMVC7hLLI1Y5O8ZW5rRA1HcCM18upEszZ+KdlWVun9M83vBm69ArlOFaqZNwfTvLELsP
         29FfmJMKP5PtyhEDXsqmqx1L9ZYTm4R/I3/lrP7x6471D+NY2UIkw6gyz3o2MLk91S4K
         SS4yzqLCTvIJ44EcMOATyj+XADUmv5KjbxR3DD8xr2f+/aFxkG8ETvmlJk67Cu9mN9zT
         WRkFQ+iAUGcv2ek3+wGUvUjKHJD+9JWigx+qq7W1uVXPu5uqBVK4WHKRdvDPjALEgNx8
         f7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUcJr4VUKXZsQWLpcMd0/XJNx76hx8vfTLr8H29kOs0=;
        b=zi3NeLeYCcAObwk9AKzV0dCS/PN00OOVv6TBAOGhogqQrWSc6+dbM7qr+7tPHG2W3l
         NsTnkG83T5MU32dqyoBsGy1r/rvAl0rFcHvSOHVQ/l0X/XcNiZy/dY9EUIVCxqsdDYWm
         JtwylFb1bS0sC0qhGYsgqeVlLFRm0yg7S9ceJcW6Db9/Z6RQjkcZQQzJ5OcrmLTiRmjk
         mHlg0pxI4kKADWBLsCYEDAKPO4YYe2nHy3BWuzAoiBr1QUahw+3I5sHfGKYMU6Cen2Ry
         RdRsxhGuP14NJnlV/O73NqbqIKaPU2qhVwfqbrcY9eNEe9MQ9jLlHMKgoAEAzuYL1FRx
         VOMg==
X-Gm-Message-State: AFqh2kqZLxuolfoE22EEQv2UrrkAc/kkpWSKqRrrvgiqEJDqnQk6S842
	QWTcAo1K8c60opsof2HoAPepNlM+x+0=
X-Google-Smtp-Source: AMrXdXvLkkGB46nr8Z0K1lQmzGeoSU4xpGKQInOdIo3yyMGmjxIMyL58ekjSOz+ty9QYIO8g7d0otQ==
X-Received: by 2002:a4a:1584:0:b0:4f2:88ea:54dc with SMTP id 126-20020a4a1584000000b004f288ea54dcmr21014822oon.7.1674653523804;
        Wed, 25 Jan 2023 05:32:03 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.32.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:32:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 38/41] sshpass: Use SPDX identified string for GPLv2
Date: Wed, 25 Jan 2023 08:31:20 -0500
Message-Id: <432608d56b4d189cd9e2cf6ab7af2b1212bddb53.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100773

From: Khem Raj <raj.khem@gmail.com>

Fixes
QA Issue: Recipe LICENSE includes obsolete licenses GPLv2 [obsolete-license]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb9672b8c5a8df645f420bd0ce8092800fa61e73)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
index 5c52437af8..ad7b083100 100644
--- a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Non-interactive ssh password auth"
 HOMEPAGE = "http://sshpass.sourceforge.net/"
 SECTION = "console/network"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-- 
2.25.1


