Return-Path: <nikhil.r@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD67DCCF9EB
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 07:26:55 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.141])
 by mx.groups.io with SMTP id smtpd.web10.9540.1761895610375553592
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 00:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=W3DpwIvX;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.141, mailfrom: nikhil.r@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZCHZsk3dTBH7YIZs3LawAhpvhGcmSt7PSQy43aHUkY0MHyadANXpa3/rH4jyR4vv162ZfhBRFRS/wE4P6uQ6xbgDIIYNDYLSLGwPLL+FlsRiieDLJP61fGiGlOd3gJECm8l/NBchfNSrUtCJBWKwbF4mU5VckBJvExZX/VUPJA+RHleu8+5ozNM/B5vMfiYgdiJllXr0wCRGL2XnPGGLKXuWKqzePeFpCuIwyuqPtasB5G0RLoWuoxOYq7O1UlEfAJMgIDjFqzgFPAuSCDSTQJ8KJj5VErtxDA0J76jslxugia7/mtqBVkQC2vR4uDu6s7ae+s6P4IrRYIX5l973Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3zaQi6n/2fqecu1KFimeV0CUpYqDATiGjFdsAOIzrg=;
 b=q5+xnqY1xigWaFtXIZzmiMbalmyiS70Mig4BcqoYqWGev9Y69xEVBape7aB4t8bjr2zutQBvd3bvYoq+3AvuZ6jnFZI4UUM12axv8of0rbfcW8pVGsnDxNXwgCJ8qbyiSskGhunoCkNEu6uRpcPQMipZfPOXcRG9VfE9z+w47ItzFk34IB93M0GGkSKnqDSYsA18fZpq66+6H8nwOX0HfkOf07HD0CXb0CUNXp46lOH2Cp1i5ljHUj5QY9MaQOLvCg5PdEIFXI9nuLT0w7AuhyrBi3dy7qJffnMsO39fAc1kYIfxGKEEl6+2Kr0c4MF7zqhq6B/4JOmursfl9ujiOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3zaQi6n/2fqecu1KFimeV0CUpYqDATiGjFdsAOIzrg=;
 b=W3DpwIvXhhHqrVfx7GHr8EWNZGWFF4uTrKzk2++esoKywQD4KX+OmKCywNAaHjpR53ijDv6O5qw/ueoC5lTRXYixYHDTkNcSruHJD0E1o5ehIniP3SeGgkIcEkEakASFk9k2C+PIe8+5mIHqxTLxDWhLsAta27+6w5mSYNnyaqHY7F6wKHeVTb8PJXhfBVV6IuGKNEWFIuW92vsrAvUQkf9sQFShHsoh/TStz83iet5sONvovSVbNSJZ8iFtXAI472YqHKhNVa24FF472f2InbZeTeWE/rtv1D2raqwX+j5ZxAfhJuijwZISnSNHSKtU/NrnGDzucjgjpjkh6Qb8xA==
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19c::12)
 by PN3P287MB0749.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 07:26:35 +0000
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1]) by PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 07:26:35 +0000
From: Nikhil R <Nikhil.R@bmwtechworks.in>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "skandigraun@gmail.com"
	<skandigraun@gmail.com>
Subject: Re: [oe][scarthgap][PATCH] inotify-tools: add ptest support for
 inotify-tools
Thread-Topic: [oe][scarthgap][PATCH] inotify-tools: add ptest support for
 inotify-tools
Thread-Index: AQHcSi8H5hQP+2CsCk+ONR3jJNd6vbTb094AgAAC1ng=
Date: Fri, 31 Oct 2025 07:26:35 +0000
Message-ID: 
 <PN3P287MB1693954492F680A795ED979E9EF8A@PN3P287MB1693.INDP287.PROD.OUTLOOK.COM>
References: <20251031062405.122538-1-nikhil.r@bmwtechworks.in>
 <f1b26ecf-3e0f-43f4-8c95-c95424e194a9@gmail.com>
