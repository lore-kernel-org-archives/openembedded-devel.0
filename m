Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2CAC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 16:17:54 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.595.1659111464861929364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 09:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KuK7DOdE;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 23so4373533pgc.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 09:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vwGpwWIs7Mz24eZOmrSxHP0LyAyYAKcWMgoF1wtHsgs=;
        b=KuK7DOdEKSfwwPmEM+8nuGaC+p9tllPt0OpRv84LXQ88tTNwJfC/aehORTeL3UV244
         gdcqJ6XC9s5MKmhtuqqIz4mvc05aHDtNaVltAP4dBAIQfCJ0e/9Wakekf5DxFHn/Yk3p
         0NnX6ppZMoPtFjZ5kfOdAN6skGaufgrOT5t9ToqusclcV9pNkgvpT+4UekglXXj56BxR
         S2IxeWM8/NGpHhC4VdqkNR2asTjhMqBBXvF0gGmrXko2vbNO3zkQcWWLRYeoyqlspBte
         uhIOjk8I704Tm9idQVcUw+Uzg58K/FIMGvdnKv2q92XA/We4U9odNF55UIUinhbatLjg
         accA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vwGpwWIs7Mz24eZOmrSxHP0LyAyYAKcWMgoF1wtHsgs=;
        b=LdnKEluCO2eBFNs81ls6OGvTgo4D0WDs4oo/ZhXDkTOza3chE+OOE2ZCwjnm27oH5e
         3ub9bBQ4BnxmpM5OjNhtuZIBgV2zF5lBq3ODVC4DvddKa+1DsDrE29Yd69/Yzsnk58yf
         4QN+Gw1kLtAc3fBRZGMXY6KcowsDxuGM/DR1ssXqPAMbP0n8f08jL+k8/cVViJnZou9i
         T7TB0wmniUUowt61K1fNf07V02hopkg5pvQ1vM/qrjrw+EImR8ZM+Hw3kLaJv04dIyde
         C3tp1Prgvl5bJHtAMIkevxuYYdC5RKVQ3TsCYzPoPEM1vW9CbVueUELuystDddyJoGqm
         cYcw==
X-Gm-Message-State: AJIora9saWRnwMV8NccwkuHgJ1tLrMJd2GBrsOr9yV1Z+WMrv56SiPdm
	oH730mp5yXzkIBnd0PMJMkzqwbcLB8b2gw==
X-Google-Smtp-Source: 
 AGRyM1uoTLEK0fgW6DVflBM8CFqWe/p8gMCQUaqFVe1zWKWAZ8wTnQ+upr5RToaQ6OAg+krb6FmDLA==
X-Received: by 2002:a05:6a00:998:b0:52a:db4c:541b with SMTP id
 u24-20020a056a00099800b0052adb4c541bmr4219938pfg.35.1659111463716;
        Fri, 29 Jul 2022 09:17:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8ca5])
        by smtp.gmail.com with ESMTPSA id
 x5-20020a170902ec8500b001678dcb4c5asm3908749plg.100.2022.07.29.09.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 09:17:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mariadb: Inherit pkgconfig
Date: Fri, 29 Jul 2022 09:17:39 -0700
Message-Id: <20220729161740.3185360-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 16:17:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98047

Fixes
-- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index fa32e6844e..f377c784d5 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -30,7 +30,7 @@ S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit cmake gettext binconfig update-rc.d useradd systemd multilib_script
+inherit cmake gettext binconfig update-rc.d useradd systemd multilib_script pkgconfig
 
 MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mariadbd-safe \
                     ${PN}-setupdb:${bindir}/mariadb-install-db"
-- 
2.37.1


