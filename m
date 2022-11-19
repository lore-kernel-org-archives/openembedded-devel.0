Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C067C4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:47 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.23277.1668873500241349036
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xcsanfvh;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id c8so5325502qvn.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eq2JQbzzOsCAoiQDS9HbPQAFpFuqv1Zc4PVckNTUVZw=;
        b=XcsanfvhorYYMRReRYlpoxVdbSo5jqX6EFeQEy8FJwuYjIll0CIqa6UTkv2Ps2NQvE
         jukkpIUQPr1bca7QN7zHRb/Rhqgq12b0gjFe2nKHuHIhmDhOFOpyspEeYroYQHF2natL
         foBsQvWrXmMCwGtOgMqKzAeYj7tf7hfpBJeqtHtKbaT8jyzFNsDK72aGICb7+SYx3S/o
         A0PaqDJqz/uziQ7LsrcKfBirwHRXNYWqZYxOFUO//nFzCYJ9/3Xq14rkobRppTc+yEqk
         R6ywvaHRKyQqeER7TjnXVRHlFbsj/Tva5byaNcvQTUMqoENV6erAv9AMh9AGxNMknhue
         hQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq2JQbzzOsCAoiQDS9HbPQAFpFuqv1Zc4PVckNTUVZw=;
        b=ZNMQKMSVn/W+R7df8B4+JpuD4n0VY3tkC0l+rD+TTftQNg+/PCusogxUiVVNOXMMqo
         xe0FCe6x5h/a0KQlvRwDVHw1do10MdhU5vZAnQv6FeEcvXK3uT2/fl7CBACT+DZ/SyzI
         53Q2NJxZb+l5GemsrBf3CrmEBb1SWJmKV/F35OUmOrs5bKhHbw6QR5qkMME2t7+En3HE
         +QEHQmRSqbDU1a7fA3j/eopp22ZLpbI0oNi0k4EGUaCWhZhQdCmE2kdadTuslzkB5wlT
         kD1Y+uvOk2oNJIzoaIJSAg8+Y5Csqkk4bWwsGq/rXDVShx56S3sMhJyD3AvUnjMU3KrT
         uV6Q==
X-Gm-Message-State: ANoB5pncGjSruTMH7bpnnhJRkc7qYhbA+ciDXzl7w6wvKTLhRBh2+TUP
	yaE8gdd2Cy2k4KpqEyqPTK2M/SBqmf+i+w==
X-Google-Smtp-Source: AA0mqf7nMqyfwjaW3eDC9jP0ynYyscW53Ev66Tt8nuWcy8aZ8MxXI+1ZypBVwIpmLRWSrkLQyXLonA==
X-Received: by 2002:ad4:5441:0:b0:4af:9759:6f4b with SMTP id h1-20020ad45441000000b004af97596f4bmr11041402qvt.31.1668873523394;
        Sat, 19 Nov 2022 07:58:43 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 27/35] cglm: upgrade 0.8.5 -> 0.8.7
Date: Sat, 19 Nov 2022 10:57:51 -0500
Message-Id: <e64b9d596d9c9fe9f4a6681c4397ae5b126f2aff.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99666

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
fix build: add missing struct affine functions and headers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1736749520913fe49546a03a0767f6ca91a830e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/cglm/{cglm_0.8.5.bb => cglm_0.8.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cglm/{cglm_0.8.5.bb => cglm_0.8.7.bb} (93%)

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb b/meta-oe/recipes-graphics/cglm/cglm_0.8.7.bb
similarity index 93%
rename from meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
rename to meta-oe/recipes-graphics/cglm/cglm_0.8.7.bb
index 5a437c102f..95a651dd03 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.8.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
 
 SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
 # Tag v0.8.5
-SRCREV = "7e5d1f435f628b873347eb052b7d6605b0b997f2"
+SRCREV = "8cfc98d2835a8cd1a9041f257c7ba0bfe4fbc1f3"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


