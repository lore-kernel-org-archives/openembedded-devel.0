Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29187C77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:02:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.66197.1680516134381682605
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uNysGpFc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516132; i=@fujitsu.com;
	bh=ZYK9l2ogDwgrBkP94dIkOx2O9SIfRSjAhDgKMXO91FY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uNysGpFc6NK6RHJKGox9PjDIxMP2joVzWMpAuhycgDLt6Xzzt66goo9Jbnta4v6KL
	 4a0GqeYrR3bxDgfebgxJTFHfeJEdIl7n7Bs3LXiTWLcEyxn2JT2juACiNu6m6NWeHs
	 glK0aN78oWRXgkDTILhAo9nfRU4g9ZWCziRTnL4yZ1s+T1gMcajqcTxMcJgNcVfNUx
	 Ps+kMDeaOz0hjrnv1rFXQG6TU57oprgLnQIJLR2KKkxGJtHHRJhR8cO/+mgfvmKYI6
	 OjttAkt+xGwW0HQksq/Rcc6UXsZEvHQS6SwPAhXtrarvBsgZc0BwOg+2knqfiMYtWX
	 sE6IZpue9hMxw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWVd5iVa
  KwfKH1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bvKa+ZC85wVZw5tJKtgfEaZxcjF4eQwANG
  iQ+/3zJBOJeZJCZs/Qzl7GaUuLFjBXMXIycHm4CUxI37/9lAbBEBfYmls/eAxZkFVCRe/O5h7
  2Lk4BAW8JU4sDsdJMwCFN7zYwUriM0r4CQx/dtjRhBbQkBBYsrD92CtnALOEv+u7WMGaRUCqn
  n5QRCiXFDi5MwnLBDTJSQOvnjBDNGqKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo3lxalFZapGukYFeUlFmekZJbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZg8KYUp+3bwdjR91fvEKMkB5OSKK9gvVaKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QneeYuAcoJFqempFWmZOcBIgklLcPAoifAqLgBK8xYXJOYWZ6ZDpE4xKkqJ854G6RMASWSU5s
  G1waL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXrHFQFN4MvNK4Ka/AlrMBLS4NUoDZHF
  JIkJKqoFJ48JSo5N7I3cKBpjFqxWsnlN1ardZKdNtPRHJ/yc3Pt+l6nHjIcOxfTVc88+KnH68
  4dDHzj/zV2YKiYXHr67byfQsuW32rv07Y6sWX2m/d/Tw89bFVRvKGn/f/mDknii6SHzpvv7Io
  JTPtj5nnxzZuVH2mGBg6sL+T1PbdZYyXtqseTfGoU7pLRfT6XK9D+vX+Em3rU69Fl6XILb85G
  8R/cOH1aQjAk4pGD9St86UnRjBL7/KeEM320tehTjf8kO8MrxL42XtDrlEPixJXXBt76J7ZTM
  3l/D4hekKVxi2aPhbrD0fJT1NrLnT7Wp51ytxscnR09w+ePh1+n+1eeb08/XyHcazLzX/66j7
  fvGxEktxRqKhFnNRcSIAXkfZrVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1680516131!1425457!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28276 invoked from network); 3 Apr 2023 10:02:11 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:02:11 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 66D7D7C
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:11 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5A7967B
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:02:09 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.15.0 -> 2.15.1
Date: Mon, 3 Apr 2023 18:01:45 +0800
Message-ID: <1680516108-30896-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516108-30896-1-git-send-email-wangmy@fujitsu.com>
References: <1680516108-30896-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101910

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Restore behavior of setting a Call as a base for classes created using six.with_metaclass(),
and harden support for using enums as metaclasses in this case.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.15.0.bb => python3-astroid_2.15.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.15.0.bb => python3-astroid_2.15.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.15.0.bb b/meta-python/recipes-devtools/python/python3-astroid_2.15.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_2.15.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.15.1.bb
index a5f30b754..cde2d038d 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.15.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "525f126d5dc1b8b0b6ee398b33159105615d92dc4a17f2cd064125d57f6186fa"
+SRC_URI[sha256sum] = "af4e0aff46e2868218502789898269ed95b663fba49e65d91c1e09c966266c34"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


