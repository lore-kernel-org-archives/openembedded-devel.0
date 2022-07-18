Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A71C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 12:09:42 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.55])
 by mx.groups.io with SMTP id smtpd.web08.26405.1658146172121827217
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 05:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=G3fm88fD;
 spf=pass (domain: arm.com, ip: 40.107.8.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FEh+dJ0l0Nk1jjrkPLE7P77mCb8QqTlejxvxdnBSY6ej94SEEJey4dc791YLMiErniDABj8G71JLNCdzudjzSYq0nql+d4VyZhkgVr2LNSkgX2DDsJnGv0lncvXKILO8BMiKsOvnHZisXMyM0vJ4tLTE5CXgQWpgs0AlAh5lwPA+aKbLJaSoKos79mEOsQ9QDeR9tDTqFTJN4oxES3S+ydilSFx9D/QNY6DKko2AErN8HBbxMYF6UQY+bhKG5mmIheNkOSmJSl/xX1iLML5jrmJYEPp62RH53QIkg1dpzHvBZQ+ox7AKOw/9Q8Ugng1qp4ajr5ZpuA2C6Da7qh47bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVhsqC6rj1w6ZXZCfcdwuDGfQ9TTsXsyTiqERssSSOM=;
 b=gVyLw5nYECBwB91OTopA35IK8AGA8VzArI3e0y7mnDt2Ns1XrSFNPllCJ9fbjOSHi+d5OS7L2O17XIJi7eCzuNg/X+k1FHRNEWMURmNVCQst3sMtLoMjKu2V+HSGDMriz9zbsrZu6/VMuLdrwa94e8HJiwVwsnYvj4ChUG2rplR96ZpVfzOVf2nc0hHciwmAMsO84fUYjVOywxyv7Q7kJiGPZLjsL6CwLXgaE5rcMU4dfVAIG0Xo4JlO7GQWWlxxnrmue43evceWSo5TRdMvtpPWYIJVafAkwXYdp+Zqw2P+CWgKoXi8X18uVKwDEbCjZZwMq+bNuUaTeBESjl7bdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVhsqC6rj1w6ZXZCfcdwuDGfQ9TTsXsyTiqERssSSOM=;
 b=G3fm88fDBeMr7yCSPJMXRi+bDvK4uk5I2Z6eHTqSwGkZ3T1x+90jZziC/+n5uO1wuhzJdv5uj/h9lvpdnl9iQNGHPDguDw72G5WywYk7o69ZR/B0sl7j7swfFXM0xsUQ/3u7xFwyAkvYyLwz3vcARvkYxDMMN/Y9SUR8mqfc4Gs=
Received: from AM6PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:20b:f0::23)
 by VI1PR0801MB1920.eurprd08.prod.outlook.com (2603:10a6:800:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Mon, 18 Jul
 2022 12:09:27 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::22) by AM6PR04CA0046.outlook.office365.com
 (2603:10a6:20b:f0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Mon, 18 Jul 2022 12:09:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 12:09:27 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 18 Jul 2022 12:09:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 192a3873ce23a951
X-CR-MTA-TID: 64aa7808
Received: from 0afdbecc68f0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A0053D2-5003-4732-8681-49740522B067.1;
	Mon, 18 Jul 2022 12:09:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 0afdbecc68f0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Jul 2022 12:09:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+kyfIxiPfWmeQo7MXhZ8Evy9fS4hgYb/6yLE0T3xObnky4F+xT1NNbrLrjQ27kheWS0fTPOAOlZMWEZh3SdTbXYnO6gRyu++ZL+bf2Q/MPOq6g3lRGrJPZW7+JoVz744VfqqEei+BA1KAGBaBla6lABuu9l2Tvqhk9K+Dn1O14Gj2LncUR2+3MymTcuWR6r6MhhNuplqKLUdshNyJXNCWkjoOKYxE9ItnI0jaiJ0DcrS3htU4WxcCmCSi6S/5eP5V1zKIJMYn0uxiGdMr/DNMI+IpduJom0cjpFuH3D9XhElw2jbLPzM7/ydiHga9ygnhwtGamAJs0ISdAnWmlHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVhsqC6rj1w6ZXZCfcdwuDGfQ9TTsXsyTiqERssSSOM=;
 b=JKu024ygLSitN93rpslmfdUrzZSJiU3ikT3DujVYiLJE2dtY6Wb/HMC7MNC0PJi5OYn6lZK37ibzCX0JJe3e7gs0JCmQHVpRbqOhdqwqHSHnM6P2S727ij4U51C36slXooD93teTvybGV8BwHc/L/FuXI9rxYK2C8KKtHnwhydC6lGrydDwa1Ys3hYJDIW1o3tG/IwM3yRSJQc0WquFb0gWrB8a02kggh6U2vb1MMaQWjiCEBCnD5Z6C0WHeLNwf7mnj80aYNg7vGbBvEyw0eFw9LRGGwfP6o+iauaBbnWQu3K1suD9kkgHbH5YnHy1H3/Z75UW3K01WkU3jFEemXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVhsqC6rj1w6ZXZCfcdwuDGfQ9TTsXsyTiqERssSSOM=;
 b=G3fm88fDBeMr7yCSPJMXRi+bDvK4uk5I2Z6eHTqSwGkZ3T1x+90jZziC/+n5uO1wuhzJdv5uj/h9lvpdnl9iQNGHPDguDw72G5WywYk7o69ZR/B0sl7j7swfFXM0xsUQ/3u7xFwyAkvYyLwz3vcARvkYxDMMN/Y9SUR8mqfc4Gs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7051.eurprd08.prod.outlook.com (2603:10a6:10:2be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 12:09:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 12:09:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 3/3] python3-pycups: Inherit setuptools3
 instead of python_setuptools_build_meta
Thread-Topic: [oe] [meta-oe][PATCH 3/3] python3-pycups: Inherit setuptools3
 instead of python_setuptools_build_meta
Thread-Index: AQHYmMI50u3lEzO0akuhQsSF9GVvM62D4VeAgAArYjg=
Date: Mon, 18 Jul 2022 12:09:18 +0000
Message-ID: 
 <PA4PR08MB7411E748A14F4EBA9B9E132DE88C9@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220716031434.4021879-1-raj.khem@gmail.com>
 <20220716031434.4021879-3-raj.khem@gmail.com>
 <D981D817-D78E-4CEC-A685-7BABEF22530F@arm.com>
In-Reply-To: <D981D817-D78E-4CEC-A685-7BABEF22530F@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 55a49002-a2e9-4d5b-3799-08da68b65cbb
x-ms-traffictypediagnostic: 
	DB9PR08MB7051:EE_|AM5EUR03FT028:EE_|VI1PR0801MB1920:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rac+FyN9DwDWFWtCSCF3qKfBVV+MILG1NQ1PEtLn0oJfirKKHDW51wRlZZCj3vBAMdP8A1Bmj13+kR4ODnaq+Hfc2covaAYNNIwCkcgS2HtH1hJ91FOJnCEkN7gvGUY89pzK0ewjuMq6ZdOQqO7lqkkPGHuNz9AlTvca4rktPY2HSBmtXQhKEYcVz9VGhvBdoBFAJETilWw7Exn5VNDn0lclCYEg+VQfs0GwURTx/x3Yt2sFnk/mN4cAIKPNnVum2apNHLPFdB976w9m7iYTG4E5RGR3+n+PeD2/i8w7h8XfDvAnmI5oLz/5ImaVfiGKUJWJd88mnlHi6F9qRJxPXTIwJqHqcusOcLQdy+HLprfabdDobu4/AqdCK3JU/RnXTiUuBSz5MvUbkUo29Ok/ozh6WE7ZfnYHwMYTd3bRTJSnp8Um/2WyYF4oYMeDtITodrrzGM9lObUS3kdXtm4oWjfdBtl8eVwNgh+jqRiW7Sk+3XFZJI3SD5Dl2ef6Oa0ShgzlaI83YIwMZ9KM68WNkTl8wIg8pNUcRI/h+X2tX08iA96orsWtfeaW2qUWKBvvN9ytO7gD9Dbikj2niuIsY4ad2Occ6y6HL5UTlI+95W0Mc2wHCBA8LtMq4QLbUzFB0TYeqfN6yLMxxnabYuTHcSxd+br6JwcBb66PSIpWJIVgwjALuEEdadn0YTAv3TmslFBtUTXito6jwMfYeXiV5eM3+1BgHqzWFqZVdqU9mFWasOeXGMN5wMRlbqxMtMdVpN5Bvxq5/iR6pvx0OhyBXvccmX0/+QtlwZGi2Z2ocI/Zp3YA+1AUpP2/77UZUbAA
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(6506007)(7696005)(71200400001)(478600001)(41300700001)(83380400001)(186003)(26005)(5660300002)(9686003)(55016003)(91956017)(6916009)(66446008)(64756008)(52536014)(66556008)(8676002)(4326008)(76116006)(66946007)(66476007)(8936002)(122000001)(38070700005)(33656002)(316002)(558084003)(38100700002)(86362001)(2906002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411E748A14F4EBA9B9E132DE88C9PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7051
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b916b356-cfd8-42bb-105b-08da68b65799
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t3wtGRdiNbPuwzuDcTNFs/269CHW+4N8fbt9ZUHkU7KTJCW6GNCFsX4oNS2E+o1uMoeq4GFkdnT7DiatvZyAck9t3TiTZZTtx0ZVdBDTX7Ks84xZ7umuN2/SAbBzpgdRWEZRZ41LOlTn5AoUPcnr+qH/jYwP6ciPzBgYptj5XrI3fuKRKuRoCWIssLJcuUztk+u08KujXxY07VAL+Cfwfpgvpo06n9eno8q2OmnZA44NYfYqQSJsvNozqa6t7OzwwJKmPRW03Hc7Qv/uPuggdBBHGIDDdUTlLrCk9uV2bm/o11OhRmnE24xTy2tMWcGfwtiKu1NswlVPxXz9kiOXzaYYYy4R2zeQAUhlR+56Kw6jSKti30MNrsqAkMFLaBe7vRrF8h0p+1fZMDjxEnwKpQm777/X1WHRlRwQMGe70AuO7njo36L+FaYNedbJJNeRQ0q5GzVt8nuRmy0iP0lfwDX+EEPF3tdmBz+xi9Dn1hK5RO/xFHp9SQ6WciA8kSpbUKqnBR0QFvzBm+DG2RTwIH3C3TSFVaeAOs4FKfBJHNH9cLxb/IWhJIY25V42WaVA7bSJZSNfWw7LhR7P4QsUVw/8LS6ny4SE9bHw9ilVPt34dTOEn31ar4kz/mHuPmyEXSvHQi62YUh/G9nM31Vwaaod7fj973zTmrlkDFBVN+5nixmGHEz0/QdomFbqGtonP88YrfL2nmYHWxV4BAhPou8ozUDF28zqcMkyCaCboUX25gTrdp0cCdSIF2Ju9yrs9/KItyMDk94xVdieIXWjB3R5veBYFnMRQ4hn9nZfMSMzP8r1VhrjXb63YzJIZl0O
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(40470700004)(36840700001)(86362001)(356005)(81166007)(33656002)(82740400003)(478600001)(47076005)(26005)(7696005)(6506007)(9686003)(41300700001)(336012)(186003)(8676002)(70206006)(316002)(70586007)(40460700003)(40480700001)(8936002)(6862004)(82310400005)(55016003)(5660300002)(4326008)(52536014)(36860700001)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 12:09:27.4831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 55a49002-a2e9-4d5b-3799-08da68b65cbb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1920
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 12:09:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97875

--_000_PA4PR08MB7411E748A14F4EBA9B9E132DE88C9PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> the picobuild 0.2 upgrade queued for oe-core improves =93legacy=94 setupt=
ools builds too.

I=92ve just looked at the logs and this is the correct fix.  Don=92t merge =
these, just wait for picobuild 0.2 to land.

Ross

--_000_PA4PR08MB7411E748A14F4EBA9B9E132DE88C9PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt">&gt; </span></b>=
<span style=3D"font-size:11.0pt">the picobuild 0.2 upgrade queued for oe-co=
re improves =93legacy=94 setuptools builds too.<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I=92ve just looked =
at the logs and this is the correct fix.&nbsp; Don=92t merge these, just wa=
it for picobuild 0.2 to land.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Ross<o:p></o:p></sp=
an></p>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB7411E748A14F4EBA9B9E132DE88C9PA4PR08MB7411eurp_--

