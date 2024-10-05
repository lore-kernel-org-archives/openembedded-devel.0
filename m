Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2752ACFA756
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 15:56:39 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.14252.1728143792011437797
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Oct 2024 08:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bGf2WYMD;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71ddb6199c4so1996123b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Oct 2024 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728143791; x=1728748591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNpzNXH7paMMyZ7XyLVd8nAC6hLRwig1Hhv2HzrjJmE=;
        b=bGf2WYMDMTH7bSB5E78XGFCRq5T9Tck8IqM9/2ruhal7BtH2bl53eY6TTfKLivn3Rl
         8kjlPcYLx4GUW2dh0EpzmIO5LkV64WQb0CcjNfFWRz+lrDav3PLJTnMw1rnBEbnQSf5x
         fe7H9YVa/rwZeoUyfD3vynIUTzvRYStCcePFjpks7QxjB3w079hze2FQO3iH+0GWFOTV
         y5zYbaDJkKLzHytVaHf+J2nxymbCW80xbDI0zIq8cQ48Wy8lLJs9PVnyRWQo08klxMF9
         QRC1dzt4sIbIqMnLHpiMxjLhfwxe/JRD/2XbtRkkryyUoIkAoo9pEZml7Z+KtOggyzSM
         iD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728143791; x=1728748591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNpzNXH7paMMyZ7XyLVd8nAC6hLRwig1Hhv2HzrjJmE=;
        b=hPqEbTxBhGNbFVRxae/DYvUEyQJjzs9FSqBT7uRmkyyTkwzMrmnLurz+LcxhuM+TUO
         d1M2yx/jTrpVKwwg6zw2WpbR1lvew3MgEaIF+Sqv/soWjnt8gCdA21Wpsg5Odt0lr1jP
         Y9VNv4OoWEvbUsL1J/TiiZrXqA23QxejRJFqH5oW8+n+yRaqBSYfjYly9NpeYCWH8AZp
         tKwxeXapZx25YfYt1V7ynMojS45sxgW5qN27T/OoNFTFrIi2sDr0QOEUyDSugdLambIr
         ggjgr5O1fpCcbU2IZun5ny061Au16j2glJ3B9w9B8RCq8UhyuaVLyHgWB/Yz9D49tVZl
         VKeA==
X-Gm-Message-State: AOJu0Yw+FkqVHwMVYh72KMj96M/G5ibOt2jPIu8MwFFDRB2i43R/00bD
	XpCKWpRq/A+sZ2FmJ8lTC+NfTmsn3+f039HIS+/EjTZedT9ASSKFW40dp3k+
X-Google-Smtp-Source: AGHT+IEMB9WNcuY7LcxntBm8gwFeSGQzFbcZLRoZFaET/vT7ISbP0k8ljjLnZojK5G08wehNuIoLIA==
X-Received: by 2002:a05:6a21:1190:b0:1cf:ff65:3c30 with SMTP id adf61e73a8af0-1d6dfa547bbmr7984818637.29.1728143791176;
        Sat, 05 Oct 2024 08:56:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::23dc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbba2bsm1629396b3a.41.2024.10.05.08.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:56:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] libopenmpt: Upgrade to 0.7.10
Date: Sat,  5 Oct 2024 08:56:27 -0700
Message-ID: <20241005155627.2558421-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241005155627.2558421-1-raj.khem@gmail.com>
References: <20241005155627.2558421-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Oct 2024 15:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112675

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libopenmpt/{libopenmpt_0.7.3.bb => libopenmpt_0.7.10.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.7.3.bb => libopenmpt_0.7.10.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
index 8bb49b2f12..fea15f04ef 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
@@ -7,15 +7,14 @@ HOMEPAGE = "https://lib.openmpt.org/libopenmpt/"
 SECTION = "libs"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=59f6e21f42e49919617267ff13a0b232"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=829270a66f67187a1d08640df673249a"
 
 DEPENDS = "virtual/libiconv"
 
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-
-SRC_URI[sha256sum] = "2cf8369b7916b09264f3f14b9fb6cef35a6e9bee0328dec4f49d98211ccfd722"
+SRC_URI[sha256sum] = "093713c1c1024f4f10c4779a66ceb2af51fb7c908a9e99feb892d04019220ba1"
 
 S = "${WORKDIR}/libopenmpt-${PV}+release.autotools"
 

