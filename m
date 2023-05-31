Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265DEC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 20:45:50 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.52])
 by mx.groups.io with SMTP id smtpd.web10.1.1685565943866827737
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 13:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=YrVQc/w3;
 spf=pass (domain: advantech.cz, ip: 40.107.117.52, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYM2nfJjxghLfchwKQKuctXvAas++8eUW1t02Eq+cm1TzDz/i8dLJLQi5rnvQWtu+ETb86ohFtj6NFbMwdwV39lLA0jqb6oaUk6A7ufkQyp7IFoU7Q1cWTRqPD6dXr5UeHVrIGB193CO5pRIVBMy2DfTd5FVChtWXUM3jL1LZuyrjzvZKcnq8m2qcQY7XdID8WuLh3hXzZWEogkHsftve8T0KRas/wIzfF0lldBTu3XAgKeK/XG3FQ8E1NpZevGHP1taOE4A8XvDg12t1v0xw9DWaB5mFu+1jHQB8q1B8zbuGLWEm/RNz5FBQXMQSR6hJzm5jT959yZ8fFGKWpQXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH2F/xeFqmBSMkXDGybhIt16mgtIyCSxZ2HLlaer3O0=;
 b=QDhyklPk4za7GkbkEy+QdKAICUcjKLa/gR3aTmtQdUbo/CToRzcEY+P7teGdy9Eb3dEfjiTJ0fwsOcX8h/Da4hPRtrZNtYO71VQuZvPfnEjCmsVwtoMlcEjPcQ/e+Ev/QsAywSgvNbSfR56sxN82nLK35prt5UMv+KpyE4g2yyHx3NK1fYomWl21fd45UDlwVVbOom/k0cc/hsX2aYaH5aTi9auiqZzuQ3uDn13Ac8QnvjZbjH/wbOJH+CB5sYXGMmAfRIvnwREDBR8KVOfjrRnpv+bMm889QxPXyJ8m7ca6hzzg72B7GHFdeOlbtTlgX7JIZinZ/18Tf8g33eavHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH2F/xeFqmBSMkXDGybhIt16mgtIyCSxZ2HLlaer3O0=;
 b=YrVQc/w38wfYhEWMbUs1WLyVf2CT70jPU378bJtGecFdCFNoj5Jxv21/kRUYqjsuCePwYTNstw2zny9XJvB/j4ku+lkACKj9HbMDcqjzcFBITQZpR708TsCE3i9/gWr3TSF3Y+r8F8t6Ra2npelL7YyIQxZ6gMav2TMkTIxz7k83EMHmFZJpakT0FY5so2PDH6kZ7UODwMsfv/9iVuL2Lb2rFa5VWTWmRc7FFiO+5cFrmUSBMhHEMqaMKnv+IJrnwVeVLrlcjetae6V7oBi+8kgH5lPlRAWJDlFsraS48FFb+DtyHO4jpxhArk+yh4aBo1uTDxxjsS0PFQPCTsY+ig==
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com (2603:1096:100:47::18)
 by SI2PR02MB4730.apcprd02.prod.outlook.com (2603:1096:4:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 20:45:38 +0000
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::2dcf:3f1b:7609:d74e]) by SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::2dcf:3f1b:7609:d74e%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 20:45:38 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] blueman: fix REQUIRED_DISTRO_FEATURES
 gobject-introspection-data
Thread-Topic: [meta-networking][PATCH] blueman: fix REQUIRED_DISTRO_FEATURES
 gobject-introspection-data
Thread-Index: AdmT/5SrhydHambtQdSlybWoEnG3qQ==
Date: Wed, 31 May 2023 20:45:38 +0000
Message-ID: 
 <SL2PR02MB3676865B4E60E3685D114EE981489@SL2PR02MB3676.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR02MB3676:EE_|SI2PR02MB4730:EE_
