Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B841EFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:03 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18171.1777549622051227009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ox8bGMon;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-364c5317d67so535400a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549621; x=1778154421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oAOKjHLbnmcKTeBRJrt2Rf7IBOiArKsQlI1OlOzjCLY=;
        b=Ox8bGMon9LcYToGx5w5WxNU31dc1BbVSYlPgntPKneNS10jLS/MdrWK9swD/rMTaJ8
         oCWjxfuS7usqsTt7n6n9999OBaTiNQg94WN5EZUqMG3lYqIir5Fy1X+YW8e4RT3Hib2m
         HBrNV5CD4GQWfxUx7lFkxfZqyt99iTo5GSs+Q9OWcFsVXChnvETL+w88LFXjVaC/o/93
         BVlhNbyayahYE/NQIBURSpwPBANQ+68HmfNwL7cl/grXUlWtlVeNIpzC5P150t8OjFEa
         LZjOBomvfO+BfjfIJsyJKK0ukhuSUZDSbw3Xe393eDVskMEB4qeUMwQLuIBrDvXNwScW
         1Xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549621; x=1778154421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAOKjHLbnmcKTeBRJrt2Rf7IBOiArKsQlI1OlOzjCLY=;
        b=ZCI2VCaT9m3p52Wz5dhsLTfNvxBjDwHFAiZnG66Lsp2J1Y1q37rfo45u/dNsyeFrAA
         AFURIJ6xPCi7K9JaqVolXtgeVrYJXft+KueTqripYPavGahuVjb7jtod3CSfCpuLvO1t
         5ZdZzLBZb8JwopOplU5VfTEhSOUbRtCdePYm7qkhz3U56doGwGsYQ7+pHDQiKXcx1Qn0
         rV5481LSqXPTI40i8Fh9HPmTC82NgJ+RNkuAgp5MVuru8ZoQgtkZa0ZiBggIKCep3sSK
         YGDRKEYvqNqfMrQNXNZcYwVEx/KXKkYF2Ii6mS6bzDZLBpiACYGc5ORQSgYDQSCcqQsn
         pOqA==
X-Gm-Message-State: AOJu0Yz0p9/J+7x6rofD0gzh23xF6q4XU0quV7bU+M92AFsmwVPIX3xm
	4EhFjIjFWPNPcPWFPNVZvKnDIdLAipxXxqQifKW9pK+3kM63QfX8FEw6x3QZIsht
X-Gm-Gg: AeBDieu6ze+RWOtvDcJYSUhO71FSu/qDtjGS5Q1wcUZDogKTlE3YzB3DdlPx8nUrsaG
	jrnca98IqnW/KC9yQXeJpdUAIqzhsNbzpgXj1N8VdQ9hA73yH+moSdg65vtD1FYp1+GZj3iq/wC
	pYKWEWk7P3jwI81Vz4GPrKeTMjNKfIMdpQM5LAuckPm+yiLJJUmB7HFcg0PfK0YzOcrB3AUtCn5
	AAtp4VEJKjVvXvnwJeBAofch1jRwsSJzn2mubhf9GDneDtPvellZ5sLd7koS/NCDC1zUiaC/5ye
	1pm/qK/xjeExC11bJOgtB+M20Jt+jZDHuD/zc9gQGWb9MNgNGR/u+MdUdcgqzNuj9Wkt4kWy+t+
	L9DC0ov1EJDPWvCio8FCHAept0d9L+9QzxS64dnDX2kMHm7NuG7uHJZ+5Dc+j/qmaWiKvU6YIwI
	RAp6jJAsyyPRiQKStOufY5uIPwFJJQod8QFUM8J7EJehEmI/U=
X-Received: by 2002:a17:90b:2d8c:b0:35e:30bc:96e2 with SMTP id 98e67ed59e1d1-364c305ff6dmr2758765a91.10.1777549621101;
        Thu, 30 Apr 2026 04:47:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 1/24] libgpiod: update to v2.2.3
Date: Thu, 30 Apr 2026 23:46:24 +1200
Message-ID: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126735

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bug-fix release addressing a couple problems in gpio-manager and tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 172c473caf11c00ce4221f786050f0b9805d868c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libgpiod/{libgpiod_2.2.2.bb => libgpiod_2.2.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.2.bb => libgpiod_2.2.3.bb} (98%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
similarity index 98%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
index 09b0928dfa..a23d65bcaa 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
@@ -13,7 +13,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += "file://gpio-manager.init"
 
-SRC_URI[sha256sum] = "7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d"
+SRC_URI[sha256sum] = "70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \

