Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167ABC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 09:27:11 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web11.5756.1685438825895236196
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 May 2023 02:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=lQnGpz8g;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1396; q=dns/txt; s=iport;
  t=1685438825; x=1686648425;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=S+LssidYpSY3C73DmjzPwFNApNnJje5Oz+FbaXKDXmc=;
  b=lQnGpz8gHMjCkZRh5FXnyXa9hng47nnmJzF/FQG5rHJm/QwWF9u8yRpl
   5YdtoPl7qEMRoGNLrMZXvrtEeECY68T+D5zGKayzU2s37Yw7F6G/59Pu5
   QYzg7pAxA0PY8Z45Q79fAozTYK7DBe3WHzurIGpmCYvrBYONAdeh76lif
   g=;
X-IPAS-Result: =?us-ascii?q?A0BhAQDywHVkmIsNJK1aHgEBCxIMQCWBHwuBXVJzAlg9G?=
 =?us-ascii?q?i2III1xi1CSF4ElA1YPAQEBDQEBLgcPBAEBhQYChVwCJTQJDgECAgIBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOECeFaA2GBAEBAQEDA?=
 =?us-ascii?q?REoBgEBCQEuCwQCAQgRBAEBHxAhBwodCAIEARIIGoJcAYIoAzEDAaE5AYE/A?=
 =?us-ascii?q?ookeIE0gQGCCAEBBgQFax8BMQObEQ2CSQmBQodUhScbhEgnG0CBTYFYgmg+g?=
 =?us-ascii?q?iBCAoFihBKCLo4/hAaJHoEvcIEhgSeBAgIJAhFngQ4IZnt5QAINVQsLZYEjV?=
 =?us-ascii?q?T2BRwICET4PBU18DgERAwcEAoEHEC8HBDIJFgkGCRgxJwZWBy0kCRMVQgSDb?=
 =?us-ascii?q?AMKgSM1NwNEHUADC3A9NQYOHwUEIwFLgVgEL0KBEQJKnEKDAIEOgUSBJaF+o?=
 =?us-ascii?q?U5wCieDYYt7jRqBeYYnF4N/jGqYZ5gOIIIvjn2WPQIEAgQFAg4BB4FjOoFbc?=
 =?us-ascii?q?BWDIglJGQ+OIBmDW495QzI7AgcLAQEDCYtGAQE?=
IronPort-PHdr: A9a23:T2g1sxC6dVZ/eOo8qb0GUyQVoBdPi9zP1kY9454jjfdJaqu8us+kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+iLzKlBbTf73fEaauXiu9XgXExT7OxByI7HuEY7Tk96w28i5+obYZENDgz/uKb93J
 Q+9+B3YrdJewZM3M7s40BLPvnpOdqxaxHg9I1WVkle06pK7/YVo9GJbvPdJyg==