In-Reply-To: <f1b26ecf-3e0f-43f4-8c95-c95424e194a9@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1693:EE_|PN3P287MB0749:EE_
x-ms-office365-filtering-correlation-id: 5f2d2795-7f64-48e2-923c-08de184ed29b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|39142699007|31052699007|376014|1800799024|366016|38070700021|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?4nIOjYChmBApMsyzocnKRXxzIEJ2BuQ+GAMM/76F9kkG+NEmeHPCT+C8?=
 =?Windows-1252?Q?48LtgBoUpb+iMDAlkVN+o8biXW09iqydvgBkriFYfsJx4r1Dwp2thor6?=
 =?Windows-1252?Q?snOfaYDC+xZeBqXOX/JCF1cN907lAWZm8bIj5/6YcxVhtsrgIpbEzr1m?=
 =?Windows-1252?Q?QhL7HWcUAYu80yBMLDyqIdOw5BQGOPRrYlyTnFH12PHWvEEf3lYZ2nB/?=
 =?Windows-1252?Q?cBGwl1N0jRkIuOf0WSKj2MQsQzIoqWvDS4BJ/vK7OpDfTrRfGujD2KZI?=
 =?Windows-1252?Q?FxDuAkOTRzy06bIZq6gYXbi4xJtEZHJpVemBWuLpzTXKrQ82mDqM9kPP?=
 =?Windows-1252?Q?DbwYes88JCRzTu6nLEnYxA77VgSRzgkd4BfT0UXBhCR2ha9sdjmIrK4g?=
 =?Windows-1252?Q?J2Jf0+K+Vjosx3ZOqIQ7vRhuZ/c2udPRq6HLImx/8U88iIoICRH+Zuob?=
 =?Windows-1252?Q?yP2nJvgY5KRfdUyIq4s5gbkVZ1S04jP0RsSVrz8X1PNcC0ojfq9WAzaB?=
 =?Windows-1252?Q?BSEohFrpWnYMKJT2fcDvT1q71xBiv/UkZMUfo3u0VuGHigeeLs2mai4g?=
 =?Windows-1252?Q?QWYnsyUabQg+eDBUGmfnbxZBJoW0ETQfMG5DEY/3hbWwanJb5esVoybD?=
 =?Windows-1252?Q?mqavTzHJZYF4rPWErE3Ypk39HDPGwCyUbba7D9AyKjfpojkZQMYIvNIv?=
 =?Windows-1252?Q?JSSR3z4WWssByYoo7AEpla3qTtOLoF90hwGdkmJSCpcFrjPnhU0s0uAZ?=
 =?Windows-1252?Q?j5cudpicJ+5PpwVDq4M6LfAZdr7ZRtWMqGbfyG5m8eD46EnCdLy8HuM1?=
 =?Windows-1252?Q?nA1SpghwAXLg0PYYE7ct1KcI5EZnZAjOWkCxmhAqnSrQ/oENfgaqcPwr?=
 =?Windows-1252?Q?N7ZsFtrFyc5GEIz5UfSKPDHPqnVSdRruTg7i/X59sycx3VyBUvk4o0Qn?=
 =?Windows-1252?Q?hfMJGuBgGKse+uLuAwYqIdVL9X3XsLxqV4qlwFR2MaVlltLvYqYaS1Lw?=
 =?Windows-1252?Q?MtAx8C7TzPatp2/a3+fH0M8z2wkPT3U1cIPsxmj1FpD17UPe+7Ac656H?=
 =?Windows-1252?Q?hV6U/Z0jgOAebFYCrJwJ29WygoPNmN8vyjPFeRNT9JHC64qpHFxZGHBS?=
 =?Windows-1252?Q?4TUhrZPkjhJbisO3qdP5vrrMGtbOacUo7BPylFJEoleJs7Mt1QF4B8NZ?=
 =?Windows-1252?Q?n0IZlQfIR0VIy+ys/LCIIUOIsczxGp7NfXe01sLslJWNU6L6arABYP4I?=
 =?Windows-1252?Q?oIQv0Oi/OdlpaRGySFUN534b03jF6mKduf4MHDAetehepShr8RW87Gzw?=
 =?Windows-1252?Q?Zz4qjpSW/JkfbwDYI/l9mx5yMbbQz6hbDthhmj0gZuwNwURTKH71SIoK?=
 =?Windows-1252?Q?uDd56ErGMlk1ElB3IEZeXZcMariU/3+V7r3RPri2DSW+B/+yRCGKlhcY?=
 =?Windows-1252?Q?unCxla89s+1G9vcGILzFU90shpXxjJMHhmSBLMC006hQW9rbvqjP/h5J?=
 =?Windows-1252?Q?2Q9GGelgWZe+jcg89XOHgvOB8qqLlhsaBB9CafENgf48x73ORY2OXwYH?=
 =?Windows-1252?Q?LX+RizbMWTf/FI/r?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1693.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(39142699007)(31052699007)(376014)(1800799024)(366016)(38070700021)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?01Hqa6TFo7ByS62rdMPDpNCWH6ALhgrljhJQXKzACtamcVKY0mUZLwl5?=
 =?Windows-1252?Q?Gqp9FFJWq2R9Mmzv5RlIBbB0wAV6UlSTVYPQhC/nmaPdLWSAqyETklSb?=
 =?Windows-1252?Q?QfceCiS9SsVwj0pDqBKKqM8b3qiKV2qKg+ATO8Msr0Nr0IpDtfvtbOJH?=
 =?Windows-1252?Q?fxbBE2gE/LEDID5Sv6wVbtQ2OvBTAs9QIeE3l3JQ08FSJzPUwsOsTT4U?=
 =?Windows-1252?Q?IXttxxpsmPFrK+xPa/STmxCnkRG0aMy3hfWs+iOweCYS1K6mtoBWw1Yz?=
 =?Windows-1252?Q?obefsotULz4Jpcb97pxV1zbSirBSbH3UoC1NxsfDzIh4U9Fbuw4ymtvf?=
 =?Windows-1252?Q?dCrrlERE2qOMzPtUm3zgmiXglhM2JcWCK/nJkRnDpaTHgVA3sQpdZUQd?=
 =?Windows-1252?Q?djJqRfGk+65zaro9dAf1ZYcMQg3yXt0E5iGEwR8LWG/VGi1s4FuwlChP?=
 =?Windows-1252?Q?DSAr7a5xwlEGqCyFiZr+KpQmb3QtTqQ6Yg/yt5j/7SEEX29TDRw5N3RA?=
 =?Windows-1252?Q?+1kLFy5y6UHvK9hnutoHHotKPo1rtDSVEAqpJhRaUxCKsSdLgiGgRbn8?=
 =?Windows-1252?Q?DvOtnivQEpEDXEB3J+LphuJT69dmY9TDZF0XNd49cIfJvSM2afOMiA+9?=
 =?Windows-1252?Q?M6plEIYQ3T8oPz1fdskbN+m6nFmHgURc8+tICb3sJWFiBEvpZxhNzKnT?=
 =?Windows-1252?Q?YbRf3RtdxiSQXVaTxYIMbu6zLBwF8tLdkeli7qG7OUohbDVcOEGUSpOh?=
 =?Windows-1252?Q?gB85lXoK+7enlkorJGz6OTCEponVMgOEsRYbGmPP1+AToW++/DEpj9cb?=
 =?Windows-1252?Q?3hgyWoYFu0cFMrmIkeaXaEBIYixFP8ZFW85YMjPkg8kktumKyZIo7QFU?=
 =?Windows-1252?Q?BcezZjKmCqXe0PO939+dTfDGSqu8pEIiasTlncE/HQfWIW31KYYhyXWJ?=
 =?Windows-1252?Q?ssthhebunRXy3lsfZpKxCYNp1ztd+1PAnr2tcT2cJ2YQfK6Bx3Sdsu3j?=
 =?Windows-1252?Q?LRNNEWkEzRRQYTTvxGql2asvvbDY5khRG3vqCi66MIY4ifeQ5a/pwZBD?=
 =?Windows-1252?Q?ELDBCADQkm8OLf/lwBUFnSBf40/6GHNbCxRIkGseT3dCGIbFfL3Z0cDc?=
 =?Windows-1252?Q?8vu1Jx3ydhR/trkhgb++7CWvolxXbigybV6ngmidfI89oqQfzgdOrTXt?=
 =?Windows-1252?Q?6nZXsvRUkFewIOhvWKc9GuGvQkTmNMzpFuPiZDy3KH0Cu1zKUoYWZoEm?=
 =?Windows-1252?Q?k89VzrZwmUiNisdN/uzNVOYbAqirZMW02SxkRU4dT33j06xpUPyAcxqy?=
 =?Windows-1252?Q?ubc3n+ea4w1ytJCu+jxUDP3qlXvOxi6lHxE8qVtNRZIHeSCjzHB7HcjQ?=
 =?Windows-1252?Q?WAuhR6yv71YJS3mW2CXt9lvFod5gE0spKVRuyG71Y9DHxNBpDbAIETsE?=
 =?Windows-1252?Q?zvjePmbbgAHxLW6hddWNWDUM3cowwD4bNrktcjyZ4sknaizMo6YTgN9i?=
 =?Windows-1252?Q?umjMAAU2GAK2KyqYy73Mf8HUxTF/Uedzsh4jgkV4U5cukp/f0PSaWuMW?=
 =?Windows-1252?Q?DpvN2nhqGASRFCzL6tJi5kv91WLhu/GpCmlRuS8e0Wst+ypQ0bvX9Vq0?=
 =?Windows-1252?Q?eqz0roVL4a0+OcNoYLwEbvqqvSrGQct7goS461zgjYcNWPXrw3zs/+75?=
 =?Windows-1252?Q?9Mrw2aNjQD9v5qJg7+DMQM/7SPZI8ILX?=
