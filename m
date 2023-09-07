Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD6AEE14D0
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 08:33:37 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web11.8560.1694075610881042263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 01:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=CaKs2uQO;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.101, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1694075612; x=1725611612;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lmbI0AO4M67gepcZq20s3XezVuF0dh0nmGWtHYEH2Q0=;
  b=CaKs2uQOI0Aazb6lg6OUHsOKA3vhuhVOsuKPztO/TG+LCox+md3yRHI6
   rA6hUZIopf6Kndo2guC+u7f4raMpKprbLa30l77xMeO7bXlmL80kkSHUj
   2BcO55hQ03rrszF7UCyr0IDTmrURs7DHXhfgiOnAmloCfsbj5UkpLqfOK
   ZqUuihzqcpZczygemk/144jBfY8r8Tl1l5gBr5ZrXF4mZynUKyGcAbugd
   uGERntoQDU9+uSK62VcXEtNDgGJT7o4gvw7KndoKaeXjfeU9O7EPUobGq
   fZ+WBPZh1DJvoovmvComSrehty2TnJAoVohlheglfl4AWQ0py4Ymvv1J8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="94136266"
X-IronPort-AV: E=Sophos;i="6.02,234,1688396400"; 
   d="scan'208";a="94136266"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 17:33:29 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWWHmz8MVVtkdY9kA3so0BXD7697iyEaS0wfx4k4qV3SHDNe14k4hEKRMWo4K/sBRUek33gvD7WpdekevyaYCAgicTITYOQR95t5yOD2dYHrfUnJB8TAe/O+cS5Xv9NUyl9sCxoetCLaXHNHspM7nZpEdenYzH18AurXjn99Q8cBjkhzLEkQ8iqfYQ6mhjik7NwVGZE4URwLwpYsGOA0gxjiJwSBqJm1AjHueVb/1Z2l94RIZuKvqkH3+MHma6WJQoWM5OHgpbHVpmpbh0faaOo+yNTnxQj+OabQN1kaddkMjWhoRcdzEnUdSTibNqPA+uXjRj5CqrBAwoPPyc5/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmbI0AO4M67gepcZq20s3XezVuF0dh0nmGWtHYEH2Q0=;
 b=d6LWpQI1fDo5e5mVGPXOSrcmc3RuOw1q/dzZ164dazwR9FdBsk0pnYeME8m6ZxtVlLGBoSutXWV6gyLT3HCN3b0Rh6oCIr3DgnkBa4mVYadCPCE/mj3LxIQ6I+MfVO49UnWFBK5meI3RUxTyIzsaaCt9O6BSVeaVBqG2MM0KDh+9/Bz8HjUV+o8kta7rM/CPSXqnjRqrgcXNP6lgtGjhe328LGCaIDPkyPg8Tqqo4vdfVknZEF7V7QoV1ft9zr4OwQdFs9LsZRmGV71mmP9JGNqcN0eOAt/SvPEhH0GdI8/FWQ02K033nTqiosu+FDZYID/21a2EEAcC9aMw3ozb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS3PR01MB7969.jpnprd01.prod.outlook.com (2603:1096:604:162::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 08:33:25 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a36c:a5a6:13d8:8a41]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a36c:a5a6:13d8:8a41%3]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 08:33:24 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.10.0 -> 2.11.0
Thread-Topic: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.10.0 -> 2.11.0
Thread-Index: AQHZ4GToUFjUq+ouHEiM6aFMBl/bbrAOuyiAgABPxqA=
Date: Thu, 7 Sep 2023 08:33:24 +0000
Message-ID: 
 <OSBPR01MB184533CAFD14318A563F2685DCEEA@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1693965188-13918-1-git-send-email-wangmy@fujitsu.com>
 <CAMKF1spNnQ+GT-ju4OQ1b0yGsOROkHh9GE7tU=L_Akgw_U==7w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spNnQ+GT-ju4OQ1b0yGsOROkHh9GE7tU=L_Akgw_U==7w@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZTk5OTA0NDctOTA3NC00NjNmLWE4Y2QtZWQ1ZTBhYzdk?=
 =?utf-8?B?NjIzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wOS0wN1QwODozMjozOFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1845:EE_|OS3PR01MB7969:EE_
