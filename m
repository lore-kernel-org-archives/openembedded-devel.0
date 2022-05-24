Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384AAC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 10:26:06 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.78])
 by mx.groups.io with SMTP id smtpd.web10.7672.1653387957786439792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 03:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=kdkOIHBO;
 spf=pass (domain: arm.com, ip: 40.107.2.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F1XrQAw6Bm+XAh5pTWjxqnzXwpBig1tiT9Dq0BHDkORsFhNO/cBvrt7eZolEwNp+wCHFak6EwenwpOyNs6PSQExjw2Y8vr4VYQ4sBbyP9Yt/d1yZGX1kgneEpV+aT+6o5QYPCOFfazZk0UszrTcKuD3woypFlie5xjAlr9ePN59bRjL/AxIcb4siinMZghjzDm2r9I/U0LiggMoJS0wuhjD7A6VGBQVo8dspSbpCL+NsfgMQykXQ4ICYdIoeh3NOezDUoBBSpvv7ykLhwZPo5u/DZC9kXG32c59TWHTjaxcmaSc1OQwXfdKdQhT2XbcoUkFioW6meHAdNjQGivhzPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcH1pfinZ+Vhu2c3OJ79RxrJZzfFcP9Y6+4nifaEzKY=;
 b=QU/kPRYTSSxcL0lNK5hF/DJy6FP8SYHHujeTLVHODqDQky0ffohNyb2skJzWQk3b8tpXvRu7rPQD9zB6RmdHNUV+L40+aXwkatTKi7d54pTAj/xqdlO7BjWNsL6v70ttDcM2TQBJZrtbsEQuu4j38qrVyOHDJKF6OKSF1UwzmA37PeGtMBEh1Rs7qmSxu7F0DDHKgcRqzj2QSNcR6GuILD8Om4vQcf6ZKHKH7TUG+/xT9FCUzu9JskH9aWEI7s045rYTXN2Z6Bap4a+l4/fa88bQRVNLkItOL/m2+onBk+dnRIVpLwqcwvIH9xbKm3TXtfcofdMC5xnxUbCOMrt6iA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcH1pfinZ+Vhu2c3OJ79RxrJZzfFcP9Y6+4nifaEzKY=;
 b=kdkOIHBOdNHWx+QxAgMuCMbqafst5sLAOJfnyIz7+wrsajVOMJi9po+o7m9mAIBZaDXciJd0DG+4uuDJijllSDtTkcCIkVp9j6/KMYNpMiYFqs/QI4LO08iqX0l8YmASQPLtg5hrdV+WUXWIVOZDRPSxkVpY064svWGszJVuIDc=
Received: from DB6P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::34) by
 DB7PR08MB3898.eurprd08.prod.outlook.com (2603:10a6:10:30::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.18; Tue, 24 May 2022 10:25:53 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::17) by DB6P192CA0024.outlook.office365.com
 (2603:10a6:4:b8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 24 May 2022 10:25:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 10:25:53 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Tue, 24 May 2022 10:25:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4ab1e2e13b91f5d
X-CR-MTA-TID: 64aa7808
Received: from b70db33870cd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02BB9097-B604-43FB-B9F6-3E3785C3169B.1;
	Tue, 24 May 2022 10:25:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b70db33870cd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 May 2022 10:25:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0GjmJrjhbmELOH/DS0SN0P9iAYl/AGcU1yUDp6NOM7OS+f5ims0PrAFJyX0uSv9g0+kj5D2VHBAbz6sfTr7H/AqIAmLU1aVi0lsU1EvMiyDp6c30x1vkxGgtDoPPYBVN2qL1OSPoev6ePR4bxeyK9eRzOjap74C1rBVRKJGtndQ7OoFZHy+Y01CjR6itBNvsiRflmZH29P1kuKf9dRRb+0zA5adsHaWI3RyBtSJcXjHN9TujeayXR0VBtIcSdUTdDGp8P3dgi67c8JRpPnqQpNNss+KrPlvCRq0JZoyIn1mAHu5medBpL53BGaLREgkp84XJlX4gq/vyxkLzk6SiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcH1pfinZ+Vhu2c3OJ79RxrJZzfFcP9Y6+4nifaEzKY=;
 b=LVZ/KcqgCg3xqwTQToxkhJPONwHuOX4/ti+2JeRXWt0uec2vTvMHOaZTf0IBGl6pf1b2M66kpCxEu/0GoflbI9YRuuS3rCeV7cRDuWovpUYOcBRU8m4+ni+5s/B8yliWfBnbhtBfUtka/8yJSrMNcoUfoov8g21OYxRn/C7CPRJObMC5CnJ4WGREKNXjfwSCIhEE92LJqSVXVHY7zyZ2P+uwQ6IG4pf6SD3qSeBAqWRwz2Jp4zm0Vpqtbno1d/kbXx3j5BX2sVnGMdRXkDHaQ6u1bIkzJzFxZGsCxPXSzeA2XJjbqDD1Es1B+2AJsFE80H7Hn4LpVsuHM4ceSWgbAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcH1pfinZ+Vhu2c3OJ79RxrJZzfFcP9Y6+4nifaEzKY=;
 b=kdkOIHBOdNHWx+QxAgMuCMbqafst5sLAOJfnyIz7+wrsajVOMJi9po+o7m9mAIBZaDXciJd0DG+4uuDJijllSDtTkcCIkVp9j6/KMYNpMiYFqs/QI4LO08iqX0l8YmASQPLtg5hrdV+WUXWIVOZDRPSxkVpY064svWGszJVuIDc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5418.eurprd08.prod.outlook.com (2603:10a6:10:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 10:25:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%9]) with mapi id 15.20.5273.022; Tue, 24 May 2022
 10:25:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-traitlets: Upgrade to 5.2.1
