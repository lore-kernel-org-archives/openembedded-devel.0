Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.2466.1621473980741164505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 18:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HqLkvjdh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621473977; i=@fujitsu.com;
	bh=d0+okc55wRnKsZaH+FMH22CFCerazR1Sfr0sOKeyVzI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HqLkvjdhPy6dHb7eFh1eHLXp1Fa5xkRKg38rcJ9xNolmbe5bThWIuCJ1Bc5vVUaPA
	 NtJy9PUPouMXi8OB/GMrDLBygwLVAXxFM7ajXcfIpezYfCJmO15Xy+NhAIbnvctW2e
	 yCa91lJeLGl6hQLzcoTqpL2hSOVe1NL+Isra+QVwn8nheL7SsnsChsCPKyvcrnE81/
	 ManPQ3L7QLmtSJ5rwluPqm6BSVW8peMQ/dcL6/7IZLA636O74233+Mdr+FDwAW3CQN
	 lfj9qjPE9W9wnSiC9gFAr9uym8U1yC5Sk+DHzkNTa05KnG9qfBZhf+L/qnTHWCqjeI
	 MTeDuQppIZ/1Q==
Received: from [100.113.7.141] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 65/0C-14259-8BAB5A06; Thu, 20 May 2021 01:26:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVXfHrqU
  JBmcuaVhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBnTXi1mLtglULFjolsD40z+LkYuDiGB2UwS
  k493MkM4JxglFq+dytjFyMnBJqAj0fGimwXEFhHQl1g6ew9QEQeHsICDxJrTySBhFgFViaePH
  7CC2LwC7hL9f9azg9gSAgoSUx6+Z4aIC0qcnPkEbAyzgITEwRcvmCFqFCW27zzDAmFXSMyYsY
  1tAiPPLCQts5C0LGBkWsVomVSUmZ5RkpuYmaNraGCga2horGuua2RqpJdYpZukl1qqm5yaV1K
  UCJTVSywv1iuuzE3OSdHLSy3ZxAgMo5RC9j87GK+//qB3iFGSg0lJlNfs/qIEIb6k/JTKjMTi
  jPii0pzU4kOMMhwcShK8hsDAFBIsSk1PrUjLzAGGNExagoNHSYT3/zagNG9xQWJucWY6ROoUo
  y7Hu5+LFzELseTl56VKifPm7QQqEgApyijNgxsBi69LjLJSwryMDAwMQjwFqUW5mSWo8q8YxT
  kYlYR5FUEu4cnMK4Hb9AroCCaQIxoXgRxRkoiQkmpg6uTYWdTptdHJ/nLaiYQfm4MqXj0vqdz
  3UvvFi9mSO/VWnyxpZcy/eZ+ddZYaR2Pom6l32dWW+/7qi877bCA8n9c+fVt+c30U98oQrfNH
  NZICna91OP7qaXJ7xm9i2v7yXu9Xb5cnJ7oT9pbVvPt39EbOidyL81Svt2uc9NAuPL3g55fjt
  +WU9Fbf1TdssD/Rf3fKkiN1C7e7fNZLkmzcmfT5w2I3iWmlEwTLS9JEuRN+agrJTdZgnPBlut
  w7nb0TjDX2PJad+P/KYoXjLjPSvhvmcIrOcLPhLo5Zu7fzZQRv5XWL/plTAjoMHfQ9Ztyc13Q
  2PcNWo1Qu41NQnHGi+fPZ39LOu1VzPzez2SinxFKckWioxVxUnAgALBELnCoDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-238.messagelabs.com!1621473976!205729!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9385 invoked from network); 20 May 2021 01:26:16 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:26:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1QFaG019333
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 02:26:15 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:26:14 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] postgresql: upgrade 13.2 -> 13.3
Date: Thu, 20 May 2021 09:26:08 +0800
Message-ID: <1621473968-11111-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
0001-configure.in-bypass-autoconf-2.69-version-check.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../0001-configure.in-bypass-autoconf-2.69-version-check.patch  | 2 +-
 .../postgresql/{postgresql_13.2.bb => postgresql_13.3.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_13.2.bb => postgresql_13.3.bb} (78%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
index 970d750b13..45f283a02b 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
@@ -16,7 +16,7 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 +++ b/configure.in
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
  
- AC_INIT([PostgreSQL], [13.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [13.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
similarity index 78%
rename from meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
index ca8a6c7cee..862dd61bd6 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
@@ -9,4 +9,4 @@ SRC_URI += "\
    file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
 "
 
-SRC_URI[sha256sum] = "5fd7fcd08db86f5b2aed28fcfaf9ae0aca8e9428561ac547764c2a2b0f41adfc"
+SRC_URI[sha256sum] = "3cd9454fa8c7a6255b6743b767700925ead1b9ab0d7a0f9dcb1151010f8eb4a1"
-- 
2.25.1