Content-Type: multipart/alternative;
	boundary="_000_PN3P287MB1693954492F680A795ED979E9EF8APN3P287MB1693INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2d2795-7f64-48e2-923c-08de184ed29b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 07:26:35.3095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HznussbFXkQAJZAD58rJWao8HNuI9t/LlIbbMIemRgqnGDEqF/f0LyKU3IpICvZa3KC+OTyuKat2JztVfMwCitGbDo1Tnn6/MHaLKrjHLw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0749
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 07:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121226

--_000_PN3P287MB1693954492F680A795ED979E9EF8APN3P287MB1693INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy,

Thanks for the feedback  you're right, capturing the test output in a varia=
ble causes buffering, and with set -e, the output wouldn=92t appear if the =
test fails , I=92ll update the script and send back
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Gyorgy Sarvari via lists.openembedded.org <sk=
andigraun=3Dgmail.com@lists.openembedded.org>
Sent: 31 October 2025 12:31
To: Nikhil R <Nikhil.R@bmwtechworks.in>; openembedded-devel@lists.openembed=
ded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][scarthgap][PATCH] inotify-tools: add ptest support for in=
otify-tools

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".

On 10/31/25 07:24, Nikhil R via lists.openembedded.org wrote:
> Add ptest support for inotify-tools by introducing a run-ptest script.
> The ptest verifies the correct functioning of inotify event handling
> and related utilities.
>
> Test coverage includes:
>  - File creation, modification, and deletion event monitoring
>  - Event handling and command-line option parsing
>  - Basic consistency and behavior of inotify event queues
>
> The ptest completes in under 20 seconds
>
> output:
> :~# ptest-runner inotify-tools
> START: ptest-runner
> 2025-10-30T08:38
> BEGIN: /usr/lib/inotify-tools/ptest
> If you want to do a malloc trace, set MALLOC_TRACE to a path for logging.
> event_to_str: test begin
> event_to_str: test end
> event_to_str_sep: test begin
> event_to_str_sep: test end
> str_to_event: test begin
> str_to_event: test end
> str_to_event_sep: test begin
> str_to_event_sep: test end
> basic_watch_info: test begin
> basic_watch_info: test end
> watch_limit: test begin
> watch_limit: Warning, this test may take a while
> watch_limit: test end
> tst_inotifytools_snprintf: test begin
> tst_inotifytools_snprintf: test end
> Out of 362746 tests, 362746 succeeded and 0 failed.
> All tests passed successfully.
> DURATION: 15
> END: /usr/lib/inotify-tools/ptest
> 2025-10-30T08:38
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0

