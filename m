Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.16926.1630891089676522055
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LnzaO/C/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630891087; i=@fujitsu.com;
	bh=9sshyNmaZXjRclsVZ2WHpnbcsRS01ewdfAbRTix2GTA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LnzaO/C/fFblCCapJc/nU8wi9ZfLYa92OBnu+JyE7ywy5GZpupuQwiYvX00ivesJw
	 Rxh4eEmHIGQMjCebgrNwMfofOsd6P6FtjvGESU9yuIyQKPriMO8jWiBcltTtTbk6wF
	 pjg/P9zdWxJF44B0QrC1tRMWciVxxhTunMPa2LMaV+M31+HE704ESsVctT+vaEQBhe
	 7cUJU4hNyguhuQR3EffPoduURO3r/D1NbgoQHtkm9KxwD5Q00vCOtSpUOPIUUdBLms
	 kRlFuJ6j7c5rmThf1+2FgOvvEoCN+qVzpTGFWf3fjmBkz+rexMfXeWT45UUbnIy1s+
	 qec8H69zzAoJA==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 70/79-23460-F4C65316; Mon, 06 Sep 2021 01:18:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYouuXY5p
  osGmWtsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH3WXLBeYGKnZ3TmRoY//B1MXJxCAnMYpLY
  +u0lC4RznFHi2ax1TF2MnBxsAjoSHS+6WUBsEQF9iaWz9zB3MXJwCAukSfTfrwUJswioSPS9u
  sUMYvMKuEtc/nyUHcSWEFCQmPLwPVRcUOLkzCdgY5gFJCQOvnjBDFGjKLF95xkWCLtC4vXhS8
  wTGHlmIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXUNdIyMzvcQq3US91FLd5NS8kqJ
  EoKxeYnmxXnFlbnJOil5easkmRmAYpRQyPtrBePr1B71DjJIcTEqivBp2polCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHijsoBygkWp6akVaZk5wJCGSUtw8CiJ8DplA6V5iwsSc4sz0yFSpxgVp
  cR5y0ESAiCJjNI8uDZYHF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzbGg80hSczrwRu+i
  ugxUxAi9semoAsLklESEk1MNn/L7piG1s5cb+yN9useWFfKtdvP3V48SGVy0mZHPNcpmX13H5
  +JSv8AIv0jpOFVsu+f/x+bfr02XzutV+0XvGekAs5eStuL7Pkm9sBvEfZpyw4zzi7PPjRrN4k
  Qx0XGU79hdHNbm8euMxq5ktz6bv7+sTvz8f0fSfN4Nq2Kd9cjlVD+Jbrs/fijfz77N0naC4U3
  LrjSu3eJycr5C9ml2/W035zypf3dYl6I9usLT1/Pf2kVu673SDyvItv/ZtZdZv2bDu6v3r12f
  fz5V0DGX6s23l1xwz7/+5TrvqJZvWV8eszc5huOxCg7XGlPC/iN9dDKanG6gJ3vTtLSy9w1XS
  qmC5+ouY8bZNLwbUbSxYqsRRnJBpqMRcVJwIA/00Tvx4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-232.messagelabs.com!1630891086!231551!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5955 invoked from network); 6 Sep 2021 01:18:06 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 01:18:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1861I6df020844
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 02:18:06 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 02:18:04 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.18.0 -> 2.19.1
Date: Mon, 6 Sep 2021 09:17:58 +0800
Message-ID: <1630891078-61263-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

From: Wang Mingyu <wangmy@fujitsu.com>

remove repeated calls to self._get_reason
analyticsdata: update the api
androidmanagement: update the api 
artifactregistry: update the api
bigquerydatatransfer: update the api
bigquery: update the api
chat: update the api 
cloudidentity: update the api 
cloudkms: update the api
compute: update the api 
containeranalysis: update the api
container: update the api
content: update the api
dataflow: update the api
dataproc: update the api 
displayvideo: update the api 
documentai: update the api
file: update the api 
gkehub: update the api
logging: update the api 
managedidentities: update the api 
metastore: update the api 
ondemandscanning: update the api
people: update the api
sqladmin: update the api
sts: update the api
workflowexecutions: update the api
youtube: update the api

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.18.0.bb => python3-google-api-python-client_2.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.18.0.bb => python3-google-api-python-client_2.19.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.18.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.19.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.18.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.19.1.bb
index 0dc31826b5..564058e98f 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.19.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a25661ec6cf4c159f41fe9c061c2bee31b2dddaf2ad787e23617048a25b53842"
+SRC_URI[sha256sum] = "c89b345615188fbd525f52d59013156ad3bfd1023af27041f2dec3d7877ba112"
 
 inherit pypi setuptools3
 
-- 
2.25.1

