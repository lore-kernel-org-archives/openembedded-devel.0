Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA891C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 04:22:11 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.4706.1646108531010080655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 20:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=irHCLEeX;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id o8so13385306pgf.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 20:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28pmAHbK06jbgJmOhNOgX3chM5G2a4CzFAUajKXHN1M=;
        b=irHCLEeXdbkxHdsgFZkTIdzhw+C6a9xK/Xg13H20rHeVzkZv8ZoTJdBRVt2VCXZd6n
         5jBS1bbPk0YaOBt8+lT1J/Yq53oYVdQ0j9R3NxBfWpctffeWImqld6DoKhtnOnFMg0nm
         8GcEgMDygfbFX9dpscTcXS4cVK/9aJeVRDXZojD5TRmRBHme5ExxknTnrAiQbf36x+Gl
         KwyWiNJdo2ANf2DbJVHC1GXTFS9pUB6is204BgbJMSQaB0G1XNdJ7YiCAb2F5aJpOGpd
         rju5u4cs5icuM/1ZLYt5oJZ3xKSwNPA3phOclSnYxQmHaJpEMmBCY485SBh20crPwv2v
         bJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28pmAHbK06jbgJmOhNOgX3chM5G2a4CzFAUajKXHN1M=;
        b=d2hIFj5CDiv90OTO7w5pV/0dKReh+u+MUD9tDi9IjgsArM8mEPShmRVss60CmYfQV+
         yGuTyUD+yUxtewGssWybTFUybumsTnjSH0UKx7YB5VViD+XDpRPhQvBwp+M5C7Hz7VHW
         yYh3T8pJEsHkkz0R08cpemPWJ6rA7rCqDPBzzjjKnVy45tITwIKouYMBWP0YHO6F1UYi
         4IRuc0TdpMxYoX6/PiQjuGBmVrtwkU1yzIvLLAikIvEa7MuRgdCXAy1WlKmV8SJpT0XC
         AvGmtl3OYhoUGuy3DVOjXjih927C8PvBpH5CqgCGUWP4IK1cqMpTt3OGBZP5SH/ZLsNb
         9qgw==
X-Gm-Message-State: AOAM530XEkQK7H+evpr9NeDd1/XZkoLqourT7YgU1kUmrYidIeVcMLNb
	5oZmK1CVl11aIY/jgDX5WjQ3En20vG1Ivw==
X-Google-Smtp-Source: 
 ABdhPJxDhMFiG4iYQ+4jrl25+/ntoyP4GPCgkFlkP6fB9IGknG6T7ACp1q4SS/Q6q1kvIjOwIEL3Iw==
X-Received: by 2002:a63:4543:0:b0:374:87b6:c9f5 with SMTP id
 u3-20020a634543000000b0037487b6c9f5mr19713675pgk.302.1646108530284;
        Mon, 28 Feb 2022 20:22:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 o11-20020a056a0015cb00b004ce19332265sm15489644pfu.34.2022.02.28.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:22:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] catfish: Fix wheel build
Date: Mon, 28 Feb 2022 20:22:07 -0800
Message-Id: <20220301042207.1703852-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 04:22:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95617

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
index bf3d7ed979..853d77e395 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
@@ -3,7 +3,8 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-inherit xfce-app setuptools3 gtk-icon-cache mime-xdg
+inherit xfce-app setuptools_build_meta gtk-icon-cache mime-xdg
+PYPA_WHEEL = "${B}/dist/UNKNOWN-*-*.whl"
 
 DEPENDS += "python3-distutils-extra-native"
 
-- 
2.35.1


