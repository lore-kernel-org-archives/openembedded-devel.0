Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35822C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 13:03:28 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.7619.1638450207381564252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 05:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fymeoGhq;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: andrey.z@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id v1so115547637edx.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 05:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1oegR5id+EV2BgMU8zggBAcUpceR2GTYmBUIFA336LA=;
        b=fymeoGhqlNt6520J40bu4MuWa+5wp7FOLMT38r30iiH2PWhp84ktwM5jVLXqOhjlVx
         HMxDALsuhLPySHZDJW0cHpTa90vclt0skHlUsn4mwg/Q3xGTIIyX+yIMnmbAxLGj4jZl
         R9eL8D2iYx3UgmhHphhwz0X+/LFqstIvuP8/VVjE+gKV1XQQGRgG10bQbuwNYykcnIG7
         OZctfwjWkU55v12bNPT8MNcJfHSoPdSRvPylQ8VJR3atycfdl3GhW8gXbf13/gQKtoOY
         fGoChWd0dSSFjEc7sAfkGbp8w55gnHp43Cg7YXERJwj61V6H1HTqr9hGkPUq9/3sgDrX
         1KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1oegR5id+EV2BgMU8zggBAcUpceR2GTYmBUIFA336LA=;
        b=FVz/3Am8CSDOI1IU/wbdWf8qWtRMfdczJHpQj8bW/dK9W6ZBc0hmyCz/qXt1H1rrcM
         P7tqo8qLYQBFW881Wf4483gVqSgE5q0oznzGPiFaUPiVPEi2gT+DNcbnI70Qx2SPZ+sk
         bWSWziSlENN7EIuH6OAdKB62EN9vY9FAkw7PLmU2ryfea5k2MEJKKj7OaaVH/II20DEZ
         hv81llTrfwGUuK//tsJV6TpYYtFtorhTNvImg4EwOFO1fUgHPYK5bXpghcsfl33387C4
         SqrMhGq8QfvV/1sntR4Qln5QB4B/CakjF4viXSgNcZRRhAtQQrZstbDlealflo00InDC
         HNvg==
X-Gm-Message-State: AOAM530u9WmoJzwVGsV3ncwdhPM/rG4g4Thei4UDKafr5GlwDuwWQHUB
	qBTR6kH7T4Io1yJ7A/tVq2pxcizlBaPGrQ==
X-Google-Smtp-Source: 
 ABdhPJx7W3reGrhoYFusFgeMSfqrtyD9CAW8KpgcTGVaQj8w/MUW5CZfDa8RbC+6hId1P7uNMtD+8g==
X-Received: by 2002:a05:6402:339:: with SMTP id
 q25mr17771327edw.251.1638450204586;
        Thu, 02 Dec 2021 05:03:24 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id
 ht7sm1944334ejc.27.2021.12.02.05.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 05:03:24 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH v2] gpsd: fix clang buid via export CC explicitly
Date: Thu,  2 Dec 2021 13:03:11 +0000
Message-Id: <20211202130311.2080938-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202125359.2071687-1-andrey.z@gmail.com>
References: <20211202125359.2071687-1-andrey.z@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 13:03:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94186

gpsd scons build system defaults CC to 'gcc', which prevents clang
toolchain to be used.

Export CC explicitly via environment to override default assignment in
scons.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
Changes in V2:
- Correct commit message by removing CPP variable, it is not present in
  the patch.

 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
index ace907bc0..c11d4c76d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -48,6 +48,7 @@ do_compile:prepend() {
     export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
     export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+    export CC="${CC}"
     export LD="${CC}"
     export LINKFLAGS="${LDFLAGS}"
 }

base-commit: ac67765cb09ebb43e1a2ecbea7e0f425b3cffcbb
-- 
2.25.1


