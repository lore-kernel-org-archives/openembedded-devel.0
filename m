Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D919C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 16:17:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.642.1659111466272437969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 09:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FZLNlhNA;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id x10so4328792plb.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KifiPRR3WhMqqfNJyADf4MsRrupWcBpjPHs+W6TBkN0=;
        b=FZLNlhNAwBrDyhFnhAH21wjTcjMVTwPJe39nyWqV3YvExkhakX06bp9mjs7o7dbP5l
         TaeipspdhsBAEdkkQhLpaJpjFlbQXYADlaxlYVCttsfEA8lFSpSCqKS28FlZbKv91Eor
         tH7m8JxVRKgBRF7jfb/ZzDLjHZAV3dJRpfsT9dOfsH8/ZJp/FrlR0drT6kweuWvQvzhv
         L7zZMPP0PudYRcsMfSXU5fAZPL6kc+CIHuTC3qq65CxP0qm7KXdaUZknE4UAlzp1qMvf
         sNWcgKNu/leenvaStftA0/9TUpCqS9VszY6g09O74RByOFo/7hAuM9KgsJXZWRTKAN/W
         9jTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KifiPRR3WhMqqfNJyADf4MsRrupWcBpjPHs+W6TBkN0=;
        b=4aZzwuST3Gly9/ttclH4xOosN0VLPJHsHiRRLE1l7K+zdi//vamYZDKJUXm/taL0/1
         Sk3AmmqBQcWRblweIuj/OrmH8BmTTWkDeH0BO8wAqRsgJNW5F1zemgPLKTEgZyp8epEf
         6t92+G28eKtyn7KkBiohwUnGBvI8yY44x0VRr9O6mZj2A7KOXvQgiaXC4Nzszmsft9c5
         3YtbXX9aKUbUBe2vSvtFQVwz2tlHwJyjp0MaK5h3ezugVnF4ISYgE/LkIrhON6VfFbh3
         IcqBmAQQbG3kZropxfZBkXCF29Hu10d2qrMj6W5ItICHsUBxB/qgabpHnBfOfYbicddF
         fmQQ==
X-Gm-Message-State: ACgBeo1rb4axDl4pCC6Te28ECnC8xUxDRmWAj72HDsq0vRIAhEJm6NtN
	xPYuViylEwd5PPyWDb9kUgRbKFq86S42nQ==
X-Google-Smtp-Source: 
 AA6agR7b/NqHaKWmQTLGpV4b0O4YZEQf5lBZ8OPWRYTvK1/N5h1tCyuwUXq4FVIndeoLcPTErhp9Ew==
X-Received: by 2002:a17:90a:b00b:b0:1f1:6023:dacd with SMTP id
 x11-20020a17090ab00b00b001f16023dacdmr5530245pjq.184.1659111465212;
        Fri, 29 Jul 2022 09:17:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8ca5])
        by smtp.gmail.com with ESMTPSA id
 x5-20020a170902ec8500b001678dcb4c5asm3908749plg.100.2022.07.29.09.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 09:17:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mariadb: Add packageconfig for lz4 and enable it
Date: Fri, 29 Jul 2022 09:17:40 -0700
Message-Id: <20220729161740.3185360-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729161740.3185360-1-raj.khem@gmail.com>
References: <20220729161740.3185360-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 16:17:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98048

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f377c784d5..c63d5114f6 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -60,11 +60,12 @@ FILES:${PN}-setupdb = "${sysconfdir}/init.d/install_db \
                        ${bindir}/mysql-systemd-start \
                        "
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} lz4 openssl"
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
 PACKAGECONFIG[krb5] = ", ,krb5"
+PACKAGECONFIG[lz4] = ", ,lz4"
 PACKAGECONFIG[openssl] = "-DWITH_SSL='system',-DWITH_SSL='bundled',openssl"
 
 # MariaDB doesn't link properly with gold
-- 
2.37.1


