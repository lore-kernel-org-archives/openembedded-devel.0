Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C753CC04FFE
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 09:40:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.62])
 by mx.groups.io with SMTP id smtpd.web11.17029.1713174053271635023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 02:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=V1RmNiJ4;
 spf=pass (domain: siemens.com, ip: 40.107.21.62, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZYwwRskTqny3mIJz/YKS4i2Ns+hSLnI8F+uMW/lgXyZL0tXrOhKB8RqYlRcFwFuLRGvYiPkS1vUhp3FOS1FzkAk+VOFCkVVcX8dUXE5PaHt2goaydsnLpV4BJBEa5HWPU0mT+NDc0cF0Qpb0EsGU3DnW0V27vCuteADqOaOhHxRm7jVh6KXQxNjYOajen+qBenF2hnC+P/gGQiXUh8wLN59h6kingy+INJ78R22R3uqnVEzHE++EUfDp+Cc4epYPNiEh587508o+4I3oYY14fKjiWt8Y0eqyD/ndexU3/ifsr/R3jCtYnCgICyy+avaclr6rfb5QU5sq0J9Ql+vrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBmrSZSqI8Hu7laOYXukv/utQpDpMfQBMQ+2l3YF4ts=;
 b=oH6UqSGNdgu64VB2e7g1fT/61n7AO8CwUMHy/mUm535wtGH1px5jFJuvrkwftOfrjWcHeQdOX7XXLlLiAaY5UTxP8n6Q4DHuObh7Mo9JeRfAtL7WyyiTdIezJsXtaI2w6lCVmhfQZBtnVS/CibZB0zunbCDAm7puFZsMAXIklXtnArS6J5NqQW9QNjDWEWEH3zwyM2IclXv5iP6a8ZAERJzw3FXhICzdsAA5sZxBdPM2Q7Q+X/cpl12d5OsknwZTjkd5NNMar30Z88xO2Ip6JNoJvZxwgtIeCLLEOdMS7LOzmEcL9UrbuKs0gKLi6i3hDDRDCFjVv1AMcMJ4sd4eOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBmrSZSqI8Hu7laOYXukv/utQpDpMfQBMQ+2l3YF4ts=;
 b=V1RmNiJ45oD9qen0fneqrjIJEDraQ5UloCcknhoEPYKt/LIDwf+DvKc8XSNBg7vR2JVb4xo9aCUUcexzxAjhD/zkm/RCw8gna7qMfeyFWyrLKim9J5MbYosCv7kZErfQwtWn+KvNKtq8a5ois53KCzy1/FkaHWIZoKB1j08YG+L0jP9+cHjjGlQ82zsJouL8CYsADhjXncNw/9M7G+F4hP5h9sWPal76rulMPU9WzDiWk9GJZkAgQRmmCGPqlXTNmBmdfCl9mMrf+P/mETPJ4gyDGPeQ+XQeKbbzXKLI0nGtpTy525gII/Kz+deNOZkdsosWp28WfJiiqRTw1l18JQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6233.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:78::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Mon, 15 Apr
 2024 09:40:48 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7452.046; Mon, 15 Apr 2024
 09:40:48 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] c-ares: Improve the ptest output
Thread-Topic: [oe] [meta-oe][PATCH] c-ares: Improve the ptest output
Thread-Index: AQHajxRplk2Tra0fGkWJy2XxAJA5T7FpEA1w
Date: Mon, 15 Apr 2024 09:40:47 +0000
Message-ID: 
 <AS1PR10MB5697E0BAC016B6540E615626FD092@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240415090750.2727038-1-mingli.yu@windriver.com>
