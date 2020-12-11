Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.2592.1607663618376123191
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Dec 2020 21:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cjaxONqi;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id s6so3677260qvn.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Dec 2020 21:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HzlQRkhDKwU/Ld55J6kYkieaxjqURV6VJF+AHa8BcEI=;
        b=cjaxONqi2G10O0lL4oBxfkq+mD2/MWOfov+wAhlvb2N+bO/MVmLfpah9zwQItre2eX
         RVJN1C4+8cXSdOygokCAig3W44XZsV7Xshg6znLAQbK/1HB9sYEwNfl9eaxHCNxQOcH0
         9Nz7AwSxz80fbpGFPPhjLnCb1zguIDm9fXVuVpPvZVfuXV/yZ+I4/mjJ3CN7XFwj28C6
         kfA2i2uwNC0EdMWvtLZXJ5DkFyRrTwaIv28nwK+kpa8i6KTtKoIlKkQ41ti64qp/ipqg
         14kq8pAZvrxIaRdgK/xrQAhaCcQXwfl+lfe80TiohirE+m2Dl6qBm1qIvj2gndokRvB/
         bw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HzlQRkhDKwU/Ld55J6kYkieaxjqURV6VJF+AHa8BcEI=;
        b=jkAbidD7Y7hzlWCCZpeXuDTw1z4/uI1kKwSJkyztfaH+R9ljWoHS8GhDQMgAp2XInh
         GQCGBw70w1zp7mvnuKhqkCsvWyYfNZW9oRxxrzlkd2EQlQPmYcp0CBSnGXVJ3DXzdTTC
         BcADP4KrS1skP87e2bO3LCO3miHYAEpu+Jy/HtCWZd/rmLja4TkyvozvevjKnjg4BDO+
         5DijUUYV4v70X09IMqYoNpZqVWbAFMV1WkTDkM78ZpRP0FXLzY21rMIQSER+w2UFqi8a
         xvfd5MDpK55r7KnhIkRcBLg02TDK3XiwB8AfeJpdOADBUgTPBG7zmJk2z8iIpw+eC13h
         IfIQ==
X-Gm-Message-State: AOAM531e/urMtN0ji9IRBUvo/ww04LplY3cb9mzdhmWf9KUgjirtMd/+
	wwD/PMnAd//3iKFShXihdBgwLIqK/oeT2Q==
X-Google-Smtp-Source: ABdhPJzak9YnYunl64NlV+i0WFv6g8qIytod+bWl3vo+kAbHqkm6/ywCNQLR1MR74bq9bWrRIXJjzQ==
X-Received: by 2002:ad4:4426:: with SMTP id e6mr13732259qvt.51.1607663617097;
        Thu, 10 Dec 2020 21:13:37 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id x189sm5986855qka.26.2020.12.10.21.13.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 21:13:36 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] glmark2: revert to previous behaviour
Date: Fri, 11 Dec 2020 00:13:26 -0500
Message-Id: <20201211051326.16132-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.28.0.497.g54e85e7af1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- use "drm-gles2" as the default PACKAGECONFIG outside of any defined
  DISTRO_FEATURES
- use a version string that includes the full date of the latest git change
  (not just: <year>.<month>)

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 46634634d..44bce9fb5 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS = "libpng jpeg udev"
 DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native', '', d)}"
 
-PV = "2020.11+${SRCPV}"
+PV = "20201114+${SRCPV}"
 
 SRC_URI = " \
     git://github.com/glmark2/glmark2.git;protocol=https \
@@ -26,9 +26,10 @@ inherit waf pkgconfig features_check
 
 ANY_OF_DISTRO_FEATURES = "opengl dispmanx"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gles2 drm-gles2', '', d)} \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gles2 drm-gles2', '', d)} \
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gles2', '', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gles2', '', d)} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'dispmanx', 'dispmanx', '', d)} \
+                  drm-gles2 \
                  "
 
 PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
-- 
2.28.0.497.g54e85e7af1

