Return-Path: <Sana.Kazi@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE2ECAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 04:45:20 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.92])
 by mx.groups.io with SMTP id smtpd.web11.15055.1758084313935956258
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 21:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=C0L2xq4U;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.92, mailfrom: sana.kazi@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InxSq7GZlwElSFqkAmRL8v2gyOoGHWx8E0rIhsklx6uNPZTuc/eNrhoxDRw8nnw7OYqwht7nf8KL2C9Sctbk8Wwzqnaa06K0ds1uMdHHh/LKv+OBJm/sPgbYb+1LRrR6z7ZUPSJbyDdBLbEYBRuABMK+PzUxRK+VcXOu88pTbaO7s6iJyraHyCuNbSARF/JOlfgvzz/E6X92M6aWWzZrWH9bnP/8TJn64rgCmrvggj9swaUFse5J2Td85UnIeRQKjkct9qpAotvYYwIAJb7pu2pMmrME43GIEQixnyZhf3GPKBwQ8h8I4gu/CYrkpWczFhLhok+yd03C+u5vRfaYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iY+YhH2FMarSyEm6gH7ZY/AB/hcwRmUFY/huv3S3ByE=;
 b=jjr/Kej4+5uSUCoGW8ZkI1NPJ4KgI/EMvAAV59RnDQKvH0Yrjn1zJYi5A9tVimOegzlnoN9B04HYCp8x7w6hjOVYwsVhTjFnyFDUr3Nv7l2WB5gE9rgVT/3eZU+99tsQcHSu5xRWM+JVLW2eVevOR/3SYWerIp7jym3xKb5gpHswyjW94oB3Izz8KmnwvpjeBXz05DmYpy+cAHo55lope0E3rGcQZb34prJZFOl1Bi6Grbv8hPr/p9Nie0ph8Z/q3RCvFgPqq/rY6iDt16fDTAVbGHHB3lTDVCqbGHo2e8aAfFmC+b+PP7rrC7gnpMTyreDP8fHW/yR/+3vzDwQ8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iY+YhH2FMarSyEm6gH7ZY/AB/hcwRmUFY/huv3S3ByE=;
 b=C0L2xq4UTUE50toEeX6OogUrbaH+fxULDQBosE3EtjylovDf4kmFILd2q/8swxsg0u83cwMtTIcTjB4BtvPRKo7IKDcIRHAtcvJRiCh6TWeuHM27YgJyfBkixRH/+LVkwcOJP3YosptZi5h483RysV4EbNrFBmyEKC23CsQEImD2df4NCnFWPOpYmobwEZUE3x/qV6oONqnM+8FTllEiWA4vl3/D8xnInMKbVYqlCbsPAkq6vBLRFwS0TBYzkMlMKO7qAUYvDUMapEb4lzpQf2AFLhcYWLeSKh1kRLeqoI8rHBBar+oSf8Dh0sDA/LdKvQYt4HgxSAEOYV82epUJTQ==
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:19a::20)
 by PN3P287MB0306.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 04:45:06 +0000
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95]) by MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95%5]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 04:45:06 +0000
From: Sana Kazi <Sana.Kazi@bmwtechworks.in>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Clarification on License Identifier for Cryptsetup 2.4.3
Thread-Topic: Clarification on License Identifier for Cryptsetup 2.4.3
Thread-Index: AQHcJ4yoL0UcODBu+Uq3PKASIMV7xg==
Date: Wed, 17 Sep 2025 04:45:06 +0000
Message-ID: 
 <MA5P287MB4602030E79E84AAEF6BD0442E917A@MA5P287MB4602.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA5P287MB4602:EE_|PN3P287MB0306:EE_