IronPort-Data: A9a23:cEPxOq977DZ8M+1uC4UKDrUDn36TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GZNCm6CMqnfZWCjKN4kYNy//EkH75aBzoRmHAA4/n1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEjmE4E3F3oHJ9RGQ74nQLlbHILCCYngZqTNMEn970ko+wLZh2+aEvPDga++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFJZH4rHpxdGlOjKmVi8kFWc
 M6YpF2x1juxEx7AkbpJmJ6jGqEBaua60QRjFhO6VoD66iWuqBDe3Y5gEcsuY2Zdhw6OuM9Ny
 8l0haC+EUAAa/ikdOQ1C3G0Egl3OalAvbTAO3X674qYzlbNdD3nxPAG4EMeZNJDvL0pRzgVs
 6VDeVjhbTjb7w6y6KmwSuhwnMMvBMLqJ4gY/HpnyFk1CN5/GMqTGviUtY8wMDEYgNpFObGAb
 NcidCtrbAjpPTcUMHUsB8dr9AuvriCvL2IHwL6PnoIw+2XVwQl73bThPdaQdtGUSMF9mkeDu
 nmA+Hz0BBwfPtGTxTeJtHW2iYfycTjTUYYWEviz8eRnxQPVzW0IAxpQXly+yRWktqKgc4l6G
 n4e2yAilq8V63CoUuDNYxPg51fR63bwROFsO+E97QiMzI/d7ACYGnUIQ1Z9hDoO6ZNeqdsCi
 wXhoj/5OdB8mObPGS/Bqt94uRv3aHZIfD5aDcMRZVZdi+QPtr3fmf4mojxLP6evitTzFVkcK
 BjV8XBi3N3/YSP3vphXEHjOhzaq45POVANwuEPcX3mu6UVyY4vNi22UBbrzs68owGWxFwbpU
 J04dy62t7Bm4Xalz3HlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hUJGS5P
 ReI4l4Jvve/2UdGi4cqM+pd7Ox3ksDd+SjNDZg4k/IXOMEqLV/blM2QTRfIhTiFfLcQfVEXY
 MfHLpnE4YcyAqV8xz3+XPYGzbIu3UgDKZD7G/jGI+Cc+ePGPha9EO5dWHPXN7xRxP3f+m39r
 Y0AX/ZmPj0CCoUSlAGNr95KRb3LRFBmba3LRzt/LbDcelE7RD96Vpc8A9oJIuRYokicrc+Rl
 lmVUU5Dw125jnrCQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:9RlWWq21uD3PRywqKXifEQqjBRRyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ5exoWJPrfZquz+8L3WB3B8bvYOCGghrkEGgG1+rfKlLbalTDHmA279
 YZT0ETMqyTMbE+t7eG3ODaKadu/DDkytHSuQ629R4EJmEaCJ2IrT0JcDpzeXcGIDWucKBJcq
 Z0kfA3wAZIF05nC/hTAENpY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 n4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv2/VXEO0aKSAWQR4Z
 zxSiQbToBOArTqDyaISC7WqkvdOfAVmjnfIBGj8CLeSIfCNUMH4oJ69PJkWyqcz0YmodF717
 gj5RPmi3MQN2KPoMw4jOK4DC2DUSGP0CIfuP9WgHpFXYQEbrhN6YQZ4UNOCZ8FWDn38YY9DY
 BVfYnhDdttACWnhkrizyBS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEBvo
 3/Q+5VvaALStVTYbN2Be8HT8fyAmvRQQjUOGbXJVj8DqkIN3/Etpay6rQo4+OhfoAO0fIJ6d
 /8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCo0c1a74gRgMyKeFMqC1z2dLkDqbrUnxxEOLypZx
 +aAuMlP8Pe
X-Talos-CUID: =?us-ascii?q?9a23=3A0woohWkGjZppyvX/w462iEIUnK3XOSb4/UXaAkW?=
 =?us-ascii?q?0MmFOV4GWVWagxK081OM7zg=3D=3D?=
