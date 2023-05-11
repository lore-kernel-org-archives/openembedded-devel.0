Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EA2C77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:33:37 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.68])
 by mx.groups.io with SMTP id smtpd.web11.1365.1683822816112325691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 09:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=dSyW5NBd;
 spf=pass (domain: advantech.cz, ip: 40.107.117.68, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzRH8aDUxG5T3GLvfbSzQvZlVBQnNFWL0NquPpChYnrZO5RH/335bQMxBJbiL2GlWE7DzFgKSs2A6zeLWBfaO5EcF+Zi/jSivaVw4omidW/3l4X4C5ElncWM3sn7QJx1zRuYOjU05q4v6qaujat3jqZBuetVYAZ+nJ//KMm9JVcsuqEbLD6ebDRcluF3xobH9koCTXpStRGNabgKs8kJPMuHJ0XyjSSdKQRd6Kzd+3xJyLrX6LtoDPGPmjifkngdVakEoVBmr8abUbfn/o5MhBsUrts0eixrFHXb0jde+WCO4xxgwo90sloTaHTERIUM9lzrtXGts5zqbA/TU+Yh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5Da2lCI4GATN65YqLMCd84bchYfKOgjWPPNlcDhqYY=;
 b=oMSg7ADS+aAFav5xNSs4oq8O5COzGsYwclOXj4Qo4/rKKkCacGdjUaTiHCmkI9t+RrS7CXF50TlVVCtt2UXJ7tdaH8WB595eT/m819rofYdA7eUVi71hWh9+JtglgoA2/x7ttZm1mEYAQ6ufB3rGsXddeKJ0RCmlag+YHQs92E1t6mbOyRsQ3ctZz1KuPHOvjrbP4wzT76vJOZvwdM/RLzCOl2j0Tkt31fETx9qrfsisn1pYOwWDkK+RGGgxmq//eJXyuy6hsLRgh/EdkX94s1El65FWCc1GOdrOrgFP/yEa9TnxgYtXpS5TByAJ/pvjGT2WaGgt9804yS7ODJpUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5Da2lCI4GATN65YqLMCd84bchYfKOgjWPPNlcDhqYY=;
 b=dSyW5NBd2ySWYAH2nlKxpt7KXOx+pFwKPxVVuQi0bI5XM8S2TGspncpJ+uGhkMMTTKATGspUfktl8cX++jrNKYwWSv26IwfCU6pCIvikTicqsz5+YoQG1tLo7P8sNJWdDqfoqpcfu+Z30iBw+hGg/34RSPncY40xUo3UyGOhNTwONNyoFNQCtlE+odP89LeO7ju78h7ZXoYlVijWPvrhDvPKuBIY/OWbXiY9QlO+lKPQHm+qnScgzPl+m1dy7X8KrlYbx0t/trY5/bUzqkF3QyxXKzSBCgibgJ05qaGIp12NvfJ+IoPHxlOySK2m+BgExrLM8zlfsu6mPTWJuaKVZQ==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by PSAPR02MB5061.apcprd02.prod.outlook.com (2603:1096:301:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.7; Thu, 11 May
 2023 16:33:32 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598%4]) with mapi id 15.20.6387.021; Thu, 11 May 2023
 16:33:32 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] networkmanager-fortisslvpn: add new recipe
Thread-Topic: [meta-networking][PATCH] networkmanager-fortisslvpn: add new
 recipe
Thread-Index: AdmEJRkbAQsRZv8QTby4BWzUuN730Q==
Date: Thu, 11 May 2023 16:33:32 +0000
Message-ID: 
 <TY2PR02MB3678CB86F8FECE2510FB308881749@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|PSAPR02MB5061:EE_
