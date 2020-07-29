Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.5124.1596027157682535008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 05:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=zd8T4/Z+;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.178, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f178.google.com with SMTP id r19so24868266ljn.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 05:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ZEhlPk0hfwKbt/YhIJgAYkT73+1BYWAfh02UWOOjKw=;
        b=zd8T4/Z+EH1kdKpSFXMKPXtnT5BY1cU9fCMl+b/OqUtY+DXghl1pupZ6ojxwpqSg7Z
         mJbcQcSHRfZOnvakebCEc3kS9D20aA+o8S8AYGrrZJ3034XzMOzA/K8GoZ2L0cBwU70t
         dvVT0f77hsBLpaqwwTS9gtnzyALLGn2M2uXnfPbK8Sj0rSQJR5+jO5FYmAiqx4eV5Cfa
         Oc/d+bsCyCv5m3d1HU4mYyz4kj9pXQOkZO3VcZaugy3614ckO6iaFo/DalbCBur+52+Y
         UX7yHH3ttrXbyC2kkvarJFAQErhH4cB/zyTIvLsTx8X8u0zDlXftwnHECIoI0aUzltde
         kEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ZEhlPk0hfwKbt/YhIJgAYkT73+1BYWAfh02UWOOjKw=;
        b=atm1eq/27QcJAgIBSxZGFogO3EOUoCcnSQjyRoRJtKxlLRGi1PQEzoXqA0a6UJLFCB
         IjwTLVA4kF7QM/GosJjmBdcZWKy8lL/116XtQsPLDyEgWmOgwLxzwQYGczwxGnI8mdBq
         UZU+EZ+95TGm/j9qtK8jwIAO1e9UROVbGJykN5Ssph86FeXv3Vz4TKmijeQWNWQwZLeH
         ExA7N+MxaLLPyNwAXS3+6sVF03gCy0CsbCnfYiLZiL8/kXAqOeXEymnLkG2qCcQ4wXCu
         R+FawQdrao1lhqeJMG6CqlGSFNUrOGfV47XGJinFnx+VDOrhegg2mZ6E5yvWNHRQlypr
         k3Zg==
X-Gm-Message-State: AOAM532k5iGAgioAFqnm/UQL6OOtnehNEef1JBUKOnddEf1MrT4k3ZKX
	ZOnXIsNNDGZjNTMU3KY3uOnVS2aWzp4=
X-Google-Smtp-Source: ABdhPJx3u1fOns0qxF4ptlRoQ/NWfsh/ZWbGeWC5yWWu0BxlBLJWhnQHs2cO0Fi9DK8LXo1eXxZ1cA==
X-Received: by 2002:a2e:381a:: with SMTP id f26mr2358839lja.252.1596027155475;
        Wed, 29 Jul 2020 05:52:35 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id r11sm381332ljg.15.2020.07.29.05.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:52:34 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] relayd: bump to latest revision
Date: Wed, 29 Jul 2020 14:52:33 +0200
Message-Id: <20200729125233.3434622-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-connectivity/relayd/relayd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index e3134e41f..ebe64cb1b 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.openwrt.org/project/relayd.git \
            file://0001-rtnl_flush-Error-on-failed-write.patch \
 "
 
-SRCREV = "ad0b25ad74345d367c62311e14b279f5ccb8ef13"
+SRCREV = "f4d759be54ceb37714e9a6ca320d5b50c95e9ce9"
 PV = "0.0.1+git${SRCPV}"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.25.1

