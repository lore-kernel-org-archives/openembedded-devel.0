Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377B7C83003
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:23 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.11437.1685531596290989976
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PfQq8Qf5;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55db055b412so12535167b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531595; x=1688123595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x34Su8pf+y+yNZx+Qg9rENg+7lUGq9lcJD0hRpvGbIo=;
        b=PfQq8Qf528WnyDgLBLAj+vASKLhoRy9JqRmROHahCp2cPQCaZ9wFVsdRDjr2q4H1JR
         i648IqQP5lchjqRbaHFUP//B+bm5kYZbC5GbD40VBo58Su6DGn1ENPIUr5j5fNBYgS/B
         x88ZLhLa2ePs3eXxf+GMIcu/XXmHepWaDMrqBXF543JMBIsMdP6w5Bm3f/WCMBWE27ZC
         tMcjF3mdTG5D1wjCVPX3zlMpEwZg6yflwGOQ2MH3yCRhhAZ49j3DIp1tCws1Qg32o8WI
         jcNvXoBkPPuCeXpPES4pAin3LcVoBFlD91IT5nd5wsEEUTUvrJjG9JNAqQN3pboV+mrq
         AbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531595; x=1688123595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x34Su8pf+y+yNZx+Qg9rENg+7lUGq9lcJD0hRpvGbIo=;
        b=FkGm3A6BA4sDHG/RiyfrpVE2kS+lTsMTBoaUiT3Ud/0Wd7BFiwfElv+E8BoxkYgo5T
         p7o1h76HSOICsViLZRc3I5rnw/QHH2Qoudeyq/vEsakyeu1EfeENewYDNlONZPqdV7Y6
         JmewOQGuZnsW64Og3ZYjId944Tl/w2pYbmcJmzs91zTKXWlFuEhT+bM4Hd+z8sgl7YME
         QknvqqhKudLk50rFaXwZhNH1INLRnxxRyefnHwoJJZncwHrSQAJs6+bvVRTUcWPsv/3N
         xoNmLzW9eTrTc0OQXMPOGklTPG25J32rWWYSLiK+NE0QfMXhpBsifP7REQe6p2C4xu0O
         e0Ew==
X-Gm-Message-State: AC+VfDyxaxJTa7fy9TQIZ6Utet98t3gQTz810EkQnjVnIeJo2+DHNf+r
	72WDEUOD3lIcONzXIX3a6O+WqsjNbwM=
X-Google-Smtp-Source: ACHHUZ6mZG/A1HdRbiayG/SUbcV43d0a8VZUA0Vgh9F1k1Oovt/oi5f8ViqKAnipycr9krh7P8Qbuw==
X-Received: by 2002:a0d:d941:0:b0:561:89f1:6bb with SMTP id b62-20020a0dd941000000b0056189f106bbmr6078065ywe.6.1685531594920;
        Wed, 31 May 2023 04:13:14 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 06/36] lmdb: Pass CFLAGS to Makefile
Date: Wed, 31 May 2023 07:12:39 -0400
Message-Id: <20230531111309.2454603-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103035

From: Khem Raj <raj.khem@gmail.com>

This ensures that __FILE__ macros is expanded correctly without
buildpaths

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9af3510170137070cb269e6cf0399ac43ad8bece)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
index a76d388d70..35242bedb6 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -21,11 +21,11 @@ inherit ptest
 S = "${WORKDIR}/git/libraries/liblmdb"
 
 do_compile() {
-    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}"
+    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" XCFLAGS="${CFLAGS}"
 }
 
 do_install() {
-    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" install
+    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" XCFLAGS="${CFLAGS}" install
     cd ${D}${libdir}
     ln -s liblmdb.so.${PV} liblmdb.so
     rm liblmdb.a
-- 
2.25.1


