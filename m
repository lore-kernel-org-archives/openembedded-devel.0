Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223E7C63797
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:52 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.46810.1673191288505181490
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RI6rhZ/o;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id r11so5152598oie.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp38h/Ml8IZeNDEvF3wuByQ5RM3SBvUJHI78Pc2rlZQ=;
        b=RI6rhZ/o2KNqHMxgyyLHI0VozsbGbyr93yM0vZOv/LsgwWIFbnjuofkZGUFqHzpnLw
         8Kty9KM6c2bl+NrNdNcpQgTT3xDU2u1wLazujhhw3JoCGqetN4AHMxk29Jshv9KqfmE2
         tsk1tmjY3S3Q9OCUuFAL6RqrgT4AjQNPuHrbsCzRhH9Xzk8YpEviUOzyuqdH/mSfjMtc
         EVCBDmWp+yFR3Z8OmdqHwaocEuvVTpLeniX/KJbEyxDsSL/a8jAd0YTROidmPMxIh1u6
         sluvhMdyMMqiK6HkNQ4Wlzzh9ac8P9gOLDksJqx7euc1DFMQ7Niw54UAetWImE9R2DYR
         z4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kp38h/Ml8IZeNDEvF3wuByQ5RM3SBvUJHI78Pc2rlZQ=;
        b=yqqt9oRPQpaFC2mivzhsVqN2Niuk2QZ45XRdd1/1UuFjxSHxbADJuGl7klEwNcwx2p
         nRpKBwlskEjmxMwyH1Cmj4eoTQhscaag/jN10n++jMFecJ/b2cHpjXUXqKpKECLobcuN
         bLYgmU9DkFSdauxRex9gj0ryCYCadMpsDvzPJ0Ng1P64J4mjUzABwg53siUXG2jfFQjI
         NAGGgpstkQI7MnjiyPDkMkP481PcULHHDC4Yi95iIS352AWqR2NCj2ZmyRVUrHhxuPiP
         9SeL7u3dv5mRYnr9erLuTtSxfJlA3oOzlJ69RyfmmM+H4UNag3Iw3G+xQ6HmXO8AyHsX
         VJFQ==
X-Gm-Message-State: AFqh2koXGWAmgx+Mj2AauqC+cleD1zfsdbqRi85FhFEsexzNu+1Qix7l
	NK+8bj8QMnZSd3lvJXdEFh66TIrZhis=
X-Google-Smtp-Source: AMrXdXv227expnxJF6bKw4E/wA/LHitEUIPmDtzYvNwoJTYOGIDRQYOnQqvVJgRRu+IgFBDnRP4Xeg==
X-Received: by 2002:a05:6808:1a14:b0:35e:d50f:2a4a with SMTP id bk20-20020a0568081a1400b0035ed50f2a4amr33206993oib.10.1673191307288;
        Sun, 08 Jan 2023 07:21:47 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 24/26] networkmanager: install config files into correct place
Date: Sun,  8 Jan 2023 10:20:59 -0500
Message-Id: <43e318de2ff3135054233864d2cb95b2d50ca6ea.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100469

From: Chen Qi <Qi.Chen@windriver.com>

The current location has no effect, because NetworkManager
is not looking for config files there.

In meson.build, we have:
  nm_pkglibdir = join_paths(nm_prefix, 'lib', nm_name)
  config_extra_h.set_quoted('NMLIBDIR',          nm_pkglibdir)

It's clear that the configuration directory should be
nonarch_libdir instead of libdir.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 15893f46f8af8c91d922fa41f9a1f537d92aeb9a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../networkmanager/networkmanager_1.40.0.bb                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
index 110b499aaa..b9273ac89e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
@@ -295,11 +295,11 @@ do_install:append() {
 
     # Enable iwd if compiled
     if ${@bb.utils.contains('PACKAGECONFIG','iwd','true','false',d)}; then
-        install -Dm 0644 ${WORKDIR}/enable-iwd.conf ${D}${libdir}/NetworkManager/conf.d/enable-iwd.conf
+        install -Dm 0644 ${WORKDIR}/enable-iwd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-iwd.conf
     fi
 
     # Enable dhcpd if compiled
     if ${@bb.utils.contains('PACKAGECONFIG','dhcpcd','true','false',d)}; then
-        install -Dm 0644 ${WORKDIR}/enable-dhcpcd.conf ${D}${libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
+        install -Dm 0644 ${WORKDIR}/enable-dhcpcd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
     fi
 }
-- 
2.25.1


