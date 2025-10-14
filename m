Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B683ACCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:56 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.378.1760475287109125535
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k8sZb54p;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso3509405a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475286; x=1761080086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXQHJwFS0a+HJ0ixs5bXpKf7+JIbexdsYkmNmliyaZE=;
        b=k8sZb54pzdzekD1ftPdy/7TFGRW2ArdLV5gCvunK2ehux3tPsxKR5Qa2vRmuI0R2V2
         h+0tBepFlhXTUkEIeoJW4LtnBZmWSn/vrP9YLnn9C8Xnk5I8zzpWUw6/EGGDb8L7gqDC
         q1149ojDHnc+UFTEQHf8QT/8Z7qqez6Y7+wlIGSmcLv2Ou7YDlHlVjyGNuN3lXM8pWTg
         kgESKQ6I/SGN4abRmLut32buxHigsZx5/FQcy8oEBaYH8Ly+S8tMplskQxOIF8fhJi1J
         jZHxQnobRmQGX5MpvJhjq0Cj3ZKSYNTa912kkMz3AtEpJfP0FuQkb+Oo2nz2FLu7p7NE
         lUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475286; x=1761080086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXQHJwFS0a+HJ0ixs5bXpKf7+JIbexdsYkmNmliyaZE=;
        b=QnvO+K0RC55AdnLjWnoCO+Z4fAFGaOjm1j5OVkb2uj7IDSfpJbKtNG8NWrm+aC+UHW
         l/yf0N0My5RwVPnadu84vS9zxIjnJL0tGkxS9DRqtRB6NrBRtqziTdXnT16AszLxGRrx
         OkhvdZy8CxlftQdbfdTTfHON/naOUpzdeIg9mcV70g7mPGzCHRATsbrf30f5VEiMu9N+
         eHFaERopIqJqDBhHimqcyOXYi9LrXukQ6X7FQ8C3bTnztn4yr0peYniiGpTWx+SL1Atz
         S10RYAmACTB4Psxx9tYdRGd0HSIhbYPE6bWdETyOinberByaLycndPp5XomFPTEwZPzh
         WBmA==
X-Gm-Message-State: AOJu0YwYYAJcwieaVFrhfwGSCkZyF/oJ7N0LAii/jeN7jw+OOIfDY49+
	RXu64DsTorsxdc2WstbiXk+xyC8n/iJwqn8WXIvgtFIA8E4wCIWUvBUWN94e8w==
X-Gm-Gg: ASbGncsJMLW7UTt4deoM0hYI1fGacEOqDKvIrSux2vI5679yJaOovtPd9cDya94XDib
	emENz3MXNQxUDcvgOWrMGuAA6wElox+vm2xGruhzy/vPdQ5PSnckopFk6IFTRj9zwiEMz4q7Gc1
	5XbBjheZ8hDW+aRe1spSX0l7KaB/WMxFBjk8Y4X9RxAQd/sYRIZ6dff5TPqcF0T1xoP6MnOz6OQ
	yxgTzMu7dPn8681C1wIynEIUTVcgKav84yGbDxCK/B0SAukfuHTWa/W4dHOXt3n8Vfl0hyLhpFm
	/dbDE/IeXCV+Iqt46oy8zPX5iOhlYUGqcCBdffhDN5c4wGFpY+nybLCpwi0PyqOqASQLShLT3Yu
	iO7tquKvBxJpsrRjEgx1K7knbY3YJ4MwNJ3o93Dyxv6Qdv+hY6kjb6am00Jrm173LhA==
X-Google-Smtp-Source: AGHT+IFUgm/i3MORLq4V9fxliPs3qK5f0qTyiFOMijrShQ9hK0nvyaoZRQFEkyZMbrEeVXJhvKg0VQ==
X-Received: by 2002:a17:903:3885:b0:246:cfc4:9a30 with SMTP id d9443c01a7336-290272c037dmr321169835ad.35.1760475286317;
        Tue, 14 Oct 2025 13:54:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:46 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 16/18] influxdb: Do not remove non-existing files
Date: Wed, 15 Oct 2025 09:53:59 +1300
Message-ID: <20251014205402.1487867-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120649

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cd6e2d8f53b45108ae9aa7b2a2988452dff4a2eb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 5301071516..9506d0e55d 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -38,19 +38,20 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system -d /var/lib/influxdb -m -s /bin/nologin influxdb"
 
 do_install:prepend() {
-    rm ${B}/src/${GO_IMPORT}/build.py
-    rm ${B}/src/${GO_IMPORT}/build.sh
-    rm ${B}/src/${GO_IMPORT}/Dockerfile*
+    test -e ${B}/src/${GO_IMPORT}/build.py && rm ${B}/src/${GO_IMPORT}/build.py 
+    test -e ${B}/src/${GO_IMPORT}/build.sh && rm ${B}/src/${GO_IMPORT}/build.sh
+    rm -rf ${B}/src/${GO_IMPORT}/Dockerfile*
+
     sed -i -e "s#usr/bin/sh#bin/sh#g" ${B}/src/${GO_IMPORT}/scripts/ci/run_perftest.sh
 }
 
 do_install:append() {
     install -d ${D}${sysconfdir}/influxdb
-    install -m 0644 ${WORKDIR}/influxdb.conf ${D}${sysconfdir}/influxdb
+    install -m 0644 ${UNPACKDIR}/influxdb.conf ${D}${sysconfdir}/influxdb
     chown -R root:influxdb ${D}${sysconfdir}/influxdb
 
     install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/influxdb ${D}${sysconfdir}/init.d/influxdb
+    install -m 0755 ${UNPACKDIR}/influxdb ${D}${sysconfdir}/init.d/influxdb
 
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ] ; then
         install -d ${D}${sysconfdir}/logrotate.d