Thread-Topic: [oe] [meta-python][PATCH] python3-traitlets: Upgrade to 5.2.1
Thread-Index: AQHYbtILIpqQDJjwKUmofnHQq57rrq0t00Vp
Date: Tue, 24 May 2022 10:25:44 +0000
Message-ID: 
 <PA4PR08MB7411054B66EE67A29DC76157E8D79@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220523182203.8969-1-raj.khem@gmail.com>
In-Reply-To: <20220523182203.8969-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c0ca8a3c-03d0-442d-831d-08da3d6fc7f9
x-ms-traffictypediagnostic: 
	DB8PR08MB5418:EE_|DBAEUR03FT023:EE_|DB7PR08MB3898:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB389850C3C5FD93268BC2D741E8D79@DB7PR08MB3898.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 m2TOYImPqM09BYoonplDwr4nJ+HJkTbQPhEo2PlV3SXyTWjIfFJUXqSwPUmzxVTIJmYI9+jRbPS8Rc5bSeEovswpnc9Nu8L8aykAzYWgs8QrF1qIrXcZ9BqIoy4D3q1/KzRGMrRpK9j0HMosIyekWcsW9qNvrmCHYMZgIuoqmj0BGlfHLeFa1fFAhUMyJ7isgYtlYpwyXxdrtAQJf447v47gbYclRtfP2grf+Z5rTZ0M1r4Bzl9+xvX6xPd50dCTa1M6vFhdXWuxAwqR2gyuaFzC3xrEQxSoE69/WcW3n1QyQBkGOacwBnfnANMt5Xdqq/t/4wH4xzUgwpInGNGn4TLhddOzHLYmCSViGMedg+RanC5/efHFoautQ0b/dJvp30/GhM/oQfoPooJSjXqpsHpSvk79BfW/nitQgre31m6RbnrBl7zzYQ+e+I8iQbIrX1//bpBUO/8T9Y9irMyh5x2qWgNVTJPiapW7p6kBtKhnXDIiKII0YC2HpJ5H6gY6ghDh2qj9uzfIW60USW/7XXfIXBN4PkvYTRaLiLFd7bnlpH5uJduLbfRRGtIOTMF/SrZVOSOslHLdli2vaa4CnLMAgWjqskfRFjpNH1EGRPn1josWU0nAXDsgmfk/Oc+yAOR3MT0nEURveGJ4bMNUczrk8iKCGJMJtnB8O9reuTlJOsSGBL76Mw6dom3PoRCW+cc+pCyJbiNq/LWtOf0OBlh052Fd+IyxMcAndbDTF09uxOiDhfHuAgAcgQ6E8gGqzvo/Ibz1+O/eZhAh4xvzOnFkR9cCRhlvzATJRWNQQvc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(122000001)(71200400001)(38070700005)(76116006)(91956017)(2906002)(166002)(33656002)(64756008)(66556008)(83380400001)(66446008)(66946007)(66476007)(86362001)(8936002)(110136005)(7696005)(508600001)(316002)(5660300002)(6506007)(9686003)(26005)(52536014)(186003)(38100700002)(55016003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411054B66EE67A29DC76157E8D79PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5418
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b82f2ed6-6c96-491e-781a-08da3d6fc289
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8TDbR4dB1lCxZWF8IC8OKD+SfvkRrXdCpUgC5LAMDs3AG1YMv9ej2TdzntJCOLHEZUgXUYbT46e+vVyZgNGygybg0rmdr+vcjanTOyw/XyaOflP4sl4tXleX8VtWh3P1g0SCghhdHByP2VYsNVyGEZz2OuuCbJLJGUIQNP/D4996qDK4J2IEEoSA+rD31AyG31N2Pp6tbo6GJmwTLGap28V7gLL5sfUTz8u40WC9aT0vCsWmfHcOkl79apg1AjDQKkOEe45/QVoGxydo7UqshryJf4JWvKz7rjotJUDEPw51eSLlLPi4BapmZ4y2iFeys8Qww7a+LIbspdZekLTJzKh5Ft8bpgIiEQ4Dm5Yc6ld4zkidrgVKuHJB/SGEF2IGn8Z8hWh3dKSIg5GKBfDevTfqr0RonD95vduroIdHuMkjmXn/1hflxAMlXqau/US4y5Krch1Sq/vICt/OLBKS9UntwjONd/29hG0uEMZrlc22szOd6A9gBDlYORhv7/6tuy0YC4oln2PcB+gPX8LbFaZPkZSDhgxEapxyz35TcKblYYssVPdn2Q9GRqSIVhQq9Xrhsxud9C5SDBJHqJ4VxJBP762/UpXw1vWqECCwenosa74oH4Oe3S5Ziy6kY5PnoBMru4Zr/aAu7tnK0cHbUEDcn3chL7zjW8XiCh8z/LNUXQOde0cN+jCXZdX7mdVbb+HuuA6+3pJaIBJPwyPdoS1VHt6Co+z0aJAaOqZLomeeF4dJrhCrj5HrGHFRslknQEuOUOUXP/iU3QYQrk3t1Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(166002)(55016003)(508600001)(52536014)(8936002)(6506007)(7696005)(26005)(107886003)(47076005)(36860700001)(9686003)(82310400005)(356005)(40460700003)(83380400001)(186003)(8676002)(316002)(2906002)(110136005)(81166007)(70586007)(70206006)(33656002)(336012)(86362001)(5660300002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 10:25:53.2028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c0ca8a3c-03d0-442d-831d-08da3d6fc7f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3898
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 10:26:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97241

--_000_PA4PR08MB7411054B66EE67A29DC76157E8D79PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I have genuinely no idea how this builds: the recipe says to use setuptools=
_build_meta but 5.2.1 deletes all the setuptools files and has ported to a =
new build system called hatchling.

Maybe setuptools_build_meta infers a lot and it sort of works, but this is =
not the correct fix.  I have a branch locally which is almost complete to a=
dd hatchling (and it=92s dependencies) so this can be built properly.

Ross

From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org>
Date: Monday, 23 May 2022 at 19:22
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [oe] [meta-python][PATCH] python3-traitlets: Upgrade to 5.2.1
Fix build with latest setuptools while here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dynamic_description.patch                 | 36 +++++++++++++++++++
 ...ts_5.2.0.bb =3D> python3-traitlets_5.2.1.bb} |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-traitlets/d=
