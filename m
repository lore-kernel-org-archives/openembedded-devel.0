Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214FBC433FE
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 02:50:29 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.22576.1640573427730565022
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 18:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZGvrMPiU;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id co15so12369261pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 18:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpSH8HADgA5vmOqUtVmQy3J/ZWw6SJVuljYZ+/V2INU=;
        b=ZGvrMPiUr4xyr0IJmcbCgoJtdEHknMBMES70Lz3pcDy163zpl2NFK/QVUWg0MVTVqm
         CQviDKJ7AkhmkpqWDMI4KzZu+ImrEoVPvn9Z7gGUOLjz0LlRXV2PTYKM8+qQo2Vvxtn0
         OEfyJTRUG2u3Q64g3kCxsyDCEqE6+yn5mUobPFIVsl6JqHFBasbwJuJ5+cKuDnYpX8kA
         IVxdSN6phlbhp+Bfp9wI8Ua40V82CV3MrYPvQ8YiwZnN9xFklQOxZzw7x2teZgTdUZpg
         MF9nML1P88WRAbxhgfkzU+KvFuaiNtm2iTqznWmxoyWL74bsHOT/OPBy71lUySFyi8RT
         7/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JpSH8HADgA5vmOqUtVmQy3J/ZWw6SJVuljYZ+/V2INU=;
        b=jsn7QgZDjT+upUORIlnWvIOmgFeDjbnZc7N7o2vZgR1h+5PYp+Xd8oUYtiD4xat59d
         z1lbGwlWJkXxwO4duj8KOsURMa3tCSxloA7qEhfq0528TKKx+i32olj8gfgo/S0mzX/G
         PBO2tn52wEloyc2CVsmNDfDNkeWLP82ssR2iiGOlbxX38UEysvzegbXqCP768xbEHnl0
         OTIOVa+OYiI7S3anU9IpJIXEnhDHwWX3nta5U/h46LS3/BaP7qExUwtgTBYBFXBbiAG/
         NgMeSr6sfDSpvo64PPK5W1g40GNS3Nxs0UnoTHEiRDfCOqT+0sgCJod0yLjwvBhRlm4g
         eOKw==
X-Gm-Message-State: AOAM531QkTBAnnZYrIeh+c6YmOOyPdl6FMQFBWgCl/6+IWrE07B1zNLx
	c89am2cxr8e5jaYjKvlVHjCfEVxdNZQ=
X-Google-Smtp-Source: 
 ABdhPJzL3hppJ4yRQnIB/NMau4ph/chd+eU1e8k+/XlgzPF44DEwknonp/pGVbSwIf78FT/D4pq2Mw==
X-Received: by 2002:a17:90b:4b07:: with SMTP id
 lx7mr18985035pjb.122.1640573426833;
        Sun, 26 Dec 2021 18:50:26 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:9a12:d2b4:2175:e337])
        by smtp.gmail.com with ESMTPSA id
 e29sm12744268pge.17.2021.12.26.18.50.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 18:50:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/4] strongswan: provide PACKAGECONFIG for
 cureve25519
Date: Sun, 26 Dec 2021 18:50:22 -0800
Message-Id: <20211227025025.1211176-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 02:50:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94500

Not everyone wants this to be installed by default. Enable to remove
cureve25519 is someone wants to.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/strongswan/strongswan_5.9.4.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index 45500df01..a031c54f5 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl \
+PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl cureve25519\
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
@@ -41,6 +41,7 @@ PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-sou
 PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
 PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
 PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
+PACKAGECONFIG[cureve25519] = "--enable-curve25519,--disable-curve25519,, ${PN}-plugin-curve25519"
 
 # requires swanctl
 PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
@@ -130,7 +131,6 @@ RDEPENDS:${PN} += "\
     ${PN}-plugin-x509 \
     ${PN}-plugin-xauth-generic \
     ${PN}-plugin-xcbc \
-    ${PN}-plugin-curve25519 \
     "
 
 RPROVIDES:${PN} += "${PN}-systemd"
-- 
2.25.1


