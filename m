Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE46D5B85B
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 17:14:06 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54334.1765818843650497812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 09:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nI2L23Y7;
 spf=pass (domain: siemens.com, ip: 40.107.162.26, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLzCK/WFnF2m8/W0DfE15NmuihsWjDD/BrwvhrIrNS3j2uxB4OiTc4ZFre/nziJCr1+b8hjltjdI+j1I0ZdvdRSj8x+WOFocVJIJqoR4lDnPprDHBTNobx/ESla1oYM9HV9i2IZwkNLUsVU5MPjLooCFIbVsUZBPYJrid13w5s5/aRpd24t2eJ0j1HpkEDBHAm4wk/3G2w/nO9KB9wT+sS+V3yBW3PyzMgONicC/Xc7MTM3djJneq+oSA1Y86kt0PeyD+tyYYUL/EHcYRp4TbymGwxOc4tZkJjQcxLdDuyFVXnFlnRRYrk2SQecJdZvMmJ3OqedrXcEf2dy+yUf76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+c/UNCAU5yi26qXGAlKH84b5UDrSv0v7iTWqiD9tZkE=;
 b=SC6RnvvJC7gSvIrWY3ngvJer06l/RD4AqdoOAB/vaT1Q6uXa97q7ORnsTDmmsxrUiFaVV7e52GhMHgKqOwEAbuPE7EW7pcOXcuc0Pd8daBPn4mLiJXkilMnJErzX/ck/zAPWLGKlzt//pDBTDZgnTmm5/F/zDjjJD3JG/3Ckt5ZrMWTqoEgrEW9H7Fl4aW56CxIcmNXkfZ56Tr6U6HdYeHxrOH/48w/C7iHL3dArH/T/jrSs3Bjbg5ZWUxl+lkxIUKZSGFd5MWV4PfNrBaP5RF67WUygFtWuqFC5SqVVZTB5xJTwjPpBwVN0wCfAmROiV8J3JcTrq5krSu7FaW4iOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c/UNCAU5yi26qXGAlKH84b5UDrSv0v7iTWqiD9tZkE=;
 b=nI2L23Y7p/JgWULNYyOhj+Cw6QF5kMfM51k9qBnp9/0+hULtbr5yLXjzWZ1iHBYJBxKkSTgoLsFMT6sg3/286JzVEl20otW48YfbkFMZLZDkgrAe7yBThFBTn2LruBkdzSWZGg37Fc0WZ4kMY7kRWyRd4onvhNojOEQSthwwcb3UF+aUjU0MJhVTbiq0ekIVsETWhFVv3d3qp5A6U60STMb//wn22hinoSiSYjOS70Vq4jmF47a1rbY5z7IlHdNQRZvaoyNPSoy3AdsHFJgHhL6J3SPqKukv6uOm/rIPR5STzPIIy+YFwUK3Q/7LgGGUQTHM087gB6443zqT3oy5PQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU2PR10MB7741.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:49b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:13:59 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:13:59 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] CVE report - scarthgap - 2025-12-15
Thread-Topic: [oe] CVE report - scarthgap - 2025-12-15
Thread-Index: AQHcbdyevkye13XSVU68DgalIY+DU7Ui73dg
Date: Mon, 15 Dec 2025 17:13:59 +0000
Message-ID: 
 <AS1PR10MB5697BEF5FBCA7CBF47927E90FDADA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251215160506.2697309-1-skandigraun@gmail.com>
In-Reply-To: <20251215160506.2697309-1-skandigraun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5b1b5b25-9ebe-4a5c-865f-e48a4143f229;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-15T17:09:38Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU2PR10MB7741:EE_
x-ms-office365-filtering-correlation-id: 027f28a8-015a-4ee4-3792-08de3bfd5634
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?SmFsM1sjzsfs5ZlmVCO8wjmfuBGVoFOElk3RUr2RA+XaJEuZnUUVs/hPQqhl?=
 =?us-ascii?Q?eQKIR8mgNSeU8/x7FWACk2am+qaYMX/skltaZZk2JwfGfDY9ZthcGGbZXJRD?=
 =?us-ascii?Q?eQ7GWpFqviS17Z/Q1TBtWNILrGwk+cW4rqrqJxTUxQMXFIF2PC0tBbSCizGp?=
 =?us-ascii?Q?4ZID9cU8HtqVzHXMFeVOMu9TBy2nCB4lGYggpcnkKyhbUB7cTDGefisBb190?=
 =?us-ascii?Q?wQljrrNSB6JZVB/MIl3casS9ORWk8kCOGz0d8/hL2j9P78CB+s+a58Eqj4ty?=
 =?us-ascii?Q?n3GrkBSXUFBlMTqam5tv3x0dy8/NP2yaCVpsxosQLt6fegkRKx9KhaHzx6pH?=
 =?us-ascii?Q?VzbKpnXSXx4AiKgAExXN/Ito6yF4HFmF7e6fzQxhVmmbkFKPLkJbMnvfOGNm?=
 =?us-ascii?Q?6eciBhKaGDSPTloS6N3yNc87uX/fryj661teCOZmaLeSYkF5Mp5y1E0In0Y6?=
 =?us-ascii?Q?vHewhz0WDe81baGm3n8nozvXX5DQtLOHeD6zzrFRfcTPzQT004G+4ldok+Bz?=
 =?us-ascii?Q?7nY+nCHw2pS0jGn96ubYuheVw+hkQR/RzCOpJVEoo31bWL8UZsGd5ep3TgfC?=
 =?us-ascii?Q?unFC1eNOhkMJmb3Z4/dM6hMvIaFBj0hYRmtDAtptHVVWhHWu/3i9H2oznokX?=
 =?us-ascii?Q?wpAMp5RdNCt9DMVHk4bE2W2aFkFx080XpY+nfWimbKXTYwj5D+v9P7rqRGy6?=
 =?us-ascii?Q?bA6YQ3LFnhyTMLRHFpiytxx+Ta66v0HUVfAqKVC+Tplu0uLD8/g3E5C+Twn6?=
 =?us-ascii?Q?vgzvz621b0ov0sqEjtcsCQzk+3Esgoqr/k3Kb3A6d/fvcBwd6DvLDNt9TSpk?=
 =?us-ascii?Q?PZCitRE5mR7cTw5Pr4cpYZGZpz8zJyq3guHW/XXRKDt4RzJvw7SoVRv/e++6?=
 =?us-ascii?Q?oaciR06lldmFKwEXr9NMHynfxIvaWWAB67I5fkJkpfSrG+lCz5NKvyzFWVxL?=
 =?us-ascii?Q?ITETGRSKFx9L10xZcv7hlmGd7SOT8CXkg+8xTiDAASRyDkNVs7jzNPLESJ1I?=
 =?us-ascii?Q?4JPPChiMOdB63cLUHSaZ1roeEV5/Dq8cpb4OH4c3PTotFTNX8C2ZQKaIZ3M6?=
 =?us-ascii?Q?Prt0EQpbmnV8+56lC9MBCnD08fWWiQRqlPvW373C7xoymPrmEDUbj2e7lkgL?=
 =?us-ascii?Q?TILUe76mFJudT8WZEt7Yk2vyOL17knxZJxf69oYhWfjaBtA5uKTxnXchtrwt?=
 =?us-ascii?Q?4L6TD6F72sGTlfn9R+iK7n9bY3tCCKt7BJA3nled2Nq3mXrxpCKy0kQaTRi0?=
 =?us-ascii?Q?kEEKb0fkW2jj8WRMQzW24IM4AANxWRuOi7iKXvM8cpqzStbhPk++FLsNxnL5?=
 =?us-ascii?Q?/vvMAZ2BPj7uO//r5RlzzGE64uSj6v3IO3dEHkaab3rd+uOyRr5aAosqeBj5?=
 =?us-ascii?Q?8YpS3gem7UTK7lpnIUMUbfWNm0vRl39+LZ7KjmcbGRC+/8wanCsDrE7uXF3F?=
 =?us-ascii?Q?jLr2+V/rLqeqsAH0Kv18tTEqxdKJWf6K0fEajqZZQfa7/D75cbGF8GpuAWxt?=
 =?us-ascii?Q?PUIrlPk6YTiDwQWHz5bX12Y5MnCuP6+XEzNe?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kmChlpvFtyBV+UtAdSGtBSW6/aUOsPGRFnP3IyRUPOlFAE2q2xapWGxyg9oQ?=
 =?us-ascii?Q?EpTAFDta7wc+3S0tSUL2lOrex/9hMDKC0x5xJ/0V1w02+EyrA30+V0Jsv0PG?=
 =?us-ascii?Q?7/0iSjWcGnR+IAPPyrQ97GlDZqPvhYbrYv9WkO26VNEv7xlluGHKc5774LbI?=
 =?us-ascii?Q?GgV7YsANbsa4tgTK2+KisEiDqb59WH0kjqC1N7R0OTHBZeOccB5qi0oUx4ce?=
 =?us-ascii?Q?OJaWvCCdm1egSEpFBX0UoxmzZMCgRBpZm0YvesVxnewpsHpUmWZeRzlqCza/?=
 =?us-ascii?Q?Xqp/6yy9OVEI1bi1KP0Zbezb9OCFb7FRnb9ichWoORfO2Q0Hl2oJK+r8AHke?=
 =?us-ascii?Q?xuR5sMfm3VBKGJiiREY8hxQf+dkURILv9hid5Sj7GuXxd2WRUCRJu7i3bIUb?=
 =?us-ascii?Q?5fgbeEydRtFeILJBbykoEE6YYTb/yWvZo4h9nG4HFcfuK+Kp+xF0erOegjce?=
 =?us-ascii?Q?B7ns0+zjJ6pevxLnj9p6GDuijbmHXQ0OcsGgCWYQDqePk+USSInMrXGkoM5q?=
 =?us-ascii?Q?xb7HGYuacAjAzqMUvs9chHKcK+xugxaECFj1lRY/WcHGfEbvY+78RaGU2uI/?=
 =?us-ascii?Q?RRULyFVRNnpTcga6eJ34x6+q1yjRcS3ShMp13HAm1Tx86H2hvYBf1Is7pS3N?=
 =?us-ascii?Q?I1dmsUmfywKmnTkRFDYnFYO9RNXArv+StH7o2NBWQBUCoFJA4RaNIusvDixI?=
 =?us-ascii?Q?KCUDSVqPa0Ve6odOxSOonlIXvUYx1f/X0J8WZMwGCjBiaUeUlg56FIvuTrQv?=
 =?us-ascii?Q?N5hMXL54G9GEllRU6lv69yBd7X6mbOyFY57nCnjTQTl+xO+Z7THATv8a/h9H?=
 =?us-ascii?Q?Fav+E7ToBTeUxDA1PuBu0ly7u/Tqp1WVRYvkmIk9eIuE1+iQ3eOkAYx+uhDK?=
 =?us-ascii?Q?6xs7/e64zVNB8NkM+85t0rceZd1COa9i2HAdzew7TciK7pMvFalb3qRmdI2K?=
 =?us-ascii?Q?+QJkDT+sxke/o5AjrieZCgflwJmOEv0Jrva+3q+OA0Urj5YiN6hZmzY6qONq?=
 =?us-ascii?Q?rzUxN3LaRQuo/Bu3O2lKN0YyPMaIM4FS5sxCiHwmZUQvC+Tq09mOzbNltqZ7?=
 =?us-ascii?Q?PjZrOiLeALuWWV87O1C1lZiKSxp7WiLCUsh07mbRz60beTxmCmEGKSuPrL44?=
 =?us-ascii?Q?oMXSNjmXm9Ssvcgh23h4zApSPaE/1PpPgaCR+jaVppxfXa2K+16b0WEDQbsB?=
 =?us-ascii?Q?NsTZP81PMvrM6cS4337d3/u5jXJE/O+cMJ3rP5ebBJJVWr6Ygw5j/eMk9TpC?=
 =?us-ascii?Q?zFGRaG3zEkYjOOF6//sT56PtyEsWPDeQ7wNllLDL1X9iZ7AajfcepPYcuGgi?=
 =?us-ascii?Q?eLc+zgqQJSwwKVSoJ49yHnVOzYyglas8yhO770RE1Ob/vKXcYgT3seXhRAPL?=
 =?us-ascii?Q?JCQCTrt2HWRPtGW50pkIEqs64UTzywubha+fDaD2NBaDbpPsmolKr9vf9zvA?=
 =?us-ascii?Q?cMUX+npRGNjRT9ZttA3ySfN2b/20STsfu7NYaRmyEo06VYxSrdA7/lpChwDH?=
 =?us-ascii?Q?wXONJn/gmo7JaL2/5Fm9da5SifaRw/mpar1QWqDFifwKupE/Ged2X5rCM3j8?=
 =?us-ascii?Q?vj63wHh+5pq+NXQOB9wF4geoVwHVLYu9wt4vNIhv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 027f28a8-015a-4ee4-3792-08de3bfd5634
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 17:13:59.1520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 749eNc54HbGxaV7M8Z1M1hxG0UyF4p5DVTnI3Vs+l66gpbIa9n3AwFddw2/r29LVQPaBPjVPti78C+Yua/D2rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7741
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 17:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122664

Neither of the libwebsockets CVEs reported below are good.
AI correctly guessed the component, but version 4.3.3 is not yet vulnerable=
.
Since NVD does not report a version, updating CVE_STATUS is probably not th=
e correct solution.
This may be a general problem for AI enrichment.

Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Gyorgy Sarvari via lists.openembedded.org
Sent: Monday, December 15, 2025 17:05
To: openembedded-devel@lists.openembedded.org
Subject: [oe] CVE report - scarthgap - 2025-12-15

List of all open CVEs (206, out of which new this week: 20):

 - accountsservice: CVE-2023-3297: https://nvd.nist.gov/vuln/detail/CVE-202=
3-3297
 - atop: CVE-2025-31160: https://nvd.nist.gov/vuln/detail/CVE-2025-31160
 - [NEW] botan: CVE-2024-34702: https://nvd.nist.gov/vuln/detail/CVE-2024-3=
4702
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-231=
2
 - civetweb: CVE-2025-9648: https://nvd.nist.gov/vuln/detail/CVE-2025-9648
 - cups-filters: CVE-2025-57812: https://nvd.nist.gov/vuln/detail/CVE-2025-=
57812
 - [NEW] cups-filters: CVE-2025-64524: https://nvd.nist.gov/vuln/detail/CVE=
-2025-64524
 - dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-230=
26
 - dovecot: CVE-2024-23184: https://nvd.nist.gov/vuln/detail/CVE-2024-23184
 - dovecot: CVE-2024-23185: https://nvd.nist.gov/vuln/detail/CVE-2024-23185
 - [NEW] dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025=
-30189
 - editorconfig-core-c: CVE-2024-53849: https://nvd.nist.gov/vuln/detail/CV=
E-2024-53849
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-08=
87
 - fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-619=
62
 - fio: CVE-2025-10824: https://nvd.nist.gov/vuln/detail/CVE-2025-10824
 - flatpak: CVE-2024-42472: https://nvd.nist.gov/vuln/detail/CVE-2024-42472
 - frr: CVE-2024-44070: https://nvd.nist.gov/vuln/detail/CVE-2024-44070
 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
 - gimp: CVE-2025-48796: https://nvd.nist.gov/vuln/detail/CVE-2025-48796
 - gimp: CVE-2025-48797: https://nvd.nist.gov/vuln/detail/CVE-2025-48797
 - gimp: CVE-2025-48798: https://nvd.nist.gov/vuln/detail/CVE-2025-48798
 - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-39=
82
 - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - hplip: CVE-2020-6923: https://nvd.nist.gov/vuln/detail/CVE-2020-6923
 - id3lib: CVE-2007-4460: https://nvd.nist.gov/vuln/detail/CVE-2007-4460
 - imagemagick: CVE-2023-5341: https://nvd.nist.gov/vuln/detail/CVE-2023-53=
41
 - imagemagick: CVE-2024-41817: https://nvd.nist.gov/vuln/detail/CVE-2024-4=
1817
 - imagemagick: CVE-2025-43965: https://nvd.nist.gov/vuln/detail/CVE-2025-4=
3965
 - imagemagick: CVE-2025-46393: https://nvd.nist.gov/vuln/detail/CVE-2025-4=
6393
 - imagemagick: CVE-2025-53014: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
3014
 - imagemagick: CVE-2025-53015: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
3015
 - imagemagick: CVE-2025-53019: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
3019
 - imagemagick: CVE-2025-53101: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
3101
 - imagemagick: CVE-2025-55004: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
5004
 - imagemagick: CVE-2025-55005: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
5005
 - imagemagick: CVE-2025-55154: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
5154
 - imagemagick: CVE-2025-55160: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
5160
 - imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
5212
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
5298
 - imagemagick: CVE-2025-57803: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
7803
 - imagemagick: CVE-2025-57807: https://nvd.nist.gov/vuln/detail/CVE-2025-5=
7807
 - imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-6=
2171
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-6=
2594
 - [NEW] imagemagick: CVE-2025-65955: https://nvd.nist.gov/vuln/detail/CVE-=
2025-65955
 - [NEW] influxdb: CVE-2024-30896: https://nvd.nist.gov/vuln/detail/CVE-202=
4-30896
 - keepalived: CVE-2024-41184: https://nvd.nist.gov/vuln/detail/CVE-2024-41=
184
 - krb5: CVE-2025-3576: https://nvd.nist.gov/vuln/detail/CVE-2025-3576
 - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - [NEW] libcoap: CVE-2023-51847: https://nvd.nist.gov/vuln/detail/CVE-2023=
-51847
 - [NEW] libcoap: CVE-2024-46304: https://nvd.nist.gov/vuln/detail/CVE-2024=
-46304
 - libcoap: CVE-2025-50518: https://nvd.nist.gov/vuln/detail/CVE-2025-50518
 - [NEW] libcoap: CVE-2025-59391: https://nvd.nist.gov/vuln/detail/CVE-2025=
-59391
 - libde265: CVE-2023-43887: https://nvd.nist.gov/vuln/detail/CVE-2023-4388=
7
 - libde265: CVE-2023-47471: https://nvd.nist.gov/vuln/detail/CVE-2023-4747=
1
 - libde265: CVE-2023-51792: https://nvd.nist.gov/vuln/detail/CVE-2023-5179=
2
 - [NEW] libiec61850: CVE-2024-45969: https://nvd.nist.gov/vuln/detail/CVE-=
2024-45969
 - libmad: CVE-2018-7263: https://nvd.nist.gov/vuln/detail/CVE-2018-7263
 - libmemcached: CVE-2023-27478: https://nvd.nist.gov/vuln/detail/CVE-2023-=
27478
 - libtar: CVE-2013-4420: https://nvd.nist.gov/vuln/detail/CVE-2013-4420
 - libtar: CVE-2021-33643: https://nvd.nist.gov/vuln/detail/CVE-2021-33643
 - libtar: CVE-2021-33644: https://nvd.nist.gov/vuln/detail/CVE-2021-33644
 - libtar: CVE-2021-33645: https://nvd.nist.gov/vuln/detail/CVE-2021-33645
 - libtar: CVE-2021-33646: https://nvd.nist.gov/vuln/detail/CVE-2021-33646
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - libvpx: CVE-2024-5197: https://nvd.nist.gov/vuln/detail/CVE-2024-5197
 - libwebsockets: CVE-2025-11679: https://nvd.nist.gov/vuln/detail/CVE-2025=
-11679
 - [NEW] libwebsockets: CVE-2025-11680: https://nvd.nist.gov/vuln/detail/CV=
E-2025-11680
 - libwebsockets: CVE-2025-1866: https://nvd.nist.gov/vuln/detail/CVE-2025-=
1866
 - linuxptp: CVE-2024-42861: https://nvd.nist.gov/vuln/detail/CVE-2024-4286=
1
 - [NEW] live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025=
-65405
 - [NEW] live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025=
-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-10005=
38
 - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
 - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
 - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
 - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
 - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
 - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
 - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
 - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
 - [NEW] minio: CVE-2024-36107: https://nvd.nist.gov/vuln/detail/CVE-2024-3=
6107
 - mtr: CVE-2025-49809: https://nvd.nist.gov/vuln/detail/CVE-2025-49809
 - netdata: CVE-2024-32019: https://nvd.nist.gov/vuln/detail/CVE-2024-32019
 - networkmanager: CVE-2024-6501: https://nvd.nist.gov/vuln/detail/CVE-2024=
-6501
 - [NEW] nodejs: CVE-2024-27982: https://nvd.nist.gov/vuln/detail/CVE-2024-=
27982
 - nodejs: CVE-2025-23165: https://nvd.nist.gov/vuln/detail/CVE-2025-23165
 - nodejs: CVE-2025-23166: https://nvd.nist.gov/vuln/detail/CVE-2025-23166
 - nodejs: CVE-2025-27210: https://nvd.nist.gov/vuln/detail/CVE-2025-27210
 - open62541: CVE-2024-53429: https://nvd.nist.gov/vuln/detail/CVE-2024-534=
29
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-10=
00155
 - openh264: CVE-2025-27091: https://nvd.nist.gov/vuln/detail/CVE-2025-2709=
1
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-3932=
7
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-3932=
8
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-3932=
9
 - openvpn: CVE-2025-13086: https://nvd.nist.gov/vuln/detail/CVE-2025-13086
 - openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - opusfile: CVE-2022-47021: https://nvd.nist.gov/vuln/detail/CVE-2022-4702=
1
 - p7zip: CVE-2022-47069: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] postgresql: CVE-2025-12817: https://nvd.nist.gov/vuln/detail/CVE-2=
