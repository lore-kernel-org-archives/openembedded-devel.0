Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEFDC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:25:23 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.3203.1657182319163279818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QW1Re7Np;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id j22so4849814ejs.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O2yPvQ8S/45Mt8qLmqIIJBrZXBpnbH9XkNJvEV5f+yE=;
        b=QW1Re7NpkV6g4RJ06FBuGkF+GN6WjXCSL6zUrH7icVZGLqaaKoDFGCc1KZptDbTWYn
         lEB6VtDnGvf3lyBOWl7qN197IaUTZLBwEAGLChEw2+LzUQqnBM0aiPwlFBLhQiCzrbF2
         N3Ik2PUL1Oy7EWadCX1v0hcl/XNmWZ/2IGgpQPWoSvWgM32qVfEzOZQ96l7bSi0jxwhK
         mOP2SvDI2RJOzmgsu3g1Q7JTgqcj/3N2XbMERqil+O0ULcuS32IujLYMZRzmtbr38cCx
         wv7q4n+fdlQcVE215P//8UPvKZB9+WHhTmPO+lbbO6AABs2HkNxOWfLWeEXvbgkY8MGt
         jrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O2yPvQ8S/45Mt8qLmqIIJBrZXBpnbH9XkNJvEV5f+yE=;
        b=H6vnXwTGhhsi5QLoxAEyTl/OT48FGufqB6Q6/VrUCqioXzzQgnMDFC7d70XmIy/Dxq
         S02WP0nq/3WMktn8v0c2OlT9K3zxZFxHgM9e7RIn7Znmg9CuyDkB0DrxxCT5ce9Sf/Qd
         1gO3TJWyKmIzLhxAL3y9UfY12JVN17YTQz0xnnhf1TbdJF1S9fj/jiDD0cOsk7XWhJ+h
         u9T7II+dFVpdz10UEtWnCBATjp4rtW5z8r8IXsbQf2W7e1E4LAqGT7pjuEFpyqhgll45
         Th9MqWduJn4BN1xkwbu6V4R0TeVWm+ON18AeNgA13MZ7Ut3+3PvgIr+t+c2w7UOp7M4g
         3hTQ==
X-Gm-Message-State: AJIora8smJ4OzmtfxP80PM0mi30uK4J+Q8fS9dvrX2Y19lUjxETJyo4H
	QGfNCYIUA1xyeluKWTCC+UBpEzse4VScL0ul
X-Google-Smtp-Source: 
 AGRyM1slGPGBfJGLFIfO7OndUUhSTQNUnBwCnGpgHf2+fFAYW8+Hy3e25K3eMXMwxaIwZEVWvg1thA==
X-Received: by 2002:a17:906:49d5:b0:717:7d2f:d6ed with SMTP id
 w21-20020a17090649d500b007177d2fd6edmr45121149ejv.750.1657182317165;
        Thu, 07 Jul 2022 01:25:17 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 4-20020a170906308400b006f3ef214e27sm10863311ejv.141.2022.07.07.01.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:25:16 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][master][PATCH] networkmanager: minor fix rdepends
 ppp
Date: Thu,  7 Jul 2022 10:25:02 +0200
Message-Id: <20220707082502.2499067-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 08:25:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97762

The dependency of networkmanager on ppp was intentionally removed by the
previous patch. networkmanager depends on the ppp plugin, which in turn
depends on ppp.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.38.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
index c8fea5dbb..8918c3cc5 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
@@ -86,7 +86,7 @@ PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
 PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
-PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp,ppp"
+PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
-- 
2.35.3


