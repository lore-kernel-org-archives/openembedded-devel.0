Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web09.2618.1623982751815396720
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XSSdGiMg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982750; i=@fujitsu.com;
	bh=ZIFfVS/YQ5HuKl0pGnvUe71yZnT+YapPgEJGVSli3vw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XSSdGiMgialjd778/hqEgWxVd5krm3jwB/bs7Ric4dnnNYK0kwSkLWhpS4zrURH06
	 HBXpCaa7rsghHHfQ8xWWKYFKxQhvIicpHdRKtZoqrU9YrT+58Ix0mFc+D1Z4goj7fP
	 RWMykFO1icoIJy7vxyk8VmHkH0pRXUIqx/Dgdos/tPTCuI9G7+wx6oS/f6DYpcerGU
	 oQyIWQKaMYcekAqgVsJ+Am7zZGvpcszTEylj4CRnz/Lna/acmdZMh5hqG3+rbi+jzH
	 CfDX56QFl5GiVVzRz4WF5NBIzcw6IU+Jvwcg9SwAHeR75FbIZehEm+maJ0VNTcXxF8
	 FjUzImNSJZ/bA==
Received: from [100.112.195.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 81/E5-45811-D920CC06; Fri, 18 Jun 2021 02:19:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqjuX6Uy
  CwfGHvBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ba12fYC3ZzVqyY083ewHiLo4uRi0NIYDaT
  RN+r2ewQzh5GiQ/r3zF1MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAq8X/fEjCbRUBVYu63v
  ywgNq+Ah8TdjhusILaEgILElIfvmSHighInZz4Bq2EWkJA4+OIFUJwDqEZRYvZ0eYjyCokZM7
  axTWDkmYWkYxaSjgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLYHYyEwvsUo3US+1VLc8tbh
  E11AvsbxYr7gyNzknRS8vtWQTIzCMUgoO1O1gfPD6g94hRkkOJiVRXquXpxOE+JLyUyozEosz
  4otKc1KLDzHKcHAoSfDeYjyTICRYlJqeWpGWmQMMaZi0BAePkgivNTCshXiLCxJzizPTIVKnG
  BWlxHntQBICIImM0jy4NlgcXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLsNZDtPZl4J3P
  RXQIuZgBa3CZ0CWVySiJCSamAS1/6Zem9FzYqqLLYT+XeXzwzsnmQ3o+KTqdlTT95z95zupF1
  qumDP8d1jicK1hF87/A9fWjRnF8vc32//7XkXtLO+P+CnDvPs/bkCc58z6IqHHLKbKK+ybFbv
  ft1+hqud1lIlEbkRlv0SLuudWnvnbw/liuv/bVGxju8Jx7Ofdj85/+1ZL/18xfGqKVcu+ia5N
  17Tlspz31kSsXT/ojNaZketd6+VX2BfeO1wYUCa65r316f/aZyw4u+XHyfDYl0nrVLumN7JFL
  +063D0xwgtYxk25qP3f7ZPV3SILEhd8SJuRbhGcHyezI7EIKkLEj0te3VEj+cWr3AUWrmI3zm
  XIaV9uezjjQZMvu073z9UYinOSDTUYi4qTgQAVzpp9B4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-267.messagelabs.com!1623982748!92091!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1966 invoked from network); 18 Jun 2021 02:19:09 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:19:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2J8F5019346
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:19:08 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:19:07 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] rsyslog: upgrade 8.2104.0 -> 8.2106.0
Date: Fri, 18 Jun 2021 19:18:55 +0800
Message-ID: <1624015135-18587-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../rsyslog/{rsyslog_8.2104.0.bb => rsyslog_8.2106.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2104.0.bb => rsyslog_8.2106.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2104.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2106.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2104.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2106.0.bb
index 3f1ec91ab0..37f391356f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2104.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2106.0.bb
@@ -31,8 +31,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "a0213c989bce297944901e1a85286b8b"
-SRC_URI[sha256sum] = "710981c3c34f88d5d1fb55ecfc042aecad8af69414b2b1602b304f4dedbf9f43"
+SRC_URI[md5sum] = "b90659d85dce1df0f6c69a79c4ef053a"
+SRC_URI[sha256sum] = "faf45c25a2265c001739e8888b3652cf685eb3f35cd65d17d5c38fd44b9ddd81"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1