025-12817
 - postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12=
818
 - [NEW] proftpd: CVE-2024-48651: https://nvd.nist.gov/vuln/detail/CVE-2024=
-48651
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-202=
5-13372
 - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-202=
5-64460
 - [NEW] redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-4=
6686
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
 - sngrep: CVE-2024-35434: https://nvd.nist.gov/vuln/detail/CVE-2024-35434
 - spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
 - spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
 - spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-4425
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - synergy: CVE-2020-15117: https://nvd.nist.gov/vuln/detail/CVE-2020-15117
 - tcpreplay: CVE-2025-9157: https://nvd.nist.gov/vuln/detail/CVE-2025-9157
 - tcpreplay: CVE-2025-9384: https://nvd.nist.gov/vuln/detail/CVE-2025-9384
 - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
 - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
 - tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-8241
 - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
 - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
 - tigervnc: CVE-2024-0408: https://nvd.nist.gov/vuln/detail/CVE-2024-0408
 - tigervnc: CVE-2024-0409: https://nvd.nist.gov/vuln/detail/CVE-2024-0409
 - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-2659=
4
 - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-2659=
5
 - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-2659=
6
 - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-2659=
7
 - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-2659=
8
 - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-2659=
9
 - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-2660=
0
 - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-2660=
1
 - unbound: CVE-2024-43167: https://nvd.nist.gov/vuln/detail/CVE-2024-43167
 - unbound: CVE-2024-43168: https://nvd.nist.gov/vuln/detail/CVE-2024-43168
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - vlc: CVE-2024-46461: https://nvd.nist.gov/vuln/detail/CVE-2024-46461
 - vsomeip: CVE-2024-3979: https://nvd.nist.gov/vuln/detail/CVE-2024-3979
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13=
502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13=
947
 - webkitgtk3: CVE-2025-43342: https://nvd.nist.gov/vuln/detail/CVE-2025-43=
