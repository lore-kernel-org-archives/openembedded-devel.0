Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56028CCA47C
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:36:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.81274.1657003009505330936
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nf05Bi1/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003007; i=@fujitsu.com;
	bh=A5uAQJdxAwdNg74I0OUggleDce2d/+Olq/VZ8VRWyZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nf05Bi1/+F/ZOHF341z8ChAUiZ033mgA7+fjLBHjLV6lUmHetwRWNAts58Zw29K9Y
	 bupGKRWbhUAhJTe+yqRCrwi6QFLQBMDgwqGFO9PqvNcNSHIQhjLsGOVMtQ/g8R01c/
	 j4jVVfVB6LjQ4ibYSp2/nmIj1Ffh0ls/ZGI7LwDvjH/2VeZbhgYFxKihd7qKtB56BO
	 mZE+Lk1n9EHiwH92vDivVTCzgqFtov8zKH/x+chFzTEt/iCitAL09IqIbzZn7lId7F
	 JtJE3dzyS/dEPJLhB5yWwTIsTBfxuPSnvJhWs3HCB+ASxFQ9Z7ako+XUZqvqEGVS8u
	 o5mtq61WBpFNw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSff/7cN
  JBtu3C1pcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlH36kWXOSu6D0ykbGBcTtXFyMnh5DAE0aJ
  E09quxi5gOzrTBJnP/1hhUjsZpTY1CUIYrMJqElMv3UDLC4ioC+xdPYeZhCbWUBF4sXvHnYQW
  1jAU+Lr1hlMIDYLULzh6DpGEJtXwEliz5KnbCC2hICCxJSH78F6OQWcJfZt6mWD2OUk8fLGAS
  aIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxIwZ26BmqklcPbeJeQKj4Cwk7bOQtC9gZFr
  FaJ1UlJmeUZKbmJmja2hgoGtoaKprbKRraGSml1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmb
  nJOil5dasokRGMIpxQp1Oxivrfypd4hRkoNJSZQ37urhJCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvMxXgHKCRanpqRVpmTnAeIJJS3DwKInwrjgNlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl
  6qlDjv7ltARQIgRRmleXAjYLF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw79/rQFN4MvN
  K4Da9AjqCCeiIG1UHQI4oSURISTUwOVvXt2hctg4+dd234CLbZ4etVTP/hlTN8T1oZVL/ePnN
  //9WaaRcXyVSl3IwVOf1u3crjdWj/iuZKujynRV5nS4XcOy+iYrKt64VfltZZbmcIk628D6uc
  /KaZ3vh6u+cbRkVmhJM8kuzD9wXcdoS2Hgty+REwd7HdfrZRU7OLG+/in50yfh5MP2+TIGIuj
  /TI1EvT0eORXtOLXmzcGFkplSU9mx29YKS6xr3A7MOd7YcuvBir9DWiNWyzK21F++b2d8+7yH
  sMFvi/HeddVtsdeZL7Pi29wPL2laVZRYqjAcOJGw+ssIs4f7LPWozt3flPr3D58wm3Xkoyd1R
  bVf5UxOXyZoVxnwG7GelDqUqsRRnJBpqMRcVJwIAfhklvGgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1657003007!44164!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4202 invoked from network); 5 Jul 2022 06:36:47 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:36:47 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 055FA1000C2
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:47 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id ED114100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:36:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] geocode-glib: upgrade 3.26.2 -> 3.26.3
Date: Tue, 5 Jul 2022 14:36:19 +0800
Message-ID: <1657002982-14427-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657002982-14427-1-git-send-email-wangmy@fujitsu.com>
References: <1657002982-14427-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:36:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97704

Changelog:
===========
This release adds support for libsoup 3.x. To use the libsoup 3.x build,
applications will need to be adapted to look for the "-2.0" version of the API.
This allows both native and interpreted applications to select which version
of libsoup they want geocode-glib to use as the backend, and for both versions
to be installed in distributions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{geocode-glib_3.26.2.bb => geocode-glib_3.26.3.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/geocode-glib/{geocode-glib_3.26.2.bb => geocode-glib_3.26.3.bb} (74%)

diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.3.bb
similarity index 74%
rename from meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb
rename to meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.3.bb
index df401f729..9783dade1 100644
--- a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.2.bb
+++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.3.bb
@@ -14,7 +14,6 @@ DEPENDS = " \
     libsoup-2.4 \
 "
 
-SRC_URI[archive.md5sum] = "e1ef140a11a543643d170dc701009e39"
-SRC_URI[archive.sha256sum] = "01fe84cfa0be50c6e401147a2bc5e2f1574326e2293b55c69879be3e82030fd1"
+SRC_URI[archive.sha256sum] = "1dfeae83b90eccca1b6cf7dcf7c5e3b317828cf0b56205c4471ef0f911999766"
 
 EXTRA_OEMESON = "-Denable-installed-tests=false"
-- 
2.25.1


