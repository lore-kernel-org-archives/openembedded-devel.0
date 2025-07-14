Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCE2C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:22:41 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web10.75917.1752492151056015703
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=aVS8vJPc;
 dkim=pass header.i=@bmw.de header.s=selector1 header.b=VbV3NXgW;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492151; x=1784028151;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=nFjMUA70seYpPSlJJo28EXs7+j+l/hQKUvcfZqxqbgo=;
  b=aVS8vJPcbYUe4a2HLyfplj+smISCqJDpUjCdoNnz+Kon42/Qp47m1xgk
   tDrph6Mx8lFJamAzJGOMWx2kUwkhJbXRAqYh3PVafL+vFN2LQH7JdJPSb
   9qin62u53iTKoCGNfzAW0KVvrx1du9YEhqoXNppXpH1VRrZmdu+aZ49mf
   8=;
X-CSE-ConnectionGUID: hRxIKVf9Q9+e4EME008xPg==
X-CSE-MsgGUID: w8iFehKgT3ifasSZGFOlNA==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:22:28 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 14 Jul 2025 13:22:27 +0200
Received: from smucmp16c.bmwgroup.net (HELO smucmp16c.europe.bmw.corp)
 ([10.30.13.145]) by esabb1.muc with ESMTP/TLS; 14 Jul 2025 13:22:28 +0200
Received: from smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d) by
 smucmp16c.europe.bmw.corp (2a03:1e80:a15:58f::1:56) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:22:27 +0200
