Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1037C5478C
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 01:28:09 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.11345.1708738083420599194
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 17:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jnw2mEAL;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e4751b97eeso766768b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 17:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708738082; x=1709342882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjankqNQ9Af5Gk5F+cWKzgcmt1MaZWDrAT2O+YHYJBA=;
        b=jnw2mEALhpPxMAr3cIgl2bavqIp+85lHXDZlx7D24GL+K4YoWCxh/J9Vtu98wv3Xbn
         pb0abp0qblIcavyKftS/PZY73Q3zVvrhhDXmaCeHA4LwW4OGNd3KP7FoQuE7MIbn4RXV
         puDL6g8K9STEu6XQQS71g7AdkWfZvbai/M4zHSepPx4kRwJ2am1C5X4AY7Osed5cCHv4
         b4+p5F9T3WKAyfBad85uGNC+1EoR/YLa6rMgeU6Hwy+ws+/Z+J6nLWxs4ycmt2MfEQA4
         rb4LBGvT2hZGQIyaBv1NIyyvLO9TeUqmfcnMY7dpILyFs4hr4A8Jbt1uonai6x+sokez
         YBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708738082; x=1709342882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjankqNQ9Af5Gk5F+cWKzgcmt1MaZWDrAT2O+YHYJBA=;
        b=TGBxuAH3gnEEMWw87YjTYlbYFKfvOsdprgpPeOyekyhySFcS1J4UUvYXdGxudSbjuh
         bT7Xs71iRWe5M4/6R0jCFxM4Dsfg+4jMgPmG7KnryQ2isSxIuE3eRK5Jq1ClhHUqPYi7
         J6gLpPNchu79cnett5rL/37SvAIh4MZK5pgnoHHC9aizRba8NMa7wqthes/7agfPjKIQ
         Me/DiRlDWcq66cjmqbSK1Gqgg9umu3AbENP8Gk1LbiC7OSB0q1JLeLQ4+IiEoOqJ9ztV
         LQu/HIir7YXL4dAGZ0V+WLuGGgObhnEmg+VMbje2IoIFOYMpWS73nS+02glQ+eAv4oH3
         OtpA==
X-Gm-Message-State: AOJu0YzrDIPHdJtRpBNC4Mle13K4yxHNzu1S/KkpOJ87JEOnNZ91dvRy
	VKvu4Ka7EG98u2mZO0USUAEwqcj/Uq21xSPRVe0bmPSosZfsmgPNhNm+RYD7B9A=
X-Google-Smtp-Source: AGHT+IGb0I6J8Wr0O8op6MkyZlnmuYwxYBK8EOvi25IW5c5iBGr5PakLNRcVqkJxC54EOjrCaILhUw==
X-Received: by 2002:a05:6a20:b49d:b0:19e:a19f:f4de with SMTP id eq29-20020a056a20b49d00b0019ea19ff4demr1058964pzb.41.1708738082201;
        Fri, 23 Feb 2024 17:28:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1220])
        by smtp.gmail.com with ESMTPSA id su6-20020a17090b534600b0029a7951c4a3sm2135633pjb.41.2024.02.23.17.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 17:28:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] openhpi: Fix ptest run time failures
Date: Fri, 23 Feb 2024 17:27:59 -0800
Message-ID: <20240224012759.386475-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 01:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109021

It needs make and build tools in order to run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-networking.inc         | 2 +-
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 5d0100bd80..05c4e474ab 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -15,6 +15,7 @@ PTESTS_FAST_META_NETWORKING = "\
     libtdb \
     lldpd \
     mbedtls \
+    openhpi \
     tcpdump \
 "
 
@@ -30,7 +31,6 @@ PTESTS_PROBLEMS_META_NETWORKING = "\
     libtevent \
     lksctp-tools \
     nftables \
-    openhpi \
     openl2tp \
     python3-scapy \
     squid \
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index bacf984e74..32c4783cf7 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -59,6 +59,7 @@ FILES:${PN}-libs = "${libdir}/${BPN}/*.so /usr/lib/${BPN}/*.so"
 
 INSANE_SKIP:${PN}-libs = "dev-so"
 RDEPENDS:${PN} += "${PN}-libs"
+RDEPENDS:${PN}-ptest += "packagegroup-core-buildessential"
 
 PACKAGECONFIG ??= "libgcrypt non32bit snmp-bc"
 PACKAGECONFIG[sysfs] = "--enable-sysfs,--disable-sysfs,sysfsutils,"
-- 
2.44.0