x-ms-office365-filtering-correlation-id: 510529b1-7f02-4d1c-5fc9-08db523d75f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uI6044r4MpzX5MVotpg7qlqbCCHA9oi4kSwmljUEcCb5toeVnRyWexFbbuOlF411sDrlxI9rePHATCqnpTiK2tMhKrQQkFVxthJk9vNERsgfhURrydwdJgDgF6IuPCs6tyt4NcCWplUMvN78RJlRuCPAUVtekNeLnx9wBcOt5Q/uMhLpH8c7CQuk1+JuPpZBLpSPRP4v54c76x5IC6uzAxjCpjtDrIyOtkh8k/0eCC4ZgycabUUBs2ZRCrVxqItDGaSd+M9lfBpEY2emgv8xuV7WDvD5oLVMvvaoUKf3j5TPSQQ4rCS6Q6YrrosWcXuwzCp23wOp26rmkr091p6S3Wt7ziPZ6JUdxTrK7HXfnBC+KVoVXxpm9yYeFLcvq0NQTKNjQxvKNnDq3MjkogiT1oeib8MKU5tIeBBA9GPGh6HY9vO59r1AgdCRR94zJcOW53F7gX8Unj9rja5hXlACFcF6im/EEU6ZKByvi/MOZTMAm90ypMCSzrDDbgDUtzJOuJN1OFX5nOly7Z2gNRouZts95dIA99M6qdErgsPJ+VlwB64EQ7VXSz9XV7uqz/QHzIw9rojfeIkJyK1ryGS3jbbfwxiISBWTP8cYVgPz9Gg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(186003)(55016003)(478600001)(86362001)(966005)(33656002)(7696005)(71200400001)(38100700002)(122000001)(2906002)(5660300002)(52536014)(44832011)(8676002)(8936002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(38070700005)(6916009)(41300700001)(316002)(9686003)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WnVQM1NPd3pLYmk3dkhVeFl3WllqRTlDS09sNHJXWnRoc01NMEdXNmZLaE1j?=
 =?utf-8?B?VEdNT3FhNjU0aTRETzdkNllaVlN2a0RLWi9nMHFVSmJwZzNCK0Mxc0c0c0g2?=
 =?utf-8?B?UWIzQzBRYW4xbUJQQXVFYlF3d3ZLK2xOaGVRcU40TktyRG96MExrL3FhWkVR?=
 =?utf-8?B?VnVORWd6dW9sdCtjZVAxb3RwQ0UwOHA3Zm1sdGo3RklvcHd0NEIxTzlrR0ZF?=
 =?utf-8?B?VXdxNXJRTDRSVnRoMnRwbGxZVzk3L2dxbmNqZFRKSk9wMkNNOVFBMnZTb1lN?=
 =?utf-8?B?TTlORHU5M0g1N3hIT2lnUkc5TVNEY25kZ01Xc09VVWdRd2hxNGQybmJXVDNQ?=
 =?utf-8?B?bmZDRVNYKzZZeUlnZ210NWtIWFE0TTc5QjF0N3dvM0t5R0t3VHVjUkVjUzhG?=
 =?utf-8?B?NjVFRXA4UFc5MWlMZWdrU093NlFkZmE1R0VjUEcxU0Rxdk11cEtabUJzRDcv?=
 =?utf-8?B?TzROVmhMMHBNL25EVE01Mk40S0ttUDhoMWVEK3NBMS9OKzNjN2NQaTBCQXpt?=
 =?utf-8?B?VWQ2TUF5djExZ0drbG9wUXhQRjJRMDUrLzNhOGFvTVFmNit4Ty9JYmxyamE3?=
 =?utf-8?B?SjVCRHpXOEpOcUlldjkzMVlPcEJ4SVZyUmF6aVJ0bW01RmQ2bUtpNlp5TGt5?=
 =?utf-8?B?VXdxUHBaZHlqL2FWS1FlaFpUazlJZ0cxWVlIMjBVSFl6S010QTgzUXVYSEV5?=
 =?utf-8?B?eGNvenppRmlRY0h3ZkczUExCQWVqMzI1NGdpYXdYUzVaSWppWW5YUkJaQ1dG?=
 =?utf-8?B?RStnR2J0Y0FvQlRzaUdobG5rSUQwWUVwSzBodDRlellCdXRQeHVtck0ybWY5?=
 =?utf-8?B?UHJOYzFNQWZjWHN2RlFFR1RScDZ0YWlSMTlZUzNoR3RnbkwwNEIvWSs0anMy?=
 =?utf-8?B?Z0lyRzdVTk92SytlYkFlKzJzdmo2K0RzaDNKUGoyVjVKNG5wNjY3a1NPekNa?=
 =?utf-8?B?MWZQaXUrN0dBTGlJc0hEeW9EK3F4RWlaQTZtY3JEVFNrL2JGKytIN0todVc4?=
 =?utf-8?B?Nld5QmdBSHQ5Zy9nMkNtNWlHTnlGTVlPaEZLcFQrYm9JTmFkQTlKazhTdTlL?=
 =?utf-8?B?bmVwWDBiTEhlYk5vMmJSSUcwZGt4L0VzSENVMk5FeWtkQjlTNldkTTFQOWVs?=
 =?utf-8?B?akViTFh4MkJTZVJxQVpuK3pJUU93UmZQT1kycDE2cjA5SGg5T3lzN0ZpOGRK?=
 =?utf-8?B?c1lXRVNBVWwxQnJWMUl3N21UbDE3TzMrVk4rUlJOV2pCeUM0WjAyQy9URzl0?=
 =?utf-8?B?NlE4bEZxMEVCYm1xa2dFeFNQTlFEcnJTZ0lRVGV6b2JkeklzRi9yVCtueDA3?=
 =?utf-8?B?b0RiVnVldXl5NFhJSHk1QXZqdlVacThDS1ZKVzczaWZ2UnN4eHVwTGpFY2s4?=
 =?utf-8?B?dnVmUm1rbVNJUFdlYjJQc1MxUytSRHNudG81QTJGMnd1R1diOFlHck1Qb3B3?=
 =?utf-8?B?d0JhdmFNNkJLZlYxcFI3ZTRackl3Y2RKMlpuRmFFM2ZrQVlUSU9ReDdsL2lW?=
 =?utf-8?B?OGZyUW1WVXR1YzhHWVp1WWtIRVZzSktYN0pGN21YUTNvRkdOcU12YXpxbTFs?=
 =?utf-8?B?M1h5OWdqVWNhSzlUaHp4dHFqYWZxS1lRNmkxR0tCT25WSkl3RHBScW54RVhq?=
 =?utf-8?B?NXRvRGVHUGxhOUNwcHY5RTBOdTJXYjNvZk1qUjk1c1NuclhaUmtxdzA1Y2or?=
 =?utf-8?B?R2FPQ3k1OXNzMGpDZVNLZlVDZFdxMlM4SjNRbFd0d1NNR3RPcHh5RmwxTTVK?=
 =?utf-8?B?K0JQR2tHMkFJSjRDNVNtbVFUNFQ3UVJVbHdPWjVDRDdHL0RaZjJrbEJWTnB6?=
 =?utf-8?B?VTdWUlY1MElhWHZuZElrTFlzNVN2U09wRm42Mk1QeDl0YlJvNWVZejFMOTVv?=
 =?utf-8?B?eEcweVhZRHlhSHhZSTd1UUNZd2FBMVRkTWd0UFRpZnRPZVIybzRtd1BlY2FK?=
 =?utf-8?B?NFh6c09mbXhVY0YraFZ4cDcvY1dLQkNHMElmSmlQQ092K2FxK0xHNklyTU55?=
 =?utf-8?B?dnVQa3piYlh2YkRMV1lIZk44cUtvbkp0ZHFROWpzcVV3MVFKSGFkNmU4dEtT?=
 =?utf-8?B?RFdMY05XbFJHMGRpZmhHeWtlNGVGM0s5MVBPdS85b0VUVStWbGFFUm9xV011?=
 =?utf-8?B?aWNMczhadHBFbkh2TXVDUWg3M281b2JEOFNOZ1lUeW0zVXJHQVYwN2hqb3Q0?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 510529b1-7f02-4d1c-5fc9-08db523d75f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 16:33:32.8705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S90RSkCJKlcyn2PTR9ym0IHlz7rooFPLC1PKqPQiEC+s7l2oVSfRFrMznn2WWGcmWPtrHWaE37A3i0QnWsbJLobwsSCTYe10suEIQB+Y5Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR02MB5061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 16:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102548

Rm9ydGluZXQgU1NMVlBOIHN1cHBvcnQgZm9yIE5ldHdvcmtNYW5hZ2VyDQpodHRwczovL2dpdGxh
Yi5nbm9tZS5vcmcvR05PTUUvTmV0d29ya01hbmFnZXItZm9ydGlzc2x2cG4NCg0KU2lnbmVkLW9m
Zi1ieTogUGV0ciBHb3R0aGFyZCA8cGV0ci5nb3R0aGFyZEBhZHZhbnRlY2guY3o+DQotLS0NCiAu
Li4vbmV0d29ya21hbmFnZXItZm9ydGlzc2x2cG5fMS40LjAuYmIgICAgICAgfCA2NiArKysrKysr
KysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykNCiBjcmVhdGUg
bW9kZSAxMDA2NDQgbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldHdvcmtt
YW5hZ2VyL25ldHdvcmttYW5hZ2VyLWZvcnRpc3NsdnBuXzEuNC4wLmJiDQoNCmRpZmYgLS1naXQg
YS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0
d29ya21hbmFnZXItZm9ydGlzc2x2cG5fMS40LjAuYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBl
cy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXItZm9ydGlzc2x2cG5f
MS40LjAuYmINCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwLi5hZmFlY2Uy
NDViDQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0
aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXItZm9ydGlzc2x2cG5fMS40LjAuYmIN
CkBAIC0wLDAgKzEsNjYgQEANCitTVU1NQVJZID0gIkZvcnRpbmV0IFNTTFZQTiBzdXBwb3J0IGZv
ciBOZXR3b3JrTWFuYWdlciINCitTRUNUSU9OID0gIm5ldC9taXNjIg0KKw0KK0xJQ0VOU0UgPSAi
R1BMLTIuMC1vci1sYXRlciINCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT01OTUzMGJkZjMzNjU5YjI5ZTczZDRhZGI5ZjlmNjU1MiINCisNCitERVBFTkRTID0gImdsaWIt
Mi4wLW5hdGl2ZSBsaWJ4bWwyLW5hdGl2ZSBuZXR3b3JrbWFuYWdlciBwcHAiDQorDQoraW5oZXJp
dCBnbm9tZWJhc2UgZ2V0dGV4dCB1c2VyYWRkDQorDQorU1JDX1VSSSA9ICIke0dOT01FX01JUlJP
Un0vTmV0d29ya01hbmFnZXItZm9ydGlzc2x2cG4vJHtAZ25vbWVfdmVyZGlyKCIke1BWfSIpfS9O
ZXR3b3JrTWFuYWdlci1mb3J0aXNzbHZwbi0ke1BWfS50YXIueHoiDQorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImIwNTVlMjYzNDliNTE2YjIzNTg1Nzk4YWIzZWY1N2I0MzZiMDE0ODAwZTkyYThhYzcz
MmNmYzhlNzZjNWRhZmEiDQorDQorUyA9ICIke1dPUktESVJ9L05ldHdvcmtNYW5hZ2VyLWZvcnRp
c3NsdnBuLSR7UFZ9Ig0KKw0KKyMgbWV0YS1nbm9tZSBpbiBsYXllcnMgaXMgcmVxdWlyZWQgdXNp
bmcgZ25vbWU6DQorUEFDS0FHRUNPTkZJR1tnbm9tZV0gPSAiLS13aXRoLWdub21lLC0td2l0aG91
dC1nbm9tZSxndGsrMyBsaWJubWEgbGlic2VjcmV0LCINCitQQUNLQUdFQ09ORklHW2d0azRdID0g
Ii0td2l0aC1ndGs0LC0td2l0aG91dC1ndGs0LGd0azQsIg0KKw0KK0VYVFJBX09FQ09ORiA9ICIt
LXdpdGgtcHBwZC1wbHVnaW4tZGlyPSR7bGliZGlyfS9wcHBkLyR7QGdldF9wcHBfdmVyc2lvbihk
KX0iDQorDQorZGVmIGdldF9wcHBfdmVyc2lvbihkKToNCisgICAgaW1wb3J0IHJlDQorDQorICAg
IHBwcGRfcGx1Z2luID0gZC5leHBhbmQoJyR7U1RBR0lOR19MSUJESVJ9L3BwcGQnKQ0KKyAgICBp
ZiBub3Qgb3MucGF0aC5pc2RpcihwcHBkX3BsdWdpbik6DQorICAgICAgICByZXR1cm4gTm9uZQ0K
Kw0KKyAgICBiYi5kZWJ1ZygxLCAicHBwZCBwbHVnaW4gZGlyICVzIiAlIHBwcGRfcGx1Z2luKQ0K
KyAgICByID0gcmUuY29tcGlsZShyIlxkKlwuXGQqXC5cZCoiKQ0KKyAgICBmb3IgZiBpbiBvcy5s
aXN0ZGlyKHBwcGRfcGx1Z2luKToNCisgICAgICAgIGlmIG9zLnBhdGguaXNkaXIob3MucGF0aC5q
b2luKHBwcGRfcGx1Z2luLCBmKSk6DQorICAgICAgICAgICAgbWEgPSByLm1hdGNoKGYpDQorICAg
ICAgICAgICAgaWYgbWE6DQorICAgICAgICAgICAgICAgIGJiLmRlYnVnKDEsICJwcHBkIHZlcnNp
b24gZGlyICVzIiAlIGYpDQorICAgICAgICAgICAgICAgIHJldHVybiBmDQorICAgICAgICAgICAg
ZWxzZToNCisgICAgICAgICAgICAgICAgYmIuZGVidWcoMSwgInVuZGVyIHBwcGQgcGx1Z2luIGRp
ciAlcyIgJSBmKQ0KKw0KKyAgICByZXR1cm4gTm9uZQ0KKw0KKyMgZ2RidXMtY29kZWdlbiByZXF1
aXJlcyB0YXJnZXQgZGlyZWN0b3JpZXMgdG8gZXhpc3QNCitkb19jb25maWd1cmU6YXBwZW5kKCkg
ew0KKyAgICBta2RpciAtcCAke0J9L3Byb3BlcnRpZXMNCisgICAgbWtkaXIgLXAgJHtCfS9zcmMN
Cit9DQorDQorVVNFUkFERF9QQUNLQUdFUyA9ICIke1BOfSINCitVU0VSQUREX1BBUkFNOiR7UE59
ID0gIi0tc3lzdGVtIG5tLWZvcnRpc3NsdnBuIg0KKw0KK0ZJTEVTOiR7UE59ICs9ICIgXA0KKyAg
ICAke2xpYmRpcn0vTmV0d29ya01hbmFnZXIvKi5zbyBcDQorICAgICR7bGliZGlyfS9wcHBkLyov
Ki5zbyBcDQorICAgICR7bm9uYXJjaF9saWJkaXJ9L05ldHdvcmtNYW5hZ2VyL1ZQTi9ubS1mb3J0
aXNzbHZwbi1zZXJ2aWNlLm5hbWUgXA0KKyINCisNCitGSUxFUzoke1BOfS1zdGF0aWNkZXYgKz0g
IiBcDQorICAgICR7bGliZGlyfS9OZXR3b3JrTWFuYWdlci8qLmEgXA0KKyAgICAke2xpYmRpcn0v
cHBwZC8qLyouYSBcDQorIg0KKw0KK1JERVBFTkRTOiR7UE59ID0gIiBcDQorICAgIG5ldHdvcmtt
YW5hZ2VyIFwNCisgICAgb3BlbmZvcnRpdnBuIFwNCisgICAgcHBwIFwNCisiDQotLSANCjIuMzQu
MQ0KDQo=

