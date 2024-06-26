Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83ACEC3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:11:21 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.27698.1719411076135144949
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=QlMqY9gA;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.172, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fa0f143b85so33151585ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719411075; x=1720015875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cos/2F7LREYIg+7vDfCVe37ut+BB6V/7hRi3XdEsP7w=;
        b=QlMqY9gAWJTy2TME4/r514Dg1ncZ69mYumwQO3O1r9Jcsp1cvfgjfvfEYgMch1fIMB
         oQuaw9RRB1mVs1snD86IRQNQhG4lxsNyJgoyTAqVOvmpgevmULZiYNKj4TVHkySIPkVN
         KY5E2wQbfrF4hpKiWtRx985HGDuK3brJyMuRPZCpAjNUpwWa9CF19WGJTftStt7GYFrH
         YoA8kUTIPZYf+ZwwScjvroemQcyXoA4TVaq+k4Bn95QwVvL6IQL4oKlOcI/DIdLHjiJF
         9EAxbVR1aDOwjgKLkbC6s9OP49Ej52kBXL2iWcq04KtLSPaUyAtw3pzXib1ZGSQ74opl
         fy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411075; x=1720015875;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cos/2F7LREYIg+7vDfCVe37ut+BB6V/7hRi3XdEsP7w=;
        b=Y1587oxVpTGWivDUjjP9GmRSomN5FEGOw4Nncs4uXfXDPrtANoviWLQDc87PWF9KQF
         TukyfzgXrIF6A9IRlANY6UnfyT6lPnKBmsMnISq4RlEw3oplg1ZU52koN+11LG0vuMsF
         tcgb+3WjpE5bNnd/EykDCEmb+VVH6/3KQHNUFDhHpWoamjt2Y3QF/RcR8Ry8ruGjHwMx
         rKvNpO/V+xipkbj7JiorhM+7KXmkUQ7nUxlNOQw3HU1mGmcWb6XXcrR3Dmue2u7YBQm3
         Xr0fk7A4OQ5fgJwTEWx/VngL3hA4qzByi/w/SL1mes1y+W7b6CKooICtG5TKQn+8ZcLZ
         6lXA==
X-Gm-Message-State: AOJu0YzhGKDQfSciMfXu2ylIYfSnPPU7XSCuz8MTETc5EfODRCDzbAwA
	5Kbqg7MoYbRtg6i3fvBjqjuq+3KE8rEDsU5/i3+5nOHvF9pUv2Kw/cLaxDALxZniZBm5lpQf0DH
	G
X-Google-Smtp-Source: AGHT+IGz6lhejUeDc/WfuD/nJlRYPYvbgZXthP17SekuR2PtOE86Pfl3vt4bbpf8L/mbCeFkxUiWYw==
X-Received: by 2002:a17:902:e5c1:b0:1f6:a606:539e with SMTP id d9443c01a7336-1fa23f3600amr115510115ad.61.1719411064180;
        Wed, 26 Jun 2024 07:11:04 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3d5089sm99574245ad.193.2024.06.26.07.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:11:03 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] influxdb: Update CVE status for CVE-2019-10329
Date: Wed, 26 Jun 2024 07:10:59 -0700
Message-ID: <20240626141059.45833-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626141059.45833-1-ninette@thehoodiefirm.com>
References: <20240626141059.45833-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111096

The version don't match and only the Jenkins plugin is affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 9506d0e55..cc8161cc3 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -38,7 +38,7 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system -d /var/lib/influxdb -m -s /bin/nologin influxdb"

 do_install:prepend() {
-    test -e ${B}/src/${GO_IMPORT}/build.py && rm ${B}/src/${GO_IMPORT}/build.py
+    test -e ${B}/src/${GO_IMPORT}/build.py && rm ${B}/src/${GO_IMPORT}/build.py
     test -e ${B}/src/${GO_IMPORT}/build.sh && rm ${B}/src/${GO_IMPORT}/build.sh
     rm -rf ${B}/src/${GO_IMPORT}/Dockerfile*

@@ -75,3 +75,5 @@ INITSCRIPT_NAME = "influxdb"
 INITSCRIPT_PARAMS = "defaults"

 SYSTEMD_SERVICE:${PN} = "influxdb.service"
+
+CVE_STATUS[CVE-2019-10329] = "cpe-incorrect: Version does not match and only the Jenkins plugin is affected."
--
2.44.0


