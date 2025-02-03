Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4866AC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:59:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.9])
 by mx.groups.io with SMTP id smtpd.web10.94877.1738605559531788942
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=b8tQwfDE;
 spf=pass (domain: siemens.com, ip: 52.101.70.9, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scAZaa+OnTwtGZs4n4kRWSzb66S1swj2LyUaGTzLgLp2Pbm59KhQmRMax35BdfHllwJEB2EpVoTMO4g43FYaeSDXpb9T9W5DdUA/Aol+AQV4QU+4+R1WJ/W0dzkSWL8x2QnuLV8Ps8eGFi1xxDALDmrlBA/rEF2US9YCI+ecKBJt60eOMAOYpd0noO4PgZPiBc0YshPbLZVRP+Vnl4P0FnhRuqk1GiF2GlCZ9ALIO005B8vd8avrkBkVEchoTUgT3ka1BKRTde6uY/W1jssPvpwUBG3paZlCMW6M6MoekI6s+3kIu5FevAXBfHchmiNbBa+Ab/0PexpSG8DG9hzM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFS2zl12iOPtkym+3bb4Pp1YqUQbxYmPQiAk7660Gms=;
 b=aHBS7dQvTqq7fVkICjdHpjipwM5G7IIjKpgGBnFnOMckXvKmnuLjZ5nkRzcankVMeyVdQcBLkneKd83CO6xr+hwSSX9zc4OxLjw1lV6B4NZZRc41dtHm1eI5VnCAhO/cggpWExhZSqoZB+lMdVkyGnpmy80QfX98qWLTSoSOe2Bi427L1DEB0R/HN6K/1STg20PuaB97NQMP/UqnmxQrBdt+rxMlm2PIlOzJA1wcXb76Md31wqYs+ONC1x6HjfwLNcWNMOm7Hq+wQXOtHtkD5n1tV4pRwtL4ilA1JyNnV+N8XlnLRFqL9Wb/mWaCQOHqirYBtCSCn2US6icwdIbU9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFS2zl12iOPtkym+3bb4Pp1YqUQbxYmPQiAk7660Gms=;
 b=b8tQwfDEiTQoUR6l0Vc44a0UFphpiaW4tMEXVo5vI89Zbvz6GT/WCUXGY8/UE62hDxPRrBaoxHPVweDOoBxc65ujay0pl7+X6NthxGDXu437Jo8ukzhPS0k1XMh8S1BFpWHeJx4gFvbwZerkVJ+eMPnMnZtaxGorvUSe+w+8ezScsoO6e3O4Ehgrtlrhxorvgxwz6Rzk6yopKsm4/ybStlGHFZCrexi+jCv0+WYUBsICYePGeuyrfWcLH7aJijOFeXacEp9qlDaxj1XLIMpU8khoupzyKNSoBVxUKg5NeHJzMZqkp0u1BeF6VNcWwn6vi5yUwJdfH96sYfE5bw+BBA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB5362.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.8; Mon, 3 Feb
 2025 17:59:16 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8422.005; Mon, 3 Feb 2025
 17:59:16 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 4/8] protobuf: don't download git submodules
Thread-Topic: [oe] [meta-oe][PATCH 4/8] protobuf: don't download git
 submodules
Thread-Index: AQHbdbsMDpGpcL+BSUe1qvtPaJolnrM0vEEAgAEUzwA=
Date: Mon, 3 Feb 2025 17:59:16 +0000
Message-ID: 
 <AS1PR10MB569786A8DA6936247DD0CD86FDF52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <20250202213910.284312-4-peter.marko@siemens.com>
 <CAMKF1sra1oC+W8hySB75F53SFHOqOgqLbLyF3vTv320M1AO0yA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sra1oC+W8hySB75F53SFHOqOgqLbLyF3vTv320M1AO0yA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7612e662-7120-43ea-9c00-472c8ef9ef16;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-02-03T17:08:36Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB5362:EE_