x-ms-office365-filtering-correlation-id: 8ba75ed2-2902-4d21-11e1-08dbaf7d1a20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vtAlH+qeXmtrysEOARnTWECo9vk6K7rKQYzzs+kxIN1E6IgVokiEibyHClU0Mo+g4PlfymGAm48WsHpTpP3BqiWHloWsbD8cSYSQSNq0dbbaBvqfWmfojQIANneYv+oJMW9PctZTmMaIvTgmnOchaXWTYJ21vwZmQpG1R3VnYzZIA5HOEQhRMQIBg/vxBAhmPLWeICRZyXEZQ8KhZ22gJU6xBUYOAoIsBHmIYO2iY0D9JF7mgQysUWhad3csm4DYheVX7gqhmNqQr4o32XaVM1TTNOrFHJ81aEB5M7EGy4TT6IpXI10LwAP20Y4vnxvq+cIDXgBMqwy8rAMmNNo4+g9ns9zduERO6sHx85PH6qD1bm4ZcK/HAIJlLH2jnZ1dc9WDRRxs0Ofh7ydy2qqyrI4KpaqFtYcUUZ5Oc6cCqKp0Ah8vdSOY/dhINb5NPYcWA15+oUHh7tUtYITPmqOPCjT15zUNxeLr/rO9GhkR17SwRR2iQclpD51ldhUX9hhPo6U9j/+palkX8l1TDDqJj5raSHEG8U9Fxh9Wgz4A3Z/5DSQP5IMb5ZvvewbmmtCkyZoAIAgxYbiW3vbCCd3SjJ5C8ymRUo5ykitzQc6r0HfoRUJrqAl83Ydod8tK4rb+GbdK+f+5obg5OJflkFzImb+D6GJqvbW9XGwogLnK0k0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199024)(186009)(1800799009)(1590799021)(83380400001)(9686003)(53546011)(82960400001)(85182001)(1580799018)(52536014)(6506007)(5660300002)(8936002)(64756008)(4326008)(8676002)(2906002)(33656002)(6916009)(41300700001)(66476007)(316002)(66446008)(76116006)(66946007)(66556008)(7696005)(966005)(478600001)(71200400001)(55016003)(122000001)(38070700005)(38100700002)(86362001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WmdyejI3STRnSEphRnhiMGlxT0l3WDlNYnBpL2x2RzJzRWJIdkt1VHk2ZEJa?=
 =?utf-8?B?aVFRZGc4aTRkYTNiTmFIcHJhZm5yOU1WbVhhdjF1eURuamt6N29KYThtQmh1?=
 =?utf-8?B?M1RhTEVKZ3NBZjQ0NFZWMWRBYjN2S3FXZ092NFQxbTVFUVdhWG9BYjI0aVFQ?=
 =?utf-8?B?QS9PTGZIbmtmamVSeWVkeU9sVDkxb3hBRGowTXJzelBVSUNIMHRyb3ZxNUR6?=
 =?utf-8?B?cGxuUW1uMHllZ0xzTUNFQmRnQXk1eWkvUXNwWjBCTW9aTFB0NEpnTDZsaGw3?=
 =?utf-8?B?WmRhU3RSUHpZK3c5R1laSGFYOGFTZ3NSRVhkUERIWk1vRHBKUWYxS2pQQ1pi?=
 =?utf-8?B?VGlnRXZHSlo2emQxL2tsQituV3JrbEVBQm45cFBoZlNOYy9aa0FHUDFuTGtq?=
 =?utf-8?B?aHUzRWRxWWNNa0N5ZG9tZFhmMjE2bnJjbWZNZmhVc1liMkNYeEpsZGVXUzBs?=
 =?utf-8?B?NWxVL04waUozNEFjU2lhTnpSWjNBa3BlU3J0cFBuSFJHZXJuV1BmeFErNWhj?=
 =?utf-8?B?Z09BQmNmOU5hZGxjdGRIaHlobmhkMXNwZm1CVnRRZDNDQWZrMVQrald3ek1r?=
 =?utf-8?B?SDVXTjJQaE8zQzRySndUQXVITTNJTk9rVHlEejBPd3RESDdMVUVDUTFxNEpM?=
 =?utf-8?B?bDVLRU92aHh0WnRBc2IvM2F2WW1HZjBDa2JCUDlkeUptWVdrMXFjQWo1TDhK?=
 =?utf-8?B?OGVMZG1ydDF1Rm9tdWlhRDhkcFJYd3dENktoY2E2L01wN1BtV0hvdUhELytz?=
 =?utf-8?B?MDdac09CbnZ5ZmJhZWFlR0xuSFBEeUZwaC83clE3ZGRIZ3FiVDl2L3JhM2Jx?=
 =?utf-8?B?WUNHNDhTZ2VPMWQ4aER4eG9xWWtRTHROUnJWdVh2WEN3VnRLNjljeS9rRFhz?=
 =?utf-8?B?NWlWTE5WMkUrRGJTT3c4ekh4NkV4Y2NqQmh2MW5IVEZLY0Y1aEV6SEhMbTFn?=
 =?utf-8?B?N2tHUmMyV242cXJuSTlSRVNGQjY1eEExS2dwRWVwdEFhekpwQWdwR296aHN6?=
 =?utf-8?B?d01TVUxxNU9ZYjVldTVQYlNYVzRGV2JQd2p5YnNnTy84M0ZBanhKaVBXL29Y?=
 =?utf-8?B?djRUcVBvVzVzTWI4YU1iU05Nd0UrRmZjaGJaS3U1cEJpckxPTWJ6VGxHdUJY?=
 =?utf-8?B?alY5dzNKbisyTEdJVXQyMXRjN09OcDA0SzRzNitGV3JydnhuVVA3cGZENEwv?=
 =?utf-8?B?dTNnbE5KcEl5MWw2SUhNME1NK3lTVUx1YWhOYyt4bnpGVUU2RjV2cWR0MTdp?=
 =?utf-8?B?bE1WeG9ZMnNMS1lXSjdHZkVwRUxIZWZiSk92TVJsWWJYVHF2QWpGOFdzbmVu?=
 =?utf-8?B?NFNTcWduVnlEOW8rVVVOc1BzZ203Y1d4eVhINGp2aWFjS0I0U24wbTVxMk9y?=
 =?utf-8?B?WEdHcnVaODY5NVZWbDc2em9BU2d0dXJhRENydXNMTGtnYm5pSDJkY21pT1Ez?=
 =?utf-8?B?YzFmWkNWZ0tQajFJUnRoeUp4U09sR1FiRHEzZTVtdnhxSUljWjBoYVdkK3pL?=
 =?utf-8?B?Ymh3Q0tOYnYwUWtXQ0VobWxjTzNPQWhuZCtGYUhyeWpVNzg0ajNleDBTVWhO?=
 =?utf-8?B?Y0NCWkNpbDhnbC83NTdhZlJKd3AzWllXdURyVE03MVZnZVRvcXpENHpvTzhG?=
 =?utf-8?B?NTIzOW5JcEhlYkIxNGQ1eDNoTXRaR0YrZlhKMm1oT3oxSWVPL0dHUjA1Skhx?=
 =?utf-8?B?dDhoVnlpdmlNOWswU0tyelIreFkxWUUxMnBWK0E5TmNXMXRCUU9oYlZNbG1F?=
 =?utf-8?B?SXZGTTcvai9sWnphUlJPUUIvSVBmeVVpNVFLaGxuVGdZOXlNakdBdDhGM2c1?=
 =?utf-8?B?NnJSVll2cnpzRjFQYUlMWGFwTlRUVEgwWXprU3hxRkFwcU9TL2pML0FGVzFL?=
 =?utf-8?B?Y1JHU0plV2hxdlhLQXdjYzN1eGF1M2xuSERXTnFiQWtWRGFyY042NHVPdGNT?=
 =?utf-8?B?VmpObXFpNFViNFE1eUJLY3FKQUV5QldDZHNaMTBPbEdPWmtmc0trcGhtSTd2?=
 =?utf-8?B?YWRwdHZ1QWVVM1lqNmtLUHczSFJJWmw5MDR0ZWo5bURlTzdISnFXblF6dHJp?=
 =?utf-8?B?OVZnWTIyQURmd3hUOCs5dGczNzlnK3dXa1YvUXJ2Q3VWaDNWY0tKdFhkRldo?=
 =?utf-8?Q?0ol+GK3FvWo+Zne1lIcwgvJUq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	KMMNE6SU9PSzyFtOLAp4pRBUrWw6y4ZEajK4qXQ5dYGcTcHolme5sEEI1d8NtmaCjp4z12aokX1MTQlLFlMdFADo91m5AbSslPkazaIK48TlOPfZHKRegiYioRm5IeFqx6hWF7vhNOBGkx0mNIkS6hu8C7OFUJqfvaET9AH9R9skHcImsoGonC5c9XRRl5Sky94sBj64vM3vQvcISqPpbkvM/p+W8Z6pmfvJLTtOfh7iGes7vUfiepMxU1jLNkl6PnEYBadgrC1z5e4fySPory7wdxvOGSO2ORbqxu3MeOGH1V/Ra25nJwdvfQj0m7OCKWrVudyxxjCJlAEHVTSvJ4n403oE4GYJNs/NzwtHxxA3Tbxbcs2yDj4XrCYff3NrNKU3zEvLRgAl9C49+5eXGlSN5IIayp+u07Gb1C/lrvDDwADARvo0zaCLoCLm4sh2s+Bxw5oHA+wfKNvUw2R1yNKcTHWPGYcxIz8obRegvgLa6+B8vCpHoceRMyEMrdbk+WxNgbPxidbmDImuZOdeRwxDfzmLi387dsrs6ulA9kdqUIE8zv6EMzVpiKsANvkMPzSdIBhqGKbbXlqFNiX0wJK1uMAsrZobsswJg56xg1yo1DbwKZsajjh9DK8nsnCgAMqoB9BKqmwWwUw4nbFBVgPcVGzfBkRr+jCNuGkO2yUspUwzLv0259rMUJsXW8GPO0pISs6pNIApW3DX+iTaBtAiGilI0Abp5SB/uIXuNJ2YiiJrJ8LnyDqbgB6ZPOxBs434PO8HaCxCJB9UkG0GFs44tJxke+zjUCbXuUhgBMnKFd/Ohl2MpijZTORXKSGt
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba75ed2-2902-4d21-11e1-08dbaf7d1a20
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 08:33:24.6762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eup5+JgSRBE7WEd2MSVbZ7LegfsFwLKQUODO7M0H0WuXIpLydedeoc1wS3mOwhBgUuVWYvrMafGp+NRSX+YSVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7969
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 08:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104789

SSBoYXZlIGFscmVhZHkgc3RhcnRlZCBpbnZlc3RpZ2F0aW5nIHRoaXMgaXNzdWUuIA0KSG93ZXZl
ciwgZHVlIHRvIHRoZSBsaW1pdGF0aW9ucyBvZiB0aGUgZW52aXJvbm1lbnQsIHRoZSBjb21waWxl
IHNwZWVkIGlzIHZlcnkgc2xvdy4gSSB3aWxsIHJlcGx5IHdoZW4gdGhlcmUgYXJlIHJlc3VsdHMu
DQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVsb3BtZW50IERlcHQuSQ0KTmFu
amluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKSBOby4gNiBX
ZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMOiArODYrMjUtODY2MzA1NjYt
ODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215
QGZ1aml0c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2NuL2Zuc3QvDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciA3
LCAyMDIzIDExOjQ3IEFNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1
aml0c3UuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdIFtQQVRDSF0gZnJlZXJkcDogdXBncmFk
ZSAyLjEwLjAgLT4gMi4xMS4wDQo+IA0KPiBUaGlzIGZhaWxzIHRvIGNvbXBpbGUgd2l0aCBjbGFu
Zw0KPiANCj4gaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy83
MzU0OTcvDQo+IA0KPiBPbiBUdWUsIFNlcCA1LCAyMDIzIGF0IDY6NTPigK9QTSB3YW5nbXkgPHdh
bmdteUBmdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2Fu
Z215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gQ2hhbmdlbG9nOg0KPiA+ID09PT09PT09PT09DQo+
ID4gTm90ZXdvcnRoeSBjaGFuZ2VzOg0KPiA+ICogVmFyaW91cyBpbnB1dCB2YWxpZGF0aW9uIGZp
eGVzDQo+ID4gKiBBZGRlZCB2YXJpb3VzIENNYWtlIG9wdGlvbnMgIzkzMTcNCj4gPiAqIExpYnJl
U1NMIGJ1aWxkIGZpeGVzICM4NzA5DQo+ID4NCj4gPiBGaXhlZCBpc3N1ZXM6DQo+ID4gKiBCYWNr
cG9ydGVkICM5MjMzOiBCaWcgZW5kaWFuIHN1cHBvcnQNCj4gPiAqIEJhY2twb3J0ZWQgIzkwOTk6
IE1vdXNlIGdyYWJiaW5nIHN1cHBvcnQNCj4gPiAqIEJhY2twb3J0ZWQgIzY4NTE6IHdheWxhbmQg
c2Nyb2xsaW5nIGZpeA0KPiA+ICogQmFja3BvcnRlZCAjODY5MDogVXBkYXRlIGgyNjQgdG8gdXNl
IG5ldyBGRk1QRUcgQVBJDQo+ID4gKiBCYWNrcG9ydGVkICM3MzA2OiBlYXJseSBiYWlsIGZyb20g
dXBkYXRlX3JlYWRfd2luZG93X3N0YXRlX29yZGVyDQo+ID4gYnJlYWtzIHByb3RvY29sDQo+ID4g
KiBCYWNrcG9ydGVkICM4OTAzOiByZHBlY2FtL3NlcnZlcjogUmVtb3ZlIHdyb25nIGFzc2VydGlv
bg0KPiA+ICogQmFja3BvcnRlZCAjODk5NDogYm91bmRzIGNoZWNrcyBmb3IgZ2RpL2dmeCByZWN0
YW5nbGVzDQo+ID4gKiBCYWNrcG9ydGVkICM5MDIzOiBlbmZvcmNlIHJkcGRyIGNsaWVudCBzaWRl
IHN0YXRlIGNoZWNrcw0KPiA+ICogQmFja3BvcnRlZCAjNjMzMTogZGVhY3RpdmF0ZSBtb3VzZSBn
cmFiYmluZyBieSBkZWZhdWx0DQo+ID4gKiBDaGVycnktcGljayBvdXQgb2YgIzkxNzI6IGNoYW5u
ZWxzL2NsaXByZHI6IEZpeCB3cml0aW5nIGluY29ycmVjdA0KPiA+IFBEVSB0eXBlIGZvciB1bmxv
Y2sgUERVcw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWpp
dHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2ZyZWVyZHAve2ZyZWVyZHBfMi4xMC4wLmJiID0+
IGZyZWVyZHBfMi4xMS4wLmJifSAgICAgICAgICAgIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkgIHJlbmFtZQ0KPiA+IG1ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L2ZyZWVyZHAve2ZyZWVyZHBfMi4xMC4wLmJiID0+DQo+ID4gZnJlZXJkcF8y
LjExLjAuYmJ9ICg5OCUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvZnJlZXJkcC9mcmVlcmRwXzIuMTAuMC5iYg0KPiA+IGIvbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvZnJlZXJkcC9mcmVlcmRwXzIuMTEuMC5iYg0KPiA+IHNpbWlsYXJpdHkgaW5kZXggOTgl
DQo+ID4gcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZnJlZXJkcC9mcmVlcmRw
XzIuMTAuMC5iYg0KPiA+IHJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9mcmVlcmRw
L2ZyZWVyZHBfMi4xMS4wLmJiDQo+ID4gaW5kZXggNGNiNDUyNjA4ZS4uZGU4N2RjM2EwMiAxMDA2
NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9mcmVlcmRwL2ZyZWVyZHBfMi4x
MC4wLmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZnJlZXJkcC9mcmVlcmRw
XzIuMTEuMC5iYg0KPiA+IEBAIC0xMyw3ICsxMyw3IEBAIGluaGVyaXQgcGtnY29uZmlnIGNtYWtl
IGdpdHBrZ3YgIFBFID0gIjEiDQo+ID4gIFBLR1YgPSAiJHtHSVRQS0dWVEFHfSINCj4gPg0KPiA+
IC1TUkNSRVYgPSAiNzQ3MWFlMzgzZTdiN2E2MTNmMjc1ZTE5ZjdiNTQ5NThhMTkzYzg5MSINCj4g
PiArU1JDUkVWID0gIjEzODRiM2MzM2I5YmQ3NTk5NjMzY2M1NGJmMjBjZjIwZWM2YmU4M2MiDQo+
ID4gIFNSQ19VUkkgPQ0KPiAiZ2l0Oi8vZ2l0aHViLmNvbS9GcmVlUkRQL0ZyZWVSRFAuZ2l0O2Jy
YW5jaD1zdGFibGUtMi4wO3Byb3RvY29sPWh0dHBzIFwNCj4gPiAgICAgICAgICAgICBmaWxlOi8v
d2lucHItbWFrZWNlcnQtQnVpbGQtd2l0aC1pbnN0YWxsLVJQQVRILnBhdGNoIFwNCj4gPiAgICAg
ICAgICAgICAiDQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KPiA+DQo+ID4NCj4gPg0K

