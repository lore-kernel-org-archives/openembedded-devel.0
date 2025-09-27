Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E08CAC5B8
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 14:19:19 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.13171.1758982748894585757
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 07:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AwC4K5I2;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so5760372a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758982747; x=1759587547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9IPUuRxuOMr+Qze3mEy+fVMY3tCW1eaW363NN4UTCV0=;
        b=AwC4K5I23OsH6J1b4Tp/S4JyhCf9j5+t9GrbJPLrOqAtLoi49AMIvmnfVtO63V3/Ao
         5IaoW+nZUtNbILXnQEXhdxlwldcM/1kV5HOLQv2Kq1d34mLi/Cja+KOuQiJPqbMg/Zbn
         D2HHNPoagrTTb5vXB5a6wd63StgY8IAkfZeEPI4vx+T/SAzC1qqHf7vnKIbe0fPSgNB3
         iU8Eo92zkfssRyArsGp2WUQL3NZAyxykF4lhLryuv11F5b0HHcVJQvl6XibNDeGkPqcG
         6DugpN6mxxzDVa+qJ0N6xYmiwTlPomRycl20zE0ZW5PrUp12jzchz5sk7vXb2bnW8ddm
         lW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758982747; x=1759587547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IPUuRxuOMr+Qze3mEy+fVMY3tCW1eaW363NN4UTCV0=;
        b=YnO8X7B2UMClGSp3iOfDvncmz9fi1XjNwhNJ8nJqi7De7rdOu3+4jKla8QIPFt1OGv
         nyRZ5RTXMnsB7x065gNkB+VOcJH9oXELmN8J2avNtw38O3IsXh0LKYYpwkTcjxNSHvnf
         k6cUhdhJrqYmPEoVDyUy/PFhuVNSgEKVwcgCs19exEzNzR57p/4xACK7ClMcqd4hK0TF
         hFnDNgprc3LlqP1kliTnGkLRfdSwW4LJwE1CB9oM4fwQbMXuYNu+x0XsWnLvOFPcMNRP
         h1UrySYE566FlJFZpLNh2wrSkKJxBm1nuTn/Wm/5mwIif84Q90mS0QQfyFi9UaWkQKAC
         psDg==
X-Gm-Message-State: AOJu0YzlrAgcYmr9tIRGX04/dRBPb4/gG2/NKTl3knnA78nscTXSy4oL
	pETrZGYZT050DzLgCtSiG7IzcU48RTUazt+JufUC+vESYnegD0McxGakGD1uLw==
X-Gm-Gg: ASbGncsp+xE18ZtPPGVDWfkLJyb6eKkh+W7S2Y+aXe1wPpnxFAmDgeku902qwL9YdKu
	dP1ZWfWzffLbz3bxmfzCjvermyAh1OyyWoeV21rh3xwmJbXiiXYJjPQkTy17xSPAPHv2AJmQcGA
	wJFbMiR9nnBvuM/lERN8IUq9StRBW4YSjV3ovBUpDdDxSNGgpHj3MKxN0VQ4rOn0nr+5JBaDRCa
	Qu1eP2R57byqMcH1PzIF1bRSePLpT2Au1Plz+UjjWDhpb/9GmXr8R1HeSxAO+D+J70gA+KHqh/R
	+zKyXXt2iBotQPxQGov5IqMiXI64/O6T2mwibbH6ydPrfeELlekMAFalmm41QyFJUIrjGJoywwI
	+5V+05l043H+yJqIXYckP
X-Google-Smtp-Source: AGHT+IEUS/1BFNheCV30QKTCLJW0GoXaDaV8zSoImIzUcBUo45FE+mvbvyfhBLGKHXPMsIQhTvwc2w==
X-Received: by 2002:a05:6402:395:b0:62f:4192:ff9f with SMTP id 4fb4d7f45d1cf-6349fa80038mr7252962a12.21.1758982746693;
        Sat, 27 Sep 2025 07:19:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae2cb3sm4510383a12.27.2025.09.27.07.19.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 07:19:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] collectd: set working SRC_URI
Date: Sat, 27 Sep 2025 16:19:04 +0200
Message-ID: <20250927141904.2699881-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 14:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119988

The project started to outsource the source hosting to Google storage
and Github.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index 36aad73b19..f310caf0f1 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1bd21f19f7f0c61a7be8ecacb0e28854"
 
 DEPENDS = "curl libpcap libxml2 yajl libgcrypt libtool lvm2"
 
-SRC_URI = "https://collectd.org/files/collectd-${PV}.tar.bz2 \
+SRC_URI = "${GITHUB_BASE_URI}download/${BP}/${BP}.tar.bz2 \
            file://collectd.init \
            file://collectd.service \
            file://no-gcrypt-badpath.patch \
@@ -18,7 +18,7 @@ SRC_URI = "https://collectd.org/files/collectd-${PV}.tar.bz2 \
            "
 SRC_URI[sha256sum] = "5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6"
 
-inherit autotools python3native update-rc.d pkgconfig systemd
+inherit autotools python3native update-rc.d pkgconfig systemd github-releases
 
 SYSTEMD_SERVICE:${PN} = "collectd.service"
 

