Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5D7C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 14:52:25 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.68])
 by mx.groups.io with SMTP id smtpd.web11.16295.1679323944271555827
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 07:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nuWvHs9f;
 spf=pass (domain: arm.com, ip: 40.107.104.68, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBfFZe11l5oujXYTmqJLNbHM3HWqmwIRyRNoO1UdwZU=;
 b=nuWvHs9fWz5zsyrFtVYMhNG62TlpoVSEw7x8y+L9dIrijb9dz0EGUXD62RM/kPC/Lr/9bp7KJuFJG8vX3E5CtSBqyeGPcUBd9Da7AgFDAJQwsULc8gmc7+v3x3WFeADCTMxdSAYniDao6mJs7gx+ptI4lxXUbjuSnkco1V37Uy4=
Received: from DB6PR0301CA0006.eurprd03.prod.outlook.com (2603:10a6:4:3e::16)
 by PAXPR08MB6653.eurprd08.prod.outlook.com (2603:10a6:102:15f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:52:21 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::1c) by DB6PR0301CA0006.outlook.office365.com
 (2603:10a6:4:3e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 14:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 14:52:21 +0000
Received: ("Tessian outbound fcd8b5fba459:v135"); Mon, 20 Mar 2023 14:52:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74f01cf04af0da60
X-CR-MTA-TID: 64aa7808
Received: from 33d3f30d37f7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 541ED410-E926-4270-9B1F-1694950D6C67.1;
	Mon, 20 Mar 2023 14:52:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 33d3f30d37f7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Mar 2023 14:52:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTkIPuw8QrB0Vr0uumeIUItInVeta53I4YCvXzh4gBwWJHEu5deo9cc2zcnnqc4adpH6MgJrH796HYy40KIAAbC2ehh7D21r1XUHiVwqCEOq9S+hrPS7i7RKsH0JyOHm5d9RChmLZ3MskjKtS48U7L3AsfE/TCBe0DKI0p12Ed3VbaEVsW51Rk3hIKbmwjZsvwtOLewU55fCDiNRsoT+PsC1o1PlVg5E3qYClB9G5Z00uY83N01Igifcqty0Br11ghYkMU1b6vsPg7zzZqhByN0CkOUBHpiaTtSip9ZcaqqjcaWzw7z/lLBzlfuIf7MuV8V49Pg+AJ+sPJ/dSFKOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBfFZe11l5oujXYTmqJLNbHM3HWqmwIRyRNoO1UdwZU=;
 b=UjMpWko7jfZ0Xgo4fI77mreUMqs4LyM1IzWRgqvBfAQFX67Gkei9BfWlBQMjiMbQ23iW/gjl5jIfA87FINLLfCAYT0ZhtCkQMD4Bj25XvPh57cUbOuVepPq4AuGaMwdDriaqtUcuFyGS0Yh5GAekQAzE37QsEGbJ/WUiCu9+47vWkhRRBlnBsGl482YhjYQtYTXHvMPfB2YijtQsAGOOkHhyQrTjN7YZXSSqJ3QkLtMlVZ0Q70azFh3uaozLChrp9VcTxhNphw7E1qfoyByM8morxwu/iyQPRD/6xYVroqE/mAcLz62a++64gtBR7pqhzduKvGSEj+KGG5cUnyVBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBfFZe11l5oujXYTmqJLNbHM3HWqmwIRyRNoO1UdwZU=;
 b=nuWvHs9fWz5zsyrFtVYMhNG62TlpoVSEw7x8y+L9dIrijb9dz0EGUXD62RM/kPC/Lr/9bp7KJuFJG8vX3E5CtSBqyeGPcUBd9Da7AgFDAJQwsULc8gmc7+v3x3WFeADCTMxdSAYniDao6mJs7gx+ptI4lxXUbjuSnkco1V37Uy4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6024.eurprd08.prod.outlook.com (2603:10a6:20b:23d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:52:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 20 Mar 2023
 14:52:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?iso-8859-1?B?QvZzevZybelueWkgWm9sdOFu?= <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH v2 4/4] python3-meson-python: New recipe
Thread-Topic: [oe] [meta-python][PATCH v2 4/4] python3-meson-python: New
 recipe
Thread-Index: AQHZWKHEOgOG/XAW8kS/9hvSNiiDHK8DxcsA
Date: Mon, 20 Mar 2023 14:52:09 +0000
Message-ID: <DF0FC653-07F7-4E8E-98D6-1C8E086A842D@arm.com>
References: <20230317072547.1031123-1-zboszor@gmail.com>
 <20230317072547.1031123-4-zboszor@gmail.com>
In-Reply-To: <20230317072547.1031123-4-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6024:EE_|DBAEUR03FT032:EE_|PAXPR08MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb4d807-c0bc-4149-bfa4-08db2952b573
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NfrjgxwlxQU5mFZp8KNmOr8O8Ql9zFijeUS6Y8rD7VvPkBu6bUL9mc6C34ibw0bdj43LxJ3F8AWqKujWv0pjI9pGDxIuvsYbI5d17A36dAnXwGXl6q0wYbSkkzYSCOU3r6cgD4x5wG7DfKKD+95wEC1xDTXZ+GVdseZ1p3qzUe2YXvljFFdjgs964mcBnw0DDlZYwM+y9rzm/XHmOjaJZ/GWir3vpYPNV6M/DypWTEUxACLxLRyqBRShnyIHpKeuJo1mrbdy79KAHtLDKmGgtoc2zjciBZh5g4ecscNF8jKalTM3pnZCXuCk/6W5cg4uGOOaYgsuGU7BQhFHMh1tJ5n5dChVfq9TQ8VPdYurNyc0iJnAnV1N/ZwOuNSJ6lyi6cUrkuGZLFhvBpAKaHW+2zaFZBGpQOv6Vx5ipNA+abBHk+6esS/XYNttwG6soEuWLCnE1CV3iZpvi1mC/GXqfpzs1OYD2khNHpau449c64e1SKQKPqY6nuJpZ3xSknOuQdRPf7udp9oTulquy3W6f9R6bczHwg5XMK3XgPU2J2UZZSF6Gub8CKNHRftH26Pb1MrdVx6Y7xtfoK4aDf+76poIBnG7jNafp4at+RnYiFh+hTmAIdogj7ZkNC0TtGLDUvWAGgZ+IvkoXRTtr7AJiduCI5UxmLRhxkcnv7Cfr/AHBEsLxj1McO1JmV2KW7suP6ceXUWbzO9j3v6+P7yKWVTXyoaMwUOU/3iZFblXSos=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199018)(2616005)(71200400001)(6486002)(4326008)(478600001)(316002)(66446008)(6916009)(64756008)(66946007)(66556008)(66476007)(76116006)(91956017)(8676002)(53546011)(6512007)(186003)(6506007)(26005)(8936002)(41300700001)(5660300002)(122000001)(38100700002)(2906002)(36756003)(86362001)(38070700005)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AA3224D422053040B79B361433E0B492@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6024
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fb02dde9-19c4-490c-e782-08db2952aea4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aD90yivDLipx9zcebsdlUmhL6KB9rak6CaZqm9qoXhVcGVn6cXnlbegntb3cuSjVfqx17uJjl1OhtMDLei/fQMhenlx0zVk9frcVq3tsY7/7W1+8rQRUDZzM4WvtQahUzFqRa7i7gxkcR6QzVQcyFpxfsZVuvqJSloJEPWwDuut62Y4ddYe7gMsylHlYOCGQq8hx6MFg2XxTMV2g9HED2y26H4ExnyyxfNJEWY+SZIevj7SL/Wxec7T258u2zUpHLFmuBURxpZvFdNo8/esraIqD7hmbg8xLgKyzHq8UeYtURBLeuPG1MK7uRmmZjPSK0UcgnxNdx1VLcfv01LzGT/XifdMpIqYkl2P7iaJXO0vnaTZN6aRYFpM3/0LmR5eQB6ujlA0mUBPQCqY+pXDdUfcKS51a9gX8GLItA8Bm+CBPRAmYU1uKmmq3Wmk6eIqKctAXndErDze8TlwanBroE4oLydWN3Yw6b+0kSKvbLNrCyg5RcCGaHBPTiTfB/SHjyOLhFTe+4pjiqjfHi84m59JLhvdnGNTbbJ8hH+iTLJFf82ad9Yk33XiVlF/2rEphg30PMhmD5K7KnsZ73ZMco2qgthlIsG3YkOCdBdOcgSao7uK/Tb+Cii55wXW+CI3u8ZHArfeZZzPRAxyfVBdO3J/M9hYkhGvWKdkv3slXlmz7CU38YMD6Ylns33B0uh5drF4W1U86hT0OR6w6fd6Vdg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(186003)(47076005)(478600001)(8676002)(26005)(336012)(6486002)(6506007)(6512007)(53546011)(2616005)(316002)(70586007)(70206006)(4326008)(36860700001)(8936002)(41300700001)(5660300002)(6862004)(40460700003)(82740400003)(81166007)(2906002)(356005)(40480700001)(82310400005)(86362001)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 14:52:21.1376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb4d807-c0bc-4149-bfa4-08db2952b573
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6653
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 14:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101609

On 17 Mar 2023, at 07:25, Zoltan Boszormenyi via lists.openembedded.org <zb=
oszor=3Dgmail.com@lists.openembedded.org> wrote:
> +++ b/meta-python/recipes-devtools/python/python3-meson-python/remove-har=
dcoded-setup-args.patch

This patch has no explanation, upstream-status, or signed-off-by.

> +++ b/meta-python/recipes-devtools/python/python3-meson-python/use-instal=
led-mesonpy.patch

Ditto.

> @@ -0,0 +1,9 @@
> +--- meson_python-0.13.0.pre0/pyproject.toml.old 2023-03-14 08:55:19.0929=
87968 +0100
> ++++ meson_python-0.13.0.pre0/pyproject.toml 2023-03-14 08:55:40.10867298=
0 +0100
> +@@ -1,6 +1,5 @@
> + [build-system]
> + build-backend =3D 'mesonpy'
> +-backend-path =3D ['.']
> + requires =3D [
> +   'meson>=3D0.63.3',
> +   'pyproject-metadata>=3D0.7.1',
> diff --git a/meta-python/recipes-devtools/python/python3-meson-python_0.1=
3.0.pre0.bb b/meta-python/recipes-devtools/python/python3-meson-python_0.13=
.0.pre0.bb
> new file mode 100644
> index 000000000..a113408d7
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-meson-python_0.13.0.pre=
0.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "Meson Python build backend (PEP 517)"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd580b27e67cc0892a5b005b0be114=
b60"
> +
> +DEPENDS =3D " \
> + meson-native ninja-native python3-ninja-native \

The python_mesonpy class depends on meson and ninja, so those can be remove=
d.

Also the python3-ninja recipe is another waste of time and space, and shoul=
d be removed.

> +SRC_URI:append:class-native =3D "file://remove-hardcoded-setup-args.patc=
h"

This might break nativesdk where we also write cross files.

> +RDEPENDS:${PN} =3D " \
> + meson ninja python3-ninja \
> + python3-pyproject-metadata \
> + python3-patchelf \
> +"

Does mesonpy actually look for patchelf and ninja modules *at runtime*, or =
does it just use $PATH? If the latter you can depend on the actual binaries=
 instead of the wrappers.

Ross=