x-ms-office365-filtering-correlation-id: 300faad5-fa2d-41a7-41dc-08db6217fdc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mXS3TMzT7M8mOizkpHwpTe81FsTZS86IV9KDIDHrvyGCU8nxb2XuxF7NDrgqvskPbFyRInwUST2wfKKLAm5AGJFVR7+auNcKYWLxQimjlB0xz3MKAdZLlSUsgH/91H7tA5vGIVynvruLLuPx2vZSfWP+3tP/+maDo6+gIOAHWdncl6fWxoTYE8X9JCYfa6vQ0RIC0Ckr7syBu8Pl5xPnultDSw7cRGGbir4LoSFpYYVuly8avxJClhOeyJ3109iyMlAiHz1+Cxl7UReJ3fl/HEmTjNZDyaebLbXXUqyLkCPJSLzQjGf4ErjRWGomve0V7RYrMpQAHPcDPn71FLuJp9GSWURZ6gophePOo+JUmG43WlKY4dBlyH8l28Mplp3iMw1iJd9G83Qbo0nhzXMgEtTXegxw2cWmsIgxbfteE8/Z013uU+WPYXU1s+ga5jQnI/hoTdd/hgGLtBZWvEkxo8MwdLilahr2snM7OMUX3RXwbcE3tktpucH4GF0SZvzsg0HNA8y6xL2KVlTtqT3kjSrL+plOGdiy7VRdvjGkbd+7ZWbZU4kBtPNk0UUcRY8VEzYfeJ6c0upSiYA5JsCW94qxjKuA7kGKTbPTm1syq8gJofoqBmnz7XtP0MOoITbt
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR02MB3676.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199021)(4744005)(2906002)(186003)(55016003)(83380400001)(38070700005)(122000001)(38100700002)(41300700001)(316002)(7696005)(71200400001)(5660300002)(86362001)(8936002)(8676002)(478600001)(33656002)(52536014)(66556008)(76116006)(66476007)(66446008)(64756008)(44832011)(6506007)(26005)(9686003)(6916009)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bnJleGxDUzZGZ0MraExYUlVvRXNMb25EUUtQRDV2QnRPMHF2Y2dYY2Fvc2pD?=
 =?utf-8?B?SlZrdFlIWGFhQ1U5ckNnVU4yS1BNM0VhL2MvcVg4VndwRmdnM1JRRWZpa3E4?=
 =?utf-8?B?b1dMZ1VVUSt6TWVmRG12WklzNTRJcE96UDN4TS9XeXlPcmVvUmdjbVo1T3Q0?=
 =?utf-8?B?RVBCRlY4ZUFpQ1RoeXFZdmtJVld6Rmp3NDhja3hXMExNNW1oK3g0cWhMZ3pK?=
 =?utf-8?B?amNwUnBkTGxIVytmZXNrazNJS0NSY0FNMGcyS3BmbFlIRWoxT09GZVBTRGVM?=
 =?utf-8?B?b05LRW5qNXlCSCtHM1ZRSDkrU0xWQnJiWGgvQVRhck9tT3NwazdQbXBjTjlR?=
 =?utf-8?B?UUpXTUkyMXBmNU5CVWFrK2NIckFxUDVKdXI3Q3dOWTZHWmhtVFg4UzJSMC9W?=
 =?utf-8?B?MWhhY0ZTZk83bkw1eVQ4ZFlPd2hZQitlRFZvY0JYLzFHZUg2RGM1ZDJXVDhz?=
 =?utf-8?B?cFlRVGIwcS9PLzJaTVJyUThJRjhyOWRMSUZrOGUwQVdRaWY2UGpTc0FySjkx?=
 =?utf-8?B?WUp6VzFHOW5nQ0JFNE5NdG5NekhSV3FyTWY3TE1zdTZTM2JnWTZaT2diMjR5?=
 =?utf-8?B?bzVsZktjS1NEOU5qQTFvQ1NiUkIzZ3FIV0hBU1FvOU9ibG5MU3dSQ05KODlP?=
 =?utf-8?B?SXhROXFDRUxGU1A4dld0a2Q2NUZzSGpSSGtZalR5dFVYWE9ZRlpMRDlxWXhN?=
 =?utf-8?B?aWlNclRTZXFXWDFQayt1WVVTdFpveWthYmtzcm5yaFpJU2xIMUgyY2czY25V?=
 =?utf-8?B?WGx3MVc1ZkZLb0VGOUxPQzRrdStKbkZyY1hTWXIvYWxMdzFmdEJVd01HRmVQ?=
 =?utf-8?B?OEFNeE9CaDQ4cDVlRVpmc21UZGl2cE1oeU9Fakc1NEp2dHAreFVRS3AzdXB2?=
 =?utf-8?B?QkQ5MkxoL21yNmgwazVteUhmUWtQb1VDdTNTQ2ZsTjFwZzhTTTJaYURvVTRw?=
 =?utf-8?B?V2RycSt0STNQcGZ3ZE4zVDltOThDOFFsckhoRzRkN0xSdjREeStqcjJ1Mmpp?=
 =?utf-8?B?VUF6bmZwNHY5VnFvM1hJSXVDdjNLMnhwWndadWZRTzlzcWp1aHY0bEovazE3?=
 =?utf-8?B?QVhLb3hWdUVvcm1ONHgxZmMyVDFuWTBsQWNHeHVjWG1rdmFnTWFMNm9aQVhi?=
 =?utf-8?B?UmFIS2pVQmZONFZ0b0h2YU4xdUdrYS8zODk3R2tjYlU0YlNiTmdLVENiWUVR?=
 =?utf-8?B?Y0RnMnhNelkvTXNrUkFiZXlib2NUWGVSN21tNDVBM2VMSlZhTWEwYktsNjZK?=
 =?utf-8?B?bXY4RElJY05FZ1BUQVZFL1BDd0d1Um1Td2RmbUNYQ0pjTGVUejByY1dyWDFQ?=
 =?utf-8?B?TVRuQnNhbVEzZnNjVGkxYnlGeHhTY3VjOUd1MGt0Z001ZnVGMjkrdjFqVHl2?=
 =?utf-8?B?aEdpZE9zWW4veTZCblhJWmFZRlFFd0VzVHFFUnNtM1hzbXU4K2tNUHR1THJp?=
 =?utf-8?B?aFI2WkROOTFuWWpGY3FoZDFSQ3cwam51VWNUcUNiYXowRWNNRTV3WlRiR0tI?=
 =?utf-8?B?WG5GSXpyUXNkbDlEU3pXNFFGMUhlV3dweUhWMGpDWU91d1AvUTJhTmhNZmlx?=
 =?utf-8?B?UWNaQW45dHZlVktsdTY1SEhvQnpZK2J4WTlEZng5dzlOVUl6NlNYTXgxNGps?=
 =?utf-8?B?bVNwblJLYjZzcXZOT3UzbGFaZVdFV2s3a0hPeloxM21BdDNpSjFFM3V2MXhW?=
 =?utf-8?B?OXBtam1Wc21rS0dOalcxZFV4ajNZWTAzbWNhV2ZkV3J6NTFlM1RIVEc5UnZu?=
 =?utf-8?B?RFRWQ1ZPM1U0S1RINWdGcmlaWTdTMHcvak0zbGlGSFZLZzA2Ny9uL0IzVGRz?=
 =?utf-8?B?YkV0NHk0RmE0MU9BTUQ3Z1h2NnJVOEMvWXNNVGhjZXpzUDR3OVZQT05JRXdt?=
 =?utf-8?B?VnhNQm85WEJydTRUSTM5Y1ZkY1hiTnE1Y3pYTk5LaVdXVWg3b0g4TjdFQjg3?=
 =?utf-8?B?MHhiUlpZUFM0Qzk3SzdpNU9sVExiOXNaQzRyS1hZWFpWRE52RTZoR1VxQjYw?=
 =?utf-8?B?N2ZpMVJBMXhrTWFjUlJPMjZPS0FSV2NvNkJuRngvUzdna0tpbGg3RlR0YXpl?=
 =?utf-8?B?dDNUdjE5eENvSktkNkRsa3dVYjJUVk5XS2E1Yi9YcC9ET3JTZi8wekZsWDE1?=
 =?utf-8?B?ZDdlTmNyVSsxN2NnZUNyV0N5a2pGTUpWUDQ5K3NZNUpheC9kQ2ZKSkRYV3pW?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR02MB3676.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 300faad5-fa2d-41a7-41dc-08db6217fdc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 20:45:38.4177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cUccXoUFDKzAycldnR9+WbjKyIZVsHGyjz/OsBHue13Qp5TLuP/pd6g8al55IrZsty2U5dQr8y8mi8pk6p7INWyG9RZzQWTsOyvIYhUmvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB4730
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 20:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103072