ynamic_description.patch
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.2.0.bb =3D=
> python3-traitlets_5.2.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets/dynamic_=
description.patch b/meta-python/recipes-devtools/python/python3-traitlets/d=
ynamic_description.patch
new file mode 100644
index 0000000000..6d8e4b1f50
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-traitlets/dynamic_descrip=
tion.patch
@@ -0,0 +1,36 @@
+New setuptools turns on autodiscovery of modules which ends up in funny er=
rors like
+
+error: Multiple top-level packages discovered in a flat-layout: ['patches'=
, 'traitlets'].
+
+To avoid accidental inclusion of unwanted files or directories,
+setuptools will not proceed with this build.
+
+
+this is becasue patches/ folder is created by quilt. Secondly, define desc=
ription and version
+statically since new setuptools complain about it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -4,6 +4,8 @@ build-backend =3D "hatchling.build"
+
+ [project]
+ name =3D "traitlets"
++version =3D "5.2.1"
++description =3D "A lightweight Traits like module"
+ authors =3D [{name =3D "IPython Development Team", email =3D "ipython-dev=
@python.org"}]
+ license =3D {file =3D "COPYING.md"}
+ readme =3D "README.md"
+@@ -18,7 +20,9 @@ classifiers =3D [
+ ]
+ urls =3D {Homepage =3D "https://github.com/ipython/traitlets"}
+ requires-python =3D ">=3D3.7"
+-dynamic =3D ["description", "version"]
++
++[tool.setuptools]
++py-modules =3D []
+
+ [project.optional-dependencies]
+ test =3D ["pytest", "pre-commit"]
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb=
 b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
index 56ebaac675..588bddbd74 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3D9c125dfc5ff53=
64d40b5f56f02cd9de3<file:///COPYING.md;md5=3D9c125dfc5ff5364d40b5f56f02cd9d=
e3>"

 PYPI_PACKAGE =3D "traitlets"

-SRC_URI[sha256sum] =3D "60474f39bf1d39a11e0233090b99af3acee93bbc2281777e61=
dd8c87da8a0014"
+SRC_URI +=3D "file://dynamic_description.patch<file:///dynamic_description=
.patch>"
+SRC_URI[sha256sum] =3D "a415578cde1985f1b773faefe49e9f078d345f38665ce3e9e9=
14ec7b41150ce9"

 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-ipython-genutils \
--
2.36.1
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_PA4PR08MB7411054B66EE67A29DC76157E8D79PA4PR08MB7411eurp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
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
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I have genuinely no idea how this builds: the recipe says to use se=
tuptools_build_meta but 5.2.1 deletes all the setuptools files and has port=
ed to a new build system called hatchling.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Maybe setuptools_build_meta infers a lot and it sort of works, but =
this is not the correct fix.&nbsp; I have a branch locally which is almost =
complete to add hatchling (and it=92s dependencies)
 so this can be built properly.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">openembedded-devel@=
lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on=
 behalf of Khem Raj via lists.openembedded.org &lt;raj.khem=3Dgmail.com@lis=
ts.openembedded.org&gt;<br>
<b>Date: </b>Monday, 23 May 2022 at 19:22<br>
<b>To: </b>openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc: </b>Khem Raj &lt;raj.khem@gmail.com&gt;<br>
<b>Subject: </b>[oe] [meta-python][PATCH] python3-traitlets: Upgrade to 5.2=
.1<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">Fix build with latest setuptools while here.<br>
<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
---<br>
&nbsp;.../dynamic_description.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 36 +++++++++++++=
++++++<br>
&nbsp;...ts_5.2.0.bb =3D&gt; python3-traitlets_5.2.1.bb} |&nbsp; 3 +-<br>
&nbsp;2 files changed, 38 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta-python/recipes-devtools/python/python3-traitl=
ets/dynamic_description.patch<br>
&nbsp;rename meta-python/recipes-devtools/python/{python3-traitlets_5.2.0.b=
b =3D&gt; python3-traitlets_5.2.1.bb} (74%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-traitlets/dynamic_=
description.patch b/meta-python/recipes-devtools/python/python3-traitlets/d=
ynamic_description.patch<br>
new file mode 100644<br>
index 0000000000..6d8e4b1f50<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-traitlets/dynamic_descrip=
tion.patch<br>
@@ -0,0 +1,36 @@<br>
+New setuptools turns on autodiscovery of modules which ends up in funny er=
rors like<br>
+<br>
+error: Multiple top-level packages discovered in a flat-layout: ['patches'=
, 'traitlets'].<br>
+<br>
+To avoid accidental inclusion of unwanted files or directories,<br>
+setuptools will not proceed with this build.<br>
+<br>
+<br>
+this is becasue patches/ folder is created by quilt. Secondly, define desc=
ription and version<br>
+statically since new setuptools complain about it.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
+--- a/pyproject.toml<br>
++++ b/pyproject.toml<br>
+@@ -4,6 +4,8 @@ build-backend =3D &quot;hatchling.build&quot;<br>
+ <br>
+ [project]<br>
+ name =3D &quot;traitlets&quot;<br>
++version =3D &quot;5.2.1&quot;<br>
++description =3D &quot;A lightweight Traits like module&quot;<br>
+ authors =3D [{name =3D &quot;IPython Development Team&quot;, email =3D &q=
uot;ipython-dev@python.org&quot;}]<br>
+ license =3D {file =3D &quot;COPYING.md&quot;}<br>
+ readme =3D &quot;README.md&quot;<br>
+@@ -18,7 +20,9 @@ classifiers =3D [<br>
+ ]<br>
+ urls =3D {Homepage =3D &quot;<a href=3D"https://github.com/ipython/traitl=
ets">https://github.com/ipython/traitlets</a>&quot;}<br>
+ requires-python =3D &quot;&gt;=3D3.7&quot;<br>
+-dynamic =3D [&quot;description&quot;, &quot;version&quot;]<br>
++<br>
++[tool.setuptools]<br>
++py-modules =3D []<br>
+ <br>
+ [project.optional-dependencies]<br>
+ test =3D [&quot;pytest&quot;, &quot;pre-commit&quot;]<br>
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb=
 b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb<br>
similarity index 74%<br>
rename from meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb<=
br>
rename to meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb<br=
>
index 56ebaac675..588bddbd74 100644<br>
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb<br>
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D"file:///COPYING.md;md=
5=3D9c125dfc5ff5364d40b5f56f02cd9de3">file://COPYING.md;md5=3D9c125dfc5ff53=
64d40b5f56f02cd9de3</a>&quot;<br>
&nbsp;<br>
&nbsp;PYPI_PACKAGE =3D &quot;traitlets&quot;<br>
&nbsp;<br>
-SRC_URI[sha256sum] =3D &quot;60474f39bf1d39a11e0233090b99af3acee93bbc22817=
77e61dd8c87da8a0014&quot;<br>
+SRC_URI +=3D &quot;<a href=3D"file:///dynamic_description.patch">file://dy=
namic_description.patch</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a415578cde1985f1b773faefe49e9f078d345f38665ce=
3e9e914ec7b41150ce9&quot;<br>
&nbsp;<br>
&nbsp;RDEPENDS:${PN} =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-ipython-genutils \<br>
-- <br>
2.36.1<o:p></o:p></span></p>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_PA4PR08MB7411054B66EE67A29DC76157E8D79PA4PR08MB7411eurp_--

