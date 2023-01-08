Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9DAC46467
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 02:34:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.36988.1673145246608761450
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jan 2023 18:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oqcM+Y2k;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: geoffhp@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id a184so3781536pfa.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 18:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5UrE/bGb85nwO9J1RG5z9Ynr1anUI5B4utRISZ4GiY=;
        b=oqcM+Y2kLpoEas9z4vS+dBm73bTxqkVC4rlu7ku33ANakuuWE2MURdICKYqQK1QGFT
         JGwHyjtr4vZO2S0xxWt9SBuJv5eWwKiCtEP+slK6igGKAVOYgtEvYNbOEswcMc4AuKDr
         PvXeG1sYGx9e7UiYO3Ckp4uSZGZ/UDFRKXj0JYCUuZunGfjQXb4co7gRtVcKcTPgbRYn
         je5L3g1slfjwHO1cfslc7qlrjYbomuHpRsSm9JKv0gZaxzeeQZz8LNjfLXdGkYunG5G2
         CDhzEF1Kg0iU8CK1TsqpBz90TnE5Uo1XF/tvPydLqVNglYub7ZES5AKWxP5UU7IMYoJw
         RNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5UrE/bGb85nwO9J1RG5z9Ynr1anUI5B4utRISZ4GiY=;
        b=uUtD+ADqjTVefneGBpWt94/q2m0ONqPun1twKfQ1VB8v7Bh+b/Fwx0yFTUzBOx5Rkb
         XseyGPN32osLednCYjMnPPzWCWHQzPls696We+DqdgB/qTK/A+b9aHUpHFlL48RltB9b
         NiMAVcxhm1kUu9DNAvlYIlMN02yfXxrF7+ufYij+DqKLBdb4ALwZ7Cf0zJJhBf79r5u0
         oZ4gYhGjOQxNpzfXBZM0zt4yvTyd8/ka2Yx0cwXCKSD9H0iAbamMWQEXO+35HJIv2drV
         Xq6S45/a5ngSJOCjKSOB8Fz4sbbAczqj026n6kwzrolYWWCfg+ZFMfsK19EBtUjipZSC
         b81A==
X-Gm-Message-State: AFqh2koc8GwyrGxD2wPnUZR4e+M9/VB4mprq291P52TQ8TI/hLxLkFDj
	W7fCV7O15UX1j+MnmzuHzGEvrUBApAA=
X-Google-Smtp-Source: AMrXdXuNK8f9Ky9KLT/Gv2UNJ7004VfnScob4UtUzoaXhdR4br9QjL/xLP3taxweB140MV8XKzxMtw==
X-Received: by 2002:a62:d45e:0:b0:56e:dca8:ba71 with SMTP id u30-20020a62d45e000000b0056edca8ba71mr52727134pfl.32.1673145245707;
        Sat, 07 Jan 2023 18:34:05 -0800 (PST)
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id o13-20020a63e34d000000b004a3510effa5sm2917516pgj.65.2023.01.07.18.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 18:34:05 -0800 (PST)
From: geoffhp@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-java][master][PATCH] layer.conf: Switch LAYERSERIES_COMPAT to mickledore
Date: Sat,  7 Jan 2023 18:33:39 -0800
Message-Id: <20230108023339.3626880-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 02:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100434

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index bf592de..c571df5 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "kirkstone langdale"
+LAYERSERIES_COMPAT_meta-java = "mickledore"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.30.2


