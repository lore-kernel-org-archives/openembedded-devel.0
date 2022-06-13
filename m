Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CAEC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 07:08:25 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com
 [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web09.2945.1655104101689511927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 00:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=Mt8yJIL0;
 spf=pass (domain: bmw.de, ip: 207.54.69.29,
 mailfrom: prvs=1562a60c8=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1655104101; x=1686640101;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8PPAh/kOdDB8xo3ul2BugsIz6za6N/jwYmieEyatqpA=;
  b=Mt8yJIL0hu7Gqb8FZ9VFf9BnN9rzze8mWDitjVzeE5sklothb/6jzbn2
   Nu/oB6K6ECBfT/Ppf3P6LXP5ovMVBeljQRdNiY/Ss0I6iekmI1vKTbMma
   L6wCCeO2NGnN9I5P5zVS0UcVjJKNoaui6qlgNTlQKQxOmpMZA0Trrv9g8
   k=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 13 Jun 2022 09:08:18 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw1.muc with ESMTP/TLS;
 13 Jun 2022 09:08:18 +0200
Received: from smucm26k.bmwgroup.net (HELO smucm26k.europe.bmw.corp)
 ([160.46.167.27])
 by esabb4.muc with ESMTP/TLS; 13 Jun 2022 09:08:18 +0200
Received: from SMUCMP08D.europe.bmw.corp (10.30.13.70) by
 smucm26k.europe.bmw.corp
 (160.46.167.27) with Microsoft SMTP Server (TLS;
 Mon, 13 Jun 2022 09:08:17 +0200
Received: from SMUCMP08E.europe.bmw.corp (2a03:1e80:a15:58f::1:24) by
 SMUCMP08D.europe.bmw.corp (2a03:1e80:a15:58f::2247) with Microsoft SMTP
 Server (version=TLS; Mon, 13 Jun 2022 09:08:17 +0200
Received: from SMUCMP08E.europe.bmw.corp ([10.30.13.71]) by
 SMUCMP08E.europe.bmw.corp ([10.30.13.71]) with mapi id 15.02.0922.027; Mon,
 13 Jun 2022 09:08:17 +0200
From: <Mikko.Rapeli@bmw.de>
To: <alex.kanavin@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] polkit: switch back to mozjs but leave
 duktape as PACKAGECONFIG option
Thread-Topic: [oe] [meta-oe][PATCH] polkit: switch back to mozjs but leave
 duktape as PACKAGECONFIG option
Thread-Index: AQHYfuyehtaj9TZF0UKjV3bkG7924a1MxHwAgAAE1QA=
Date: Mon, 13 Jun 2022 07:08:17 +0000
Message-ID: <YqbiXqWbH7qlDrL5@korppu>
References: <20220613061205.27663-1-mikko.rapeli@bmw.de>
 <CANNYZj-kaVVKuc_mDfsufOT8qPAR0Dz0=8zztDtF_FLU-=_cAg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-kaVVKuc_mDfsufOT8qPAR0Dz0=8zztDtF_FLU-=_cAg@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA45903A9FB83D4ABF59FBFF60F3FF98@bmwmail.corp>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 07:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97479

SGksDQoNCk9uIE1vbiwgSnVuIDEzLCAyMDIyIGF0IDA5OjUwOjU2QU0gKzAzMDAsIEFsZXhhbmRl
ciBLYW5hdmluIHdyb3RlOg0KPiBTdGFibGUgYnJhbmNoZXMsIHllcy4gTWFzdGVyLCBJ4oCZbSBu
b3Qgc3VyZS4gSXTigJlzIGJsZWVkaW5nIGVkZ2UgYW5kDQo+IHNvbWV0aW1lcyBpdCBibGVlZHMs
IHN1cmVseSB3ZSB3YW50IHBvbGtpdCBvdmVyIE1vempzIGFzIGRlZmF1bHQ/DQoNCkkgZG9uJ3Qg
a25vdy4gSW4gdGhlIGVuZCBzd2l0Y2hpbmcgZnJvbSBtb3pqcyB0byBkdWt0YXBlIG1heSBicmVh
ayBydWxlcw0KYnV0IEkgdGhpbmsgdGhlIHN3aXRjaCBpcyB3b3J0aCBmaXhpbmcgdGhlIHByb2Js
ZW1zIGluIGFueSBwcm9kdWN0Lg0KDQpDaGFuZ2luZyBmcm9tIGR1a3RhcGUgYmFjayB0byBtb3pq
cyBpbiBraWtyc3RvbmUgc3RhYmxlIGJyYW5jaCBjYW4gYWxzbyBiZQ0KY29uc2lkZXJlZCBiYWQu
DQoNCkNoZWVycywNCg0KLU1pa2tv

