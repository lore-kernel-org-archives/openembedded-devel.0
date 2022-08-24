Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D18EC32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:59:19 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.6390.1661306355934731650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kKN2j3A4;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 s36-20020a17090a69a700b001faad0a7a34so94374pjj.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=LnOm9jwe3tjURKaiMwVzSoqNjE7fztummBkemuqd9QQ=;
        b=kKN2j3A4uA8fkgXL/Bj1S0tRYVZx7zJ97dWYggMoOwZPY6ajEck9OUalOKDKvJ2zCj
         T79J3to05G2rIsg2MbEucpzdb8VA8FJJvjS+odUYxf1uQVJkRBnVcXPf0ErqXLjEnji6
         iKLI7PZ6ZsEwBXTlfR9Hex1nRDn1AEGO/cjqsKKrWU4E7gpjo9guuIiiXY9jzBhPzPM6
         t0uy3HCDrqP9Zu7g+MN4+bIwZwEN6g+kTx7dTU+lfxN+LKQee0rANtxkLF/zYjJJL/gi
         m5k10jBVEOadF3LxMv22ZZ2BN8N+K0HOQwSSjQFgpPQp6hEluC3uBBvWX4vAB0BXw/YH
         sZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=LnOm9jwe3tjURKaiMwVzSoqNjE7fztummBkemuqd9QQ=;
        b=CyhL2i6uvPUkP1VSzPXDj7V/XuMCaLrHS7UEAl0VdW4Of524kwMBjC9AV70Mgwr00g
         axUi7u/L4+WPJdxdV6sYS7G8eWMkaY1+bo7+0T+yGSVXyIlIbsiN6NXIe2d+9Y4CqNth
         JNbBLuFogyHoCe1OrRa6kEpU3SxA7brTTduGTlEL+yV45LE5rIK2LNnr3sP195ChuU6L
         cTrS8QrRfWuxu2GlB62U52NdHRznq4Zd5ZwhvJChdpnK42xZLThm108Q65c0Ln7GQPEH
         tzFjMsbPcuh/tb+TzTsNfJJRNhw3qZs8XttcbrCWRzLVZ8y1ig2aniE7xdQ1i96WahCf
         /lrw==
X-Gm-Message-State: ACgBeo16LfPgldeTlxSK7c8Wn/YBYjPs8BLPJrK2nIM8dHsobJsOvEmO
	swnRCYSwYDOgFaV3M5q0x1ZTokRCGQQTFQ==
X-Google-Smtp-Source: 
 AA6agR7VIRF4BSYpoY0AZfkxwoE/2AnskexZr2oJojSIUd+CXOVhYi6ircO8d991e74gUMRvYROA6w==
X-Received: by 2002:a17:902:6b84:b0:172:f7cc:175 with SMTP id
 p4-20020a1709026b8400b00172f7cc0175mr7868383plk.158.1661306355128;
        Tue, 23 Aug 2022 18:59:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q2-20020a170902eb8200b00172d0c7edf4sm7518838plg.106.2022.08.23.18.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 18:59:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] ncftp: Fix TMPDIR path embedding into
 ncftpget
Date: Tue, 23 Aug 2022 18:59:11 -0700
Message-Id: <20220824015911.1518107-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824015911.1518107-1-raj.khem@gmail.com>
References: <20220824015911.1518107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 01:59:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98411

Fixes
QA Issue: File /usr/bin/ncftpget in package ncftp contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
index 73af477eea..e66325c838 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
@@ -21,8 +21,7 @@ CFLAGS += "-DNO_SSLv2 -D_FILE_OFFSET_BITS=64 -Wall"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[ccdv] = "--enable-ccdv,--disable-ccdv,,"
 
-EXTRA_OECONF = "--disable-precomp --disable-universal"
-#TARGET_CC_ARCH:append = " ${SELECTED_OPTIMIZATION}"
+EXTRA_OECONF = "--disable-precomp --disable-universal ac_cv_path_TAR=tar"
 ACLOCALEXTRAPATH:append = " -I ${S}/autoconf_local"
 
 do_install () {
-- 
2.37.2


