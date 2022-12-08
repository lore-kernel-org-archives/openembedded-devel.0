Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58ACC63708
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:12:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.6998.1670479958906931292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NCIiAeiV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479957; i=@fujitsu.com;
	bh=aXP/qb0rYUHoKaDzxr1CrO41EVHrrvLnFss7OdVXzjM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NCIiAeiVQuXBk6i0/qRLp8D4+1lW4+RpOWdfickhb6hP73ftlidwDhJ8Bp8FruL/G
	 sIMz6Ksmn6TCX3CgcMeN3cVXlx4HmhAmnGTub8MhRlrLEmkst56FU4pD1w4YTF7UD6
	 qs/rhpRCcLIohQ7yE4lvNPv42/lFgBiP3FIJIz/2zVzTYCTg/1t29xWpi75DRrtYkW
	 WwxCE17uHHmokqr55oGqznpV/2Osw8WGaypKM9vATswtxX83jZ4lcYoS62YbRVLuHT
	 GkCfPtoPMrRKZQ+5kGeNwDpwQ8bpL8/d/6Psov6XZO/PD5pR/8M5R+1Do8Z9fePN/t
	 OnQdjcU9fpBDQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpBvSMDH
  ZYPVFbYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePU9qusBfd4Kj5ffMnYwLiDu4uRi0NI4CGj
  xMt5G9ggnCtMEre/32SFcHYzSsxqOcLexcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgK+EjNOTWQEsVmA4nse7wWzeQUcJZ53bAazJQQUJKY8fA/WyyngJHHy+CGwmUJANW+3nG
  OBqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhanFpUllqka6GXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeX
  WrKJERi8KcXqW3cwHl72R+8QoyQHk5Io74vq/mQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwXK
  icmCwkWpaanVqRl5gAjCSYtwcGjJMLrWwuU5i0uSMwtzkyHSJ1iVJQS511XB5QQAElklObBtc
  Gi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd46kCk8mXklcNNfAS1mAlp8738vyOKSRIS
  UVANT9E3+OPP/hRm7enau9w5yrirg9TqfYvl8SvveX6wb5q+a8/m6sbKd65nUAw/9Nr+sTDjy
  LUspIOTMfqaSEv2FXLlXHVb8/cXIcbOZbw+D/6L7DnO6fgZmz+z+7yEWlW/mN0XYdULbKo9gX
  84pkc2G5TM4ObI2CWUvWrVlKq/bhOd119Z7uDe9E1xjeu3SdD3P99MLf7DNfFGWq2TnsJ2RnW
  uVudC965WBD7ZoH/qYEcHsXmF26P7Vrnp+O8/8uEyvqumzmKyVX0QYF50VrvgWXDPvzPFVIqL
  dBy7Erj8VxT/7W/SzY0UNTn6vvJ+vL59YcmTt0QvMGda/nsT9nGigyLV686dNCbl/2+yE1DWU
  WIozEg21mIuKEwETVr6IWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1670479956!17245!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28127 invoked from network); 8 Dec 2022 06:12:36 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:12:36 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6E2FA1B4
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 62BD91B3
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:12:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.5.0 -> 5.6.0
Date: Thu, 8 Dec 2022 14:12:04 +0800
Message-ID: <1670479927-1286-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479927-1286-1-git-send-email-wangmy@fujitsu.com>
References: <1670479927-1286-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 06:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99987

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Adopt jupyter releaser #806
 Use base setup dependency type #805
 More CI Cleanup #803
 More maintenance cleanup #802
 Add project description #801
 Bump actions/setup-python from 2 to 4 #798
 Bump actions/checkout from 2 to 3 #797
 Bump pre-commit/action from 2.0.0 to 3.0.0 #796
 Bump actions/upload-artifact from 2 to 3 #795
 Add dependabot #794
 Add more typings #791
 Format changelog #789

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-traitlets_5.5.0.bb => python3-traitlets_5.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.5.0.bb => python3-traitlets_5.6.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
index 6ac17f5ec..1e82dd341 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
-SRC_URI[sha256sum] = "b122f9ff2f2f6c1709dab289a05555be011c87828e911c0cf4074b85cb780a79"
+SRC_URI[sha256sum] = "10b6ed1c9cedee83e795db70a8b9c2db157bb3778ec4587a349ecb7ef3b1033b"
 
 inherit pypi python_hatchling
 
-- 
2.25.1


