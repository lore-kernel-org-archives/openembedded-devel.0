Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B7AC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 00:25:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.4904.1644279951795010182
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 16:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KO97ljNy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644279949; i=@fujitsu.com;
	bh=aJJ2kEIQ9A6mbU85PMk6hqBO8jnXHH4lgX5YUWMjchM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KO97ljNy31oTzDI6Ix+q/degS0psIuxlYXcp53H4RJAaOPzdnx1rX5Xi+bUdN7c9k
	 jEnXQKdH3otpQopeLwbXPbP9/AYx9SFDvAe2XYxWLw+lVaUf5c//WPaQVX3VlRmbyx
	 J6YXliS9RIfpXajVEzU8K6FyWGZw8KyS0LgILmzovqnuiz8lwUycQag4WjLFSBT6bp
	 7cIhWXbE9AeGyE4+nmftFrx+zZtZGerKIDp8V/z6o4dQ4a0MAC0Vco/3fbaYgdFVUu
	 GRVPxJNiUvOSBEb5Pbzbqo+cExrhNBHWnQDwc0uMMXfMjXQN0kcS2EPqTYT89uKZq+
	 ttXr8+bBw1X3Q==
Received: from [100.115.2.253] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 9A/55-28285-C88B1026;
 Tue, 08 Feb 2022 00:25:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSbdnB2O
  SwdwuXouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePl0ylMBcs5Ky6+3cjcwLiXo4uRi0NI4Amj
  RO/5FUwQzgUmiQ1fl7BDOMcZJe5cWsjcxcjJwSagJjH91g1WEFtEQF9i6ew9YHFmARWJF7972
  EFsYQEviac7e8FqWIDiX36cYQKxeQUcJZpm7GUDsSUEFCSmPHwP1ssp4CSx+OsRsHohoJq9rQ
  eZIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJhVlpmeU5CZm5ugaGhjoGhqa6hrqmlrqJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym
  56To5aWWbGIEBnFKMaP1DsaOvp96hxglOZiURHkz0xmThPiS8lMqMxKLM+KLSnNSiw8xynBwK
  Enwnt0OlBMsSk1PrUjLzAFGFExagoNHSYRXGyTNW1yQmFucmQ6ROsWoKCXOawqSEABJZJTmwb
  XBovgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeBpApPJl5JXDTXwEtZgJa/HXRv0SgxSW
  JCCmpBiaHsiksGfFl9ZOmcy1el6m0THj/gzvxi+ovOT9bciv/bq6T3yr16NfvDYt3hObvjxQI
  ELpd9uRP8GMdVTWf87FmZ395v2M0UN8iZaZ2XkSYffPVOecPnK9TmyqWcb9lCs9bEV8xniMH7
  8Vtv1I2RzfrkynnTtuA7uWy4YaFmsr3Kl2WLSiebdKWa76hVSBvzVvzg5MdW2fNt/C49cPc/u
  w35xun5jJxWTf6p07RYnZpLJr/RKHMTrLAMPJO2ZX7+/j3BdlP2m/px69a8IDnm6Lkxx9K2wU
  m5E9dUD/vdI/I5lK/exveBL2pEXpwWuZqeL2jmOrkt3dYPod1JzE+dEvyfHrEUV3yzqTnuvv2
  ZSixFGckGmoxFxUnAgCGcHheXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-591.messagelabs.com!1644279947!24146!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14268 invoked from network); 8 Feb 2022 00:25:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 00:25:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C1D0F10044D
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:25:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B52B010033B
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:25:47 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 00:25:32 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.4 -> 5.9.5
Date: Tue, 8 Feb 2022 08:25:08 +0800
Message-ID: <1644279908-4266-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
References: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 00:25:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95253

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../strongswan/{strongswan_5.9.4.bb => strongswan_5.9.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.4.bb => strongswan_5.9.5.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
index 2b7a7a2410..dab2fd1497 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518"
+SRC_URI[sha256sum] = "983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