342
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43=
343
 - webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-655=
8
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66=
287
 - webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-12840
 - webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-15107
 - webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-15641
 - webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-12670
 - webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-35606
 - webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
 - webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
 - webmin: CVE-2022-30708: https://nvd.nist.gov/vuln/detail/CVE-2022-30708
 - webmin: CVE-2022-36446: https://nvd.nist.gov/vuln/detail/CVE-2022-36446
 - webmin: CVE-2023-43309: https://nvd.nist.gov/vuln/detail/CVE-2023-43309
 - webmin: CVE-2023-52046: https://nvd.nist.gov/vuln/detail/CVE-2023-52046
 - webmin: CVE-2024-36450: https://nvd.nist.gov/vuln/detail/CVE-2024-36450
 - webmin: CVE-2024-36451: https://nvd.nist.gov/vuln/detail/CVE-2024-36451
 - webmin: CVE-2024-36452: https://nvd.nist.gov/vuln/detail/CVE-2024-36452
 - webmin: CVE-2024-36453: https://nvd.nist.gov/vuln/detail/CVE-2024-36453
 - webmin: CVE-2024-45692: https://nvd.nist.gov/vuln/detail/CVE-2024-45692
 - [NEW] webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-=
67738
 - weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-46613
 - [NEW] wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025=
