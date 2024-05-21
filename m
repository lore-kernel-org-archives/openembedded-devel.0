Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5732CC25B78
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.3049.1716315034240279483
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=deMl2Wwi;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f2f566a7c7so76364405ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315033; x=1716919833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k76fqCJFiRpRZb3G68sq4uFV46wTEHHGVijUbYtO32s=;
        b=deMl2Wwiz8hXzKJRjkDWEf4UUE06Wn6X8BlsRO1lhookeLBOygVuzwq502Pvz2q886
         qfZovKKOH0UzDi9ILTKdofgaLHBi6aLW27/gIYu5pMKFmheIeLGQYlM61GYh0FBq2taO
         VS18WJueFj7fWKxzrssQJOyxfZ+Msu/li9P0lKl5sKagbL6Lb8Xib3wM7Nw3F3RyJc/4
         njYPGOhe1bNuahBdFiDMupq5C4O2lJL8DhdOoJuJ3dd0dAzyKA53IUYk61zXzm2s8CAu
         p6V15DOdynu8F65YQ4NIdAOgRwog0EUKvqJmBGhiwc2EeHxE7r2sC6pd7azf3SNjZpXY
         SqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315033; x=1716919833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k76fqCJFiRpRZb3G68sq4uFV46wTEHHGVijUbYtO32s=;
        b=dPEyvphhi4myejYjL3yiR9kObKm8WBhF1DUqBijXUj6ujTVUhbMvl06XXT3DZB2PIj
         b80sXqn7cmNyyOzhYvNvxCSmwpZOrH8xnUhEBIuig3OPOLGhwP07DuI211AinclcjLgi
         ax6i8NoxbVTsgkJkf/o3hNCZu18mFEIoKGk1GCdI22RWT3miOred0Ki+7XwyY57TSTvM
         07bM5yfnuWKtuXb9KVmLBjGNpRMbRBwDQ3EWMcHxpwn3pHHDUkHBSRz/3iKohQoO2Vdb
         fhDfOPw34u6QiXqs3DO+IoKTrHE6rJbl09H9W3MO4o4A8Xb+zTxByLz7T6cfE03qANxz
         dZXw==
X-Gm-Message-State: AOJu0Yz2z/zvGIFGjpiM3yAUhSDDVIcMr/vM9vUcWIkjc7n2N1zqAPrf
	Lh7lCdEE1mba41qOKuK2N0B8HJsv90RNQEp5Mpipj00HBMktMIXksUMXpZAEOHA=
X-Google-Smtp-Source: AGHT+IFuG2a7ITeUURRqo8F00hELGZDFF/6WOh9IWVPusJ4HRB9B5fOlLB5rqTq6S1zQZ50zGUNNxw==
X-Received: by 2002:a17:902:cecd:b0:1f3:4c1:83ec with SMTP id d9443c01a7336-1f304c18438mr68466625ad.26.1716315033173;
        Tue, 21 May 2024 11:10:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 07/22] influxdb: Do not remove non-existing files
Date: Tue, 21 May 2024 11:10:08 -0700
Message-ID: <20240521181024.426176-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110456

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
-- 
2.45.1


