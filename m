Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AF4C433F5
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 20:05:55 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.41866.1638734754502976350
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Dec 2021 12:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=C0JX6VaB;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id b1so20147941lfs.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Dec 2021 12:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pX7YhnlQ5KcqCs3GtufxxjVpb0JVl3ygwC2jLiFMKjw=;
        b=C0JX6VaBadHAT8QRDu+N9tNK+NVAiwIQV8rzPUOzecgHdwrVv4h1lDqhyCniSy2eVr
         PJF3OW3kukKyJyiD4lGKq1CcWpsl+Yt97Ox4VElZdioXWWRH1Fl6IaEimu1HZZu6tSyV
         46OcRvtxAJmVu2a85n6eVY3gUu7plGc5KmExPxtIRZCW6oX2uV6avOkeetLXQnPCQo2H
         6S1IXfc82actfX6gkdJvFOeUROodIdRFuBnAh/p6D+Us3LWF3xyfIEBs8N0GfTEzD4Gz
         T223I+hHl9VlDUbBiUMAcX/GWYjoZ2YV2poGYBLp62BpQRTBy9IlpGnsB7aqNYKk/uks
         69Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pX7YhnlQ5KcqCs3GtufxxjVpb0JVl3ygwC2jLiFMKjw=;
        b=KusM5U5JHdRnUmsjhVH/xH6mX7auJ4yyLvSXg5trY/0Q3Tx22FHoJDy6q+U15jgAPM
         WzBf376uUrjdbPslNhGESz6LPHQbvDa0qOiDgxrQt8XhJ7JKMq9egmCsy2PR7FS3CxsK
         CU2HBLYUsxM/mmmdYunsT5aVRN12bZ4BKYg5du5cEcKtIEwbEOi/ExxID1l9nGzwAbYx
         ObRbpSdjePSuhHgpZ1/BQQToxQDD/x8LR1dhuhlE3JdTH1aubNFKo9j5S4q5dYl6e0nh
         rwbB9fLVZCsXYYf0QpYTt/emxmCMzeq4AW8znjSU9ebIHtpDaV9wd2iyPyOUrzV3g64k
         BlDA==
X-Gm-Message-State: AOAM532L+v90RH4y6sZQvzseEOTjEbW1Jks1ZvW0c+gFlefQ/n2/dpZp
	qc5pIF7+LqKnK+o4glJCmoSjVbgMXmZXT/Lt
X-Google-Smtp-Source: 
 ABdhPJzcp+PK+jljKIXIRfkXwx811LaCcn5ivPGUfqSrD3wUyiZVdMT1Yd9SySA6pqhlP/D16FgFtA==
X-Received: by 2002:a05:6512:10cb:: with SMTP id
 k11mr31016685lfg.534.1638734751973;
        Sun, 05 Dec 2021 12:05:51 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 b26sm1155361lff.148.2021.12.05.12.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 12:05:51 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] fb-test: fix SRC_URI
Date: Sun,  5 Dec 2021 21:05:31 +0100
Message-Id: <20211205200531.172123-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Dec 2021 20:05:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94211

Original repo doesn't exist any more. Even though I couldn't find any
new official repo, this is the only one on github that contains used
commit hash.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-test/fbtest/{fb-test_git.bb => fb-test_1.1.0.bb}  | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-test/fbtest/{fb-test_git.bb => fb-test_1.1.0.bb} (82%)

diff --git a/meta-oe/recipes-test/fbtest/fb-test_git.bb b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
similarity index 82%
rename from meta-oe/recipes-test/fbtest/fb-test_git.bb
rename to meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
index 299213572..14ab41b14 100644
--- a/meta-oe/recipes-test/fbtest/fb-test_git.bb
+++ b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
@@ -1,12 +1,10 @@
 SUMMARY = "Test suite for Linux framebuffer"
 
-PV = "1.1.0"
-
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRCREV = "063ec650960c2d79ac51f5c5f026cb05343a33e2"
-SRC_URI = "git://github.com/prpplague/fb-test-app.git;branch=master;protocol=https"
+SRC_URI = "git://github.com//ponty/fb-test-app.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


