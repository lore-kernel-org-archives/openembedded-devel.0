Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9EAC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 02:36:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.2715.1645583812244580336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YrviULlv;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645583810; i=@fujitsu.com;
	bh=qZcl2iyUwtdQR1e/a+s6BZN/lbwjqGYZca39EdkKZhs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YrviULlv+WvAkCESeaaMrCTJPJVim0QqYBSoQ11oXjEAD5+bSTEhylfWoZj5Yrbdp
	 9WYfn0HYfadHnECwF3qBGwW8wfHhA4+/yqAMtp0SHmRBcAGNssceQWmUbiASk/qe+8
	 /vSJnhA04yAUUeDbjRVjO3DKPN1vg8ldrIwXDx2NiNBdlwry+/vY238O0eBMUOPfMc
	 j5olyYcjCWcH9qWULiflcIPK/V9CHAUmrUDp/NoYcrPktZEz/1nnGNI+FSy7GvmVYi
	 qMlpbMoHkheMcmnxF0roVgtacGgQ4zOGR4rQN2zvLR2Nok4B60+/DYjxcX+GmckXR9
	 zTTFeI/Raqx3A==
Received: from [100.115.35.240] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 2D/68-29321-2CD95126;
 Wed, 23 Feb 2022 02:36:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxRffQXNE
  kg3OreS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxfzwUKLklUnDzxgbWBcaFYFyMXh5DATCaJ
  S/eus0A4exgldqxoBXI4OdgEdCXOPV7LDmKLCOhLLJ29h7mLkYNDWMBB4vl3LZAwi4CqxKn5E
  5lBbF4BD4mdD6YxgdgSAgoSUx6+h4oLSpyc+QRsJLOAhMTBFy/AxkgIKErMni4PUV4h8frwJe
  YJjDyzkHTMQtKxgJFpFaN1UlFmekZJbmJmjq6hgYGuoaGprrGprqGFiV5ilW6iXmqpbnlqcYm
  ukV5iebFeanGxXnFlbnJOil5easkmRmAgpRQr79jB2Lbqp94hRkkOJiVR3rn+oklCfEn5KZUZ
  icUZ8UWlOanFhxhlODiUJHg/zALKCRalpqdWpGXmAIMaJi3BwaMkwrt/DlCat7ggMbc4Mx0id
  YpRl2Pnlst7mYVY8vLzUqXEefWAMSIkAFKUUZoHNwIWYZcYZaWEeRkZGBiEeApSi3IzS1DlXz
  GKczAqCfOeAlnFk5lXArfpFdARTEBHTMkSAjmiJBEhJdXA5Jfxw5bHYH7+as/bqz5rfmgx057
  TwKXIcsyUOy1nyuOvsqmShq/yl7JaTfre4qOad07PIPPP0czdLp7rp9TffKYf4SD5NW3lA6Vw
  91U7nt8/dey+kVFvQ5mtY3R84S730mV3Aqd+WrA5hOcX247PG7Q+Fzq5MUraJi/VYmfVflFWW
  24euXBH2SFpm2z+dxtui587YBM2+dC5ldz7HK0ETymu97gZUbqM54aoaRkjwxIB5ndMyesnVe
  95xChmmmRW/NzrxsWUvoWL41cp8JRzLshR2rjmwrtpHJ9mh04KVnlxwN4rKU2yet8zuaIQqQi
  FvV8YWf4yyKnNrxe93FaecNHHmnPmtMcrqphFTOyVWIozEg21mIuKEwFfgconKwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1645583810!15770!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11957 invoked from network); 23 Feb 2022 02:36:50 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 02:36:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21N2ahZ0004234
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:36:49 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 02:36:42 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] postgresql: upgrade 14.1 -> 14.2
Date: Wed, 23 Feb 2022 10:36:33 +0800
Message-ID: <1645583793-38692-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 02:36:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95464

refresh 0001-configure.ac-bypass-autoconf-2.69-version-check.patch
License-Update: year updated to 2022

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...nfigure.ac-bypass-autoconf-2.69-version-check.patch | 10 ++++------
 .../{postgresql_14.1.bb => postgresql_14.2.bb}         |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.1.bb => postgresql_14.2.bb} (62%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 3d969cc7e7..39ec7c2c8c 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 053e8fc51bd9688100ce284a9c7afab88656386f Mon Sep 17 00:00:00 2001
+From 9c9ac8b64f940bf69ecdc92abca9b58f12b401c3 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -8,17 +8,18 @@ for upgrade to autoconf 2.71
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+
 ---
  configure.ac | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7170f26..daf85b9 100644
+index 3b148b6..94f39c5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.1], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -27,6 +28,3 @@ index 7170f26..daf85b9 100644
  AC_COPYRIGHT([Copyright (c) 1996-2021, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.2.bb
similarity index 62%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.2.bb
index 680b50bb40..52e8867142 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.2.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=255f15687738db8068fbe9b938c90217"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=75af6e3eeec4a06cdd2e578673236fc3"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -10,4 +10,4 @@ SRC_URI += "\
    file://remove_duplicate.patch \
 "
 
-SRC_URI[sha256sum] = "4d3c101ea7ae38982f06bdc73758b53727fb6402ecd9382006fa5ecc7c2ca41f"
+SRC_URI[sha256sum] = "2cf78b2e468912f8101d695db5340cf313c2e9f68a612fb71427524e8c9a977a"
-- 
2.25.1


