Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FA8C64EC4
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 01:46:34 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.12032.1677635184093245782
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Feb 2023 17:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yotV+C04;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677635182; i=@fujitsu.com;
	bh=F86zvGsIdTowbdTtXeCzPJN5ln0VhiXHmX64SJ4LbyA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yotV+C04naugpVsyjxVSd+6DdCTXhvynZ3DuMNs3Nu8v0u4FYHenETxnJ27nerD5i
	 buIEdmN2aQSsnUKpUVuS2PhgHEZZrc9ySAfrS0t0F0olPPBH/fNok0vJaUVbgRfYJ/
	 1iNlZFcybeLkzCifJOzz5t4WA/btua2PnltwdpFnps7Gppe3A2x6H6cspo5TWFr1KD
	 Rd4S2H2aFNLfrnYBrnDacUwfban7Ev4HYGVcQJquAL8kMgTnHZR8vGBYSxHr2aFnHa
	 xLRnxmOqUJglp9ZiaB/11IwKDZ0LFlNKHVOd7tP7gYfbKTrCPLmPZrGXskBOAygVJ5
	 pKo7pQFFiQT1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxSTd33b9
  kg/lvFCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozLB48zF7zkqujZfYGtgfElZxcjF4eQwBNG
  ic5/x1ghnBtMEo1TtjJBOHsZJR5+OMnWxcjJwSagIbF76mVmEFtEQF9i6ew9YDazgJrE0Zc/m
  UEahAW6GSUW/V/MApJgEVCRaPi7hQnE5hVwlXj+8jSYLSGgIDHl4XtmiLigxMmZT1ggBklIHH
  zxghmiRkni7aU9jBB2pUTrh18sELaaxNVzm5gnMPLPQtI+C0n7AkamVYxmxalFZalFuoYGekl
  FmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBAZlSzJi8g/Fq
  31+9Q4ySHExKorwB5v+ShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw1qwBygkWpaanVqRl5gCjA
  yYtwcGjJMKrtAwozVtckJhbnJkOkTrFqCglztsA0icAksgozYNrg0XkJUZZKWFeRgYGBiGegt
  Si3MwSVPlXjOIcjErCvF9ApvBk5pXATX8FtJgJaHHDtT8gi0sSEVJSDUwxlxs+VjPkvf42r+s
  nH+uR2vNT4kzdjhjEyewzjzJJL491CJ6VzCyftcN2eVm97/LOh3NSbTdPk3kmH/7z+bYLpvbT
  OB+bHHi2cs+2zsBHKYGbvHNMj8Qd92D8Fq3Ravb07lSeY6reLdb1n9PXmz3u1Or2mcRxXDEnP
  vGj1qaNbzgbPZvFHhedsNXcsFVR+Hb3vGrpjMsLe7XtLk4wdlk891CZcUbewVyRf3+uNrlOSH
  zQuNOtYt2H3Z4PvqXxrOw6uYE5ZvHvCfcYK+70fZiv8CXv9icJp3s338q+i3dfuHJL4411udM
  YfJ4sP8JUaX/4mJht2N3XXUcvn43z27F82pLdeasXBW960yAXM0NCiaU4I9FQi7moOBEAdbED
  YUMDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1677635181!92458!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7962 invoked from network); 1 Mar 2023 01:46:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Mar 2023 01:46:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 246F61000D5
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Mar 2023 01:46:21 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 18BC11000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Mar 2023 01:46:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 1 Mar 2023 01:46:19 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libiodbc: Install *.h files to /usr/include/iodbc to fix conflicts error with unixodbc reference to ubuntu:
Date: Wed, 1 Mar 2023 09:46:10 +0800
Message-ID: <1677635170-12782-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 01:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101312

  file /usr/include/odbcinst.h conflicts between attempted installs of libiodbc-dev-3.52.15-r0.aarch64 and unixodbc-dev-2.3.11-r0.aarch64
  file /usr/include/sql.h conflicts between attempted installs of libiodbc-dev-3.52.15-r0.aarch64 and unixodbc-dev-2.3.11-r0.aarch64
  file /usr/include/sqlext.h conflicts between attempted installs of libiodbc-dev-3.52.15-r0.aarch64 and unixodbc-dev-2.3.11-r0.aarch64
  file /usr/include/sqltypes.h conflicts between attempted installs of libiodbc-dev-3.52.15-r0.aarch64 and unixodbc-dev-2.3.11-r0.aarch64
  file /usr/include/sqlucode.h conflicts between attempted installs of libiodbc-dev-3.52.15-r0.aarch64 and unixodbc-dev-2.3.11-r0.aarch64

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
index ced16d931..ff976ed97 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
@@ -18,6 +18,7 @@ SRC_URI[sha256sum] = "c74541e3327fc9a1c7ccf103645471c67bc014542d70f572476eb07c0b
 inherit autotools
 
 EXTRA_OECONF += " --prefix=/usr/local \
+		--includedir=/usr/include/iodbc \
 		--with-iodbc-inidir=/etc \
 		--enable-odbc3 \
 		--enable-pthreads \
-- 
2.34.1