It seems this has no PASS/FAIL status:
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwiki.yo=
ctoproject.org%2Fwiki%2FPtest%23Implementing_ptest_in_a_package_recipe&data=
=3D05%7C02%7Cnikhil.r%40bmwtechworks.in%7C5c2332b55f1140b76c9c08de184b484a%=
7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C638974908796235944%7CUnknown%7=
CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIk=
FOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DCVLijEzZIbGLKx4y8iimML6=
NWMot%2BajXHeSJ8lBo1pk%3D&reserved=3D0<https://wiki.yoctoproject.org/wiki/P=
test#Implementing_ptest_in_a_package_recipe>
Due to this it can't be evaluated in an automated way.

> Verified that enabling ptest does not modify existing package contents
> for inotify-tools
>
> Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
> ---
>  .../inotify-tools/inotify-tools/run-ptest     | 21 +++++++++++++++++++
>  .../inotify-tools/inotify-tools_3.22.6.0.bb   | 16 +++++++++++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/r=
un-ptest
>
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptes=
t b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
> new file mode 100644
> index 0000000000..1bd51248d8
> --- /dev/null
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
> @@ -0,0 +1,21 @@
> +#!/bin/sh
> +# run-ptest for inotify-tools
> +
> +set -e
> +
> +# Run the test binary and capture output
> +output=3D$(./test 2>&1)
> +status=3D$?
> +
> +# Print the output for logging
> +echo "$output"
> +

I don't really understand this, why is the output buffered in a
variable? Also, due to "set -e" the output won't be visible if the test
fails.
Am I missing something?

