Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F94C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 10:14:35 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com
 [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web08.9003.1648116873870213203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 03:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=dAm6xfbF;
 spf=pass (domain: bmw.de, ip: 207.54.71.126,
 mailfrom: prvs=0757247b9=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1648116873; x=1679652873;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=TSBT/eQsjlXA1i6TMHODU6FdEE9fGdu2tpZhJlYnMko=;
  b=dAm6xfbF0K7ggFsbsnONSN5iB3RTkSq64POVXZZVA7xYSlOgole7xwjR
   D+XzTqe+0InLuQ+pQM3p51LZYFLU8IzPLb5R5Otx2SwamFnzfUC4MHas5
   +C68fjA6j7L3rbH5rZoc97N0vtr9izlAJcNiJl4KoJ1OZQVVLnHDUkjMs
   s=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 24 Mar 2022 11:14:30 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
 24 Mar 2022 11:14:29 +0100
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp)
 ([160.46.167.68])
 by esabb2.muc with ESMTP/TLS; 24 Mar 2022 11:14:30 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Thu, 24 Mar 2022 11:14:28 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.033; Thu,
 24 Mar 2022 11:14:28 +0100
From: <Mikko.Rapeli@bmw.de>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] polkit: add patches for CVE-2021-4034 and
 CVE-2021-4115
Thread-Topic: [meta-oe][PATCH 1/2] polkit: add patches for CVE-2021-4034 and
 CVE-2021-4115
Thread-Index: AQHYP1ui4IXTv1Qqqk6/mllZlOdHw6zOQGgA
Date: Thu, 24 Mar 2022 10:14:28 +0000
Message-ID: <YjxEhI4Zxhmfi/Qm@korppu>
References: <20220324084536.25647-1-mikko.rapeli@iki.fi>
 <20220324084536.25647-2-mikko.rapeli@iki.fi>
In-Reply-To: <20220324084536.25647-2-mikko.rapeli@iki.fi>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D8264331A9A89A43BEC3F0F3EB989A50@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 10:14:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96191

On Thu, Mar 24, 2022 at 10:45:35AM +0200, mikko.rapeli@iki.fi wrote:
> +++ b/meta-oe/recipes-extended/polkit/polkit/0001-pkexec-local-privilege-=
escalation-CVE-2021-4034.patch
> @@ -0,0 +1,82 @@
> +From 85c2dd9275cdfb369f613089f22733c0f1ba2aec Mon Sep 17 00:00:00 2001
> +From: Jan Rybar <jrybar@redhat.com>
> +Date: Tue, 25 Jan 2022 17:21:46 +0000
> +Subject: [PATCH 1/3] pkexec: local privilege escalation (CVE-2021-4034)
> +

Patches are missing Signed-off-by lines, I'll add in a v2.

-Mikko=

