Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271CDC25B08
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 05:47:53 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.1664.1659592068792055986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 22:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fiD9u3Ao;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659592067; i=@fujitsu.com;
	bh=PdnsNNc0SQQF/p/0oGOZfsmoma/9cOx43/s+imAQfXI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fiD9u3AoyrZLV8JSldnxVe6d9DvqxwLoAB+wKPeIq4rOfc/oOTLuaCP1zgi+z2v6R
	 21QS3WbuQO2RkzXQppn3uCKRKQxSbHkaW2EJtRva47IJU6y8Xk6GDJ0zMh7kRAfV92
	 Bwve+t99gGJuQHQPdqAFG0dsh0iPebZtmkRiRqalUHc4M5lolmF1m+d7lpnPBuKKUH
	 BbazxzUPrQg30C4oUYgkSMfRKQpdr90DfSAVNBjtUG6uuA4ZbHZD+0OL9JD+Kzel7G
	 FuZ/dmZFggCFOR+14Xy5cUsExuHT4tK0wG9bz2csIfWqNuQpumEXC5fPurbtXjEEUG
	 PzZnnELDLmQ0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSbcp9nW
  Swfq9IhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aTF/wFTzgrju6eztTA2MXZxcjFISTwhFHi
  6buZTBDOdSaJj3MOMncxcgI5Jxgl9v6MB7HZBNQlHt98zQhiiwjoSyydvQeshllAVaL74hp2E
  FtYwE/i+d3lrCA2i4CKxMqty8BqeAXcJCbPew1mSwgoSEx5+B4qLihxcuYTFog5EhIHX7yAql
  GSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMPLPQtI+C0n7AkamVYyWSUWZ6RkluYmZObqGBga6hoa
  musa6hhZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBAZlSzCy0g3F930+9
  Q4ySHExKorztUa+ThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwFkQD5QSLUtNTK9Iyc4DRAZOW4
  OBREuF9EAGU5i0uSMwtzkyHSJ1itOSYOvvffmaO5WBy5te2A8xCLHn5ealS4ryRMUANAiANGa
  V5cONgEXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvJZCLeTLzSuC2vgI6iAnoIB2uFyA
  HlSQipKQamKJ3TJ7/rKE2JSz886OVmhf1/y5wUX5mM/WvVO10/kDdWRPWOxUlLz9jf/8n881N
  snYZ8zW9//2f/sP3naHsRIm4ScySN+KSDn+fN+27YMfL2HPK3U9l2m/d1489vo3TYe0F7dNvD
  n6SC3V5VVgu6VPwgMvbp8Dk0aHk/5cnfv3zcsLpH8vfvkrsPvJHbP6zAh0920gLEwsJUSOZtg
  uMf57tmBknJX3gdP4WjU/38zy/7v4qyTl39tbddWvZhM9+vpgvvjw7KuNT0x3e/KuPMs4uyt6
  7LfaH6Mcy/g0CTyenbozvWDhftixyYVkLh03V87oK9TvyXr6Gjz2ycqy5OwvMQpn9zyXHaInc
  kb1+Il+JpTgj0VCLuag4EQBQPqZyWwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-585.messagelabs.com!1659592066!116878!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2154 invoked from network); 4 Aug 2022 05:47:46 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 05:47:46 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id EE45E1000C2
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:45 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E1C48100077
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:45 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 06:47:44 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.3 -> 4.21.4
Date: Thu, 4 Aug 2022 13:48:48 +0800
Message-ID: <1659592133-4137-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 05:47:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98124

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-protobuf_4.21.3.bb => python3-protobuf_4.21.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.3.bb => python3-protobuf_4.21.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.4.bb
index 528f99ef20..6ebd797987 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9130759e719bee1e6d05ca6a3037f7eff66d7a7ff6ba25871917dc40e8f3fbb6"
+SRC_URI[sha256sum] = "5783dc0d6edae631145337fabb18503b4f77274f94cdd22a4b26b9fe5029e718"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