VGhpcyBmaXhlcyB0aGUgY29tbWl0IDFmMDQ4NjQwNjVlYzFjYmQ0YjgzNWFkNDdjYmM1MGZmNmVi
YzhlMzAuDQpUaGUgY29ycmVjdCBESVNUUk9fRkVBVFVSRSBpcyBnb2JqZWN0LWludHJvc3BlY3Rp
b24tZGF0YS4NCg0KU2lnbmVkLW9mZi1ieTogUGV0ciBHb3R0aGFyZCA8cGV0ci5nb3R0aGFyZEBh
ZHZhbnRlY2guY3o+DQotLS0NCiBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkv
Ymx1ZW1hbi9ibHVlbWFuXzIuMy41LmJiIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2JsdWVtYW4vYmx1ZW1hbl8yLjMuNS5iYiBiL21ldGEtbmV0d29y
a2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlbWFuL2JsdWVtYW5fMi4zLjUuYmINCmluZGV4
IGRjN2YyYjZmN2YuLjAzNzRkMjNmMGMgMTAwNjQ0DQotLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmx1ZW1hbi9ibHVlbWFuXzIuMy41LmJiDQorKysgYi9tZXRhLW5l
dHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZW1hbi9ibHVlbWFuXzIuMy41LmJiDQpA
QCAtNiw3ICs2LDcgQEAgREVQRU5EUyA9ICJndGsrMyBnbGliLTIuMCBibHVlejUgcHl0aG9uMy1w
eWdvYmplY3QgcHl0aG9uMy1jeXRob24tbmF0aXZlIg0KIA0KIGluaGVyaXQgbWVzb24gZ2V0dGV4
dCBzeXN0ZW1kIGdzZXR0aW5ncyBwa2djb25maWcgcHl0aG9uM25hdGl2ZSBndGstaWNvbi1jYWNo
ZSB1c2VyYWRkIGZlYXR1cmVzX2NoZWNrDQogDQotUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0g
ImdvYmplY3QtaW50cm9zcGVjdGlvbiINCitSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAiZ29i
amVjdC1pbnRyb3NwZWN0aW9uLWRhdGEiDQogDQogU1JDX1VSSSA9ICIgXA0KICAgICBnaXQ6Ly9n
aXRodWIuY29tL2JsdWVtYW4tcHJvamVjdC9ibHVlbWFuLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9Mi0zLXN0YWJsZSBcDQotLSANCjIuMzQuMQ0KDQo=

