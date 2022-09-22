Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A295C54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 23:53:49 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.2209.1663890824864191400
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 16:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MuWPBQgd;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 9so10761393pfz.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 16:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=yRlcfa4VH/rNQZZ1e1GGvpbO+R2tEO78iOaueOK4qIE=;
        b=MuWPBQgduAh6brA4ieA6eELwJw5qVIJLEIgorhqhvB2ghIxbgXDfldoIclNckq+Hg5
         2S4xS52ZYxZkVViCRk4a6sJGopg67l2c9BzXIS3zejSsy2Be68N38lxYkhTFMWdctd5y
         G7AbgusuO2XWuC9nSo5E66+Efki0nvXsHGkaz6hrqRXi9lnvSfhtoiwATeDGZoG28DVK
         Zh7VKQwqKuKZ00vmJWBcrKFjUYaxkU3D+a/pKx5s/x5cg1AeAk4FSr3dLczyYxnGXBYQ
         mHMm9rZrqMcevbN/ETy1YZ9n2IDOtUXuwwO1uM9DHw1CzTWSziq3VIaihPsgu3t+7F9u
         JzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=yRlcfa4VH/rNQZZ1e1GGvpbO+R2tEO78iOaueOK4qIE=;
        b=GiAzgjvZrISil2q8ho9r8HePU/5nyhJ4EVaP+b2HO2yF6Jq7Uj2KVzzLSNegmbkZ9Y
         JaI1mSm9TykWUriFwjJzw0VQpwf6EdT7aqz9RamY6TYGwZe4wdM2TEklH6sD+OGkZ1sj
         zCQlRnOtXX/GPasWEE/KM7EzrYNVQZFUSYV7YfdnpWbrEcRcCcPpTTUl+iv9QPZO8KHm
         f6IvxBEXDbpOyJINAfyPp+zaV3PMeXqksSUjpZ1Gk8kd2uk2crONQ3/0a6KrriM2td4G
         UPJa0XrtXFJoKQU6fdG5MtqS8kmi2AW3deqB69fkWB+IG6zQFiHfOETjyp5mGreqyc3B
         VQMw==
X-Gm-Message-State: ACrzQf0e5YfcIbMPUWuhLMvZb1FzhEwjH6nFzRbtw/3VawOfi2wP9QOh
	vvh57U83S85MSTUPvrhEU+UZg0NBaYpJ4Q==
X-Google-Smtp-Source: 
 AMsMyM64aPoCE6iaIyB32ALnd4SMBjrIrQSDe+kkwHFCxTEqBTG9HxwQGoReBjNytu4N2gY7IyL4/Q==
X-Received: by 2002:a05:6a00:88a:b0:53a:b7a0:ea3a with SMTP id
 q10-20020a056a00088a00b0053ab7a0ea3amr6132680pfj.21.1663890823961;
        Thu, 22 Sep 2022 16:53:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 jb6-20020a170903258600b0017541ecdcfesm4603872plb.229.2022.09.22.16.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 16:53:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] mdio-tools,mdio-netlink: Upgrade recipes to
 1.2.0
Date: Thu, 22 Sep 2022 16:53:41 -0700
Message-Id: <20220922235341.2629047-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 23:53:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98933

brings in

Added

mdio: A new addressing mode "mmd-c22": Used to access MMDs attached
to MDIO controllers without Clause 45 support by using registers 13
and 14 in the device's Clause 22 register space
mdio: Pretty print gigabit link capability information from a PHY's
extended status register
mdio: Pretty print lots of status information from MMDs (C45 PHYs)
mvls: Decode priority override information of ATU entries

Changed

mvls: Table listings now always prints out the device information,
even on single chip systems.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mdio-tools/{mdio-netlink_git.bb => mdio-netlink_1.2.0.bb}  | 0
 meta-networking/recipes-support/mdio-tools/mdio-tools.inc      | 3 +--
 .../mdio-tools/{mdio-tools_git.bb => mdio-tools_1.2.0.bb}      | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/mdio-tools/{mdio-netlink_git.bb => mdio-netlink_1.2.0.bb} (100%)
 rename meta-networking/recipes-support/mdio-tools/{mdio-tools_git.bb => mdio-tools_1.2.0.bb} (100%)

diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.2.0.bb
similarity index 100%
rename from meta-networking/recipes-support/mdio-tools/mdio-netlink_git.bb
rename to meta-networking/recipes-support/mdio-tools/mdio-netlink_1.2.0.bb
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
index a8a435fadd..7afe1c56bd 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
@@ -5,5 +5,4 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master"
-SRCREV = "07cbff2d5e2de05037e5e7edd5044d678394c8d1"
-PV = "1.1.1"
+SRCREV = "ee47c32d958ae0dcb9900b3b06654a8c08001331"
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.2.0.bb
similarity index 100%
rename from meta-networking/recipes-support/mdio-tools/mdio-tools_git.bb
rename to meta-networking/recipes-support/mdio-tools/mdio-tools_1.2.0.bb
-- 
2.37.3


