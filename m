Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8D2C636F5
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:45 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.39433.1649096381378060087
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RPELG1SI;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id b13so9805852pfv.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1qSHcnVlBKOJbzVakmZvKy3EDrGSyhucnbHIP436ow=;
        b=RPELG1SIWhOgqv2Uzj99bPIXH53f2fv2nWZ3b2zs6np6mhYOxu3xpwrleI/eFrpO6M
         gtPuI3pQhORQgxieeqrZLTC0OYiiCh0n1T5Xs9AeW/qDfZgmJ1mujkeCwpiOu458SLMu
         w9z/sq96HIQg+P9bMFbxg1GCakP0AaZXflS8cnNbMJ+9OdpzkTDxGADNpfjWJRyNzxtb
         EPhqp/GR/tx7n5XS3sUyasagfa89+UM7C7EP+0S2LpDHLi7LEKWrCOip3/+u0aERhk5b
         i2y2wgZ1DBqucflf6lDusq8yM7xYntL7D1o6uzqw2+gct67M4Ims9sTBA3YP8Hlv1lP4
         C29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x1qSHcnVlBKOJbzVakmZvKy3EDrGSyhucnbHIP436ow=;
        b=pZBf979UNr6Xz79EsJqz6Gt52pGUc3JgbAt3DBzdvTb0F7q0bae2mCqwsG4IomVS1i
         qejfBBThvrRDxMGQ/TIFXTGMcxc8cJAOtIp2w0ZwYMKBbW/WuB/cO6Vf58y7h9CJoUqZ
         U95v7NX4QpfIO/EQvlhjGbrs//18IEpnUFPhiw9gyPlyDvxvW0DWVvoPpdG2sYwnqY/m
         4hBo3MoOtMOlYz4btIfdpgRmQwqLdpa7VZlrj9T/do4/ZVn4b/uDo+On2OYZoSvmKYgP
         ALjkwcIoR8NOPFbdhanvG6bq8IGrdrBXkXopTMFUBOE8rXtRCAkEcSSnN352pul30jyc
         9UPQ==
X-Gm-Message-State: AOAM533+s3FYcPLXwneYI3tjKxAQY8R7xd8p62yIXp70LsV4effK7iJ9
	BJNIqmSozghLFi71t4jHRbE2RtcVXTU=
X-Google-Smtp-Source: 
 ABdhPJzGiMqgqh6wS+NTbAc8Xul0ydB29mUC7U57BjnbzMz16gH2jBxWh5LZl+MFg1gYvNXeiJDsoQ==
X-Received: by 2002:a05:6a00:1d85:b0:4fa:9dba:f1f2 with SMTP id
 z5-20020a056a001d8500b004fa9dbaf1f2mr809769pfw.31.1649096380435;
        Mon, 04 Apr 2022 11:19:40 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:12d7:1906:ff25:5c6d])
        by smtp.gmail.com with ESMTPSA id
 f4-20020a056a0022c400b004fb2292cd74sm12767883pfj.206.2022.04.04.11.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 11:19:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Stadelmann <dstadelmann@thermoplan.ch>
Subject: [meta-oe][dunfell][PATCH 1/2] imagemagick: update SRC_URI branch from
 master to main
Date: Mon,  4 Apr 2022 11:19:37 -0700
Message-Id: <20220404181938.2893521-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96388

From: Daniel Stadelmann <dstadelmann@thermoplan.ch>

master branch in imagemagick was renamed to main (https://github.com/ImageMagick/ImageMagick).
Similar change is already in master branch for version 7.0.10 (see 248739128389)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
index 26a5d4a4d2..21f51ff155 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
@@ -10,7 +10,7 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
 PV .= "_13"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
 SRCREV = "15b935d64f613b5a0fc9d3fead5c6ec1b0e3908f"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


