Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9169C6FA8E
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:05:44 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.6858.1677927943861606796
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:05:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ODtpPHoI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927942; i=@fujitsu.com;
	bh=Jdefaxk1IWGHiCCmVwRzQJsph+ZCQIq3R0htQKGq6Nk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ODtpPHoIrUvKbN0xtCv51N/8jm3zwn2sKTTCGdsTZqRF5nC4ZfI60euDVWoQmucjG
	 fR+rfxJC922ZfzmUe8P55LXWAM+xc7XQUfm3el/i8DVoceogxqmLA+NVeUwVlUGDDg
	 o08djf1hfQgxVvqlqspuNexHqwywJlPfAMMOBSM6H3Xn5Kadu0kyK3sofomYVCk5pn
	 gWYzPLHF0ySiYvBXFdeR6KlYivFjxU38maXQRMqXs98lOhHT9PMmXWhxcDs7SqkSRW
	 2B5GIYVwh/bS43HvH3AcZoOndoOyHNMVM/tCyQjuK0YmUUi5YMqLJyhtCGYqVTNTUC
	 vhgScUtZfQerg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpMuqxpx
  i8OYGs8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnGi5yJbwXvOirPLT7A0MP7j6GLk4hASeMgo
  8eD7XWYI5yqTxLcl61m7GDmBnD2MEs33bEFsNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQU8JJbM3QDWywIUf3X3IZjNK+Ak0XHkBFivhICCxJSH78F6OQWcJbYsec4GsctJYvGZhS
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YTYtTi8pSi3TN9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJL
  NjECQzelmOHGDsY5fX/1DjFKcjApifJOYmVIEeJLyk+pzEgszogvKs1JLT7EKMPBoSTBK6PKn
  CIkWJSanlqRlpkDjCOYtAQHj5II7xYRoDRvcUFibnFmOkTqFKOilDivgDJQQgAkkVGaB9cGi9
  1LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5t6gATeHJzCuBm/4KaDET0GKN0wwgi0sSEVJ
  SDUynjxlvT6pKCpudzMEvJz0hLCL2jqubf9D7DSLGxt/X6n3PX+/CcD2xets68ZNuB5iEcher
  LQ1fNyuB8TG34M5r+oUHK6a3+X+6+kxDrVi0iI/74unnz0SuSq9W3BO779B3dRae8DlJHekb1
  L72L/169WRCk/PP40w26+4ENzbExG4+dj3qR7iF1dZGlSuzWCc+XDhhwaU7lz7HNvJlJXnaN1
  8r9vFLq0vxilNX/yK6Qf3B/Xdr/7IKLXtuWLp0Fce3bSp+LYyV7Fp/j8VyKL5Z5qTZOmP5g7x
  9X1ZPjBO0cpb5sa3zacIhk89ZRbcLZ2c3Lb5YvVo8ykR5qleXpYatnqvDwzfijR3q7zK/rFZi
  Kc5INNRiLipOBADZ+ksYWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-585.messagelabs.com!1677927940!149212!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29783 invoked from network); 4 Mar 2023 11:05:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:05:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AC3801BC
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:40 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A0B0C1B3
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:05:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-decouple: upgrade 3.7 -> 3.8
Date: Sat, 4 Mar 2023 19:05:18 +0800
Message-ID: <1677927919-22891-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677927919-22891-1-git-send-email-wangmy@fujitsu.com>
References: <1677927919-22891-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101364

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Raise KeyError when key is not found in ini repositories
    Fix infinite recursion on Windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-decouple_3.7.bb => python3-decouple_3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decouple_3.7.bb => python3-decouple_3.8.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-decouple_3.7.bb b/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-decouple_3.7.bb
rename to meta-python/recipes-devtools/python/python3-decouple_3.8.bb
index 5238431bc..20d614a42 100644
--- a/meta-python/recipes-devtools/python/python3-decouple_3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-decouple_3.8.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a46375b26bb7d7603565d829a2a51782"
 
-SRC_URI[sha256sum] = "e88a8d6bdf3b07d471a854099e455e20a6fa7a4d6ecf8631b250e3db654336e6"
+SRC_URI[sha256sum] = "ba6e2657d4f376ecc46f77a3a615e058d93ba5e465c01bbe57289bfb7cce680f"
 
 PYPI_PACKAGE = "python-decouple"
 
-- 
2.34.1


