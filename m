Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5323C61DA4
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.44969.1674653491218567072
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RMUuJt4f;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id t14-20020a4ad0ae000000b004f51f61de9fso3133816oor.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqwQkUgigdYRIQwRI66MstTqMNH1yQCuoOyOB7pdAvE=;
        b=RMUuJt4fmanTf0sQu/2FgEszgr2ERmq4XsIkSollBYZ0tM/JDoPzZlKXEhRibDh1vT
         IlJ1aRpvLCe+/T/2/Ek31vgv/NnzNldagV6ElgP3GvgRmTGz/r7IgmK7EX/FdlWsU2fX
         E9dW3jUjYp43Ko60MYTMvbPKfmd95m5VU1/Qf81IcoW6tkS66ly1gA/wxRQfhTi2L+LK
         jc7BifHcEFaiXbUw4IRcb/gbcJWBlAtrLGTygB1oJXalKmS4tifhdMM8FSWkLrmbZeHl
         UUoGptZIEHFpaTuoW+3vQvhkP821shVZ/S/vzAQuJ9yl8Ik6n5oOT5bPV7W6N6/Fz23b
         3Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqwQkUgigdYRIQwRI66MstTqMNH1yQCuoOyOB7pdAvE=;
        b=PAT6ihhpfHg6nVZO4ewB8yAc8qy8c4W/TtdiLOA1upz+0sj3PBMFwOgHjpW2gjexsN
         Pg8dDcMWbhi5dDP/ItHA8HnsC63LYPxtEIMJ80ZAw/mwHnyIQ9xTWvZ4Ao9DxSyyQgZR
         /I9C1f16EqU9yajhgFYrwvd3/CJ7mMFW+61gWLY30U8aW8Uc79Ae1i/zDSzNRrpd6nin
         dfLYosrZjIQqESXPyvybw1PPZFRSaxwrBYPeaFB1IZ8ct3eL1+EPtsIYbPViHOYNIv/m
         D152QoajzD4/xPWF9cBll/VMJMwmZTZ5hD0D8z25u4EAQ40QZEGmGeLvIgbCuya6kDxa
         2jbg==
X-Gm-Message-State: AFqh2kreBZqvBMq0xmwhYPphirxUxI0bw2GCkBC11fg0ZcbCyCKFhS70
	jwjjB4lCRyEiMk6cMoft/63YqOsfC70=
X-Google-Smtp-Source: AMrXdXs8GVOwmoM6HAAknZDehzQU+Dumx/Uk9G63MVAK1H29zrq++N1aQvIWRh7fC3JC01ee7bm3Tg==
X-Received: by 2002:a4a:33d6:0:b0:4f2:ca50:7571 with SMTP id q205-20020a4a33d6000000b004f2ca507571mr15335602ooq.3.1674653522118;
        Wed, 25 Jan 2023 05:32:02 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.32.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:32:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 36/41] fluidsynth: update SRC_URI to remove non-existing 2.2.x branch
Date: Wed, 25 Jan 2023 08:31:18 -0500
Message-Id: <89a90f6792733b5e70e4e68661904a5e0b98d62a.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100771

From: Preeti Sachan <preeti.sachan@intel.com>

Remove branch 2.2.x from SRC_URI as fluidsynth github removed the branch.
The SRCREV is on master branch.

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 534d04af483d5f3d4fc73162c110449f169677a5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 14d09e5f0b..a4590d61a9 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,7 +4,7 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.2.x;protocol=https"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=master;protocol=https"
 SRCREV = "8b00644751578ba67b709a827cbe5133d849d339"
 S = "${WORKDIR}/git"
 PV = "2.2.6"
-- 
2.25.1