x-ms-office365-filtering-correlation-id: a11c6fbf-08cc-44ad-2125-08ddf5a4f96e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|31052699007|39142699007|1800799024|366016|13003099007|8096899003|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?EkKqBk8BNKxU8kOb5+QDkmS4K/Ua5+0aiEVA8qB30oenGCeSnUIY8pKLeq?=
 =?iso-8859-1?Q?ZnEP9U23RqXGh2EfRab1oZ20DoFXapEOJOpF563STaP+bhYRv8XD8d9etW?=
 =?iso-8859-1?Q?Z/V6e9bpPQj6BDBpwQR7hth197PcGbICQkfoAcP/dsrJX3HXMMnYQpVCoK?=
 =?iso-8859-1?Q?anPSOtOzK8WB+vykAWZdWVTPKrDh0IFvfpUtRirfAXln/R50Uo1HJAEQ6+?=
 =?iso-8859-1?Q?e70IUk3g91vAP1lXXEqiP5J/3Y8RlEIPSvpNCzScvz/Y9+3HXEhc/v4nOA?=
 =?iso-8859-1?Q?rIS2+ivalYTR5S+81VFGj6dX2qQh0+324MSg172R4OeQ6TU4Tc14dO5+IV?=
 =?iso-8859-1?Q?2c9zB4V65xX1WoU4NPqVWJLiHC+bSXIb7b34DRB3UQcSiKFs/bNjLhhErx?=
 =?iso-8859-1?Q?3n0gzKpD069fjl8HA/PHWuubgqP7bgYewBes+SHG0T7z0BHGv1ihJtnhJY?=
 =?iso-8859-1?Q?uU9A6VQ8TQWBzQhnQnvF63as2Yrwis6P3u24pRMhJY9JFjzb2PFx7jZga7?=
 =?iso-8859-1?Q?e0239z83ZmtvHnD60DEEL8bp2o6M9VoheEg7t7V2BRc/SNwsnmFc4CACYo?=
 =?iso-8859-1?Q?9r6NmK8OoU5i2i0Tmt28fFlJyM/4CNOgp1XfjQq1/rGWlyza81rcRUdsWR?=
 =?iso-8859-1?Q?RGbEI+Q4Q+1U3VBFuKmYG4fckqlZMPX+nknRE9fXf4fhRWM50Sw/27djjI?=
 =?iso-8859-1?Q?PHTLTwMPNbEExkeXT3ZbKsII6nOUpvInh2Ex+uG3p1F6ZYO0OkWGbNlKvc?=
 =?iso-8859-1?Q?ZmK8b7+ePxi9wGf1WvsBE4dDafMmqRNrvWV1GgUsu8g9+AvTTAxSODv7Rj?=
 =?iso-8859-1?Q?9NvZ9WyYUAkPHd5oFfbZ1nPesj96JpdidHyq/qYDDm/ZLqhTDbBHXD53px?=
 =?iso-8859-1?Q?j5hJCAcA8iBvXo2zZeiXxP5tCITrAkSHcPdbTJwDVmb78NlnHN80pS486B?=
 =?iso-8859-1?Q?ICwBQAGDFlgtzNHmwMSO5fXnNUAfoAc36Thprv9/t21KkEOoGSHjhlAfPw?=
 =?iso-8859-1?Q?sgP/9bTPXMTQh/LNVUsyIBpGg2zWM0ve6tI3WSbYFjm34CoaPYJAmzOLE2?=
 =?iso-8859-1?Q?h17YMx0Zm+JU1nldgrGMkRsA0jyyURmvTQYXANnx1XB4qIDOW4kBbZi+d6?=
 =?iso-8859-1?Q?ceP4BX1mm/GyitHr0CxoSW6ssFeBS8Yis45X5w6uWqfEXhaN1Osiy+PLsD?=
 =?iso-8859-1?Q?15A8lw8spf6LXWT1M+m5kCv60Tg5GyjWHLAhDhRN+XtMOzvpP9PgFfQ4OB?=
 =?iso-8859-1?Q?UDe9vM8GyYb6Z0+s/gzP6lefyHLs6X0xnIhWmC3zL0k4UEyBr6OIDdAfJA?=
 =?iso-8859-1?Q?+401oaVoy6rpREwT5/M8jbDUivvHY4x8l01wUcFgkdB+PXac9P263Ru+Hw?=
 =?iso-8859-1?Q?O6op4oMcYqZTJYq3QlWaEkHktoDpuRFDTf1865Fzf+78zrGtXGDVSgUZGO?=
 =?iso-8859-1?Q?v/Mr93V5XHOM9Eb9tcs1gNWU4cZqKnrxoKTFCNSrcAFfyepS6perilVTKE?=
 =?iso-8859-1?Q?Y=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB4602.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(31052699007)(39142699007)(1800799024)(366016)(13003099007)(8096899003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?V2S5W7yJdIaR5QZbRBIvFLR6Y3KAIHwADXNtGX/VTje+Y9aA4i0HHwYlOB?=
 =?iso-8859-1?Q?g+eDJr1gmPDbW2vSeLequ4tp1X7TS1S4RH2IvurfNi8W2Dx2jjM8PsfGU/?=
 =?iso-8859-1?Q?2NG7MyQW+XbmWoFwobL+vwXOeW+QpqQRrccqkZihLpLPkg3/Q4WHYKdABB?=
 =?iso-8859-1?Q?T6ShG1Qd4o3mXBdrQOzmv0X83A3Mjx2jNVHm883lUgXIWi4/pI/DTBFHAK?=
 =?iso-8859-1?Q?gEuCONy7qulcXRxPPsS/7OslbYe4CrSSUwACcBc3OAxnXv8sJPVrofqLEM?=
 =?iso-8859-1?Q?A2666YZKcFFrk4ji5cYFE82vZR0sbzMfM9q1RN2HTTWSasaFdx/3OEfVS0?=
 =?iso-8859-1?Q?aO4xHpexY7bn5gmSslbQwtNKjNMDQ5WjrT7smAPJoSlmez4/WVnmRGpEQX?=
 =?iso-8859-1?Q?oUNza/NKONBBQUVEYgscNoq7zwOn6l3eRYVvqIj74JY4GN1bXnZYK9+3DU?=
 =?iso-8859-1?Q?qEqlVtXFUavJxtnCtcDzeb8kADYbHNDBLX5GwQd9/F9gDyzE4g/L3rOMAJ?=
 =?iso-8859-1?Q?a1aYp3hWD2YE+XkZcLyffYnTDlpgjjSQeRq3kaU7xYM/Tl7Vc9jjxF7kgC?=
 =?iso-8859-1?Q?yhHxgZROug27NU25jog0zGtKPgc0GlRIMtOMgxnhliHLhurPxkQJNbo6/C?=
 =?iso-8859-1?Q?WCuIdzd24jU68OAf1qKtQn0eQG8CmMw6aJCHth6EUQgv+FBI8IJ+zSawQJ?=
 =?iso-8859-1?Q?smD384u6jLhf++jxCQhFSKa2UALoMkt03YtTmLk9q7JbQIiSsqvLKFsgvt?=
 =?iso-8859-1?Q?85FYynDAa55nA07uvKtIa9ahCzqQN+20j/SmdPrGDS/9XWPxNeIuQzmrjJ?=
 =?iso-8859-1?Q?w25btCFjx4liYQcZJ3uzmW/JOrXmn12OFRuxVOGOSNKK3+DXSQg0Y+6pdZ?=
 =?iso-8859-1?Q?J81E213zX8A1N9Y6DhsV6QISSbsZ6RfVfIhJqMEKrhg/Oi4xMrvmFB0sRJ?=
 =?iso-8859-1?Q?IcHlXAETsayQ6btJCRIybpvkIoVqH+zmHWON/TvD9wFQECjjn9eAxmDHK3?=
 =?iso-8859-1?Q?K7+LRNzNtmWFGBKMtVW37SaqXU1WHkdSBivNi8zJz9gSIVVgOOHu8dLbur?=
 =?iso-8859-1?Q?OVEj7MgT1/uQPKlt4O4OD3RcK7kzNZzl9uV/10BXOH/RSDxYUUexmAol5E?=
 =?iso-8859-1?Q?wQkLSsevSBYWwSEUa/sufr7mu31OEZpoID4TUV+JPSnsB9DpdUJge/8NMk?=
 =?iso-8859-1?Q?/WsyXtTzebju3EfVWONgRR3pDwk5ma9GbAkUz6zpS15/n+qX7GFl91JcCK?=
 =?iso-8859-1?Q?cRggtAZC1OVeYwWVhsy9AffCZvQPl1/wQdShCIg+tw5JLDptgq+MI7s5ij?=
 =?iso-8859-1?Q?8TeHFQnxuKqCYv6MKJ1d8Wa5TIcbZmGPBuQ0ZlSYDdti7+C/eLwkFiJOzg?=
 =?iso-8859-1?Q?MvRymcW89gBf2Z7Imq/RXJfQHHEf6fo63xn3wLbeC4e69vrgcTL6pKB0A5?=
 =?iso-8859-1?Q?G2m1VJsNNLX5LquKtA8Y2xEWs/60T2i43UmSxsaAA1o9d3UO9ZfWq7sgC+?=
 =?iso-8859-1?Q?4hCg0iGFLqj0yDyyLKBDzVqSil4nCorJJ//1Jr++Z8R5PQ3RjTylXeAMC4?=
 =?iso-8859-1?Q?hXx00aG1ZSfHUcFovR40xDp5Ddd5xIqL0aMXt+wmIje0K9sFqIMACc7f7Q?=
 =?iso-8859-1?Q?Yzdhc5aBDK1YQCT3/D7mlZEuX+4/wjLJV5?=
Content-Type: multipart/alternative;
	boundary="_000_MA5P287MB4602030E79E84AAEF6BD0442E917AMA5P287MB4602INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a11c6fbf-08cc-44ad-2125-08ddf5a4f96e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 04:45:06.4431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUKXxvbMPSBNq3tETz0xPBu6l0GncT7C9BSPVdkZjtJJFH5oStleWjw/HcBo6/ETjaXHJaWpyc505bgs1GJntmUVh5ztOojhpR0GV55Oznk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0306
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 04:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119476

--_000_MA5P287MB4602030E79E84AAEF6BD0442E917AMA5P287MB4602INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

While reviewing the recipe for cryptsetup_2.4.3<https://git.openembedded.or=
g/meta-openembedded/plain/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.=
3.bb?h=3Dkirkstone>.bb, I noticed that the license field is currently set t=
o:

```
LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
```
I wanted to confirm that this aligns with the upstream licensing. As per be=
low reference, OpenSSL linking exception is to be used with GPL 2.0
Reference: https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e=
13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

To ensure SPDX compliance and clarity, the more precise License would be:
```
GPL-2.0-only AND OpenSSL-exception
```
Is there any plan to update the license declaration in future releases?

Regards,
Sana Kazi

--_000_MA5P287MB4602030E79E84AAEF6BD0442E917AMA5P287MB4602INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
While reviewing the recipe for <a id=3D"anchor-77a387f2-d9c4-efb8-e744-e5ae=
78604c5d" href=3D"https://git.openembedded.org/meta-openembedded/plain/meta=
-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb?h=3Dkirkstone">
cryptsetup_2.4.3</a>.bb, I noticed that the license field is currently set =
to:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
```</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
LICENSE =3D &quot;GPL-2.0-with-OpenSSL-exception&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
```</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I wanted to confirm that this aligns with the upstream licensing. As per be=
low reference, OpenSSL linking exception is to be used with GPL 2.0&nbsp;</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Reference: <a href=3D"https://github.com/aboutcode-org/scancode-licensedb/b=
lob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0=
.yml#L7">
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a4=
4380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7</a>&nbsp;</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
To ensure SPDX compliance and clarity, the more precise License would be:</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
```</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
GPL-2.0-only AND OpenSSL-exception</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
```</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Is there any plan to update the license declaration in future releases?</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Sana Kazi</div>
</body>
</html>

--_000_MA5P287MB4602030E79E84AAEF6BD0442E917AMA5P287MB4602INDP_--

