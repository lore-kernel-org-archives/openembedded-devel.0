Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66238C7113B
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 07:48:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5893.1692863276238694388
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 00:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eRClkL44;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bdbf10333bso50944695ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 00:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692863275; x=1693468075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xRrpHqmpd0nfoIH/yvle5G/Pa434cvB6csnia9cz8yc=;
        b=eRClkL44W0NZ0NDdS0QXnhsgXaa3L94FuVYA5soXyf2xsaEXJJLUpn3562FwPGPiAW
         sElDiacsb9D7h0IvmKWUmZStW58/9EM8vU7Y+T1AUh9Ol4m1UmywotDVa10P6jc9ZfuI
         HuivQlFb8VAoCtjUTLqgYbpab7S+lo6f4L5hFPrmreKi9oKuifN3UDCimkPhfFwRyADg
         TvAY8kFFK0hwSC/2VdKDH7CmZ2AXQvODH88ipC31TKKmNiuXyYfMQnT957q1Z7jLdFD/
         AUq2GIU7AA4+idoHEUfhFyf5ghfUAVhVLcbVK7gRdHKGGp9Auv8ooc/4eHHXSH95sOnu
         3Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692863275; x=1693468075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRrpHqmpd0nfoIH/yvle5G/Pa434cvB6csnia9cz8yc=;
        b=DLL+DbE1NCtaaSuXYlPXux3PTXkq7csLG0mdBH8gpw6t/kf3Jon/2ZJLv/RdWqQxlu
         /8LozkBoQxp9hbZdbzsOIx47JzB3+ASnwCSQvNewsscC8xbIWV4ypgZH0LvqsbtLhCqB
         nOYwa7GfGumJdLHjvV6EPIx1SyRoPtpSRdjQdShF7C5LYHnhkltqxnJVd3XgT4WKHcVJ
         w23OUMHZPHwXsMTFUgnAsu68yuYVi+fUCM2C+hAjGW3hWRCuFn+/jQ0MbItKa7VpYwCo
         lkN9epkAUiiULFZ99O8pfQISle9nAgYsngTOUdzF08ocJqtZh26BaL0p2okj4fpJQgQg
         PNPA==
X-Gm-Message-State: AOJu0YwlKhYT2KKtKqmnk6UVv9wJ9RIOXTBnwKMM+vTxlhAhs4CobuoV
	j3Z8DvQEpLhxOenBqiGIN9YKvLotL3rc7A==
X-Google-Smtp-Source: AGHT+IGWXIN3WbDKABo04XiYyEjiXn30Adn8QKCU1yX77ksjaUb5brz+uV/j4BlDiByoLUZtDu6dyg==
X-Received: by 2002:a17:902:d4c3:b0:1b8:987f:3f34 with SMTP id o3-20020a170902d4c300b001b8987f3f34mr18932079plg.25.1692863275446;
        Thu, 24 Aug 2023 00:47:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id g9-20020a1709026b4900b001bf846dd2d0sm7598310plt.13.2023.08.24.00.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 00:47:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Nicolas Marguet <nicolas.marguet@windriver.com>
Subject: [meta-oe][PATCH] rsyslog: Enable openssl transport by default
Date: Thu, 24 Aug 2023 00:47:52 -0700
Message-ID: <20230824074752.70060-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 07:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104556

gnutls is not enabled in librelp and therefore tests fail becasue it
uses openssl but rsyslog uses gnutls,

FAIL: sndrcv_relp_tls_prio.sh

therefore default to using openssl
for both the packages. gnutls can be enabled for both via bbappends but
its not default anymore.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Nicolas Marguet <nicolas.marguet@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
index c639e81473..41ec191a6e 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
@@ -47,7 +47,7 @@ EXTRA_OECONF:remove:riscv32 = "ap_cv_atomic_builtins=yes"
 # first line is default yes in configure
 PACKAGECONFIG ??= " \
     rsyslogd rsyslogrt klog inet regexp uuid libgcrypt \
-    fmhttp imdiag gnutls imfile \
+    fmhttp imdiag openssl imfile \
     ${@bb.utils.filter('DISTRO_FEATURES', 'snmp systemd', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench relp ${VALGRIND}', '', d)} \
 "
@@ -70,6 +70,7 @@ PACKAGECONFIG[imdiag] = "--enable-imdiag,--disable-imdiag,,"
 PACKAGECONFIG[imfile] = "--enable-imfile,--disable-imfile,,"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
 PACKAGECONFIG[imjournal] = "--enable-imjournal,--disable-imjournal,"
 PACKAGECONFIG[mmjsonparse] = "--enable-mmjsonparse,--disable-mmjsonparse,"
-- 
2.42.0


