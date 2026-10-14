Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C106CC6B27
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:58 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9264.1791969952193356816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fi14JJIf;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-890d52c7c7bso3173556b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969951; x=1792574751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uLxgzOj5PVjJcA9KrdjjodUQeMPLWlydBZ6fmvtUig=;
        b=Fi14JJIfjVTVFxIq1+Y/RPxZjz1iiYYuwvqDRPAXaiJKaH45thPTlQ6/ks/ZkWL9d4
         LEjSihudUh2y7d4pjjK4MYawjUqnDRDrvd8XYCh2+4nbEPabRwE2qaCKesxz6rsQNvF8
         rCASv9hKp2PhX70QQXddrNfr+WpuvwfCXaN2EKQYu8jQCQnl3ykktslJHdVfGutxTe/A
         rowA+H5ORt8N1QugNWFpvI4o/WvRo69jj3PovRgRUSROpURVMEkmmsZdsJVdjezLSD9Z
         5G4NhGqIoKq60ybhFvVKVMa5p47+UJKqkLIJr8dfYwN8jRBUyAjHjsDMqD5e2lkIFH/T
         xshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969951; x=1792574751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uLxgzOj5PVjJcA9KrdjjodUQeMPLWlydBZ6fmvtUig=;
        b=kwCTTz8D21Wi3RM3VZjs/VGrC0oouofCtt5eGWtulc0/QCYX5D1v0bK5plAv53X0nq
         DVVVBjn18MZ2HwYI/xELoTviIDP39qyQIw+proTwR3bgm/hh7dYzNjCjWsCpHI13Dmxy
         saZdpS0vmq48oIxQ8XaQanSwojopxFTC6fzGjj2Gz+bTRvJ8L+Z5N66UVxwLVTGaR6F6
         b+CJ1XbWL+7vANJ005LC/Nyt9OfH/vIZCB1uo7mifKOmxysQZ6cqYHTUUsse+zlCaUO6
         NsJp4gTW88I3F4SrawOVEP/33yIqTVQAV22EQ9g0A/2TscWKb7N7Bz9w3QaEpGaB5K7n
         FPew==
X-Gm-Message-State: AFq9FYKuzFAve+ML2FTAlLNbdmDVQ1+lMZwyPovAs9c0RSdIq1fE+Aqv
	AzUz5INY08QhxjWeO5BOPlLLDT1DGDH8drcivxxRAyu8Z43VthH5zunFnqbLIg==
X-Gm-Gg: AYBFou3PVIL+ZNuF82TenyWdW3lubAhP3tlt2w+fz2pE3ajKJFZrzz+5Wn/iBCcd8/e
	96PFvvjdDZWZWBvScwXNnG1BHaE1Pk7glUPLCQxZLLQ2ZJrZhMDF7WkbwCPVgx1PvKSuwlEV1c3
	ymDrfZi8GtrO4t1H53LAXW9JwDQebMxrT7NP5vi0fyi5oGlBEO3LNPbc2TBHOifxdcHIsKAKD0h
	bsTKkzwAEVLpnhVaItdwkV7mI06At8T7t8fscu71ihagYw1VGzaIC3qrn1VNzmRei0d8a10cSxM
	ICsvOpYVhp9tHHiLfeY3XBNMgR2sK7+dou0w7XApvphRAHCkQ4gJ/fwdILEPu3eOmMFUddVqbRu
	y3zSE0FB2w18Nk9ZxRr6siLEYABm9+mAz1xwW4biOR56WFnT/H93Qe+QwHLKTjDDFi1W8QlxMRz
	jSID/CiIVpmzh/QTwqz7tKNL9RojTeeZ+63z1fFib7l56eMD6wlgusE/EZHzM5aaTgrSI3bvYZ1
	+/4WnAoQO/ottzi/NomB6pKLnNpZYE1s/cRG5U=
X-Received: by 2002:a05:6a21:b98:b0:3de:7dd6:ff8f with SMTP id adf61e73a8af0-3e16be94558mr11487120637.50.1791969951507;
        Wed, 14 Oct 2026 02:25:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 12/17] spitools: upgrade 1.1.0 -> 1.1.1
Date: Wed, 14 Oct 2026 22:25:08 +1300
Message-ID: <20261014092514.454505-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130880

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../spitools/{spitools_1.1.0.bb => spitools_1.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spitools/{spitools_1.1.0.bb => spitools_1.1.1.bb} (87%)

diff --git a/meta-oe/recipes-support/spitools/spitools_1.1.0.bb b/meta-oe/recipes-support/spitools/spitools_1.1.1.bb
similarity index 87%
rename from meta-oe/recipes-support/spitools/spitools_1.1.0.bb
rename to meta-oe/recipes-support/spitools/spitools_1.1.1.bb
index 69f527a6eb..e2ab0a5d11 100644
--- a/meta-oe/recipes-support/spitools/spitools_1.1.0.bb
+++ b/meta-oe/recipes-support/spitools/spitools_1.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/cpb-/spi-tools"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
-SRCREV = "a19dffe44fee857124a993598caae0c85894f914"
+SRCREV = "74ba65b19e0cf9d1eabd52d17d842200ef901d61"
 
 
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=https;branch=master;tag=${PV}"

