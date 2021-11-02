Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E30CC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 14:09:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.207.1635862168775581787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E3pQ3Vgr;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id r5so16401456pls.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m26gaMELDA+Mqlaq5sEdw266PQHHLWpCtkftoCOfnVE=;
        b=E3pQ3VgrK6TiSLDYaIp05LIiz5FJ06x6uhivJrwU4lduKvZIBcjrcsRaUinnF4CLdv
         BqyJwR1y9r38V1/a+5CDPyomYaBiSI2sgCSMwudry3p1PusKj1jsCg53F3qgdNmf8wEe
         Vz902FY2ht7k5qXWKX2HLAjP6J54Yt5R3G5k0jkZp3FfLJyekehnHnMbglChhVQX3TOI
         BAPlZRHaGfPjniIWL7OPcrkGNhQsnM4K0JkKk3jlW/Wlqi0P8DfwImLQIh/9NTdieOB2
         WnIAdNFEkGHC18xzLYwsJJksQWIB2TiZT87ZhsuAUAUOus7+MotLUeyfRDM8pyjNGbiI
         mH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m26gaMELDA+Mqlaq5sEdw266PQHHLWpCtkftoCOfnVE=;
        b=62r3Z1W/81P53xFzr4gDbnsZ8FAqKFL32vPFuBcXYBHOuM4JykcehgC2MNNyAEyLPY
         dLPqgbnKPf6miFlzW5u/94SUwZgmPibzBQnZHGTtPehQeopbczTyfvIHvuldRnluSNX8
         2l/gpWErGneXZj2i5qfmHpS4FszNNb0EI78xAA2nI80FaafpLC1IjJ4u6PX+9JZxE/Vx
         0XtS1zRex0auPjeUGsbKutuP5LCFIFCsEOM5EgzENKjDG5GFrv68Mu9iL1tK9XO5burg
         WMDUmvoEajk+37BQdcJFmDZ58UNZvc0uhavDHIgVgxWw6orWnmkfhXneKQAwjyeSjuvM
         840A==
X-Gm-Message-State: AOAM531XHnZ93v6kEaqi/t2y+wpu3OBlF10aLrtCuMESpgggC+i3DqGE
	YoazITukVYAhFM65ipHx27+WDG56DkM=
X-Google-Smtp-Source: 
 ABdhPJzf9YIoJbjjogeoWhbMWQQtOOSerCjo6T/bWFbW8GS9Bb+Z1DLG6UQF/PMyQGqa/xOLs3b6bg==
X-Received: by 2002:a17:90a:8a82:: with SMTP id
 x2mr6877251pjn.187.1635862168174;
        Tue, 02 Nov 2021 07:09:28 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:e13:25b1:763b:6129])
        by smtp.gmail.com with ESMTPSA id
 g37sm16340029pgg.89.2021.11.02.07.09.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 07:09:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harknott 6/6] android-tools: Define SRCREV_FORMAT
Date: Tue,  2 Nov 2021 07:09:16 -0700
Message-Id: 
 <0b0ab6a2d227f22374268d29fcb8e4f9dab5374b.1635862049.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635862049.git.akuster808@gmail.com>
References: <cover.1635862049.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 14:09:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93777

From: Khem Raj <raj.khem@gmail.com>

Since it uses multiple fetch URIs make it explicit to define SRCREV_FORMAT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c5087606145d991e2555401eacee5175a89edf92)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index e8992346b0..deeb4e70b6 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -19,6 +19,7 @@ SRCREV_libhardware = "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
 SRCREV_libselinux = "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
 SRCREV_build = "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
 
+SRCREV_FORMAT = "core_extras_libhardware_libselinux_build"
 SRC_URI = " \
     git://${ANDROID_MIRROR}/platform/system/core;name=core;protocol=https;nobranch=1;destsuffix=git/system/core \
     git://${ANDROID_MIRROR}/platform/system/extras;name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras \
-- 
2.25.1


