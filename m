Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2893FC3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:38:01 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.105723.1747237080059992985
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 08:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jzBorJsn;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso8850144b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747237079; x=1747841879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkoZ3RJ7HFX0SdfkTQ3WT3sJFBCdRXnMZITSFSQ4tlY=;
        b=jzBorJsnCJXgU9UiWNAMSzXzr611yn/yleHm608kQmNfXuaW5FA0LuxQNmCzhgbHML
         o2VallIOMSBcWmRN77lMUJ013ejkXHvWNLkN7mHpdrLU9v8OVpyrzz328M2kgbjPTJLm
         kmWcEHT7aeLJYtQ6J4WMZ3OZrp5KyJvBhnZg1m1bd5tW359XKaWwcN3by0YHRRwniAc1
         auZ6J3T8C5zrti/TJgbx3ufwNqZQMQcDBjgMBRwEvBlooHwODN68f/RbisbT0JA+pLV8
         mzg3fmnffNX1nk92Z/ZoiGrGVYceJkJFy/VDLMCr2aitxd4hQxZQ22gH3/F208nTHhe2
         F3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747237079; x=1747841879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkoZ3RJ7HFX0SdfkTQ3WT3sJFBCdRXnMZITSFSQ4tlY=;
        b=dtvN6dFcPvC86vnk8oicOopTX4dVaMM1xfDIo1d8S6mjIP3KHqCguRNVVdGYS9JGnx
         7EDMW5rU9jz2jBnDsEarGFeW+fh9f51qBjyCcSn2gxpAbq4S8mf4tOB4VdB1Zvy7ghZh
         IPjUYQacgd1v4ttUzGr1m8D64E4CFgA7dlGuJM6xQwCppj9WNSkdEBiNNjamGd1yEodY
         TRDSCuz4rSpEf7/54fKw1uaAaMcbOataf+nGvS7QlGxSnIDutvIYzDyMhWpD4BrMDefJ
         nFLGb/EglhNTYLNAxt8Je6hO/wyMEfCqvFiFXwtO27ULWHsuDRisiLQZj+SqjQSl9+DA
         Wxng==
X-Gm-Message-State: AOJu0Yx5OExI5SP74BBxYh1GaLfzCIqizONsfcM3qwEx2Hbm8x1M7/wi
	lTZ9bDprtkjnk3dOooDfsEcjAekTg4N+/Q+65QETaev4l8cI97WEa42ICo43
X-Gm-Gg: ASbGncsOwhckNpyndxzZaGwIjWYtHJw0PgCrhqkgyi2ecKjTgYFiqCAEgqe7SFdyJkh
	ehOtMMFOWa5KObSyre7NaJ/1slLAgceS0uLOc2WVxhWIzC6w5uHO5OgYIwK9ix/WmsswAQMgnIy
	+vbtFQ804B/zJLlWO6Z7YS+lWQvh/N4lQgxkcibQtngoxUc4WbVzaAwHZPHgcjVOeYZFf0bbTyH
	Hmw+gWiLX0kJqcWM+ei6U8hCAmvg0e//ZGxdeVfVm41cPHGtAPuHjDw1Wf0zx6am9reT2BOAE79
	tqbSUmviwQ1irOn8DEW2ofmeFVwD3iRYp6VuFH0wurJJKu+rp+9DMQ==
X-Google-Smtp-Source: AGHT+IFvtFEmJ/sppbt4IHxfe+R+EQ/DoNc/ozjjKtrYXFpnvsBlL1XZtxLwy47LWFvWDEAez22JJw==
X-Received: by 2002:aa7:88d1:0:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-7428926cf69mr5405832b3a.9.1747237079195;
        Wed, 14 May 2025 08:37:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237704e07sm9966657b3a.10.2025.05.14.08.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:37:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] netdata: Enable network during do_compile only when go support is enabled
Date: Wed, 14 May 2025 08:37:56 -0700
Message-ID: <20250514153756.1097088-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 15:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117416

Makes the hammer a bit smaller, since we do not enable go by default
in packageconfig's it helps with yocto check layer with default config.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
index 7693335dac..f18c979685 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
@@ -50,7 +50,7 @@ CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'go', \
 INSANE_SKIP:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'go', 'already-stripped buildpaths', '', d)}"
 
 # network is required by go to get dependent packages
-do_compile[network] = "1"
+do_compile[network] = "${@bb.utils.contains('PACKAGECONFIG', 'go', '1', '0', d)}"
 
 #systemd
 SYSTEMD_PACKAGES = "${PN}"

