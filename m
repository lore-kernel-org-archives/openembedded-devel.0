Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B237C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 00:03:12 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com
 [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web12.48004.1658275385111538864
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 17:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=DFd41Nh9;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.34,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1658275386; x=1689811386;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=pbCqwpmREpQ7NUafj+y3WPC+oHfihV3v3YzranBzxB4=;
  b=DFd41Nh9XVpFxjAnhdaw7oWb6hmQTSMIi3M4V4DEPlyXdp6EgjDATReJ
   +goXt7fNI+vXIPgeWBZYa6g7FFfKsgzGVUTeuc37RSOHxvJi2Xy4tW1Ds
   eIvAofXqZ5XVu+cCN2b1BMjgesGuOKcVutu9XWMEXNSWfYQYE95QQfUE1
   LLOfyObnMADtpEmjrPajTz1KnH9HzQ3rPhML6fsmdQHfEMzYbbV4baJrp
   GTSkLWjWUV+WZMAgr1ZWsFssahCe8E78xOTAYowE2Bah3Lt7eUX/e8PTA
   YfEbSahi2cWfL5HuAfgoP3f0fkUdParpyBY9aZaLp4OVrWafZ7lFKY7oA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="60670370"
X-IronPort-AV: E=Sophos;i="5.92,285,1650898800";
   d="scan'208";a="60670370"
Received: from mail-os0jpn01lp2113.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.113])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 09:03:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5Yf0hvsxHqA6fpco612PZJFzh/4amPQce7/lk5FD+1Wt92Dey3mf6uRkJQlKn8XVdKOEsF7vue9Illh6deruIzzIjS6sggiH0kbUSbDA9Rw+L4XqQuy3L8rPOGU0Ob6RgH/gXmNAaaDEJyqvth9fYZnOC9eW6D4/GweqJUXh4v4X9edvgbY+tFTE/jdXcydwWMr4+4KNVfK9g8s+weEERYrDg1uZA/Gc6IqrawNK5h4NYk1fMiTUY+sKhZbnEPvoalVPRQNHErvU0apgiUy0S4/xfaAjIUd7wV3P1JC2CVwathWkn6+NTwZRrt3TRNj7Sh98aHjBW9TvO4IYqihag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbCqwpmREpQ7NUafj+y3WPC+oHfihV3v3YzranBzxB4=;
 b=dpcLpq1A1WfrWcqj0FMI0ESL31fs+Ui22pAalF9aJWdK60HohhJwMzUOnWtesdnC1OL7F91TVH3E/h4US54bqf5YxiNnwQ6V1wpon1nWhlHxJHlzskgX52fvHmplJvMzNeLuFfhGiUhtIHlUom8VLAE+JWI7XJvc8+i3m5hvyq8sjuzYih3WtGBGXNS0nc5u8xi/7MbsbiaepvoQneVSIQRuPNxsTWnuwBou+fw5QBarmKxCcaONYvp52VT7k1eZJbnjdwHyLN+fLdLteJPKDBeTtcWNOIf1tHl3rFS2oh3C46N7ueknYvkcwtYKjiYK3an8KpC2pSoWzk+jeYBUmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TYAPR01MB2192.jpnprd01.prod.outlook.com (2603:1096:404:3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Wed, 20 Jul
 2022 00:02:59 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::4c4f:9d9b:ae06:4299]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::4c4f:9d9b:ae06:4299%7]) with mapi id 15.20.5438.025; Wed, 20 Jul 2022
 00:02:59 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-perl] PATCH] logcheck: upgrade 1.3.23 -> 1.3.24
Thread-Topic: [oe] [meta-perl] PATCH] logcheck: upgrade 1.3.23 -> 1.3.24
Thread-Index: AQHYmzcNAFulodfzyU+Bd5YYtMgQ5K2Fs8sAgACtZiA=
Date: Wed, 20 Jul 2022 00:02:59 +0000
Message-ID: 
 <OSBPR01MB1845E9C4EA8ED5C0C3635A8CDC8E9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
 <1658211328-2951-4-git-send-email-wangmy@fujitsu.com>
 <3a331d56-ee77-c023-b0f9-2a96bae3098b@gmail.com>