Received: from smucdzmp14.europe.bmw.corp (192.109.190.59) by
 smucmp19d.europe.bmw.corp (10.30.13.170) with Microsoft SMTP Server
 (version=TLS; Mon, 14 Jul 2025 13:22:27 +0200
Received: from MRWPR03CU001.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.59) with Microsoft SMTP Server
 (version=TLS; Mon, 14 Jul 2025 13:22:27 +0200
Received: from DBBPR09MB3143.eurprd09.prod.outlook.com (2603:10a6:10:d7::16) by
 FRWPR09MB8273.eurprd09.prod.outlook.com (2603:10a6:d10:184::22) with
 Microsoft SMTP Server (version=TLS; Mon, 14 Jul 2025 11:22:26 +0000
Received: from DBBPR09MB3143.eurprd09.prod.outlook.com
 ([fe80::97f8:c4e9:10f0:459]) by DBBPR09MB3143.eurprd09.prod.outlook.com
 ([fe80::97f8:c4e9:10f0:459%7]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 11:22:26 +0000
X-CSE-ConnectionGUID: SqpKmk/pSa6I61y2IFOjgA==
X-CSE-MsgGUID: UTytsJdBTWS05NR+vGItjA==
X-CSE-ConnectionGUID: 4CLe/IHERKWMQQUOW5vL0A==
X-CSE-MsgGUID: sbwrDoh1RLKO79XICE8Ajg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYaIHZPjOUr5Szue6sXqy8sk7OwXrx+CVGuwLOJv7QGWaQHWVkeNIV2kEkHIXTvG8HRp9edXjfR6kgRBzBtuq3WFiiaHG3/j+8Adu3oqafgSjdqFmyYC8OLQHTBQeSia9zxdnEEhpJW1WZaDrlzRlh6ItNDPYLsnOGI8TP70ziFJiHbYoLbiWp5Z7UMi2BWnEw2yawPp5EZHwt1pq7OKtjmlI3HpAjBfhfaTUt+485F90weUYxoOj+8k5pPtjNNCUCeEEDpmO3/6seUb6RWeAeLQejJCUyEFOJqUbeaJvQsVsRS0TC/inDGRbPZZdq5Cb8lTRcj3IVhRXmxAXIVehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFjMUA70seYpPSlJJo28EXs7+j+l/hQKUvcfZqxqbgo=;
 b=bLfJ1vQ1HAiIx2k5K3hcz3YX1NH1+fUnxbfpbXR8BpRABUhVPbxNcD4YMD0z9V2Va0F7StXM73wZyy05s4grWTOIC59YC1PjRUZqPy3xH9fme6gclg+XTQT4c4/hs/jYn63xNMJ/tddts4TBHA9UHPVTdMerixc4hbDqNwZLxHTT5Ka9OPt4AgUpLHk7CNqTSh9MABjJN44AJaeSeoRFhYnXy4S+lvv/JmOCZdQOUb7tlNULJ11RESkazFw6mA1DOh07Vv5K5/nT6IJ1v9W/PNcLgi2WCw+FYfbvUFWqjeQmdWu0zQTm7IV8OVRVeh7he6SJ3bTZnkQTWX8BSOZmog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFjMUA70seYpPSlJJo28EXs7+j+l/hQKUvcfZqxqbgo=;
 b=VbV3NXgWGb4lQ8gkDatjfp5WjFQdwDx+v+5HN4t9q7zciKjgAi82/3u7/j0xWOGgIeyzo7MXBIdWKkkV4UQlT8p0lTl4JYXbpafBhUeZNSj00rcgzAJl0G2qL2rNrqGJqksw6/BNPrXBr2fugWfbphWWZXxbeM/NqE/CEXUTKf0MkQ/TQbB1J9t//RpvgvH76b/3lC+Rp/m2rDZVRvDY+dw54DUtgpVBbIiOxhqDp8b3jXAnx9i3R3YAYYzPKZHi5WV3TUreuZ5bUrBeXB84PCeC5CaJmEA5SptsyBpmof4d3HLxChQQpN2n9AOJLSt3k0hAqtpHmreiAMP91S8bNQ==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2 10/10] vulkan-cts: upgrade 1.4.2.1 ->
 1.4.3.1
Thread-Topic: [oe] [meta-oe][PATCH v2 10/10] vulkan-cts: upgrade 1.4.2.1 ->
 1.4.3.1
Thread-Index: AQHb8mW1wtEx0N1B+0qSuYTPwGp0VrQtGzyAgARjHoA=
Date: Mon, 14 Jul 2025 11:22:26 +0000
Message-ID: <db958394-f05e-473c-a168-7419560d81d6@bmw.de>
References: <20250711131254.303582-2-Moritz.Haase@bmw.de>
 <fbaa3ce9-c31f-4b0b-9e2e-5f04f7b1a56a@gmail.com>
In-Reply-To: <fbaa3ce9-c31f-4b0b-9e2e-5f04f7b1a56a@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR09MB3143:EE_|FRWPR09MB8273:EE_
x-ms-office365-filtering-correlation-id: dfc820b8-e929-43be-8c21-08ddc2c8b622
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eWZGUGVrNXc2T1ArekVDWHdZb0dTQWErUGRyVGpQZjVsWkpPc29HUTNZYUk0?=
 =?utf-8?B?S2dUVncyZ04wWG52RHZTRDYxN0YxZHhPQ0drblIwdEp3eFI4Mll5cWhGQWd2?=
 =?utf-8?B?cmJhL1ZVNjlhZUpCSDNCMFM4MFdyWTRNL0ZhMzZPaDE3bGhvd2pFbC9DNE5T?=
 =?utf-8?B?UlFHR0ZneEVJdjZLdmdncmNtNnI0U0FEUFhlWTkzSjk0T01UaGIzdUt4Tmx3?=
 =?utf-8?B?dUVwVVVwaUNlaElLTklVYUtFN2JLQ1VaOXpRcDhiRVg5ZDBDUkNSSWhRVHNl?=
 =?utf-8?B?dU1YRzBKM2RlTExVbnZpanROOVRZWEExR1A3cURxNWRGVDYySWxUeUpmM0Zq?=
 =?utf-8?B?RzRRS0sveFQ0TXl2cjlnZHpsbGF4S0loWVJvUllhMVRyMVB2dDQxYkZqVzRD?=
 =?utf-8?B?Y2VVS3Z2UTZsV2kxZEFyTXQ0ZGFEUUhIaEhUZDczcTJ6ODlzY2R2WVJDS2hX?=
 =?utf-8?B?c3pNeE5xOXBLaEhDdDltVVpvbnFLdFhsRUhoZkJVT3pyK2szUXQ1MDYxVzIw?=
 =?utf-8?B?Q2ZudUlHdFpZNzRRYW4ycmp6Zk9GTkY1SWYvZmt0a3M2aHZXcnFqYmtGZ0Z1?=
 =?utf-8?B?b2xQaFNsbGdDcEpoWGczWlEwTzdSS0gzNEpyWk5DVEdIWEdhOUxzZlJUR1Av?=
 =?utf-8?B?Sk1laUgwdTl3dEFiTWtNZVAzZDllbTdrT05mU3VkSUliRFJBcVB3N2hXcUdt?=
 =?utf-8?B?cUJvbVV4ckdNK1cwRWdVNTVnVEt1OERZZzVkdVVubTlwL0FaUlR2V2NQMldC?=
 =?utf-8?B?dXpydTV1Z01RdC9td0RSQ29IRU9TczByYkNES0FrVkd0cDdyblYzU1Q2NDZ2?=
 =?utf-8?B?RVpXQ1NjRk1laWJXV3hhZVJzRmpJNlVFRENGNnM4dzhHR1pjN080OGxWUWdE?=
 =?utf-8?B?eGVzRzJiZmhDdGhDd2xLQS82K0tudWYwUjZUY0pPVWhPUERpMVBDdlJNdkU1?=
 =?utf-8?B?YWpLdUxuVi90cGluY3FoVjRFa2wvanhWK2pPYjNyRDhqeitaZHFwOVhuZlp4?=
 =?utf-8?B?SDQxckNNR0hWZDVScHJ2bEpKaWZWNC9UWnAzZXp5cXAyeTdRU1pIOWErelRr?=
 =?utf-8?B?ZkJwNjFVb0lGalpIdTZtK1FRa25TSnFxaW4ra1pSekZTd3B2Zk9NUmMrZ1JN?=
 =?utf-8?B?bnp3VkNHTHpxZDkrZVVrSWFYbEhLeUVDbmpUOTJoTEdibkdMRjBiajl0OXVy?=
 =?utf-8?B?Mk11UWU4NmZrcDlmSjJjRmJOMjBCblRvUW56MTJpWGJtRVVxVUprRUFuUEhB?=
 =?utf-8?B?YjYxNVc4ZFVHZi9VSXQzZVgwL3V4UjNuUExJdXBTd3ZOQnhZV3MzUnB5Q2NM?=
 =?utf-8?B?Tnc2K1gzZXB3bTRrMTk4YTBSc1plZ0RqajlXeHBMaG5yMEFiaVdBQkluRVk1?=
 =?utf-8?B?alJWMmI5UW9UWk1pUzZ6QXNlRFB0SDVLc2hwQU5HN2FVUVhlUFVLdW4vTS8r?=
 =?utf-8?B?TGlzU01DSWtsMTFweDg3d005NWRJNXNXTUtHeHY2YldudFlwSUduVjgwVlRh?=
 =?utf-8?B?b043ZklDZDNQVk9YUlBwSURlRERmdWo4aTFWa245dlJqVXVYckt2dDZxcmlk?=
 =?utf-8?B?ZWF3bEZqZjZXOGhIZ2ZpbjdqaENIcmEzL0tLOEJsa1hYSjNzK3JvTmtqRXRq?=
 =?utf-8?B?SWVtYTF2TG9NZ08yRHlDNXZhSmtzM3FUL2JHQ2pWbnNyWVR1NmZCU2Z5Rkc0?=
 =?utf-8?B?TUpkMGpWSm1Xd2hPbHZ0SVJRd25UUnhQRG5CR2pSSHVCUXRJL2xuWUhhOTlk?=
 =?utf-8?B?RXA1K3gvZFZLN1k1SWxlU0trZFlzTFFTZjd4ZTBQL0wzWGs5RzB1L3JELzJt?=
 =?utf-8?B?SXNIRkdhN2xaOXJtWUxxVXdsdWR2VnFFZ29zMmU5aUhYTTNNM2VxdjRJWUpZ?=
 =?utf-8?B?WitjZTJRSi9pQUw4emdEdzdhWTVZbEdXTlp1bng0Z1B0bGRrNTVCV1dWZGh3?=
 =?utf-8?B?TTA5MnVVaXRMYWlRcE1NZm91WFBmazltMXhJMGRicTVhMDA4WWtMY1Y2RzZs?=
 =?utf-8?Q?Z7EVIYQUVACIV9hZiEQj9EUz0Trpww=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR09MB3143.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmZVdm1IY0hxTURnSDE3STBkSVp1OGU1R0lTWkNIbjh2ZkF0TmVYU3VZZUNC?=
 =?utf-8?B?dTM3OTk0blFrNlFXRDJpVUdjcW04WVU1TXFtemxtUzBiVlFLbnVrV3dmQ3Rp?=
 =?utf-8?B?cXhJU2xXUXJCR1lMQ09kR0MydmxzSDgwS2NsUGsydDVQVEs3Sm5qNXNpdlpG?=
 =?utf-8?B?aldQYTk3a2lUWDlJR3JVRVRPaHNzNzhDTW82ZHhVN1A0aUF6blBFL1NKQUc5?=
 =?utf-8?B?RE1wOUFxS0owYk9KQXVUWnFzZXZsdnJpV212Z3pQOFVqVU84OUozQVRjMUIr?=
 =?utf-8?B?Uko3RzlaUmpnVEdYa0ZVWmJOK2lzZTVNME01N2EwYVhYMXdWNlZTM2pQNEV0?=
 =?utf-8?B?SmtkVm8yTWt2dG44QzVmc28vQ0JoajY3UWtqM2h2TXJTWnlQSGJHVXdJRDUy?=
 =?utf-8?B?NENtV29Ma2c1NHNUeXdLemdEeHhEZTBGVFRVUVk5VmlWZWJkWnRhOHNGV214?=
 =?utf-8?B?QVFVbmVQTklyL0FuSFpBZDB0L3gwWHo5NkJDSjduOWkyS01jQ09mUitDaVlq?=
 =?utf-8?B?M1hDWlVpYWVnaFB1QjkwS293b05RSVVERzloT1o1YWlsSDFRNnAzTlZnTEpw?=
 =?utf-8?B?cWVQejJhaWtOWmxiN3M1N012cjJmL2l3UHJ5NThXRUJqVFZ2NUlUSktMRFlB?=
 =?utf-8?B?VEdPZGVLUldJdVVkRDZZL000dG5ZeGxDQ0t1WjlNbFVFbldVYmlJd1FKNk93?=
 =?utf-8?B?MGczTVJpS1BmTGlvdlhPU0xOU3JYR2VJc2E5ZENjcEFJVHBnSHRjUndUNWN2?=
 =?utf-8?B?bVg4R2JjbzFoQU12NlRyVktMa2dobHhIb24zT0NDL0pNWk83ZGtaNTdYS2F3?=
 =?utf-8?B?VloxbWtTdWEwVDVVMG1rR3Zmd09OeHRtSjUyU2dsQnVhdjArak1waUZmYy9p?=
 =?utf-8?B?WnJub3FuY0Vqa3laUUxQMTQyditNVUo1elE1MjFLT3dzajB4akRSbUNtRmxG?=
 =?utf-8?B?cVZHZDdubEhhTHo2UmxxUkxvM3FiVVJyUFg1NVJmYWVyaE5aV3IzeTc4OEk0?=
 =?utf-8?B?REFCSmNPdXZ1TTA0ZVQ0eEpZbUxwS05sSG5LajVFVVc5K0VOanJ0cFA1eTZ2?=
 =?utf-8?B?bkZVblc2NHI3UHBGZnVjcm1pMVZEMWMxcy9ZUGdXM2NaRytrQjR2ZlRYR001?=
 =?utf-8?B?UUxSWXpmdEh2UXc1VzlYYldnc2dPSkFPSzdBUjdxZWdVQzJXck5ldTNYNTY2?=
 =?utf-8?B?UHQ5dmhpdmxHZEhHbHdoYUV3eXZ5b0ZJOVl3dUhsQWtqOVA2dkxQbzBSL0N4?=
 =?utf-8?B?WTNmamxNUjBLcCtESU5JMkk4MkU0eEI5WXFzS0xYS3NUUEltVzFkajlJTFBM?=
 =?utf-8?B?d2JvU0JNdDhyc2hOd3hROWxsWWhWdVlxM21yTWI4NGFxV05LeHhzVzdoTWFE?=
 =?utf-8?B?bUxhUWx5MmRLL1V0ZVU4bnQwT0FUVVJ2WXM5UnRlWkwxVm5SdWlwUjlqeDMz?=
 =?utf-8?B?K2dwWEhGYmloSzM4ODNjRCtXZGpIblMxdE9JR1BPaTNCVmprVHF3ZWFOWGpB?=
 =?utf-8?B?YU5MY1dDRXU4cDBYZUJWTjFYRTRqVFpPbE5hNTJjOEVCNm44enU2Y0NYWDZQ?=
 =?utf-8?B?dnRTcDBCK3JBS09YZ1lldGRtcDI3M1hZT1pYMkp6elJRSVpGMTdYU2FaZDVo?=
 =?utf-8?B?OWZVWnBGNklldk1jZC9CdXdKRVkxYzRZL1RROXIzSGtGT1EwQU5WMUQvMlI0?=
 =?utf-8?B?c1A3aXJZMVFkajM5Y2dHd0xnYTBoZWsvY0w5emFtOTFMSzJKdk5tZ0pQaVVu?=
 =?utf-8?B?VGdNWXNPeEUrWnNXdkp1aVVEcHBUeWhuOGVGVmkxUHg3RGtIejZ4SUt1WXJN?=
 =?utf-8?B?S2pIZTNJMjZqYzBnbnV6alFMOVFiaWJIVUZhUlZaR1hUZlppcG1lY0xhUUFH?=
 =?utf-8?B?b1ZoS0c0QVlmcW1sSnMzblhUNGxCUEJPbEhOT2cxTXArV3lpZHlhMzBFWGpm?=
 =?utf-8?B?TS85WndRVVM0c2dtT3BKN2tCYmZxWFBIQWxtT0hyZ2tXY25QZGdpNGp2S2R4?=
 =?utf-8?B?S3FpYVRmNS9vZnlvakkzUERhTkN4RWt5WVRiZWtKVTBOdFRFRU1SSkNGMnox?=
 =?utf-8?B?cGI4VFVYYXNQSG16ZjJZNzlsZmhjQ3RaWnRTRjBTUlZvenI3bmRqRVRxU2VL?=
 =?utf-8?Q?zyLp6QEvUVOiMbuuculAdFFlO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <794826998E8C0D4F9124D821A4925180@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR09MB3143.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc820b8-e929-43be-8c21-08ddc2c8b622
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 11:22:26.1379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 88TUdFqf/cBrUPh8ykSSE3mHbYszP73aUAb4yB/PqPRrKOMkzc2oLYYRpJIOUJnOTpCbN4pWt8pl+d+AzDt1dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR09MB8273
X-OriginatorOrg: bmw.de
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 11:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118518

SGksDQoNCiA+wqBpcyB0aGUgcHJvYmxlbSB0aGlzIHBhdGNoIGFkZHJlc3NlZCBpcyBmaXhlZCBz
b21laG93IGFzIHdlbGwgPw0KDQpmcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0aGlzIGlzIHRha2Vu
IGNhcmUgb2YgYnkgWzBdLg0KDQpNb3JpdHoNCg0KWzBdOiANCmh0dHBzOi8vZ2l0aHViLmNvbS9L
aHJvbm9zR3JvdXAvVkstR0wtQ1RTL2NvbW1pdC8xMWNhMThhOTUyYjVlMmMwN2Y5OGQwNGQ3Mjdj
MThjZjQ0MTA1YTYzDQoNCg==

