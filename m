Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800A9C5AE4B
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 08:52:02 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7999.1700211115313237974
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 00:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DoS/elX8;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9dd6dc9c00cso242957466b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 00:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211114; x=1700815914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhPfPpkeib2RrdvjVWTf6VVOtob+pRwmJ8AaZSEjyjU=;
        b=DoS/elX8fPnQI8X2JeBBMYTWLvWHhvk5npsKtVDHVtCXs+ukekKF0FSlFmlVwwmw90
         xkrEx8MpleextmSkZYxxg+r1Xy0+lKc5UB1LEEK2k2ex3av1ap7QOLIIiGGR9pjNzgDC
         GY593gU/lpcxOOjuLBll9AoPJp239WLYsxvLjKGYD27C+XcZeSzGyWQ1fBwYfvw1p13F
         kWVju6AyPmfUKAiyVzQWRVUgD9ayaZUH9FOk/GQYUanW5HW4BIQ8ZAkRJlR0TmSt/GPB
         YOX6S1JjNaMv6qHKq2pL7V3TxfCz2Pz+YfRTDIIuMHksfw0pedcmGJ9VFK+C7BVyx2pt
         fXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211114; x=1700815914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhPfPpkeib2RrdvjVWTf6VVOtob+pRwmJ8AaZSEjyjU=;
        b=H+NZq+KmmU+DDYInNbugQD8YYvQn3nLSihbl7Yqqm/BWpcUfHgjddi2fPdWFeOuilr
         nljQq5XpmexuNit3rmC5b2+O7oujwSSDKWZZnAZA3QZflw7lDM/7sOPQvZ/xe4bkDmee
         ESLI/I2gXIuGIyGi6DtD4vd0591B6O83TGWmzMSSlOQojNf/0slw0uCh4ZmSx79vSsa3
         s0jS4YlKhEb6Ix0EARSAETA9l7pKFfKP86HCMtjHrFgarGt/kAZH3+EZX/RZCCXsWxu8
         Cf3hoFuQwwV/EyWD+nL2gjnAZoaUMJiWF3w1nU076dMO8JBMLlMj6c1QSfaVh6pM8yob
         0JOw==
X-Gm-Message-State: AOJu0YzlwR1bLS6ZyjiNRoomSlytr3aGobN4kiW5UNsQyTBdwNbEKv5n
	tK86+btCkHhvZkkhlYma3Eoa7et5qtg=
X-Google-Smtp-Source: AGHT+IFZHWlDHhQr0kvS4bKYjsPCnSR2cQsJbtHXrs6eltVqaVsyJe8dC4JJm+Aebk1HYHVzpTtM1g==
X-Received: by 2002:a17:906:3bc6:b0:9bf:9c58:e91e with SMTP id v6-20020a1709063bc600b009bf9c58e91emr3579336ejf.56.1700211113705;
        Fri, 17 Nov 2023 00:51:53 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fy11-20020a170906b7cb00b009adce1c97ccsm551420ejb.53.2023.11.17.00.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:51:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 5/8] ntpsec, net-snmp: drop ${PE}, ${PR} from /usr/src/debug paths
Date: Fri, 17 Nov 2023 09:51:40 +0100
Message-ID: <20231117085143.3813216-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117085143.3813216-1-martin.jansa@gmail.com>
References: <20231117085143.3813216-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 08:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106854

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb | 2 +-
 meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index f40fb8bbd6..6f1c114177 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -178,7 +178,7 @@ do_install_ptest() {
 }
 
 SYSROOT_PREPROCESS_FUNCS += "net_snmp_sysroot_preprocess"
-SNMP_DBGDIR = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+SNMP_DBGDIR = "${TARGET_DBGSRC_DIR}"
 
 net_snmp_sysroot_preprocess () {
     if [ -e ${D}${bindir}/net-snmp-config ]; then
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
index af41d4989d..9ad97e7689 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
@@ -70,7 +70,7 @@ EXTRA_OEWAF_BUILD ?= "-v"
 
 NTP_USER_HOME ?= "/var/lib/ntp"
 
-BISONFLAGS = "--file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+BISONFLAGS = "--file-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 
 do_configure:prepend() {
 	export BISONFLAGS="${BISONFLAGS}"
-- 
2.42.1