-13912
 - wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394
 - wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - yasm: CVE-2021-33454: https://nvd.nist.gov/vuln/detail/CVE-2021-33454
 - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
 - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
 - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
 - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
 - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
 - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
 - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
 - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
 - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
 - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
 - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
 - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
 - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
 - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
 - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
 - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
 - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
 - zabbix: CVE-2025-27232: https://nvd.nist.gov/vuln/detail/CVE-2025-27232
 - [NEW] zabbix: CVE-2025-27234: https://nvd.nist.gov/vuln/detail/CVE-2025-=
27234
 - zabbix: CVE-2025-27237: https://nvd.nist.gov/vuln/detail/CVE-2025-27237
 - zabbix: CVE-2025-49642: https://nvd.nist.gov/vuln/detail/CVE-2025-49642
 - zabbix: CVE-2025-49643: https://nvd.nist.gov/vuln/detail/CVE-2025-49643
 - znc: CVE-2024-39844: https://nvd.nist.gov/vuln/detail/CVE-2024-39844

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Removed this week (10):=20

 - apache2: CVE-2025-55753: https://nvd.nist.gov/vuln/detail/CVE-2025-55753
 - apache2: CVE-2025-58098: https://nvd.nist.gov/vuln/detail/CVE-2025-58098
 - apache2: CVE-2025-59775: https://nvd.nist.gov/vuln/detail/CVE-2025-59775
 - apache2: CVE-2025-65082: https://nvd.nist.gov/vuln/detail/CVE-2025-65082
 - apache2: CVE-2025-66200: https://nvd.nist.gov/vuln/detail/CVE-2025-66200
 - hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
 - jasper: CVE-2024-31744: https://nvd.nist.gov/vuln/detail/CVE-2024-31744
 - libavif: CVE-2025-48174: https://nvd.nist.gov/vuln/detail/CVE-2025-48174
 - proftpd: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-48795
 - smarty: CVE-2020-10375: https://nvd.nist.gov/vuln/detail/CVE-2020-10375