X-Talos-MUID: 9a23:mg9atQry60uuaBDMQpoezzd4P+Mvva+zM10clZUakpeubiZSADjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-6.cisco.com ([173.36.13.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 May 2023 09:27:04 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 34U9R2FA024969
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 09:27:04 GMT
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,203,1681171200"; 
   d="scan'";a="2165519"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwUPpT+LwcRDow1EDhjXN1W9iOZ9gaQeAR1+t4ZVmOMyR+o84fYHgwaWcYGBrlj03qs+1o6GdQbb8ii7An3JxsMaEGS3gJ74xAjuxXsyeTNvj1X6hpF8n2fD3PL471WdAu/Vf3ixnC9PCbH2XRABWD3P1PgLkiSw73xakIcajIQXtbVA8GtchcyGQizvmcGhLqeFZKk4j/r5H/sfDTE6y90hNIWjg7DmA2oZxg8qLIWPv8KNgZ/UfXBX23Y2bqv2rLCinxwpWyBcEoUrl9eX2lRuKqNPpLGEENqUiXdvJVmIledwbvFlpBho2pdqzxEedhxnLkdb81S8IDZtzp+2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36CQByAQ/gnMJtM9fB6+PEVvYA53dOj6VGWXYFgfzX8=;
 b=hja0+xwn47Fo8+42NUaCoqhxAJtukPR07qfht2hFoAB3gV8NN0NaTkJ54ZmNiXpjjlnWWJKiCaraW47w1HQTy5ZJo2PdrWgdA00SOxh8cNZTS0wsKKEbyBqGydsjXes7D26MV9gGBxlnPs5zzbSfp6rtvEctZ8NurbwYy6g0JsD45pb4TUmOwsiOGOFPt48VX2uAjvxfcJgFAV41Q0zvds1VsfLOvv+ObtiEByOcT325xadA4V89GkL+M8JLDI9JIRqdqoVZpJ0JeXNaVLpjKNqebkHV9WTbsIs5NI2s958wNb7XXPVw1S89AA26sXx8f4T4s0UhlpAt5oVOab78WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36CQByAQ/gnMJtM9fB6+PEVvYA53dOj6VGWXYFgfzX8=;
 b=oBm3ENmgChCuRfCChjQd2MYjK2aka8s9dVl8fXo+AfhJbRVXybOurbr6V3nAUnZceehWR8tKMn5UulM42oMdwzKXesFnfEN7doSsCZOSaLl3lh8Ywf3rFlXOT5TXHD0e8zoU10+vuXWuwqbAfNk9g/bGRHjwQJL8vm4BiC+Jh2Y=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 09:27:00 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:26:59 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: RE: [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18
Thread-Topic: [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18
Thread-Index: AQHZihJ7N7ACGsNDLkOa8B2Y1fhbQa9ynDSQ
Date: Tue, 30 May 2023 09:26:55 +0000
Deferred-Delivery: Tue, 30 May 2023 09:26:31 +0000
Message-ID: 
 <SJ0PR11MB6717297349042BA59351FBB2DC4B9@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230519052617.2747159-1-schitrod@cisco.com>
In-Reply-To: <20230519052617.2747159-1-schitrod@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: raj.khem@gmail.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|MW5PR11MB5788:EE_
x-ms-office365-filtering-correlation-id: e115d628-7488-4b4c-ba8a-08db60f004d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w+bQNv52UC2GOQc7Rl8Jx9CgHo5oqgfuMa69s85XJziIRV/LlMFjR0Hz6OVuOU6x7o/A3h+9RkuZv23sZnjA58RXrwAdPHJVh2Hlcg7eqaACsx+C/4MoEEY0RX2+UajhtKpx1ybfkZ9hHeKaPz7fOGUkXeBdwj8ILrZZRUxNzABaX9JLFjrW5xE5u2zVcDxeIGI9mM2pm9zyB48hrXokjbo/cFzRETa1FydgtvEsEbMhBKZe1ez7Vqbq1lg8Y24INrT2eVmDKTb6uPD7OH91RolyDXNtnn69hA7s62/mCERrA5gso76sZPNugRJGQ38Z7ri9FgpwjV6x1lY6bfGlzc75+yTNviFc8dX8Ynmdf8UngpEUCTyr9IXy04lJHPfyD9Kf8RkZjtEGjZwIurq1p25lNqRctUOi8/tDMiR/z6Xv6uiF8eSrmM9Fa0gfjJ17vmm8OSOi7OxsBZGngpHBDO0d59yFI+vBuRvVjlLbW3yvfnfrNGEt5rnW9PjEKaBFepanEAmZu7pXKyTBasRQ2KgUBY1yX7uxvlQTuLvGsHW8GE3Bb6rsH2I9DVTauZkZtQ5MpfY49z8dDhb1fpz/FNIBSX8N9Kt+Zs7u0ui4WzhVwwBkzCYGRfurjZFawHnO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(122000001)(478600001)(38100700002)(86362001)(38070700005)(64756008)(66446008)(66946007)(66556008)(66476007)(83380400001)(76116006)(110136005)(2906002)(4001150100001)(71200400001)(6666004)(6506007)(9686003)(53546011)(7696005)(33656002)(186003)(26005)(15650500001)(316002)(41300700001)(5660300002)(52536014)(8676002)(8936002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dlXwueaz9u9jd29D7ZrglhNN5MkJ2qZh88WwMqb7Feeq8UdQL43u8RkgU/qO?=
 =?us-ascii?Q?kTVX7D+vgz/jYsi00UJpKeb4akAQ2hX3E1URdbqkXqMhplSImql8mAXL3eRu?=
 =?us-ascii?Q?8StH4LHwNtQUshQAD5QNT/rZTyhEz4W7H2W/hq5yek8flM5eAerWmD5Wx8sa?=
 =?us-ascii?Q?4nSS/hfuC4zm1uMEIBWaSxJwaM55++QT1i5gZGkcLYwhJbhQoTCnD9fZcw+2?=
 =?us-ascii?Q?kSx5ydOmUA05mEy+Do5GnROr1HF9ROL3iccHhh9aEaJWG/8rLMAKNgpQCC/9?=
 =?us-ascii?Q?GNw+a6K2bk0n7qi2zdENmeVVvBDn0dbJBGIhaEAkkHURdpo/mbikJhxpT5ii?=
 =?us-ascii?Q?jK2u5M+bitXVEC19G2m6bhAhGuCVJyGtdpL1jEIoz3YXuz44U94/XJzA5GBA?=
 =?us-ascii?Q?EUN8ZkJe02aJ1l0mUHr7TU1n3Z+ZFfMudFPhwLT1EjcPXPFU4xyoUAg8+sCk?=
 =?us-ascii?Q?THlyyxMR6cI4/o9O0SugRal/Ao5JndMLSUkBnA+e+gzAOzGYksqJY8nXwtDI?=
 =?us-ascii?Q?r5ZQfhKD/Afd7vysHPBr7SVsISREG/0arVU+D/pTBGx+Knu85u7LfDfOgiti?=
 =?us-ascii?Q?u53oTmWNx9XpymykGXzAVMXrIffkbmIWsrAzrDzMmz2SF5ysFA0XthJy45KY?=
 =?us-ascii?Q?Kjn63jwb7dqMxr4uc1RHaZGK021CUOSH8+B34LNOLFrM+6WWFeyXaDQ0YpKk?=
 =?us-ascii?Q?LxCNuL+4CT23/aTbdG4rI6CakOfX7QMjho2gvHOQ6PdkZmxDZeOUpedRJN8p?=
 =?us-ascii?Q?MFpV9Mi4jqOZZ413uNPAWlH1K+aJvqSgaHUmKwRBwsqShQ92b84yCS3yDutJ?=
 =?us-ascii?Q?YiSkBAnEgQq088pglDNHfuY3K0VpcYknRjHZ/tkykNmQVJZ0ouUW08M9OGAl?=
 =?us-ascii?Q?WbzXaL7XYU1wm4SFYg3XCosd5eV9Iz+BLW/J7eEjJypCnCgt73JaEZcEAJRf?=
 =?us-ascii?Q?rvg1FS7kPc4qz4m226/3bD0YYaUZmJ7VL79cU5VVJbVkwv1tme2at4ankdQq?=
 =?us-ascii?Q?yibj9NIaM64eDLOiVmIO0qS4CYwFtwCWpMeMq6mM8stwGSSFlQdnK7pOxmF2?=
 =?us-ascii?Q?+IUMn7nrC7yGUdrQucno0Wi5OhUvfRSIFRe3QeOLAIRk1x5nTOSf7FmNhPN9?=
 =?us-ascii?Q?UC/QaP4TtmItFFIJZq+Vt4iIN2/TWA0hvUn06QZGsQrRS5cGCVae6nyk+4jD?=
 =?us-ascii?Q?eaNf0meVaxo7UD6+hMg42+m40uSFdeVC5SK3oepPVmr6zF9dwUBYcAfX83Tf?=
 =?us-ascii?Q?GWEX1N/v+TtZXMKZhV75JaJICHSu5qciZ4p67BiDylHmUE4HbOoZKo8zTk2x?=
 =?us-ascii?Q?/V+nvcLuIw+u8Kmpq88vSdXvsDed7wId006dLSD+i5HOl25zyZdCxJVi8AdO?=
 =?us-ascii?Q?V035rCSgyMjcnwZ73lVMuAKSTUJ1tnNZ+w9FzxmnUbubiRpwS5sVzBm+ePH0?=
 =?us-ascii?Q?oZlpp0k8PrD3WkgZvvW8wShtefDH51D+tOvNKyXs0lPJq9anPVs9SvY645R8?=
 =?us-ascii?Q?jon54DpeDCUBdbgGcQ7QLtZ9mxeI7Npxk0K4tnQgKLVMXbzShTnH/0PLVO5M?=
 =?us-ascii?Q?fOVDnoW+B6QoetxxR/NW0aP1HM3uTW0UXMQpcfLV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e115d628-7488-4b4c-ba8a-08db60f004d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 09:26:59.2267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ulOKuJWP5n9Eax1gAeNeVxpTPNeg6VG1a0ad4vKailOf8jJ18EdRLeMSWaexnAlgiVzcviXzXHCw9aTF/Qoyew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: alln-core-6.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 May 2023 09:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102896

Hi all,

Any update/comment ?
@raj.khem@gmail.com can you please guide me on how to procced further ?

Thanks,
Sanjay

-----Original Message-----
From: Sanjay Chitroda <schitrod@cisco.com>=20
Sent: Friday, May 19, 2023 10:56 AM
To: openembedded-devel@lists.openembedded.org
Cc: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco=
) <schitrod@cisco.com>
Subject: [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18

As per gnulib_2018-03-07 recipe information, SRCREV =3D "0d6e3307bbdb8df4d5=
6043d5f373eeeffe4cbef3"
This revision was committed on "2018-12-18".

There is a discrepancy between SRCREV and the recipe version.
Which reports "CVE-2018-17942" as unpatched.

To report "CVE-2018-17942" as patched,
We need to align a recipe name with SRCREV commit date.

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 .../gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/recipes-su=
pport/gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb} (100%)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb b/meta-=
oe/recipes-support/gnulib/gnulib_2018-12-18.bb
similarity index 100%
rename from meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
rename to meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
--
2.35.6


