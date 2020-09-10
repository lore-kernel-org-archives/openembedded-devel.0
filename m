Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.29825.1599764916697904824
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 12:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=qVXVfHNZ;
 spf=neutral (domain: kynetics.com, ip: 209.85.128.67, mailfrom: diego.rondini@kynetics.com)
Received: by mail-wm1-f67.google.com with SMTP id k18so1432623wmj.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2020 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qn4C/WzPCeVXTGmOpDqBTm8m1V0msfzB3dNDZ6xpNBQ=;
        b=qVXVfHNZKDk4Y7uBKJGNhdYq4c5h1AsX97Clmwb0p1S1f3gIc1gQMFqw5bCSDNN0D7
         7hgR+4Pcp9rUbspQSOJPSuHWydU6qqYOJJVSJj/eZox8r/BTwZ62dh32j817ls8xIt72
         aib6WC0T6vuSqL1NhvZ+hRCsN2uF9gfXEJgPWR3itqKpJFDIdhMv0nY0BUUcgPzjoAhW
         EoN/oBpOLxumOGmk01XuBHXaIcwaX0hUI4TKD/2uG+YAoX6JMgR9Q0IdblIDarAmTfio
         fu8pLvxlWq9F20S8bJpCaanwZepph63gpsml97+tFhG3I3M+LpubcFnRGA3wRaxiVkd5
         Etsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qn4C/WzPCeVXTGmOpDqBTm8m1V0msfzB3dNDZ6xpNBQ=;
        b=Ko8IwQwP1elTDGTTI+xe8LGu8gnn0fda7us3cX+oc9iNGLmcwLYFwNIbpvMqHvprGM
         lXcR6JwBzlCocxj8gJ/8SX9h4lgC2ytxFPtBOwLif5H4YicszUSb/u7K5COxaSekGUCg
         wgSNJ+2PCGqREbboyKRvfHgbRjiyufGdN/55xVP3Src0XPAYpxHBjG0/IttzPOwNSdbe
         Ssjg2QXn9HYKPvJk5Vnv4/kauGe4BwA7vjwnxD/qABzqgPzfvLnGFIDXNu4KWsGLFJQw
         F1sXoX1VFi5MC2ToExX8aIVEbnvrRElQSeSvrPtlhAPRn6E5MCkQLW84FsH9GFUOgIU3
         lITw==
X-Gm-Message-State: AOAM533QMuBAtDsvk/vXKRaFo5QRGmJeRkPuGLMdq4gCeyRheW4J/rfW
	/baGHITeE8f3sl1UOJyVn1WdS0kzhAw2DA==
X-Google-Smtp-Source: ABdhPJxk/4O4yxpJrRF1PHAVlcdOxhAaoYyZNl/AhoPubR5UJ/7gVFP25TAnxhxxCINA65PMF790qg==
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr1461514wmj.72.1599764914150;
        Thu, 10 Sep 2020 12:08:34 -0700 (PDT)
Return-Path: <diego.rondini@kynetics.com>
Received: from localhost.lan (mob-176-247-160-75.net.vodafone.it. [176.247.160.75])
        by smtp.gmail.com with ESMTPSA id c205sm4765726wmd.33.2020.09.10.12.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 12:08:33 -0700 (PDT)
From: "Diego" <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-oe][PATCH] libeigen: update SRC_URI to use gitlab git
Date: Thu, 10 Sep 2020 21:07:38 +0200
Message-Id: <20200910190738.37047-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update SRC_URI to use gitlab git repository. As discussed here gitlab archive
stability is not fully guaranteed, so repository is preferred:
https://forum.gitlab.com/t/gitlab-release-tarball-stability/41888/3

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
index 9c3d962f4..6ce318d0b 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = "https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
-SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
-SRC_URI[sha256sum] = "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
+SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;nobranch=1"
 
-S = "${WORKDIR}/eigen-${PV}"
+SRCREV = "21ae2afd4edaa1b69782c67a54182d34efe43f9c"
+
+S = "${WORKDIR}/git"
 
 inherit cmake
 
-- 
2.26.2

