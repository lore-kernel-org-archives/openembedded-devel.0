Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2536AC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 11:43:30 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.2212.1667994202809344898
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 03:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kmOqzbjN;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13c569e5ff5so19347290fac.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 03:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wSEchJz6FhX97YgE4WcNo973yftvD6dLpvQW+beudPQ=;
        b=kmOqzbjNFloTEKOzxinKKGsWDn/SvIqr2LUyeWV4GCZw/gwiyFDK3mAKtZzFh+wwU1
         rQP0zMqfuSAgNnH0FwLH2ioNMtvfBJ6r0huvwV6J5F2lsLayWEyaJZFhyfLAWG4GOtV9
         XvOPccYuqfvWYJwsLWrS6aoGCVtmLq2gc5DSGI5JFNibz/7ZUhme0c6u9MN4pgfhen2C
         v0udFbvUVn5iHit2PU9s3FcKmjn70aXq7cN/V2ERMrKg9ytiH6EAvnWdXSuLOD2Y1D2O
         S8LH05nk2SfugcLcf26Ji5Nk77YieDX9iaH92aYMGFz2BvKNdi6IifxXAVGzYDSoiv1M
         BtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSEchJz6FhX97YgE4WcNo973yftvD6dLpvQW+beudPQ=;
        b=C5epbtZJF2CIT2Pwc7KKKrt3aOCZMNyzsb2bKVQYGyJzZ4tfzn36gOvTM8LWUvIgoP
         CYK2IbRyHLX8XAsVEmWFq3Wp2QX+SfkVXVo5EWywtlgRL76vE43I7NbNW4Rgkp2actFh
         mnopiLuacz58dbPFJz0cr74LdoNGVXg7KEjuJSho9sWaIAzKueF0Sg6lamX3adTFUv/I
         0an8NiGDvxTWoqPxormOlOQwazevI4i1X6V2PmV7A9joSujcoG9lFXA4a2Zk1IRvwRXd
         R/0fYwm2Hpot2obr3fBjpugXbBYRCbmLdLsZDL12e2xK0ANc1tfRBRqfwxgwHYF8aPER
         +x2w==
X-Gm-Message-State: ACrzQf1Ku8VmlvJocHr6QtmLCaRVWdirJvMjETPqKFEXAVqFAjfB6fKs
	1HBlqPA58cpZ4LT3WJ24Ssx2gwrFqz/jIg==
X-Google-Smtp-Source: AMsMyM6hxCuVg0alsh8AStPkCvRCDG73BZIH8Tg9wKl2SriQITPdXNvKUidDXRtqwW2A22GMw2ww6A==
X-Received: by 2002:a05:6870:3510:b0:13d:9666:b884 with SMTP id k16-20020a056870351000b0013d9666b884mr19480559oah.138.1667994201639;
        Wed, 09 Nov 2022 03:43:21 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:d298:220f:4ea5:dd62])
        by smtp.gmail.com with ESMTPSA id x26-20020a056870a79a00b0012752d3212fsm5926330oao.53.2022.11.09.03.43.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 03:43:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [master][langdale]meta-oe][PATCH] monkey: skip recipe
Date: Wed,  9 Nov 2022 06:43:20 -0500
Message-Id: <20221109114320.772827-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 11:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99493

Package SRC-URI appears to be dead and the git tag produces a detached head so no viable replacement can be found. see email
https://lists.openembedded.org/g/openembedded-devel/message/99433?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cmonkey%2C20%2C2%2C0%2C94844107

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb | 1 -
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb            | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index e775cdb50e..fbcf7c547c 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -23,7 +23,6 @@ RDEPENDS:packagegroup-meta-webserver-http = "\
     apache2 \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "cherokee", "", d)} \
     hiawatha \
-    monkey \
     nginx \
     nginx \
     sthttpd \
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 8e58a7d4e2..771d1ed39e 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -86,3 +86,6 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
                    ${sysconfdir}/monkey/plugins/auth/monkey.users \
                    "
 
+
+SKIP_RECIPE[monkey] ?= "Upstream SRC_URI dead and t tag version produces a detached head "
+
-- 
2.25.1


