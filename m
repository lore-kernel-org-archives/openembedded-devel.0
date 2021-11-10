Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C410C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 04:06:26 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.7689.1636517184679583345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 20:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LHLujaMV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636517182; i=@fujitsu.com;
	bh=3JFSM4q94XwAqpJPcsRctE/Cp6DfNmnAE6UUZ3ql1pQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LHLujaMVyR0tVngvAVt2y8cQPqeO0Cn6dbnYgdb/l5f173CyFmVVPSdvcfkx2nlpH
	 Cvgt4NVPZFa3Os1lAuBw5QydkCHQ10p1Y8LY8qyW92CW5hTO3ZDHnlxlKxfoIKYV9r
	 ugzKorZPau1MyIR+t479eGRJU/IpvpljUS/TdzMXOsozaJ1bY3zxL6ZU8rR6EEZKU/
	 U9DNmfJu3dgjCcwJs27XDbDkCqBLNkBmeTi5iX6JqHXThXWQwuAJtJb/RvDDmLbuie
	 OXHL6O5B0BnWBjK+3NXCHC4HKGZa+EMCz1z3NWNYWDLrm/UD9nqFx4KDs2hUvbEN1J
	 gWH4fuLOdOsNg==
Received: from [100.112.193.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 50/C4-02128-E354B816;
 Wed, 10 Nov 2021 04:06:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRqmvr2p1
  osPaLnsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHpuULBFMGKhx1P2RsYz/F3MXJxCAnMZJK4
  e2UCK4RzglHidM9Exi5GTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5h72Lk4BAWiJOY9
  FQVJMwioCox6dprsFZeASeJ1x/nsoDYEgIKElMevmeGiAtKnJz5hAVijITEwRcvmCFqFCVmX2
  6Gqq+QmDWrjWkCI+8sJC2zkLQsYGRaxWiRVJSZnlGSm5iZo2toYKBraGika2gJxEZmeolVuol
  6qaW65anFJbqGeonlxXrFlbnJOSl6eaklmxiBwZVScKBuB+OD1x/0DjFKcjApifIeEOpOFOJL
  yk+pzEgszogvKs1JLT7EKMPBoSTBm+4ElBMsSk1PrUjLzAEGOkxagoNHSYS3yAUozVtckJhbn
  JkOkTrFqCglznvcGSghAJLIKM2Da4NF1yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxrQa
  bwZOaVwE1/BbSYCWjxwS/tIItLEhFSUg1MMw8Zr55xnz+ndLulUIjGnpgSvp8vnrkZ6Sx0Pzb
  hWKcr85K0N7P2/f88p+1S2K1EHu06CxbFRy+7tx3PO/ar8KyP2owpjeJuHTVPOkWt20N/z92n
  vXJ+8Z/j16Q/yF3SvPp91RHTvfOMlnK/dT486Yy2soZTiM5pS6/+KqUHz+fuze5jXPxwhxtz5
  KfE2EUfT/CJFU/pn93z4848w8+rcqNYs1UnZE162rBaIvfThcmLOQ5mOmkcSGg2FlLkWnF+c0
  tId8QeOfmH5c33s2x0gqLPs87MlXotPTtCZfX91rsius0vDDYe0JNvurHo+r53P88fUDxo+ux
  HmeXv2OisDRpeNl3VImyX9jFxR4Y/U2Ipzkg01GIuKk4EAF6lZZcpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-265.messagelabs.com!1636517181!143486!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3606 invoked from network); 10 Nov 2021 04:06:21 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Nov 2021 04:06:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AA46LAO011678
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:06:21 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 10 Nov 2021 04:06:19 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.28.0 -> 2.30.0
Date: Wed, 10 Nov 2021 12:06:09 +0800
Message-ID: <1636517170-63516-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 04:06:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93898

Features
androidmanagement: update the api be2e5dd (5dcb723)
appengine: update the api 4535ce5 (5dcb723)
artifactregistry: update the api 882fdb3 (5dcb723)
chromepolicy: update the api c330a6f (5dcb723)
cloudidentity: update the api d0f0527 (5dcb723)
composer: update the api 2bfa5a1 (5dcb723)
compute: update the api b917688 (5dcb723)
datastream: update the api 218521c (5dcb723)
dns: update the api 540233d (5dcb723)
healthcare: update the api 1e029c8 (5dcb723)
ondemandscanning: update the api 9f998b4 (5dcb723)
osconfig: update the api 59cea85 (5dcb723)
paymentsresellersubscription: update the api efb5b4f (5dcb723)
privateca: update the api b4ae2c8 (5dcb723)
recommender: update the api 8dffae4 (5dcb723)
retail: update the api f711074 (5dcb723)
storagetransfer: update the api c835926 (5dcb723)
streetviewpublish: update the api 35f0b1b (5dcb723)
translate: update the api 1f848a5 (5dcb723)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.28.0.bb => python3-google-api-python-client_2.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.28.0.bb => python3-google-api-python-client_2.30.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.28.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.30.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.28.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.30.0.bb
index 19ae3cba37..e1f7040e4f 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.30.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "07e6fdfc489a452d79c5efdc4cc2d5cfd7f7aa207dec82786bfcc436b208e027"
+SRC_URI[sha256sum] = "d46418a296f8ee309b2044791aeffae512cb1a9d9bfb3def2bfb37058f01c645"
 
 inherit pypi setuptools3
 
-- 
2.25.1


