Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0301C3ABC5
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 05:07:03 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.24198.1746940021128122068
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 May 2025 22:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vhpap4Y9;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e78f528aa8eso2706480276.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 22:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746940020; x=1747544820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/xr1Aq3/vVOsPdTbk+5px1p274XmZ/niuICcpn+w7o=;
        b=Vhpap4Y96I4BBeO7QYnkG9wHPtWxpy3iQQPZGgoL/qEVpJWHFsxdZ770ogyqs/SU/h
         svOhCJV/0MQ7vEziI7dn9ud3KIzdIQZ/4hzADg1vdTVqh3pP8oRvQk41yMecXSqGGuDP
         8y3K5Xs7nqjvf1DyN2AK4ve0HzR+B7PnlRzl0uv3AEZMhobFMT0ZSfG3ucs/VAjAyu2X
         ezxCIbKQR2DSrrJS+UNWlvxPcEep4yUx1T8Ccyd/cRpT1p3AIscuFmp+nAaN93DhMB/W
         2UhLHWvbgBqXY4z7aV8mB4szY3LiVw51qgT/qqfn1ChNfxOIPBsWR9/GSPMoDhmVv6S7
         0oUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746940020; x=1747544820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/xr1Aq3/vVOsPdTbk+5px1p274XmZ/niuICcpn+w7o=;
        b=dg67XvwabsyV1LL5jfmw0btEy9xh/Cnyq4XQIz/9jMXXuzoDquSJKqR4ama2EhQor4
         yePaEQ55mtuQSQGYJhkQrwLOGFsK2MjblmYhr8U0MCWfbu/v5D4SV9Zb9ABICE5vwJ8L
         Bq97kN6aCLnqiUjSf4GcrS9iRpxOBHMZVpXCSJPg74aCJHW9YNtsUBhKrH8np1lfWEvO
         nhxx1zoEx12oAfeyN3lZ945Oj1zo5czi11ZVuR1VIDiA5tKoHgRHzuVAtZTUZ/vxwKOU
         +VpEKiu8PBQVF0N+ewu8ewVqiupAOn8uCpNilhLZRT6zROL3cd5UsBsssylt2mHfJopH
         EmGA==
X-Gm-Message-State: AOJu0Yw9CQttgjFEYu2UBOsWxnW6Ui3Wqlx0/5RcUTKF4zIUF9EGWHwb
	tMYxhrJidc62jocHV6vvY2icL8aimMgSWvUGSx61qFHl18Gl086JXLrZnCP8
X-Gm-Gg: ASbGncuaey7ehTumr6CyFpoeQasZSS5clO9b5OmUtfoqm6RnWIhWHVZeJcrqdNHnpu2
	ilX5j8kP39x/6UT1TGHfu24bRN92wl9h+h4ilwiy4A0h2DMOXVrKrDCAv+TTaXf4+uJGle6Lp+V
	3tm7X/aFM2Ekcblm3gM/+6kBH/CyCGeS+N6DVKyuy0mywYJiIvzNuO/pjHjy1jgm0DSt8iAi5Gl
	ZKJYxYdg6HZDUxll4/uKmsjMlIpETaskkGXa2wadP3yHlwB2ZN1II/WEThoFPgM5udy5Yqb3IB7
	q333GIM7vF0NBJuoncBED/ROL5xZYI92my6SKQYQIPiiI7F+cbeskl4h
X-Google-Smtp-Source: AGHT+IFh1glczqbnCnci0gqzecng+tp8Ek12zg5MzSiMhhX9ydR6IvJvLEpFS18De6IL0/DtYgt75Q==
X-Received: by 2002:a05:6902:2482:b0:e7a:b37b:7265 with SMTP id 3f1490d57ef6-e7ab37b7764mr2166477276.20.1746940019673;
        Sat, 10 May 2025 22:06:59 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e79965aa4bcsm564590276.2.2025.05.10.22.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 22:06:59 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH v2] xfce4-settings: upgrade 4.20.0 -> 4.20.1
Date: Sun, 11 May 2025 01:06:49 -0400
Message-ID: <20250511050650.2630805-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 May 2025 05:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117383

Drop unnecessary CFLAGS.  They were introduced with xfce4-settings version
4.18.3 to address two errors seen at the time - deprecated declarations and
implicit declarations.  The error was documented here :

https://patchwork.yoctoproject.org/project/oe/patch/20241127005545.86128-1-schonm@gmail.com/

Both of these errors have been addressed.

This change to the code base fixed the deprecated declarations:
https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/def01fc82caac1cb41d3b7c242efa7f98d48e9a6

This change to the code base fixed the implicit declaration :
https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/10e40cdf13f1440d207a50a3f19fc4903da0d80a

Changelog: https://gitlab.xfce.org/xfce/xfce4-settings/-/tags/xfce4-settings-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-settings_4.20.0.bb => xfce4-settings_4.20.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.20.0.bb => xfce4-settings_4.20.1.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
index 76ce27cc96..353ea9ed81 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.1.bb
@@ -8,9 +8,8 @@ inherit xfce features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "23548da3429a296501fbfdbc98a861ee241b9fdd47e8d5de1781f57c6bbce5a9"
+SRC_URI[sha256sum] = "fd0d602853ea75d94024e5baae2d2bf5ca8f8aa4dad7bfd5d08f9ff8afee77b2"
 
-CFLAGS += " -Wno-deprecated-declarations -Wno-implicit-function-declaration"
 EXTRA_OECONF += " \
     GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
     --enable-maintainer-mode --disable-debug \
-- 
2.43.0


