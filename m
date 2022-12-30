Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3BAC4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 22:05:46 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.29621.1672437936887412515
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 14:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P+p55kAz;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d15so23121578pls.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 14:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iyJDXmlTHUL5odaaQzNTYT8JOOncAfNbLJPsg+A7WuA=;
        b=P+p55kAzBze8n4ytNGp5ilVzVG/XXdNWF8Gu3YZCbaSSTJBHu+ypePZk65ff5DF086
         JAA+PxuFxII9/MO0RvBtJjCkdyKEB0LuQshuFMR+hfrYVKHagvaP/opt+ymll4ktiPKI
         LYZt3XCAHJbyIjIjCbUoGv2QzVyt021LQstVE0M1pAM/1rcJek8/U1RBqAaOdYimYNQe
         Uc04a9DYV6pavBWq4b8xocPQnmcSCc/lLObgWcQYGZ1I990Cv3WDA9jLzcmSroTji0GJ
         KV9N+OPS1R4gxXsIsZn1HBSa5TyDclkgy6sIDZ6HvEGIKF9udjDLl78UCIomUQznnyna
         /WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyJDXmlTHUL5odaaQzNTYT8JOOncAfNbLJPsg+A7WuA=;
        b=1rBvbHYVBgptaw5UGjqF9By+rrysn8GEwvw9cCfHUjP8eHeFcPortyVSy/DCSo+YLn
         cDSn5MWaGF9zs8WkAI66iADKWtz0JIxLcavZypoEUXMvTEhAVnx52aV+b85k6Ur6HUPU
         FUj0wxaVRPpzsL31fHy4KzT9tg8DNaFOUmmao584udfyDlH1EBl+DUhN6k7cy5HR8W+C
         6tsQ7WEBmpVeR8nxRi/ovMskhYyzzJisWmWaLFSA6LdxOjQMEa41QhYhRp1fcZFooxgw
         hYLW6gts4pA/KJ8W3hOj2Yk2887sXPjzsjr2+JxTB99M2lO3lgjveJInud2kRcc/kQsd
         S5sg==
X-Gm-Message-State: AFqh2kqeDXESmkMybOAUA2ZfiQTnozJ8CugSWtwK31NB4pSEmPr/yBDM
	qkQGUFHxzkClkijg5wwI9zBQrdQneUE=
X-Google-Smtp-Source: AMrXdXvRCX4ZETkOZPwzjldfLcn3tnRZq8aH+w/jvEf2XPaMBYNiRqpq8EV4CEUQaDP8Sy3wiTuMzQ==
X-Received: by 2002:a17:902:6b02:b0:191:1c99:57ef with SMTP id o2-20020a1709026b0200b001911c9957efmr38725010plk.67.1672437935982;
        Fri, 30 Dec 2022 14:05:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709026e0900b00186f0f59c85sm10779155plk.235.2022.12.30.14.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 14:05:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] vsftpd_3.0.5.bb: Define _LARGEFILE64_SOURCE on musl
Date: Fri, 30 Dec 2022 14:05:32 -0800
Message-Id: <20221230220533.2614883-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 22:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100316

Needed for F_SETLKW64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
index cce3e66adc..0ae52c8ddc 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.5.bb
@@ -45,7 +45,7 @@ inherit update-rc.d useradd systemd
 
 CONFFILES:${PN} = "${sysconfdir}/vsftpd.conf"
 LDFLAGS:append =" -lcrypt -lcap"
-CFLAGS:append:libc-musl = " -D_GNU_SOURCE -include fcntl.h"
+CFLAGS:append:libc-musl = " -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -include fcntl.h"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 do_configure() {
-- 
2.39.0