> +# Evaluate result based on exit code
> +if [ $status -eq 0 ]; then
> +    echo "All tests passed successfully."
> +    exit 0
> +else
> +    echo "Test program exited with status $status."
> +    echo "Some tests may have failed. See output above for details."
> +    exit 1
> +fi
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0=
.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
> index 8a0ae17ad7..3629ce45b2 100644
> --- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
> @@ -10,11 +10,12 @@ SRC_URI =3D "git://github.com/${BPN}/${BPN};branch=3D=
master;protocol=3Dhttps \
>             file://0002-libinotifytools-Bridge-differences-between-musl-g=
lib.patch \
>             file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.pat=
ch \
>             file://0003-replace-stat64-lstat64-with-stat-lstat.patch \
> +           file://run-ptest \
>             "
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools
> +inherit autotools ptest
>
>  EXTRA_OECONF =3D "--disable-doxygen"
>
> @@ -25,3 +26,16 @@ CFLAGS +=3D "-Wno-error"
>  PACKAGES =3D+ "libinotifytools"
>
>  FILES:libinotifytools =3D "${libdir}/lib*.so.*"
> +
> +do_compile_ptest() {
> +        cd libinotifytools/src
> +        oe_runmake
> +        oe_runmake test
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    cp -r ${B}/libinotifytools/src/.libs/test ${D}${PTEST_PATH}/
> +}
> +
> +FILES:${PN}-ptest +=3D "${PTEST_PATH}"
>
>
>


--_000_PN3P287MB1693954492F680A795ED979E9EF8APN3P287MB1693INDP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Gyorgy,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
Thanks for the feedback&nbsp; you're right, capturing the test output in a =
variable causes buffering, and with
<code>set -e</code>, the output wouldn=92t appear if the test fails , I=92l=
l update the script and send back</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Gyorgy Sarvari via lists.openembedded.org
 &lt;skandigraun=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 31 October 2025 12:31<br>
<b>To:</b> Nikhil R &lt;Nikhil.R@bmwtechworks.in&gt;; openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe][scarthgap][PATCH] inotify-tools: add ptest support=
 for inotify-tools</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: &quot;External email, be cautious especia=
