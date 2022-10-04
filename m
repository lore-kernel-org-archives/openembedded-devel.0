Return-Path: <devendra.tewari@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7438C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 22:51:20 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.17303.1664923879500717109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 15:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kje16HBX;
 spf=pass (domain: gmail.com, ip: 209.85.167.178,
 mailfrom: devendra.tewari@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id r186so81949oie.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 15:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=iXEERn+aDir/Ek2gAX/gTu8w8IyI6NwfAD8myQHq12E=;
        b=kje16HBXEwsdjUAeUfO2bsM999LXysVdFavemUMHX7Z9djnD5i+zYFHR8Icb5yWLcX
         O/lb0YXVyGWLIlSyyNRntZjnulqQGt2XhiarotDorUfzaqLX37LFq9Alg2kb0SVZC3L5
         ecJhQglm2RTo3g3XaAvRz6LtV8jXjjA7axdSZVZLHnWk7OqTPjPvY7AJVUQW5+AeXqaP
         mNK9nKZU8q9IaL/Et8fGBbd0bix272lTDsugFNShr1hhbBJY/8WjG8eVWLp+FhF1hURd
         DgulIOlfMmVFzs4v2fsVKNDb5lRUtsud6y4yP3DvnMLFascM7WM/9pasiNQ6rvyUgzxM
         Uyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=iXEERn+aDir/Ek2gAX/gTu8w8IyI6NwfAD8myQHq12E=;
        b=yH2cWjK+wMMc5Ss7kibZz2cGqPxfLCH4OFxo6NDm2YO+hiIgSfQGtz/yJFKzWLrGY6
         +7w5gRlKdt18Nwf1GSabP1T7k6rGo5e4RMZd0u6unxIZkMA56RHMdHSCh1tFcgmpickR
         e7s9N0N6g3/wY+WodhTu4qhvpfOT442nifhnc+h39hqqp6H7G3mv1IrW3MOU2ez4iRf8
         6aqLDxCKUJ5lTy1uUR/jczl7xwGPWrk+TO3fIt3J9mq/giloTUEripQJTUDuiCFAvFNQ
         ksDybWf6tUyc37Su6d6/LmA0CX8w197wCICs2yfh7vBE7svSDbMq305MNnMNHgcGdtDv
         Zecw==
X-Gm-Message-State: ACrzQf2JIdEe/VfY1i1cMIDxVc9gW5rZ0+qx8AlkNLysIZBBPx4WfLAe
	Sxp20XcAd56BZ8QPLa5EUcMOHTXri0w=
X-Google-Smtp-Source: 
 AMsMyM73Vnx29U0YvWB7Z5YJTcFyZXJo6Xpo45TB+alDIB/0MSmBbGTUIlJHh3Bn+AXzvYUL0LhPFQ==
X-Received: by 2002:a05:6808:7cc:b0:34f:9881:7f9e with SMTP id
 f12-20020a05680807cc00b0034f98817f9emr918978oij.57.1664923878434;
        Tue, 04 Oct 2022 15:51:18 -0700 (PDT)
Received: from ma-mailsvcp-relay-lapp01.apple.com ([187.105.4.40])
        by smtp.gmail.com with ESMTPSA id
 h94-20020a9d2f67000000b0065932853f5esm3294357otb.61.2022.10.04.15.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 15:51:18 -0700 (PDT)
From: Devendra Tewari <devendra.tewari@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Devendra Tewari <devendra.tewari@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Bump SRCREV and add libyaml to
 DEPENDS
Date: Tue,  4 Oct 2022 19:51:06 -0300
Message-Id: <20221004225106.29537-1-devendra.tewari@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 22:51:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99061

Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 0b9f3f7a5d6..2d3f5e94937 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -12,13 +12,13 @@ SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
 "
 
-SRCREV = "acf8d028edda0a59b10e15962c2606137a4940af"
+SRCREV = "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
 
 PV = "202105+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native libevent"
+DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native libevent libyaml"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
 PACKAGES =+ "${PN}-gst"
-- 
2.37.3


