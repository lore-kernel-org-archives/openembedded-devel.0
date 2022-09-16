Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEB0ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 06:40:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.3173.1663310394737853166
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 23:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ofZutsiT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663310392; i=@fujitsu.com;
	bh=qFGdIOGtL0I/CITj3IqlazilnhuRRjfqw1vO4aY2B/Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ofZutsiTlZPHlkO/RlW2oFKD3gi8ynAZJgr2Kn3gYzCZiyggA5BncYTMU2/gz1fM1
	 LeqnDZJxUWXgWzd00YmvpXzjIPd4fy4OAnO/V4udHP6/2Mqmvp1RHBhyAA3dHDap+r
	 NWn8pOxKkrH9hMTKo6wa8QQoIzVWlAno/umQ1upO2Hp+fuSCuRmEhNDdYZ6D8iyTba
	 FDhyRbmmnINTMg42yg4A8FtWdaRtQxuPIBx6R1qY5JTMlc41Vr245kRvVXIGEEFZHh
	 jma7/wbbTVUmBhXfrVKPzAxPdo9OY1BvDLtwsAJnrFbyRc+B7LqO+dYDbpY/oyHNsH
	 T7fEbrrmnbYSg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8OxWddcSiX
  Z4F2jtcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFu2WfWggaeitWHPrM2MM7g6mLk4hASeMgo
  saDhBDuEc5lJYsL6c4wQzl5GiSX31rF2MXJysAloSOyeepkZxBYR0JdYOnsPmM0soCZx9OVPM
  FtYwF5izY3jbCA2i4CqxMwH/SwgNq+Aq8S1891gcQkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNUoSby/tYYSwKyQapx9igrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0SSrKTM8oyU3MzNE1NDD
  QNTQ0BdKGusYGeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIGhmVKcKreD
  8cC+X3qHGCU5mJREeR+bKycL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuC1EldJFhIsSk1PrUjLz
  AHGCUxagoNHSYTXUQQozVtckJhbnJkOkTrFqCglznsLpE8AJJFRmgfXBovNS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEeV9LAE3hycwrgZv+CmgxE9BiXgNlkMUliQgpqQYmx3BhTpF9jvn
  2Gcccvn49cuKoTOde76uFljFfNnTJPRIyOy39r2P/nAXnQ3eelIxz2ly40ySvU4H3ysHa+XvX
  eTZ+ucol7GJte+WcEE//ijmWtgXRU7+kiM268ef/JueqG/vD1POFmvKOi1e8Y2Er0ChrYbb5s
  s8yQDAuW3TTmfkaX5JqzvreFz9+87bWPhX2N79uee14fXjVOubnb/5afJLVlGX0vVUw7STXlj
  J/9+QPcfmHefcETOKdu95t6YZD1lvnrv4ZXP5B1k1ktwr7ntuWz5een1fN6DjhoSD/md0XNu6
  e9/1vu9z8vzP/Xt/OrDPHvJ31Tcuz92znawN6XB6cU7PpuucxSUSuRTSrUImlOCPRUIu5qDgR
  AFjL5BBIAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1663310391!968!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4146 invoked from network); 16 Sep 2022 06:39:51 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Sep 2022 06:39:51 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 64120142
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 07:39:51 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5719D73
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 07:39:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 16 Sep 2022 07:39:49 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] mariadb: Fix buildpaths warning.
Date: Fri, 16 Sep 2022 14:39:39 +0800
Message-ID: <1663310379-31652-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 06:40:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98829

WARNING: mariadb-10.8.3-r0 do_package_qa: QA Issue: File /usr/src/debug/mariadb/10.8.3-r0/sql/yy_oracle.hh in package mariadb-src contains reference to TMPDIR
File /usr/src/debug/mariadb/10.8.3-r0/sql/yy_mariadb.cc in package mariadb-src contains reference to TMPDIR
File /usr/src/debug/mariadb/10.8.3-r0/sql/yy_mariadb.hh in package mariadb-src contains reference to TMPDIR
File /usr/src/debug/mariadb/10.8.3-r0/sql/yy_oracle.cc in package mariadb-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index c63d511..7bd4ac0 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -224,6 +224,17 @@ RDEPENDS:${PN}-setupdb = "coreutils"
 # Allow old code to link to the backward compatible library
 RDEPENDS:libmysqlclient-dev = "libmysqlclient-r-dev"
 
+PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from comments in generated sources to ensure reproducibility
+        sed -i -e "s,${S}/sql/,,g" \
+               -e "s,${B}/sql/,,g" \
+            ${B}/sql/yy_oracle.hh \
+            ${B}/sql/yy_mariadb.cc \
+            ${B}/sql/yy_mariadb.hh \
+            ${B}/sql/yy_oracle.cc
+}
+
 FILES:libmysqlclient = "\
     ${libdir}/libmysqlclient.so.* \
     ${libdir}/libmariadb.so.* \
-- 
1.8.3.1


