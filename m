Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22454C001B0
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:22:08 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.5845.1689456123069446546
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=soPemB2U;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b852785a65so19698285ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 14:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689456122; x=1692048122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1c7SO4uX5K6NCUu5rKrECupX/P5JhSEjjH2aiqXkpEs=;
        b=soPemB2UJH3vTGUffFGIH/LKd6fHnQZWVLc6fhEcBwEkB3N06Z65zazDnCUK8lLM4t
         nho19+EqW4eJcU1/ESTG43rpImpCWek8EJ13XEhWDsZ49zsG72+us2JiavNLUqisUzf5
         zMji3jnyLkNpw5x/w8DZ89lIx926GsRWU7iVL8S8ZH1YCHWvp1XC6wIciUCNRZ0Bzc4F
         F0okRgacTC9wcbs6qBZm0dD0COpz5RfaA0LG44FmzrDcMM6Ab2ySSUmfitHWy2gE4Xz6
         /OmftI+yDZroSYA1a06OVCb6YI+7GuCgbBJ1ErBNZOZshrhRZvczFNVTqBO8+LW06cc9
         uA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689456122; x=1692048122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1c7SO4uX5K6NCUu5rKrECupX/P5JhSEjjH2aiqXkpEs=;
        b=CpDHqBc1CDZNfMQxcn7Yb9ZBmDyWisG2RSOIAqqeZb/mGQilnJBZGGwdMQaPAlsL8n
         PB/c24AqqgM8ObXN0MJ3JVZeJuUgtXVqsM50CguTA/TEAX+bwJbA7TlVydy6hvqqCTda
         wediv/YR66JJ8enW2YUdpTI+Ncwl5mbLk+GwhVR85roFRrMMtC+bqpIsJuwWkkKI8ivt
         xHy3nGJ1gcfEctDCK6+ePTfBCHMYsQ53fQSjCiDrh14PApk+T2L9souYXXJRU5gkfTTD
         Q7uQIR340l9CODRMExCvn05/sfUhkgmMt8jep2UOwWNHBEM7drh/zOlsbB0EJkyuQhtI
         Ir0w==
X-Gm-Message-State: ABy/qLanskBUtvnwAdDiVQePTu9zgZnYCJzKSlNml/l1rZADeXAmUgbz
	ajjjVetoxAPh8nKWtd+FJcvZbOmSB50=
X-Google-Smtp-Source: APBJJlFIr1AFvxVgfs7hOSuJWh3LGtUenhp4KsFcsPnSutmsB6/A7AA8UjcX93nLP/p2UUXSpcOArQ==
X-Received: by 2002:a17:902:ab1a:b0:1b7:f99f:63ca with SMTP id ik26-20020a170902ab1a00b001b7f99f63camr6774658plb.34.1689456122231;
        Sat, 15 Jul 2023 14:22:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::b373])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b001b8ad8382a4sm10051785plb.216.2023.07.15.14.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 14:22:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] dhcp-relay: Pass cross configure flags to bind build
Date: Sat, 15 Jul 2023 14:21:59 -0700
Message-ID: <20230715212159.3265080-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 21:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103875

This ensures that host tools like 'gen' are built for build host and not
target. internal bind build supplies its own options to configuring it,
where it does not pass --host option and as a result it does not deduce
it to be a cross compile and hence these variables are not set property
inside bind build

Fixes
| ./gen: /usr/lib/libc.so.6: version `GLIBC_2.38' not found (required by ./gen)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index d36646c0d7..e5f7e0334f 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -34,7 +34,14 @@ SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 CFLAGS += "-D_GNU_SOURCE -fcommon"
 LDFLAGS:append = " -pthread"
 
-EXTRA_OECONF = "--enable-paranoia \
+BIND_EXTRA_CONFIG = "\
+        --build=${BUILD_SYS} \
+        --host=${HOST_SYS} \
+        --target=${TARGET_SYS} \
+"
+
+EXTRA_OECONF = "--with-bind-extra-config="${BIND_EXTRA_CONFIG}" \
+                --enable-paranoia \
                 --disable-static \
                 --enable-libtool \
                 --with-randomdev=/dev/random \
-- 
2.41.0


