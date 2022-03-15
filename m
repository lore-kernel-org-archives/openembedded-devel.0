Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74226C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 14:36:15 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.11726.1647354974994208367
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o3fJVae0;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so2462366pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PaUC6ou2LXA9kwzK5Bl9Kwk+SriIsE37NbaTdVHhIdM=;
        b=o3fJVae0MU2wJtkweF1lJuYCCC45ewYXj6hW4No6CydeFGkMpoi/2VDZE+cj1ZSvkv
         Xz63cypFQHBDtcc0xnjLvPrpiGSzfgCqziL7sCFl5Na1jLyUhNWxsv5J4lTIP3rQhy73
         UG8TXDuB2uAq4jG3AQ8WfjZMmhcuAY3nZJanaGPVENnpvY9eDMKsYeq4d/uAiBhyA2Mt
         jby9VRdY+CQDkEE2B3Ke0fsl8fVsimHqoNjvsLnJIUj2QF2lJZCAye9OJ8atl/jMAZXd
         GSwA5FayBc4THdb/GUKlMXOnl8RD7o+L3ONPfV3FuxmP+gpxTZK4ZbGeBt9JbmpXZLvG
         A0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PaUC6ou2LXA9kwzK5Bl9Kwk+SriIsE37NbaTdVHhIdM=;
        b=3gYI8b84Qdp/CFxaI1CBDBUvjX5lMEIXBpRZOrXVZJjKe3SEwMNC3w2v6pgz4HmLo0
         Eq+M1UDEYWRUoZrgO7CjGh8J8I/xyj+5mBWlMTFfdcybHZEPpXxE0VKEdVwidmw1GDSp
         quGiELjyNtTn+s4j0ilHG8uMT6CYwJl/WVqTDucwFgz7GIgZEoPwYyv3Uoam5qWapvhD
         H6Gf0WLroXGZeIl+wFv1SCTTWfEV4mc7RfGQCdsyd/zTID7RFGF1s9d1dYrTUYd7Xqeg
         z/Opi5KyQQNacmxX5f7UFg2IPTeM5bbbLJTbmD4Edo8OT9YpMiEpy/Sk6Up5/eVANFhA
         OASw==
X-Gm-Message-State: AOAM531lKfb4poBy/q7Q4XkV6UIEpoUEbaWy6yUkLAMjMb0IiKgKMtcv
	sPG7PMdYoWyv3Mw4R2GeW+IJQq34lc0=
X-Google-Smtp-Source: 
 ABdhPJz3ZAER2p1/i9+bQIPOu6keuDu4c6Ccd0BrpxnxZJqSFBpU0rttIoTqj79QqSTgKd7QhLP3FA==
X-Received: by 2002:a17:902:b094:b0:151:be02:8e27 with SMTP id
 p20-20020a170902b09400b00151be028e27mr29158209plr.50.1647354974166;
        Tue, 15 Mar 2022 07:36:14 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:fb85:bdce:f9b3:3700])
        by smtp.gmail.com with ESMTPSA id
 l20-20020a056a00141400b004f65cedfb09sm24574137pfu.48.2022.03.15.07.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 07:36:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH] imagemagick: update SRC_URI branch to main
Date: Tue, 15 Mar 2022 07:36:12 -0700
Message-Id: <20220315143612.1219507-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 14:36:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95993

From: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>

master branch on the repository has been renamed in upstream to main.

Signed-off-by: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2487391283890f40c829aecd1808688f60451216)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index bb111a1c9bb..008a83f46d7 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -11,7 +11,7 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
 PV .= "_25"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
 SRCREV = "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


