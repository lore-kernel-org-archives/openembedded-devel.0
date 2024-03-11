Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E15C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 11:25:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web10.60275.1710156299396030011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Mar 2024 04:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uWcakkv3;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uWcakkv3;
 spf=pass (domain: arm.com, ip: 40.107.20.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UBLJRuQy0nIb1Xi1iIr5aDqdSQOIPCo/mMVIAFdiC26KtZ4S/LYjALL73KojLYLXzYg04wbPPg6Rac+sP0HhXh+ZUf4dDqoF0gPrG/ubjFGnk33FrIh+/i/bK7Sn1D0oprfeCHSQRkl/WQWiX2aFWZd3Y3auLxZQ5nPnWbWRsajD9U0RNqEL5vxJjI+GF5idzN2XUCF3wtHDb4alfyz3xcZ8Loj2EWnXs94+2YJ/g41dWRUZ1WH8T5j5FNaDre34MnXSmy8JzEwWsXVjsGh+eVTkP9900/7IEl064wOqMdGvDGxlsSizHtOctNPWvLNvUuFV8AeLv5dHp+H4qRgonQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVJ7pgNjT6CQkisNAe9onXMCNkSicpUTQdfoiMLITzk=;
 b=agTkxL5OPr6Z/Q8+VaT+G0FAJyDEkuZeoXIMlsnfEV2esrULqLycC/u5M+IW+R+4xw+d8y8Ss/wG1aiF0YRnrTD5Fe7o39eRK/5MMp2WBvZ8QQVtRz1XQHAphAV95gWxaJ/jrmH+BdU404CwVF2Svee2dmTEfWwUoUhN/5UNtguTP3oZRxQazXNK9DdHjYD6fUjfgg4/UCixEg64ptb4KtIkbDIRG27h96ApJmK95hD8cK5+5jE443YwLOwegz9hrY0UMExjP2UgawhRWb/dPdSV4Gu80CjACMWU+E8sY5C/VA57VCi1HKsn0g3vHHlaQajABXFXFszoCgjhE1lo6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVJ7pgNjT6CQkisNAe9onXMCNkSicpUTQdfoiMLITzk=;
 b=uWcakkv32ETTQ6CrbSnmxGwvKjubCeBpzwQkepM7mDnGoTdQZuB3Ktx62HFW4+OAtO5P9GjXWxLFzUizhknq4bx7mmCj6LmIPNVsyf/aRnBKPf13aUw9PyWpL3bqHe+NXDrKVeazU/+baHK4y9eLSLor/aN4PI3JBX9vLhnQoSI=
Received: from DUZP191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::19)
 by DB9PR08MB6331.eurprd08.prod.outlook.com (2603:10a6:10:251::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 11:24:55 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::f2) by DUZP191CA0030.outlook.office365.com
 (2603:10a6:10:4f8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Mon, 11 Mar 2024 11:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.12 via Frontend Transport; Mon, 11 Mar 2024 11:24:55 +0000
Received: ("Tessian outbound 3b68a75ac28e:v276"); Mon, 11 Mar 2024 11:24:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 812f7743a720193c
X-CR-MTA-TID: 64aa7808
Received: from 3e90f7d01a31.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9E111C50-0688-45AA-85FD-21CADDDDA8F1.1;
	Mon, 11 Mar 2024 11:24:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3e90f7d01a31.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 Mar 2024 11:24:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ntjcow4RATheNKeHXw/ANbX+vgYL1tjjrqpID+1My9fI+NXDhPrUKIIKvDZ/9OfBTpFcaVQzyFFPhcY2hLK7Ff3SjPTX35EJNra5aL1r/acrrQ3BWpwt9Svo9mKjIyj0PfzdcfxLGbmZc6EToCXy11ESpTO7UPDZ/wgnG4MLnsVTuhbqUCu9D5m71xW+f8vAMWUSHJuRuppIpqEkQsI1EwjWXHb6ZcoOzTV4DAUgC6o23DB8w3mIzLF9TZRAp4yoWxyPrU4kTJ8Gk5OFSUy8fpQ7ZKSpLpkKj4AQZ399Ct4OKeoqNFbdSwYIlxVyOh1eomqj3Q6UHfNLFot0lfvs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVJ7pgNjT6CQkisNAe9onXMCNkSicpUTQdfoiMLITzk=;
 b=QzgjgWcA7FChmgWFdlpJpb5SYXX6pZHuphdQy10WfRPKFYHf/ZL4c5VGMQ2s11XaAQsXNm+IfMXEbc5csi3yF5uPbqhKsI8TUp6yy5hcNUQz3Hm3hnc4y62H6zSYvu2jEvE360ZB9yWPzMmX0BV9DfIhGysmK3KAK0vfaN/GdQuNixLIXrPZ7/CUoR8Y3gegf3GMg0abNLUpXM8FAdhxr2B0R6M6XWUHX8rzAef3z1FIVQKygkVruOfZJC2OL1Cti+Ohmy6ds4j4Q+lxuWKvrAvck8FIqCr4RdW/W+dg8wiu0ddxum3rfKxF+xPJ8KSRXPLASCF/AidQRbeleEo6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVJ7pgNjT6CQkisNAe9onXMCNkSicpUTQdfoiMLITzk=;
 b=uWcakkv32ETTQ6CrbSnmxGwvKjubCeBpzwQkepM7mDnGoTdQZuB3Ktx62HFW4+OAtO5P9GjXWxLFzUizhknq4bx7mmCj6LmIPNVsyf/aRnBKPf13aUw9PyWpL3bqHe+NXDrKVeazU/+baHK4y9eLSLor/aN4PI3JBX9vLhnQoSI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5627.eurprd08.prod.outlook.com (2603:10a6:102:83::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 11:24:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 11:24:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
CC: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] short list of strange ptest recipes from
 meta-oe/recipes-support
Thread-Topic: [oe] short list of strange ptest recipes from
 meta-oe/recipes-support
Thread-Index: AQHacifsLFEsL8EScEWan0jth+y6SLEyaRGA
Date: Mon, 11 Mar 2024 11:24:44 +0000
Message-ID: <926E0240-44E1-419B-B7B8-4154C3E8EAF2@arm.com>
References: <1c6cd1af-7c7e-b97b-549a-3efe4e38aac8@crashcourse.ca>
In-Reply-To: <1c6cd1af-7c7e-b97b-549a-3efe4e38aac8@crashcourse.ca>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5627:EE_|DU2PEPF00028D0E:EE_|DB9PR08MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: f38e097b-851b-4507-4e9c-08dc41bde07f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 sC8cFwQeavNZfXKS5OXkkf6a5x/h/Ndonbt+LiHMPpwFNp/Jh8OkPPfH6mt6nCkwvcHhAJK0ZZdInwwVEiLmYtjC4GVMgSnLvhfCuoJRBTXW3UX4p3UhSR9+OT2NN5ernqAMCpXuIa4iOiVgDw39ksur5WzB3JaiwYtbU5W+kCVDE6TnnYk3JqR4m2K3Gmb1lrBExGdaOEX789cMOc+k5tFe5fh/chdyu/Tb+nBXiKPw5mvJAWBqQgHgyyeeg5++N0S8wVjahqEWh0//3gw7VIJWwz9mhUbfEOtRaUe8KxH3s9OGxqkuolO+Jdu6RWMaO4G1zedxNG6OkzgYD+1GTFHbbTL6mYVRMN5SGpAxRXC1BokEDCXEKhc6YvrJZ33tkDE3/sK61rN4mC7STemnl/IlNQnLiNt3dzv6xlKdHuU8Q4gZcyD7DABPD2sx965iZvlcz5UK8KRNIj3LpeNm47RpLybiS9PyQe9Rpsje4QXRdl1mmILuTC/vUmXKQ7GpGSGlbYbqoUF8hzgpeXZcoaFWOfkDw42TQGuKzoq+0x2XGhhNLOirfjT729EVPylV8cZfUrf7OU/Y9prLlz63wnWIZgKvIbYMfkgs+zOeIcIRDMXN4rrUvJaWhtkhuP8O3uV+e4PUU0/Y09FsRDhiXG7928vIKZw0S6T/VCOYqr1MCv0jwoICLs5rD+zIdaqI
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28C6C4D225FC804DB01E545C2BC63352@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5627
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	61dfd39a-6102-490f-977e-08dc41bdda07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u0RscMMmFJxrq4rgfFcf9D+0GgeHO+awhEOuosDs6GCLked/Yf6Oi/RuHZVnbTnm8xC9DVxIL33gbqDJWK0A/cyBi0rCr1o90eGSfe15H1E7ONAcCGkxj4/mPzTNQM5d6Klwvll909KBL1zGd3gFlgSebbHG5vFNmhz9bBdSqvPvTj1TZYGsnwhd3mqG/FDLoy1g38jE3agdYGsuFZxJAEdZHWBjY16j2TISDPVORA6ewDkZqnlCtufNtSofomdECZvM67cvZiBN787dhfk7OgYXkoCNjvq7GxTzmUH4H/SVylcvIxBUXijrvv3ZyNk89hF6Db/SkfkRLy+DFNJtwYe9CKuh9m4jKBEmTvPWDcDTAuq5cwFyjXbAiQOxKd3AGyz/lrEt8+YlSimjXLakNUQmyZfSIx4vIla8ds2xTsS8hAUVx1gyrSPV970oFLKiCdJ9kf3j5vF76ngLZ9A2VUyrH3DhDzrRXDpGZ8hoSwV7JPUxFhIAg37OJ/blNFGG9XDRbCjnbt4G3OMdXwXfOcoc1jYz+bbhSoHeOs+nnyPkbHwQaCO5UQdOZx3JRj8s8Ae8bcA1kTlEZSk0Dqo/PLXG55N5lAEIEHWjTtXXMfZZ5pSySwE/7lLUsJkxeHa9wVdn9lb013oX5MUJRqvLHwVJAqTYwi+RqkeQUSp6eBfmXq7KLbDK7KliSsXrs2FJMftTBhmKG59Z9+zT7xEPfA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 11:24:55.0831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f38e097b-851b-4507-4e9c-08dc41bde07f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6331
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 11:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109268

On 9 Mar 2024, at 13:44, Robert P. J. Day via lists.openembedded.org <rpjda=
y=3Dcrashcourse.ca@lists.openembedded.org> wrote:
>=20
>=20
>  in my travels, i ran across the following odd allegedly ptest
> enabled recipes:
>=20
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/fmt/fmt_10.2.1.bb
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/function2/function2_4.2.4.bb
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/libmanette/libmanette_0.2.7.bb
>=20
>  - inherits ptest while not providing the requisite ptest harness
>=20
> and one more equally odd:
>=20
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/websocketpp/websocketpp_0.8.2.bb
>=20
>  - tests DISTRO_FEATURES for ptest without even inheriting ptest

Yep, patches welcome!

Ross=

