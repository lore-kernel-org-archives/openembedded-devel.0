Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3101C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:33:59 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.11429.1651502030224093511
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ls/9TUI8;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id g8so10028214pfh.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C7rdVHxz1D5kJbwqpILzhZLdb1PDB6us4lGFDG17ekM=;
        b=Ls/9TUI8EXpeX/KVFnYANcquG0duIhySPATHYLWPjlky5AB1EYpYcfdwCXhfBl4nzf
         YiStuSCPBUXayvRxHbcPdVr6zecJ4AC/RBVEeSZ4tQOGcCUlrJsJs9D/MpMmcaEN4K7W
         VXq0bGZ/0AHH2JOeKxRi1RBN4JP/5z/Mu7PbYYR5ijpEi1OlLqWfiHFQr83cGzK07LnK
         a93pfD3GVmvzDbHtuwGW4DeTRnUAUnqsec4Mu1mQ8jHiOWXUu78EilFFTAMX12xW0U3L
         DNHlfaATdfm1VM0jCqMDhyprC6azPekGmoqqjsWjOWx9FDUOFzTEU9NOltWIsrRIoFxi
         mcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C7rdVHxz1D5kJbwqpILzhZLdb1PDB6us4lGFDG17ekM=;
        b=hFEP0SC5LPTiLZxhTsbYyuVCfourwfqFOaqLaHfeFIDAbHJPDnNtNnWYokupBTsaAy
         C3tPkDynw7l9HZRzAgLQI0xEWro6AyTf2YC+vf2t4aEIP6+obiO3c4MYEmF0+NdZrpkP
         VBetzhBlH06N596cV0CfFqCgruLdtuh4ITu6uFZu0mWhmRoh7If1T7si4Rhg5r2/ZCrw
         8OOj7eW2mMWX+UWUVxHJz+FklPmb96t5ZcxOf8bwHusAbH1fBfAdWwDf30CoYiN9fMTQ
         mHOQ39eDesREeJPt/Vl5PiJy4qxO+eaINmB4/4YhWbdI4797U2Pp+5YFj0Q+TFPV9b+M
         4TUQ==
X-Gm-Message-State: AOAM531RhwFrgbnA8lvESypaWJnySTrf+idChiPnaug3rBlHKd3v8c9S
	WyIoMI/x3IcvgmktRr76LhnTBnRhVgKD5w==
X-Google-Smtp-Source: 
 ABdhPJxYLSKZY1wLzwJp8VBoI0oxQSo5hjSpC+BjvJXfNTZxa69QV4hgEhCRHn6kYfeiAewQmWesHA==
X-Received: by 2002:a63:8149:0:b0:3ab:6545:87a0 with SMTP id
 t70-20020a638149000000b003ab654587a0mr9961295pgd.392.1651502029378;
        Mon, 02 May 2022 07:33:49 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.33.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:33:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 02/10] cyrus-sasl: move from meta-networking to
 meta-oe
Date: Mon,  2 May 2022 07:33:37 -0700
Message-Id: <20220502143345.1500852-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
References: <20220502143345.1500852-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:33:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96931

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch  | 0
 .../cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch                    | 0
 .../cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch              | 0
 .../cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch          | 0
 .../cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff       | 0
 .../recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.conf      | 0
 .../recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.service   | 0
 .../recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb           | 0
 8 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.conf (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.service (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb (100%)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.conf b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/saslauthd.conf
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.conf
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/saslauthd.conf
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/saslauthd.service
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/saslauthd.service
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
-- 
2.25.1