In-Reply-To: <3a331d56-ee77-c023-b0f9-2a96bae3098b@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MzRjOWQ1OTMtMzgyMy00YjQ5LTg5YjgtZjcxZTc0ZTkx?=
 =?utf-8?B?MmIxO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0wNy0yMFQwMDowMTowN1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2aac725d-02fa-4f1d-2cf0-08da69e334ea
x-ms-traffictypediagnostic: TYAPR01MB2192:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kQGT+hnEHhP+VFRWjeBpp5WPmv0RfnQLr7Z99Y3vbK/PA8e2isbzMtyIUgDBF+zHheqSqWHKk0M2VE7jNFdAgESaCIijfGhXtWmNUGKQsqfHePdPQ0WqUxa7CVkU0Ik1cErSHP0+nrBhKa+wHvaz152yTHoc2uBqItbFEpJ17WickNlzaSpKfdqKA6TzVqHMcVy8vAxZRFWrCDpgcgkyj/kdHsnAyu17FAMBE9zYZbFksDfhjDbXotHB2zFuxAgF7Mv3EBRIYaZyZH3jNdD/74KzSYPQgWGM8cd/ISlDRe3salnxOe3gcCQ2y29BC93I53DnpY+BXRFe7ap6QzQwNBUtSKejC3ZSTw8BEVZZC+4QJht2TQ+06VWgAdH1OZhF14P+Q++hSd5skypeSo8owJ26uGijLNGbAyPkM1zENAGsfJR+wtx/U39V3mqEaoW7WC36x7HjoRWBC00pF0CkuWhW8XrlfnW3eR1sPJtwAi1dgwkTMye4COFl2m1pe3eA/yxFAjLeq3iUnPhvmw+M1KDjXXh9zUsqGZcvtFQF4ytNzg4XppMjG4I/uNKPskNLDyjV4gpUQ/WZtJOZBAoK/dI9KPL9R2y6lMon0a873nNDejGSgt/K2nqKtPaUi+1k7TTBsbt1v3S39Xe0d3QUTZbZ8yZCHfKBhVFi4T4B83RxKHDnNdSc69/Ed2uq/CyN9yNYTElrmT6QQc3ZsLGJz+HAfdTTaiKutW1CcAjPcyYzE7f/9/ETuZeCmO/RpCM0HiZt8Vrd0tn1qMA1fd8hP5/6Ms75u+J51rxFGMEykfnLWa7q7rGL6ntGDtT3KpZu0W4Ts1A3qzTvSUEsm1OtMiXNuWb1z0gPRSPBFGHn7eLn14pS+oX4QMzU8DuCOiSC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(52536014)(85182001)(8936002)(26005)(38100700002)(5660300002)(122000001)(86362001)(33656002)(186003)(38070700005)(83380400001)(82960400001)(478600001)(9686003)(53546011)(110136005)(55016003)(41300700001)(316002)(966005)(71200400001)(7696005)(6506007)(64756008)(8676002)(76116006)(66446008)(66946007)(66556008)(66476007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S1ZZQ0NUZFZIV3RCTmlQUW0yZ0xJKzNXaE9hd0thWmt2MmF1U0oyVlVmOHRW?=
 =?utf-8?B?MFNEUmIyanJPYWFyMDBoQk1HeDhrYy9yS3hHd1ZmaEJ5bFk3V2NOaUE3UG5U?=
 =?utf-8?B?c1JiaFBZS0F2NFpXM1I0d3BzWE0wZkdTR0VpVGdjMUI3dytCZFFLN096M3c1?=
 =?utf-8?B?ZXAyL0I5V1ZJSzZ4aVJoV2trczlDdXNXVWhwUUlyazAxaFdpMDJ6V1pxSCtU?=
 =?utf-8?B?Wmd5dk01am5rYVZjaVJ2N0pzMkJzY3p5ZENQYWVTZHlHT2l2c054ejRyaXgx?=
 =?utf-8?B?bWFZUmJYRXBxRFBSQXcxZmFVNDZac3BxNGx0SkpvZTZ0eVA4bm9kTEZkRzRX?=
 =?utf-8?B?TU5OZGc0L2JiWjQ5MDdiNlZwRCtQTytSVWhYMlZLQW9Od01qakV2OE5GdjV6?=
 =?utf-8?B?T3N5YUNIU0hCM0pRWldLOVUxemw2SG5uR3Zpc0ZRaUxseXZQNTYraDAxdnJx?=
 =?utf-8?B?WjRFZFVKYTJLdWdwREpxZFNmQ3NvcWZNRHlCYlhtZlc2a21nL0Q5U2YxR3Nr?=
 =?utf-8?B?T1Bjai9RZFdYcHcwUHluWUpYdjdHN05MUkR1dzdYeitNNmMrL1YwdjBtSFVB?=
 =?utf-8?B?RVdSc3FCWjZXT2VtNnNEVFA5dEcwcU1OZHQ2T0oydzNRMnloMmdMcnBBZzl4?=
 =?utf-8?B?dDRBZkFnSS9JL1JiV1ozbDZCYnZKUGJYU08rREdac2hkZ2FlbW9IV3g4QWlI?=
 =?utf-8?B?dCtBY1h0ejQrM0xwdE9jaHRYS0QzTmhFc1FxOWppYWpZUXAxMDRtczBMaUo0?=
 =?utf-8?B?M2NwajgyRWxXOWpKZGw0akVZUDR5MkM0UXdockFwTFhldlgvTlVXOHl1Wmp5?=
 =?utf-8?B?cWRkR0d0VUpxZXBTcmJoR1EvejRhYUtqRm1BWkc2MmpWTFBtOE00QWFwSHpR?=
 =?utf-8?B?MUNjNWpGVGdLaDVLOGRyRU1jaEpxcmFrek8ySkY5c2tqU3ZTS2IrOHJuOHRi?=
 =?utf-8?B?SFFaV3hBQ2Rpa1d4SFNkRjN3aXRDTkZNTUVlemRQRG94ZTdQRndEY0ZCaC9P?=
 =?utf-8?B?RVpCd1VINlJQbFU1ZHd3ZHJtdG92VkR2aHJRc1U3cXhqMktoTXBuQkZpMTBM?=
 =?utf-8?B?MW5sUnJ3M3RoVkJzVGtOYVJrbE5BZEVmZzc0dElNeGUwWnF5S3RHczZtdEhm?=
 =?utf-8?B?WExPaXk2RkRZUDQ2VTk5TmpURXhjRzNGNnJ2YXJvYldwbjFUeUFxaHRieEpt?=
 =?utf-8?B?QktqLzdmWTlHZlR4OHZjbC9Sa2V2VHZXNlBXT3VTVGZONytvK3VzTWNWWE9z?=
 =?utf-8?B?T1ZCQUpJSkpwN3BiZDFIRVRlS29Hclc2cUFJVXpNdnFUUXcwMmlhZGdMaEx1?=
 =?utf-8?B?d290TWFNUk1uQVBwQnk1eEVjOE1meHF2Sjhqci8yNWk1VTE1UkRKRUt0Mm1K?=
 =?utf-8?B?SkI3VzA0ZWMzdU9Id3R4UThaYTBjWmlaUXdENi9reVJRUkMxQXdRM2lVQThW?=
 =?utf-8?B?QXNSSEZMa1BmZldSN1FmZTJjcS91U2xtc2l3dTNoODhPYWh3WDdwak9ndlRy?=
 =?utf-8?B?SUh2WExmQW9kdlJ1bGkrY29kZnRPcTZwUytXM09BeHNneTlwK2hPUDN3Titz?=
 =?utf-8?B?c3VCUFIva1dLeStzaUUwYlhCRTRIWVVKb2lVUUphSFFiclliVno0SzMvdksz?=
 =?utf-8?B?RTFiVDQzQmhPM2drdG1oUXBHRDZTbEtsUW0zZWhoWDc4Q1Q2c21nNlozTHM5?=
 =?utf-8?B?RWsycTB3clRiVzV1a1UyTDl5RVY4eXM0ei90cTJGS1QwN251Z3l0M1pMdFJN?=
 =?utf-8?B?NHJ3RlQ4YXRmOWhaNmhVWXoxS20rMURiRWFGVE9jMkpiUWtFYlZnKy9ONnZ5?=
 =?utf-8?B?MXBneXFtbzJVbVVyUGJKd2dEdUVZT2pjdUJSVDVDQUtmN09lVG0yTFU1WnRG?=
 =?utf-8?B?QXVVUU1rbmwrRWp5emRzam81VzNYQkIwUENDZHRPNS9WV0ZHYnFtN2dqTzg2?=
 =?utf-8?B?enp4aCtlczhLQ2Zzem4rNklRc0JjNTR6VUQ0TDJJMWlIRkwxRU11SXArb3U1?=
 =?utf-8?B?MldBZlovdFVIYUthUDR5WDhYRk53OWlBQ29zNFlsa1puK3d4RERBWk1WV1Nz?=
 =?utf-8?B?WEhpbjBZZkd3N1piamdHK3ArNkprNmt1WHNlNDEzTlp3VXZrdHBvUWJKY1I0?=
 =?utf-8?Q?Vi3lBYr41Hhrb7hnWaS1EDoC5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2aac725d-02fa-4f1d-2cf0-08da69e334ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 00:02:59.2445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tb7Pe3LNuSvm2Z+typGj3TxBawj+sHrTsKrOmurSYv87GaTIP8eASGtBLrgU2NFTzjSiIhYxzN8/mcefGJkBCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Jul 2022 00:03:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97903

VGhlIGRpcmVjdG9yeSBuYW1lIGNoYW5nZWQgYWZ0ZXIgdGhlIHNvdXJjZSBwYWNrYWdlIHdhcyB1
bnppcHBlZC4gDQoxLjMuMjM6IHRoZSB1bnppcHBlZCBkaXJlY3RvcnkgbmFtZSBkb2VzIG5vdCBo
YXZlIGEgdmVyc2lvbiBudW1iZXIsIGl0IGlzIGxvZ2NoZWNrLg0KMS4zLjI0OiB0aGUgdW56aXBw
ZWQgZGlyZWN0b3J5IG5hbWUgaGFzIGEgdmVyc2lvbiBudW1iZXIuIEl0IGlzIGxvZ2NoZWNrLTEu
My4yNC4NClRoZXJlIGlzIG5vIG9mZmljaWFsIGV4cGxhbmF0aW9uIGZvciB0aGlzIGNoYW5nZS4N
Cg0KwqAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRGV2ZWxvcG1lbnQgRGVwdC5JDQpOYW5q
aW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpIE5vLiA2IFdl
bnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUw6ICs4NisyNS04NjYzMDU2Ni04
NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlA
ZnVqaXRzdS5jb20NCmh0dHA6Ly93d3cuZnVqaXRzdS5jb20vY24vZm5zdC8NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
Pg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDE5LCAyMDIyIDk6NDEgUE0NCj4gVG86IFdhbmcsIE1p
bmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1wZXJs
XSBQQVRDSF0gbG9nY2hlY2s6IHVwZ3JhZGUgMS4zLjIzIC0+IDEuMy4yNA0KPiANCj4gDQo+IA0K
PiBPbiA3LzE5LzIyIDI6MTUgQU0sIHdhbmdteSB3cm90ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBX
YW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL2xvZ2No
ZWNrL3tsb2djaGVja18xLjMuMjMuYmIgPT4gbG9nY2hlY2tfMS4zLjI0LmJifSAgICAgICB8IDQg
Ky0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiA+ICAgcmVuYW1lIG1ldGEtcGVybC9yZWNpcGVzLWV4dGVuZGVkL2xvZ2NoZWNrL3tsb2dj
aGVja18xLjMuMjMuYmIgPT4NCj4gPiBsb2djaGVja18xLjMuMjQuYmJ9ICg5NiUpDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvbWV0YS1wZXJsL3JlY2lwZXMtZXh0ZW5kZWQvbG9nY2hlY2svbG9nY2hl
Y2tfMS4zLjIzLmJiDQo+ID4gYi9tZXRhLXBlcmwvcmVjaXBlcy1leHRlbmRlZC9sb2djaGVjay9s
b2djaGVja18xLjMuMjQuYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDk2JQ0KPiA+IHJlbmFtZSBm
cm9tIG1ldGEtcGVybC9yZWNpcGVzLWV4dGVuZGVkL2xvZ2NoZWNrL2xvZ2NoZWNrXzEuMy4yMy5i
Yg0KPiA+IHJlbmFtZSB0byBtZXRhLXBlcmwvcmVjaXBlcy1leHRlbmRlZC9sb2djaGVjay9sb2dj
aGVja18xLjMuMjQuYmINCj4gPiBpbmRleCBiNDBkNTJhYjk0Li5lYTNkZDVhNGM5IDEwMDY0NA0K
PiA+IC0tLSBhL21ldGEtcGVybC9yZWNpcGVzLWV4dGVuZGVkL2xvZ2NoZWNrL2xvZ2NoZWNrXzEu
My4yMy5iYg0KPiA+ICsrKyBiL21ldGEtcGVybC9yZWNpcGVzLWV4dGVuZGVkL2xvZ2NoZWNrL2xv
Z2NoZWNrXzEuMy4yNC5iYg0KPiA+IEBAIC0xNCw5ICsxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM5M2MwNTUwYmQzMTczZjQ1MDRiMmNiZDg5OTFlNTBi
Ig0KPiA+ICAgU1JDX1VSSSA9ICIke0RFQklBTl9NSVJST1J9L21haW4vbC8ke0JQTn0vJHtCUE59
XyR7UFZ9LnRhci54eiBcDQo+ID4gICAgICAgICAgICAgIGZpbGU6Ly85OV9sb2djaGVjayBcDQo+
ID4gICAiDQo+ID4gLVNSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICJhMjE4OGJhNTQ5ZmZmNDQxMmM4
MjA3NGIyNzE4ODRmZjY2ZDI1ZjNmZGIyYTQxOTE2ZTgxN2NlNjc2ODU1YjI5Ig0KPiA+IC0NCj4g
PiAtUyA9ICIke1dPUktESVJ9LyR7QlBOfSINCj4gDQo+IFMgaXMgbm90IG5lZWRlZCB0byBiZSBz
ZXQgaGVyZSBhbnltb3JlID8gSXMgdGhpcyBjaGFuZ2UgZG9jdW1lbnRlZCBzb21ld2hlcmUNCj4g
DQo+ID4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICI1ZTMwNGFkZjI4ODA5NjdjM2IxNTViY2Y5
OGU0ZjA4MDk0MTdhMTZiZjkxYWRiMzcyZmEwNjVmMzhhYjJjMGNmIg0KPiA+DQo+ID4gICBpbmhl
cml0IHVzZXJhZGQNCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3Jv
dXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCM5Nzg5NCk6DQo+ID4gaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvOTc4OTQNCj4gPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85MjQ3NzY0
My8xOTk3OTE0DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1Yg0KPiA+IFtyYWoua2hlbUBnbWFp
bC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0K

