Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AC6C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 13:33:55 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.8972.1676122426882026406
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 05:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VlNqAG+D;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676122425; i=@fujitsu.com;
	bh=crWdd+Qieo/LBfkupGF43iKSYsc4MwA+QSsQZ3YRdNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VlNqAG+DvoY6HDeta5Am0zIKNmOtUdi7Gg04sNnGi7BNzNLorj+A59Fsdb8raJiR0
	 nqF5uBESdIe6NsL+ib6s8qNjNkhEOxKam4Y8S973h8NzuZhzTNZTd/9N0gbGGw/AxK
	 MlvYk7Q0+M2Te5xz5uyrRuLxIpaBSI3RZui5oRghtp/IehBoIdMqqqxP3obU9wRdOs
	 Iu1HAxx7OESW9JgZsSoX+1dC8tVO2JIF2OCpM0qoZx3vfnrcFvJFVoukzmP1Cub/jh
	 AShRwzI7/NHK1aUYd8F0ylwrXcZVmRdMS8Amp8S8MzeYQ4sYLle3Eg6FwE3SzulJLx
	 Mbfwx5eZG5RXQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWddi5vN
  kg9f7OS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxzK9+zF5zirujfuJa1gfEQVxcjF4eQwANG
  iW2zVzFDOFeYJFZ+WsQO4exllHg84QWQw8nBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi989Y
  DXCAj4SSxc/AouzCKhKtC0+ywJi8wo4SvxtPMkKYksIKEhMefgeqIaDg1PASaL1hCZIWAioZP
  vRR2wQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYTYtTi8pSi3TN9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECQzelmOndDsblfX/1DjFKcjApifIu2/w0WYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  7KJz5OFBItS01Mr0jJzgHEEk5bg4FES4e2eDpTmLS5IzC3OTIdInWJUlBLnvQjSJwCSyCjNg2
  uDxe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8U6cATeHJzCuBm/4KaDET0GIGqacgi0s
  SEVJSDUz3Dbr2Ts7SqP3wau72Qu+4nBVffNdEuAb4MLBJu5tIT41dvPJs3KuD7Soyx66sc22f
  sPfXrBMqd38eN+L6oMPo/zzZTbBw1c3mz9qhxVvWcdTXVLbE3hVyVr19IrbqVlpvD597y/+Db
  0NunZ/27ucULo5Zz9P8G7M/xx9QztTmEr6fsXfVH8a4wpCk/7O3xmy/7jbxwCG3pudXWOU3lZ
  28Xfbv+c++F+mneybKCr/fclAgrH3RkZ+Gz2pPNd4VXqieYF8Yuppl4yF21sRVYRE29ns2Zjk
  sZL3V3Dfv+fZPTToXPB6nOCRxfTmqssyuov+uFoOt8yS5yJdzkue4nE+wynJZt/WEyeeo0K6H
  Gt5KLMUZiYZazEXFiQBpMW4YWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1676122423!447249!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20237 invoked from network); 11 Feb 2023 13:33:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Feb 2023 13:33:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AA78A7C
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:43 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9EBF273
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 11 Feb 2023 13:33:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.14.5 -> 2.16.1
Date: Sat, 11 Feb 2023 21:33:23 +0800
Message-ID: <1676122405-5945-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com>
References: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Fix a crash happening for python interpreter < 3.9 following a failed typing
 update.
-The accept-no-raise-doc option related to missing-raises-doc will now
 be correctly taken into account all the time.
-Add a keyword-only compare_constants argument to safe_infer.
-Sort --generated-rcfile output.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pylint_2.14.5.bb => python3-pylint_2.16.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.14.5.bb => python3-pylint_2.16.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb b/meta-python/recipes-devtools/python/python3-pylint_2.16.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.16.1.bb
index 738b9250c..7096e3b36 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.16.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "487ce2192eee48211269a0e976421f334cf94de1806ca9d0a99449adcdf0285e"
+SRC_URI[sha256sum] = "ffe7fa536bb38ba35006a7c8a6d2efbfdd3d95bbf21199cad31f76b1c50aaf30"
 
 inherit pypi setuptools3
 
-- 
2.34.1