In-Reply-To: <20240415090750.2727038-1-mingli.yu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=809f7f22-a2f5-49f9-9c6d-cfd97516527e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-15T09:27:16Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6233:EE_
x-ms-office365-filtering-correlation-id: a34d7742-f12b-42d9-a5bc-08dc5d30216c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7c9Xyr9I3ODAwDWDz++BI5eR7/mCLhpe5iI2TZoKBz3B0XkEXhOM++9YJ2xRLUdXF4OwMjJpqIPivt9+o2V6cVZW4BwzfqqPXE8Z9NPvCVr/Zy2cBLYDlprzjKfFR04R9PTa+EcQNwgbXE1b9cVpDevSjV6yu9owDnJ06eGz56wtiaYRnDZ3E6ldg0geJi2N0CbRh19dPTeplTOVuqGlYfsNPOv2fD8hv9d5jGca6iSPnxKR0VPoP3PsD0AO8y1DlMq4RMGk07zKf7Yx9iTvVtCFyU5X6T/SVC7QSGwCUaihcKMEWCcPYDMq+YvkgU7/LxC3vRTbHsZNby+Q72xA45o6MGLWBpwImkKDpMEvoXMKNHzhmjIvwH7CVxR9At7C181qFkYaj+wVVRjFp0v6zG8SgLcereWkF5hSqxth5yA5c5eQs/CADGZ1chbmZZ105k/+m1A/CMIsjkWJDZoGPNIYMkbIy9ds6Oqwg96fOO+SlcJNLPgAL+GYTh5rKZ+JFHOlydJbVhSxvm5QqLHF0xVPbKLPy/vfmC9R/dq1Q8l/q3kwPIEw+UvHYPT4ubxmWUM3FbY0bvctya8MDB4f6/4/usxj09mUajkw1aR5kXpTm9hXh7Olsy7kRXQijw5lH0Ke8iPKzH0Gywj7Ut4zxIEUAFrS9DKX1oCBcfMc03eeJDVjBsdfiBSrqJzm8CocFZQrNmgYDO7B+v4SuOFZ8SwBXZET9iTylo7uIute9wE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KImfgRZIHUsByijUV1XPhK/jNmrU2D7+nNkk8acWRqLAr8gx9oI4N2tI+7vt?=
 =?us-ascii?Q?py9B7Vax8CYENjoM4LEOAepA6RAr6YcpvEr4dDnkZbY86+SDulo4O+QEpuzP?=
 =?us-ascii?Q?Tu+eqrM1jHJfF+EaRw4wF30/TdSE3kLZRgNoUefoUevU3BOoaWXYRBNHCKWv?=
 =?us-ascii?Q?IUPOnDA1PBVzOEbiSu21qXmqPFsO44ZCR4e2A5FaXsi8/adCGag2SP0KwtqZ?=
 =?us-ascii?Q?AiRgQL/HEHc8qGJEdVavuHH7/URnAKPEY+W8HZmrVWa4mAkrIkoH3ldeK/B1?=
 =?us-ascii?Q?uf5Ym8Ntqm+wOgcCX5g4Kql/mQLNayAIIeS0LsO2SaU6FWYAo0SPpiRPNdIw?=
 =?us-ascii?Q?bcFfFUZFZTCXxsDK1xdwV8+9EGIQy2YA++tfGJ96SGbxsB7VwrhaD+WQuTyf?=
 =?us-ascii?Q?Lyu0pQty0tCDzAOwfNs2NNRy0+VIBkRe4uuPplqmciW5FnsQ9AGVo7+yUqTj?=
 =?us-ascii?Q?7z7nx7Wg4YnZCY2Y4o5NNU9iMBC1iCTRpI5r7wr6a/dPjtVa2JxMlb7wgbvJ?=
 =?us-ascii?Q?GvnzYaB2zvX3mgIPMTzjZ850Z9dAHEGwkDYIa4uluLcMSFx3wAIgV3gcnQEK?=
 =?us-ascii?Q?MnYMUuMhCuiChVXDNtWqCQXEfxzCp2g6Oov+gmMEFdLblVtJ2ixFQcUWLfSp?=
 =?us-ascii?Q?sYlZH6x/hV7enkX66FH9tRKYf5WEMIugfxqsBVVrRLUcYFla4xDycIcOxgRr?=
 =?us-ascii?Q?GrQlUF5YcEZGSLItCtMhIp7mvlGQS3c8XVVr5SA8xa6B3iecA4FmnlRkk6xb?=
 =?us-ascii?Q?I4y1HJbuoLkD2V5LcxHQI/wORXnW7SP4LH04ysHVqDTcHDsTYJ0O1Sk9lpm/?=
 =?us-ascii?Q?UZD8hhnyv/jZ2r3WstEr39WcuzNTHeOsOYr5xd7LOuL1e+oVTIl2VVbaSNXd?=
 =?us-ascii?Q?t+I6uHKxv99lM40iCLu2mk6kt1EuwYjyMPu08Qrg3Bds7j3dazoCXIS49Ha2?=
 =?us-ascii?Q?JrQzUwu8GrgS4FCbXDIFFiEno+Kp/iDIsy7PdPmm2LJSCEiFdl5gOM2aDeV/?=
 =?us-ascii?Q?JcV6QAc9V+1NKOD3iK3zGDz3n2GJjRbaDpx0Cy1giOQkwKm/plc3hZEUIp/B?=
 =?us-ascii?Q?BpKuwKTF+C/GjZpEE/UI++7/Vo1GmGoZvhEo7dTf90s2e1/GXTiQNPn3RaRG?=
 =?us-ascii?Q?VMqIjjwINzBBcT/VzqBczxBP7hsvBH1QkCApXd1tDnBRZUuJ/T+NLsd+n/KQ?=
 =?us-ascii?Q?CYwILrwF5OfEprObqd1cXbZVZTMVxCTLj8hy+C0vFjHfPPrxlxbjrzoJr0Ye?=
 =?us-ascii?Q?OBtrPQR0b9ZZNM0ujOorkH7RQe5xpbasfWkPuyHBkCknYfF5jM+2perlPGgN?=
 =?us-ascii?Q?gpGrJeSIIqhFxxIuKYzP2Z3UulrF/ddv/dIMalAoW534uERH8pLBu39weiQ7?=
 =?us-ascii?Q?Pbc/3xpdHMfuMu/DYnbfrnVXt+DOH0kPhpgJ3m8jymg2eQyvYSADsAYqPkwd?=
 =?us-ascii?Q?EzTTQBr30SuXq9nsQ8GaENve2qS2Cihd5bcY/rMPyFEmWY9r0M6miuBE9KoC?=
 =?us-ascii?Q?7F9igtR+emTIpONSNXwX94A53U6n0SU8WlDlWQ0eFjW3G9Estn1SQ/6ioMmb?=
 =?us-ascii?Q?VMYnZ0paoK+T8p9y7Tv8l4HOIKICYNYBJOIOLh0/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a34d7742-f12b-42d9-a5bc-08dc5d30216c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 09:40:47.9923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+s0b7vubcL9PhomVshR51o0BkF+ZW2bhKHa/UqV20JmdXfa6pdL5cFFJqnhsOnzshqoNBQtAMbNiLECiC3iFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6233
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 09:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109954

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Yu, Mingli via lists.openembedded.org
Sent: Monday, April 15, 2024 11:08
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][PATCH] c-ares: Improve the ptest output

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Before the patch:
>  # ./run-ptest
> [snip]
> [ DISABLED ] LibraryTest.DISABLED_ParseAReplyVariantCnameLast
> [ RUN      ] LibraryTest.ParseAReplyErrors
> [       OK ] LibraryTest.ParseAReplyErrors (4 ms)
> [ RUN      ] LibraryTest.ParseAReplyAllocFail
> [       OK ] LibraryTest.ParseAReplyAllocFail (0 ms)
> [snip]
>
> After the patch:
>  # ./run-ptest
> [snip]
> SKIP:  LibraryTest.DISABLED_ParseAReplyVariantCnameLast
> PASS:  LibraryTest.ParseAReplyErrors
> PASS:  LibraryTest.ParseAReplyAllocFail
> [snip]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-oe/recipes-support/c-ares/c-ares/run-ptest | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-support/c-ares/c-ares/run-ptest b/meta-oe/re=
cipes-support/c-ares/c-ares/run-ptest
> index 46572111b..66ffd5388 100644
> --- a/meta-oe/recipes-support/c-ares/c-ares/run-ptest
> +++ b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
> @@ -1,7 +1,3 @@
>  #!/bin/sh
> +./arestest --gtest_filter=3D-*.Live* --gtest_print_time=3D0 | sed -E  '/=
^\[ RUN/d ; s/\[       OK \]/PASS: / ; s/\[ DISABLED \]/SKIP: / ; s/\[ FAIL=
ED \]/FAIL: /'

There is a general problem with piping the test output that the result code=
 of the test is ignored (result code of sed is used).
I tend to use "(test || echo 'FAIL: exit code') | sed ...", but that usuall=
y adds another failed testcase printed in addition to the real failed testc=
ase.
However I have seen that test binary can fail without printing test failure=
 (e.g. wrong path, missing executable rights, segmentation fault, ...) so e=
xit code is important to be checked.

I'd appreciate if yocto elders would give some hints about how the run-ptes=
t should be written if it does not support automake output format.
I'm rewriting lot of gtest based ptests right now when preparing upgrade fr=
om kirkstone to scarthgap due to test output format enforcement and this is=
 giving me headaches...

> =20
> -if ./arestest --gtest_filter=3D-*.Live*; then
> -	echo "PASS: c-ares"
> -else
> -	echo "FAIL: c-ares"
> -fi
> --=20
> 2.25.1


