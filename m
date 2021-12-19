Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53111C433F5
	for <webhook@archiver.kernel.org>; Sun, 19 Dec 2021 08:48:05 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.15129.1639903684624279189
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Dec 2021 00:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F8yZFpi8;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id t5so25848911edd.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Dec 2021 00:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LcK7E90ZfJpUxbjW4Am8C86ClTOHGzfijJFk9o/faP4=;
        b=F8yZFpi8EuisMzHWc2F5c/Ul6r5WLp8EuLWqNY/BtLC3GgulHAX6RyeOEzR4T+m2J5
         4FeHO7EtZMEVfk3vyS1eyetO5XP2H9pmehcCJaPbY5GrJzWkpPhOz3nf/9KNHMWSIdIC
         De2HGXvx8dla7idYMZOrSDx34R81tEC4RqoM62X8Xxq6qaqSGjIeenWmFFQ3gRxOCVzY
         STk7myDRL0NlkNA6DX2C0ZboXu5QmjjcuvyfpblNaey6xL0dl6DAGE343OPaCTMnT1rp
         jIvSYnFThFu3/NROBygvlxoc1GMJsSdjhEClm5QX4tFtHCua1FxkgNXmfT++Kwheqi6g
         m/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LcK7E90ZfJpUxbjW4Am8C86ClTOHGzfijJFk9o/faP4=;
        b=CELUdX9YMq5mEWEGdtUW6vGlwXMaozopYsl/8NOdztSWGbCdggHiW264I5HdoP/tIL
         2Wq2MAcNet2m1TVJTYoz2iuGSyx1o6+KCSl4743lky8okpoDvqVhoE8zzLSVrH0acXNW
         IsgrGWRoxiyC5DsAmiQkEMk3xmEkzLC94GI5Xv7qT9cuf/ZpWDVW9jv+hC43GQx9TsCN
         kXBmGfLjY/S9BlUkl6sc8siGECcFfTD0pLffSFSAP10m/+1bV1EB2AWzmQ78W5b4bWyB
         lZgjk/MGf1475WuLLw4qZE24HQmd3z89Cn0rZH+QqiVxEqI/Dx2RCdM+f9PSpA1zd5XI
         +ZlA==
X-Gm-Message-State: AOAM532BScaHgK4wxMGUso4S7aRJJq7HQ0BSnfxgPmOLmFp88KcZy3ss
	vzjipeGqVCksorKT2H6dMC+8VwNow+4=
X-Google-Smtp-Source: 
 ABdhPJwyUe1qHwIcrGvOdhDwKyqs1yPROGRy5c/Sndk8YYqY227OeTiRZHNdZRHYTfJOZnRcwFAjSQ==
X-Received: by 2002:a17:906:b24a:: with SMTP id
 ce10mr8778996ejb.20.1639903682659;
        Sun, 19 Dec 2021 00:48:02 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be.
 [78.20.160.86])
        by smtp.googlemail.com with ESMTPSA id
 12sm4409951ejh.173.2021.12.19.00.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 00:48:02 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH v2 1/3] netdata: version bump from 1.32.0 to
 1.32.1
Date: Sun, 19 Dec 2021 09:47:52 +0100
Message-Id: <20211219084754.2215526-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Dec 2021 08:48:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94440

Changelog: https://github.com/netdata/netdata/releases/tag/1.32.1

test: raspberrypi4-64

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/{netdata_1.32.0.bb => netdata_1.32.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.32.0.bb => netdata_1.32.1.bb} (93%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
similarity index 93%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
index 5b7f43f33..7f99e9d4c 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.32.0.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.32.1.bb
@@ -5,8 +5,8 @@ DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troublesho
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-SRC_URI = "https://github.com/netdata/netdata/releases/download/v${PV}/netdata-v${PV}.tar.gz"
-SRC_URI[sha256sum] = "5e066d322f88013cea78eb9bb42bca64599278b9db8d46593777e4258743fefd"
+SRC_URI = "https://github.com/${PN}/${PN}/releases/download/${PV}/${PN}-v${PV}.tar.gz"
+SRC_URI[sha256sum] = "ac406513e86ad24976a66146702aeac960e43908abc51d70e4a073905275d13e"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
-- 
2.25.1