x-ms-office365-filtering-correlation-id: 268f0347-8740-4227-e4ee-08dd447c7978
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dnJZU1VjOERKTVJ0YllxREZjcDNDTE12N09uenRXSjNGdFJVNHVYRHFUaXpK?=
 =?utf-8?B?SVFjeTNSbGhSdTNaNnorVFpLdFQrL1daMjI0ZlB3VFdWZkF1Z3JMNUtNcnlo?=
 =?utf-8?B?WVlES3Q3S0RJazc1L2MrMTJZNFNydHYraUlwQ1RHdW54RUU2RzZDV3FBcmxV?=
 =?utf-8?B?RStPQysvOEE1Y0h4RUVtUG90Ym9Lai9QWTdDRlRsbkQyNGRrY01XK05hZHh5?=
 =?utf-8?B?S2EzdmJtOS90ZFJHZzdteTA1TlVNTHJXbGQyTUtNMDl3cDM5V2ZCL0kremxu?=
 =?utf-8?B?VitDQXJ4bENjK1gxNDdybmExWTJQYmN0YXl4bUx1WmNFRVNFQzdGbDZKS1FP?=
 =?utf-8?B?bWxkM3ljRXM1RDRueTAwN0pleUtSMnhFaTA1QVVEUnh5MUdxM3JWT0YvbldM?=
 =?utf-8?B?dEtsSzVxTEdEZDh0bmY0U0JPODBFSjdCVzQ3a3NlYmpmb3UrRmM1cW55ZUdZ?=
 =?utf-8?B?ckRiVVVLZVFlVHVVZ1Y3QmRBWGZzcHN6Ymc1c2FMTDZXeVZJcTJqYzRHQXVk?=
 =?utf-8?B?MWt5QXVuTXBENjEvbW9hRDl5a1Rncm10b21BczFLUTNLVms0T1lUV1RHcTRT?=
 =?utf-8?B?eTRtM0pGTXVFYnhKcTdtb3lRRlR4NTZkVzlUUzhadXlYeitpSnNORFIvQS8x?=
 =?utf-8?B?NHFNSFUzMzEwRXozeUQvRkhOUzdKY3huVjIwVHFpNzF1aHJaT0lhTGYvcGc3?=
 =?utf-8?B?Sk5zNmdJeDJiVGtBTWtRQlFYWXNWRXl5VFpOVkRic3YxWWF4akNQVStwY0g0?=
 =?utf-8?B?VnVhWHMvVXV0SXNxLzByZnR3RWxhV2ZCMldnamFBdWRQT2ZwT2NNZnpDcXNu?=
 =?utf-8?B?eWk0SlZWVStIekJtY3M3d2Y3NDFOY295Q3piVmZhd0RiUm81RTNwWUNMdElu?=
 =?utf-8?B?UG1OY2tocHcvNjNWQ1o1dUJOcVJtdDB3Sm95d0o4NTdlUFJNVmxuZ3JGeGJo?=
 =?utf-8?B?clJqK2xxUzd0d1loOFl4a21WKzRSTGlIY2ZUdi9wajBRTzFja1lpandMdk14?=
 =?utf-8?B?REpodHM2c1g2Mk55cVpFWXY0OWwySWtLdEhlenU3K3Q2eTFrY3puR0tPTldX?=
 =?utf-8?B?b094SjhqRThkMVI0VmVOUjRuOEdCaXpqVGJacDR4Nlg4d0RJak1NWENOTnBM?=
 =?utf-8?B?cExYMk0ydlJXVStGR25hK2VBa01wNENaajQ1T3c2Q2ZrMEdBZWpZbXhXdlJ6?=
 =?utf-8?B?NlJpZndiUHNnWGxxdjUwV2VzZVEwRjkvTXFjaHBmMERUYXNWYmVod1dCYnVQ?=
 =?utf-8?B?WDd1TkVDUVd5VytrckllNXZPa05BWGFrOHp1aFR5c3JHM2VvWUtEZWFmNHc0?=
 =?utf-8?B?bmN6bnZHWks1WkhkTDgrNkdZY20vTy9hSGcxL1VjdjhWQVVtU2JLaTdaYTZt?=
 =?utf-8?B?cGc4QXh1U2o0K3dPdGYzQmdDUUdiYnB1eUdONXdiV1d4TUtLVmVzVTJkdm1U?=
 =?utf-8?B?cVlDb20yUDVuQXpseVNDdmkvckZma01CU2k0YU9TVGQzOWhsZS80dWdCMGJR?=
 =?utf-8?B?QkQ5K3VUMjIralY1NkNOUFZQTFllSmU4b1BudVpxRStHYlM4M29RQ0llbmVI?=
 =?utf-8?B?cXZ1RXVRcURoKzlDOStiYklLaDc3NVJocEJDQWR4bkdnOTZLM08zVDVDek1k?=
 =?utf-8?B?N3lMb1VuMUVxcEF2SzVDNzRhY1ZyMzQxWW0wVzIwcVU3RkZaRUZSN1dHR2o2?=
 =?utf-8?B?RlVaUGpmSTJSL1VtN0Z1NEFnZXdYQXltbHVpd3JYb3pBTFplOFhRRlpQSDd5?=
 =?utf-8?B?RitkYi9ZSEVTT1ZTN2FacmprUkNaVlByd1UzS0V2aGZNWGtMcG9lL1lIVjNk?=
 =?utf-8?B?RmNpVlBvRzlmTWU5RXhNb3FsRUVibStqVHBTWWpwaStjbkloNjlUNXd3YU5n?=
 =?utf-8?B?N3dFQi8zRGhnc0t1Z1ZVVGpsTEczUkN6alhqY2RPS0JQa0xiK1JqelY1bDJV?=
 =?utf-8?Q?mHZDVtpkSes4dUj+Lut9Ta4GoNuODjn6?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TEFCTit4NFpwMEk3WFBGL284bFUzSTIxd0JOVnhzbGJjZjdhd0JjVkwvb2h5?=
 =?utf-8?B?aGM3ckRVNmdnSDhWYWpZTFpCS2Q4cmtBb2xuNlBoWVNoV2JLTVpRbmdMZFBY?=
 =?utf-8?B?SzBWcHU3OXQ0ZXFiRGhBS2ZHblgvZzBJS2RMWXF2YUl4Z1I2d05HOGJEOWl2?=
 =?utf-8?B?RjdCV1YvNlJEWlNybS8wRFN6YkhOLzNTRkNudVhXK05WMyt0eHhUR0ZKQ0JK?=
 =?utf-8?B?VTJzKzlSQTBQb2Z1NjBZSWFHTjIwdURUWmFESSt5SHZualBxeUFzVlZGdzZO?=
 =?utf-8?B?N0Y2a1IvdEtmbUQ5SktmTHVveDA1ZVY5dFBCK05zdXZTOUhNOFpQdld1MmdJ?=
 =?utf-8?B?WnV4UGVLSkI5WURpVEZmT09WTnhEbW1WMytXYURRQ0huSlM2dE5LNHo4NTlj?=
 =?utf-8?B?WUZYMFRqcmdhK1cxVXVSQ2NZNFZKQ0FGUnNmREtQYVBGYTRKbXVjZFo3blR4?=
 =?utf-8?B?cjdtU09NL1psZVp3M2NldXV0QnZGeEJ4T3hkUlRHVjJpSzQrVldvSFdtd2hr?=
 =?utf-8?B?cWUwam16enkrRktGNkJYWTBzWW44VVZ3cmFSaEdyZEtsMjBRSFp3VlNkcTVP?=
 =?utf-8?B?cjRQWktjS1diSDh1Z1VxT0trMFd5R1JrTm12cmN1Wm5HaGZUTElab1llTEc3?=
 =?utf-8?B?Z3lGT1JPWEVxcm5WOHkydGJDZ0N3ck40VVZ0UWtXbG8xRnN4V3UzVGVaaGVG?=
 =?utf-8?B?cFlCNHMvZWs1bXdpcHQvU2JpajlSaFFNbnUzemp0NEwzNjJNcHkxVlpKVzZk?=
 =?utf-8?B?aUdPZ1BaOTBZdTBLR0tlakJrZWdQbiswVFo0Q0o2TFpES0NOZ201azR4d0RE?=
 =?utf-8?B?QkdObkVZdDh0T3BhQnBUNk56SVZVVU9ZaWd1Y1VyazdFc2lqSmVUek5tSE1F?=
 =?utf-8?B?b3RBamxDeTlQRGlHSGZ3c3RYMC9CSnQwUDlVMUNnTVNVMUZmOGcxZWN5RDB5?=
 =?utf-8?B?T0ZGNHcxQ0J4UFI0SUJFaGtEZDJNY1RSL1g4ejU3OHlVZU52dm1jdDNvM0Qz?=
 =?utf-8?B?d09rSlBycVFSZDhOODVKbUhoaGF6MUYzOVFGUzZORlRFZ0ZTN21JbS93NGM4?=
 =?utf-8?B?KzcyMlhBQVVvYzlmY0RoVTI2dWs3MUZUelhaZTNEV1VGUlJOa2xTTEkvM09M?=
 =?utf-8?B?Rys2YU1hYXpEU1YybVNpcFlZU1pXWk9QZ3VyOTlQaTBJeXZpdFJlcmNnTjRn?=
 =?utf-8?B?L3pObHRZdjQ3U0lhaWVYMmh3YTVKNS9Tam5UUG5YSEpmbzJJamp1WVo2bWpv?=
 =?utf-8?B?Z1FOWkdUcHJMdWNBVFcxcVlYeTNIVHMrSHNjbHZoV1JRazJwVWpXMjZLVVZW?=
 =?utf-8?B?QnpwaHZKWTVCTE5MWTJGL2w3V3djZllTRzBhSG0vUE95WXZqTVJBaHZRb3Z4?=
 =?utf-8?B?MmtnZlNuSFIwK1pkdXdSVkM1VHAxaG5lOUQ2Q1RjQ05mOGVPYmU5aDZnK08v?=
 =?utf-8?B?WjlsODBNbTk3bG1aVGtUbjBJRkw2VGl1NVdyM3JmTk5BMzVRbWp1c2FYVldZ?=
 =?utf-8?B?SUdBbDRidzdzSmdhQVA2WUcxblNaRXVvbzJQaDdQR3dCekhKYVh6WkJ1Zkw1?=
 =?utf-8?B?MGE0dmFSMS92UHJhWFhIaGU0ZVl3eFhnUmY3T1dQeEhoaUtGS1BLT0E2N3k3?=
 =?utf-8?B?WXJvc2pFRnNvQWw0Y3p2ZjdISnhlTkxqR1VrKzhmUUVmYjVUYjBxUnhmdVh6?=
 =?utf-8?B?Mnc0RmI5MWNZaTFBRU1JZTJaalVrWU1mMHVWNnFQOGVqdWlJZk9kVE1rSVdm?=
 =?utf-8?B?K3k1SFhVMmtOY00rU1lmOFVHbzhuYkFzSko0a2VENzNIZjFwQUF3UjdvUkQ0?=
 =?utf-8?B?ZUdneUZ0ZDRYRVlnWVQ3Q2l4ZFFTR3h1WlhYNkx5NGptOE5yTEl3blRsemFp?=
 =?utf-8?B?aFV1NVRtSzFGN2Fnek1PU0dSNzF5QjFwOCtacEpPelZZYzk5dVJ1YzgzL01E?=
 =?utf-8?B?L004a3dhUXFIbGp3SFVCR3FIdU9IQTVlaCtleW1HZVQxWEZKTDl5K0RBOWJM?=
 =?utf-8?B?d0dLN0YyK2hZK2Znb2dCemd5MVdZa3JMNVIzMkpUWWxrY1QvalZjU2ZwSkc3?=
 =?utf-8?B?UGRZbkN4UkFqQVI3ZEtzcytENDJ2SVlsKzVCZ01FbXRzWHJTNEQvQ1RlOHJ4?=
 =?utf-8?Q?GeD2LAFv7JZSKdTN0mw6XFXiA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 268f0347-8740-4227-e4ee-08dd447c7978
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 17:59:16.0793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWRaSSFkLml/+7HOhZmog9y9/1Y4ju8h8Lbt/Xgk2dF1/iXvnhcc22JMaZZXBPzmn0ZIGgaO0/kJa3EikxE4vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5362
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 17:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115243

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAzLCAyMDI1IDE6MzgNCj4g
VG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5j
b20+DQo+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0ggNC84XSBwcm90b2J1ZjogZG9uJ3QgZG93
bmxvYWQgZ2l0IHN1Ym1vZHVsZXMNCj4gDQo+IE9uIFN1biwgRmViIDIsIDIwMjUgYXQgMTo0MOKA
r1BNIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxwZXRlci5tYXJr
bz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IEZy
b206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IEFsbCBk
ZXBlbmRlbmNpZXMgYXJlIHVzZWQgZnJvbSByZWNpcGUgc3lzcm9vdCBub3cuDQo+IA0KPiBJdCBt
aWdodCB3b3JrIG5vdyB3aXRoIHRoZSB2ZXJzaW9uIHNldCwgaG93IGRvIHdlIGtlZXAgaXQgd29y
a2luZw0KPiB3aGVuIHRoZSBwYWNrYWdlcyBnZXQgdXBkYXRlZCBhc3luY2hyb25vdXNseSB1bmxl
c3MgdXBzdHJlYW0gc3RvcHMgdXNpbmcNCj4gdmVuZG9yZWQgY29tcG9uZW50cyBhcyBhIGZpcnN0
IGNsYXNzIHdheSBvZiBkb2luZyB0aGluZ3MuDQo+IA0KDQpJIHRoaW5rIHRoYXQgZ2l0IHN1Ym1v
ZHVsZXMgYXJlIGEgcHJvYmxlbWF0aWMgZmVhdHVyZS4NClNpbWlsYXIgdG8gbnBtIGZldGNoZXIs
IGl0J3Mgbm90IHRyYWNrZWQgYW55d2hlcmUgd2hhdCBpcyBkb3dubG9hZGVkLg0KRXZlbiB3b3Jz
ZSwgdGhlcmUgaXMgbm8gcmVmZXJlbmNlIGJldHdlZW4gZG93bmxvYWRlZCBoYXNoIGFuZCBjb21w
b25lbnQgdmVyc2lvbi4NClRoYXQncyB3aHkgd2UgaGF2ZSB2ZXJ5IGxvbmcgcnVzdCBjcmF0ZXMg
aW5jbHVkZSBmaWxlcyB3aGljaCB0aGVuIHRyYWNrIHRoZSBkZXBlbmRlbmNpZXMuDQoNClRoaXMg
bWVhbnMgdGhhdCBTUERYL1NCT00gcmVwb3J0cyBhbmQgU1ZNIHJlcG9ydHMgZG9uJ3Qgd29yayBv
biB0aGlzIGNvbXBvbmVudC4NCkFuZCB0aGlzIHdpbGwgYmVjb21lIGNydWNpYWwgYWZ0ZXIgRVUg
Q1JBIGFuZCBVUyBjeWJlcnNlY3VyaXR5IGV4ZWN1dGl2ZSBvcmRlciBoaXRzIHVzLg0KU28gSSdk
IHByb3Bvc2UgdG8gcmVtb3ZlIGdpdCBzdWJtb2R1bGVzIHdoZXJldmVyIHBvc3NpYmxlIGFuZCBy
ZXBsYWNlIHRoZW0gd2l0aCBzZWNvbmQvdGhpcmQvLi4uIGNsb25lcyB3aGVyZSBub3QuDQoNCkFs
c28gY29uc2lkZXIgdGhpcyBleGFtcGxlIHdoZW4gZmV0Y2hpbmcgc2NhcnRoZ2FwIGdycGMgcmVj
aXBlIHdpdGggc2hhbGxvdyBjbG9uZXMsIGl0J3MganVzdCBjcmF6eS4NCkNhbiB5b3UgdGVsbCB3
aGljaCBhYnNlaWwgYW5kIGdvb2dldGVzdCB2ZXJzaW9uIGlzIHVzZWQgaWYgd2UgdXNlIHRoZSBi
dW5kbGVkIHZlcnNpb24/DQpPciBpZiBhbnkgb2YgdGhlc2UgZGlkbid0IHNsaXAgdHJvdWdoIHRo
ZSBjcmFja3MgYW5kIGlzIG5vdCB1c2VkPw0KDQpnaXRzbXNoYWxsb3dfZ2l0aHViLmNvbS5hYnNl
aWwuYWJzZWlsLWNwcC5naXRfYmFyZV8yOWJmODA4LTEudGFyLmd6DQpnaXRzbXNoYWxsb3dfZ2l0
aHViLmNvbS5hYnNlaWwuYWJzZWlsLWNwcC5naXRfYmFyZV81ZGQyNDA3LTEudGFyLmd6DQpnaXRz
bXNoYWxsb3dfZ2l0aHViLmNvbS5hYnNlaWwuYWJzZWlsLWNwcC5naXRfYmFyZV9mYjM2MjFmLTEu
dGFyLmd6DQpnaXRzbXNoYWxsb3dfZ2l0aHViLmNvbS5hcXV5bmguY2Fwc3RvbmUuZ2l0X2JhcmVf
ODUyZjQ2YS0xLnRhci5neg0KZ2l0c21zaGFsbG93X2dpdGh1Yi5jb20uYy1hcmVzLmMtYXJlcy5n
aXRfYmFyZV82MzYwZTk2LTEudGFyLmd6DQpnaXRzbXNoYWxsb3dfZ2l0aHViLmNvbS5jZW5zdXMt
aW5zdHJ1bWVudGF0aW9uLm9wZW5jZW5zdXMtcHJvdG8uZ2l0X2JhcmVfNGFhNTNlMS0xLnRhci5n
eg0KZ2l0c21zaGFsbG93X2dpdGh1Yi5jb20uY25jZi54ZHMuZ2l0X2JhcmVfZTljZTY4OC0xLnRh
ci5neg0KZ2l0c21zaGFsbG93X2dpdGh1Yi5jb20uZW52b3lwcm94eS5kYXRhLXBsYW5lLWFwaS5n
aXRfYmFyZV85ZDZmZmE3LTEudGFyLmd6DQpnaXRzbXNoYWxsb3dfZ2l0aHViLmNvbS5lbnZveXBy
b3h5LnByb3RvYy1nZW4tdmFsaWRhdGUuZ2l0X2JhcmVfZmFiNzM3ZS0xLnRhci5neg0KZ2l0c21z
aGFsbG93X2dpdGh1Yi5jb20uZ29vZ2xlYXBpcy5nb29nbGVhcGlzLmdpdF9iYXJlXzJmOWFmMjkt
MS50YXIuZ3oNCmdpdHNtc2hhbGxvd19naXRodWIuY29tLmdvb2dsZS5iZW5jaG1hcmtfYmFyZV8w
MTVkMWEwLTEudGFyLmd6DQpnaXRzbXNoYWxsb3dfZ2l0aHViLmNvbS5nb29nbGUuYmVuY2htYXJr
LmdpdF9iYXJlXzViNzY4M2YtMS50YXIuZ3oNCmdpdHNtc2hhbGxvd19naXRodWIuY29tLmdvb2ds
ZS5ibG9hdHkuZ2l0X2JhcmVfNjAyMDllYi0xLnRhci5neg0KZ2l0c21zaGFsbG93X2dpdGh1Yi5j
b20uZ29vZ2xlLmJvcmluZ3NzbC5naXRfYmFyZV8yZmY0Yjk2LTEudGFyLmd6DQpnaXRzbXNoYWxs
b3dfZ2l0aHViLmNvbS5nb29nbGUuZ29vZ2xldGVzdC5naXRfYmFyZV8yZGQxYzEzLTEudGFyLmd6
DQpnaXRzbXNoYWxsb3dfZ2l0aHViLmNvbS5nb29nbGUuZ29vZ2xldGVzdC5naXRfYmFyZV80Yzlh
M2JiLTEudGFyLmd6DQpnaXRzbXNoYWxsb3dfZ2l0aHViLmNvbS5nb29nbGUuZ29vZ2xldGVzdC5n
aXRfYmFyZV81NjVmMWI4LTEudGFyLmd6DQpnaXRzbXNoYWxsb3dfZ2l0aHViLmNvbS5nb29nbGUu
Z29vZ2xldGVzdC5naXRfYmFyZV81ZWM3ZjBjLTEudGFyLmd6DQpnaXRzbXNoYWxsb3dfZ2l0aHVi
LmNvbS5nb29nbGUucmUyX2JhcmVfNWJkNjEzNy0xLnRhci5neg0KZ2l0c21zaGFsbG93X2dpdGh1
Yi5jb20uZ29vZ2xlLnJlMi5naXRfYmFyZV8wYzU2MTZkLTEudGFyLmd6DQpnaXRzbXNoYWxsb3df
Z2l0aHViLmNvbS5ncnBjLmdycGMuZ2l0X2U1YWUzYjYtMV92MS42MC54LnRhci5neg0KZ2l0c21z
aGFsbG93X2dpdGh1Yi5jb20ubWFkbGVyLnpsaWJfYmFyZV8wNGY0MmNlLTEudGFyLmd6DQpnaXRz
bXNoYWxsb3dfZ2l0aHViLmNvbS5tYWRsZXIuemxpYl9iYXJlX2NhY2Y3ZjEtMS50YXIuZ3oNCmdp
dHNtc2hhbGxvd19naXRodWIuY29tLm5pY28uZGVtdW1ibGUuZ2l0X2JhcmVfMDEwOThlYS0xLnRh
ci5neg0KZ2l0c21zaGFsbG93X2dpdGh1Yi5jb20ub3Blbi10ZWxlbWV0cnkub3BlbnRlbGVtZXRy
eS1wcm90by5naXRfYmFyZV82MGZhODc1LTEudGFyLmd6DQpnaXRzbXNoYWxsb3dfZ2l0aHViLmNv
bS5wcm90b2NvbGJ1ZmZlcnMucHJvdG9idWYuZ2l0X2JhcmVfNmI1ZDhkYi0xLnRhci5neg0KZ2l0
c21zaGFsbG93X2dpdGh1Yi5jb20ucHJvdG9jb2xidWZmZXJzLnByb3RvYnVmLmdpdF9iYXJlX2Jj
MTc3M2MtMS50YXIuZ3oNCg0KSSdsbCBrZWVwIHRoaXMgY29tbWl0IGluIHYyLCBidXQgZmVlbCBm
cmVlIHRvIGRyb3AgaXQgaWYgeW91IGRpc2FncmVlLg0KUGV0ZXINCg==