lly with link(s), attachment(s) or QR code(s)&quot;.<br>
<br>
On 10/31/25 07:24, Nikhil R via lists.openembedded.org wrote:<br>
&gt; Add ptest support for inotify-tools by introducing a run-ptest script.=
<br>
&gt; The ptest verifies the correct functioning of inotify event handling<b=
r>
&gt; and related utilities.<br>
&gt;<br>
&gt; Test coverage includes:<br>
&gt;&nbsp; - File creation, modification, and deletion event monitoring<br>
&gt;&nbsp; - Event handling and command-line option parsing<br>
&gt;&nbsp; - Basic consistency and behavior of inotify event queues<br>
&gt;<br>
&gt; The ptest completes in under 20 seconds<br>
&gt;<br>
&gt; output:<br>
&gt; :~# ptest-runner inotify-tools<br>
&gt; START: ptest-runner<br>
&gt; 2025-10-30T08:38<br>
&gt; BEGIN: /usr/lib/inotify-tools/ptest<br>
&gt; If you want to do a malloc trace, set MALLOC_TRACE to a path for loggi=
ng.<br>
&gt; event_to_str: test begin<br>
&gt; event_to_str: test end<br>
&gt; event_to_str_sep: test begin<br>
&gt; event_to_str_sep: test end<br>
&gt; str_to_event: test begin<br>
&gt; str_to_event: test end<br>
&gt; str_to_event_sep: test begin<br>
&gt; str_to_event_sep: test end<br>
&gt; basic_watch_info: test begin<br>
&gt; basic_watch_info: test end<br>
&gt; watch_limit: test begin<br>
&gt; watch_limit: Warning, this test may take a while<br>
&gt; watch_limit: test end<br>
&gt; tst_inotifytools_snprintf: test begin<br>
&gt; tst_inotifytools_snprintf: test end<br>
&gt; Out of 362746 tests, 362746 succeeded and 0 failed.<br>
&gt; All tests passed successfully.<br>
&gt; DURATION: 15<br>
&gt; END: /usr/lib/inotify-tools/ptest<br>
&gt; 2025-10-30T08:38<br>
&gt; STOP: ptest-runner<br>
&gt; TOTAL: 1 FAIL: 0<br>
<br>
It seems this has no PASS/FAIL status:<br>
<a href=3D"https://wiki.yoctoproject.org/wiki/Ptest#Implementing_ptest_in_a=
_package_recipe">https://ind01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fwiki.yoctoproject.org%2Fwiki%2FPtest%23Implementing_ptest_in_a_pa=
ckage_recipe&amp;data=3D05%7C02%7Cnikhil.r%40bmwtechworks.in%7C5c2332b55f11=
40b76c9c08de184b484a%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C638974908=
796235944%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwM=
CIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=
=3DCVLijEzZIbGLKx4y8iimML6NWMot%2BajXHeSJ8lBo1pk%3D&amp;reserved=3D0</a><br=
>
Due to this it can't be evaluated in an automated way.<br>
<br>
&gt; Verified that enabling ptest does not modify existing package contents=
<br>
&gt; for inotify-tools<br>
&gt;<br>
&gt; Signed-off-by: Nikhil R &lt;nikhil.r@bmwtechworks.in&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../inotify-tools/inotify-tools/run-ptest&nbsp;&nbsp;&nbsp;&nbsp=
; | 21 +++++++++++++++++++<br>
&gt;&nbsp; .../inotify-tools/inotify-tools_3.22.6.0.bb&nbsp;&nbsp; | 16 +++=
++++++++++-<br>
&gt;&nbsp; 2 files changed, 36 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta-oe/recipes-support/inotify-tools/inotify=
-tools/run-ptest<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-p=
test b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1bd51248d8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest<br=
>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +#!/bin/sh<br>
&gt; +# run-ptest for inotify-tools<br>
&gt; +<br>
&gt; +set -e<br>
&gt; +<br>
&gt; +# Run the test binary and capture output<br>
&gt; +output=3D$(./test 2&gt;&amp;1)<br>
&gt; +status=3D$?<br>
&gt; +<br>
&gt; +# Print the output for logging<br>
&gt; +echo &quot;$output&quot;<br>
&gt; +<br>
<br>
I don't really understand this, why is the output buffered in a<br>
variable? Also, due to &quot;set -e&quot; the output won't be visible if th=
e test<br>
fails.<br>
Am I missing something?<br>
<br>
&gt; +# Evaluate result based on exit code<br>
&gt; +if [ $status -eq 0 ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp; echo &quot;All tests passed successfully.&quot;<br=
>
&gt; +&nbsp;&nbsp;&nbsp; exit 0<br>
&gt; +else<br>
&gt; +&nbsp;&nbsp;&nbsp; echo &quot;Test program exited with status $status=
.&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; echo &quot;Some tests may have failed. See output =
above for details.&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; exit 1<br>
&gt; +fi<br>
&gt; diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.=
6.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb<br=
>
&gt; index 8a0ae17ad7..3629ce45b2 100644<br>
&gt; --- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb<=
br>
&gt; +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb<=
br>
&gt; @@ -10,11 +10,12 @@ SRC_URI =3D &quot;git://github.com/${BPN}/${BPN};b=
ranch=3Dmaster;protocol=3Dhttps \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0002-libinotifytools-Bridge-differences-between-musl-gl=
ib.patch">
file://0002-libinotifytools-Bridge-differences-between-musl-glib.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patc=
h">
file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0003-replace-stat64-lstat64-with-stat-lstat.patch">
file://0003-replace-stat64-lstat64-with-stat-lstat.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -inherit autotools<br>
&gt; +inherit autotools ptest<br>
&gt;<br>
&gt;&nbsp; EXTRA_OECONF =3D &quot;--disable-doxygen&quot;<br>
&gt;<br>
&gt; @@ -25,3 +26,16 @@ CFLAGS +=3D &quot;-Wno-error&quot;<br>
&gt;&nbsp; PACKAGES =3D+ &quot;libinotifytools&quot;<br>
&gt;<br>
&gt;&nbsp; FILES:libinotifytools =3D &quot;${libdir}/lib*.so.*&quot;<br>
&gt; +<br>
&gt; +do_compile_ptest() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd libinotifytools/src<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake test<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install_ptest() {<br>
&gt; +&nbsp;&nbsp;&nbsp; install -d ${D}${PTEST_PATH}<br>
&gt; +&nbsp;&nbsp;&nbsp; cp -r ${B}/libinotifytools/src/.libs/test ${D}${PT=
EST_PATH}/<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES:${PN}-ptest +=3D &quot;${PTEST_PATH}&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PN3P287MB1693954492F680A795ED979E9EF8APN3P287MB1693INDP_--

