Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85984CCF9EB
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 12:16:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.9200.1761480965721244158
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 05:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MKRuxmSi;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42420c7de22so1804774f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 05:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761480964; x=1762085764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2khDOiPxVIPGGnRW2BV8h2gWpyUCw0KtKVh4exYDqc=;
        b=MKRuxmSi8A5Skl1rP6GYztcJCYYBkAnFZD35VexV2SvJrTxl5BKx+qTxL4w3UqCt4m
         FKQjwFiQnjaZ+7y0AmZUy7xxP1HketXPydCdNk1b7Zj6Rk0aaNvhO5ShUuM589q0QwjW
         yjDzcdqlHANwVZtQwN2F8RS0D0K6+I0abSqY0GYLANqs9mo8mvKrAwpRTrxq+8J8VPwN
         TVVshzCn4iUfY99IiH2Zu+BwY54xTonAcQSWfrEfObpG6Icp5Jua//iq1KsJHS1y6iCZ
         DEeQaEEws+Wgk4iVUmAoZVEUNEYGSfqQcTtqHy6CjS0RdbzYpUa0mUeiJLymYk+EF50p
         l4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761480964; x=1762085764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2khDOiPxVIPGGnRW2BV8h2gWpyUCw0KtKVh4exYDqc=;
        b=uT/5QidjH42SMyFtQRS16uGaAcC8tx9dil3zFZBA97Bfj2ViRvZd6oxAhkTSuC/KXd
         jLcCh1hkBlO4BSOx9J2rRphW0aaBuGuYxARc2AaL8DA3ep7dyEIYItLcDukFC1QeIm6J
         BMEj7cJNDRdUvbTN5JilXk+TEs2w0J1czFoTzB9yhsNLUSFFeU1eQu3ufRg3h02Mxk6O
         EfdCwKyMVVz2NVrsu1vBj9HrSZ/6iebHaSMqzn/Vjg05kuSrhsR2UVoJOcZW0X0H/h0V
         exTjKFacSOvBeV49NBvs1Sz1fNe+aUXIP1rex1Qfe1lMrboWkkYBxIp+ZAe8Oj0dY5+F
         DssQ==
X-Gm-Message-State: AOJu0Yzmv4DdXfqBaX1y/VsDmnrfkxL1HAMaE/FCSG5BQv8bNNoMdPzN
	pnneLFs/RQ1791ff4QN9/zlDgaiNMskfAwVbQxlGXGqlsvySbY6hmzf4U4q0kQ==
X-Gm-Gg: ASbGncvfEmg44SH7yn00DBXPPspeNPpJFGdqSM0pbKsR7r52pHR6DqnM3ktJzMxOc4V
	/jtVeTNzvIOGBTcihXwC/PGRzBVrLaX6PBSOSlk4FE2eJa1auiXQuJAksAlDcYoHp+XnQkPY9IU
	NtWyeSYF17Y3fOArzQYDPgodC8LsUwqpzw52GGOjtJ9dLpdkXIbKN7ituIS2Qn9J1w2vwOz2vHh
	4ybXO5mjJUJT5DNr1Lf4NTCohvKhk2k4e1IENUcWokJSUoJam3sgYtq9IT8Q649m2L7aALL236c
	sK5IbmEDvM6IMj0ZSqU1cntqc327dtM5yAGcFtNjdY0HwTE594H4XsK0lq5aulom52vPtkk9glW
	MKxkP6/LFWBBnZKCABwhD6QvM+Bx57vuRrVm0jFRMuAqU4aLw1xaJYVlUeNidFMcqa6BJUbNikA
	==
X-Google-Smtp-Source: AGHT+IFyYB2vFV2T3P2y89g25YaQDz6n9ujLXu98zrek0U0wMY7htxHgvIx2f4z4UBJ1sJdVEDIhkQ==
X-Received: by 2002:a05:6000:310a:b0:426:ec63:18fc with SMTP id ffacd0b85a97d-42704d5f9e1mr23047362f8f.20.1761480963779;
        Sun, 26 Oct 2025 05:16:03 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm8422801f8f.35.2025.10.26.05.16.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 05:16:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] net-snmp: fix ptests
Date: Sun, 26 Oct 2025 13:16:01 +0100
Message-ID: <20251026121602.2772473-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 12:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121011

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-networking.inc     | 2 +-
 .../recipes-protocols/net-snmp/net-snmp_5.9.4.bb            | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 7f7519ff84..1cdb6d1811 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -34,12 +34,12 @@ PTESTS_FAST_META_NETWORKING:remove:libc-musl = "\
 # firewalld currently hangs forever so disable it for now
 #    firewalld
 PTESTS_SLOW_META_NETWORKING = "\
+    net-snmp \
     openvpn \
 "
 
 PTESTS_PROBLEMS_META_NETWORKING = "\
     lksctp-tools \
-    net-snmp \
     nftables \
     python3-scapy \
 "
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index f37bda921a..44a3cfc745 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -282,8 +282,12 @@ RDEPENDS:${PN}-libs += "${PN}-lib-netsnmp \
                         ${PN}-lib-mibs \
 "
 RDEPENDS:${PN}-libs:append:class-target = " libpci"
-RDEPENDS:${PN}-ptest += "perl \
+RDEPENDS:${PN}-ptest += "${PN}-server-snmpd \
+                         ${PN}-server-snmptrapd \
+                         net-tools \
+                         perl \
                          perl-module-test \
+                         perl-module-socket \
                          perl-module-file-basename \
                          perl-module-getopt-long \
                          perl-module-file-temp \

