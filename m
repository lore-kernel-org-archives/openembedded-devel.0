Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F4EC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 11:06:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web10.87554.1677495953687289027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 03:05:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YOztf1ir;
 spf=pass (domain: arm.com, ip: 40.107.22.55, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oXRdYvYMvYl1qzpx2TRQVDgWRoCcyvaR+8AgMgNP3k=;
 b=YOztf1irivEO4++ERcjHEvo1m3rw59OUBWGi3+4ApsuJ9TlVFWCfG1+vPIhfpKl16ZCX8j6EM2H+/XV+rrofvUbXqWxIrnYWvJ+cXKCFiLeJBXk+BbWXII/zvFPapvUfFT6aqq6uQBbb2itATdO2kXQ/e1T1TW2X+X+4XvQGaQA=
Received: from DUZPR01CA0133.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::28) by DB4PR08MB9142.eurprd08.prod.outlook.com
 (2603:10a6:10:3fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 11:05:50 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::d3) by DUZPR01CA0133.outlook.office365.com
 (2603:10a6:10:4bc::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 11:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.16 via Frontend Transport; Mon, 27 Feb 2023 11:05:50 +0000
Received: ("Tessian outbound baf1b7a96f25:v132"); Mon, 27 Feb 2023 11:05:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b685f42d023824f6
X-CR-MTA-TID: 64aa7808
Received: from df8c2784c255.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2C893CAD-B52B-4145-82AE-2B7076AA3A91.1;
	Mon, 27 Feb 2023 11:05:42 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df8c2784c255.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 27 Feb 2023 11:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mq7tv9KJLFafDj3IZ5dIA3nQORJZtR5A+bvQ+9gfLdbmC8d6fOvcNENGRSgJAI4uWjcVve7MMqcA4zPjUVnhnBMgbQ7RpOSkv/JuI2QG5K9TaKYL3KOYRQXh3xyP3J1ZITWtkYl5anRcWw85UBSiZ5n0VFVV3Hd3GdnEhayzN9f2ZaZQipz/Su4BQMhJ2Sn3dW/5rEs3pm4wWlwe2+vowFE2qNC3EV3wOFn0o62iza34kzQ+36bAJGtAZQha3Eh0wGxNK32g16VUomoPC/WPQconRX/iTGgKni6qB9oL4Lh6WZGicBO90XYyRzl0OHI3jPxT3z6mqAOT4qf0ALsVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oXRdYvYMvYl1qzpx2TRQVDgWRoCcyvaR+8AgMgNP3k=;
 b=Q5TA0O54bVQ/hnY+SX+V+J/fXlWLVMxMPmUe2EgIf4E8XDTVu5/qMdWn0U2Xr0YX+zxpzbpaQgAoxDoLdjS7BGlhH0MrT93ub9zM7yD9upCl9S4pgJq2Os/M17+6SobWQ1p4R4cVDaEj6qPLmeH43cYX9gamCZJKC8BgjQo6MN1vG7XW9xpwU5UqwrCFFNWeHIGbIuumYo40Oi7IcT6KMDNFzXQ4qjcw3NijE2gmH1Sw17kEtCXJQxMv3FMWppX23kHMF+7ARpcQn4tNuXfpCoeCBDmg8FSDF3XlKDCrIe44sHRguUnCM6+i8xc7WXMDzz/7C+P9pm9ymaEA78Hvpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oXRdYvYMvYl1qzpx2TRQVDgWRoCcyvaR+8AgMgNP3k=;
 b=YOztf1irivEO4++ERcjHEvo1m3rw59OUBWGi3+4ApsuJ9TlVFWCfG1+vPIhfpKl16ZCX8j6EM2H+/XV+rrofvUbXqWxIrnYWvJ+cXKCFiLeJBXk+BbWXII/zvFPapvUfFT6aqq6uQBbb2itATdO2kXQ/e1T1TW2X+X+4XvQGaQA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7583.eurprd08.prod.outlook.com (2603:10a6:10:307::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 11:05:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 11:05:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 0/2] Resolve conflict between /usr/bin/hello from
 lmbench and mbedtls
Thread-Topic: [oe] [PATCH 0/2] Resolve conflict between /usr/bin/hello from
 lmbench and mbedtls
Thread-Index: AQHZSW9h1bzLzN0sb0qXdwP2PeFYUq7io+sA
Date: Mon, 27 Feb 2023 11:05:36 +0000
Message-ID: <70AE5022-1A56-44E4-82CC-3B9E38669233@arm.com>
References: <20230225231717.3887902-1-denis@denix.org>
In-Reply-To: <20230225231717.3887902-1-denis@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7583:EE_|DBAEUR03FT021:EE_|DB4PR08MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 12494de8-75b5-4a89-46b2-08db18b295e7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 T9CsEoRJxaAtdYa9Nj5PddfY8A44WL7o86ETL4vAWVCGz8zgqZjpRbJV4NysczBXLFG4l5Hu8XVhkjaCt9pMdDc/ayO9lzJQzkp7doTye5Tp2zZ6SiibHXVRILOtId4LVQL3gvjj1cEZLxrVK8+Ki/0c7T1YM1LzRWwgj8Et5/rF34XrjSdNTCiaqtoi/rirFgVD9fPyI1aCeuzhlUsUeEIyJGV12b6kZH0szi3eNA2ONUZZW2Jk9xt/cV4+Rp3ycOY8MnNWNo3ETsXpCMmwOSewUQzhEkeMgXuzJpjpSgSuGeSLb0wXp9tLFbXJG/LvuMbWeeHMdUnABATOfk9ivYsDkx/Fx0vj8YhsTPEf4cTXIp1z9+gwxdEHNHKj0TwnKVaXBihHYQT1SEGeanCTF5+A14RtyGzuYkAiFfxIPsQOfO6IVoPXZnURxo8cHxFfUOheIY9WnYBLIYj0sUS1rtnP7XRoSy9Mf9k2jZ4JtWNkVXkBcTT26/kqS8Dyt7g/lvpdoGW3V4q5pFRh0Dc8vuvqA5YUvcPtrFHdO0L8GNlPTVndnxd6kSJcgAcIFi6eZZujRSkM9z1404kD5lr+Xcx/ePGmeG2oXhE4X2hywZ85wE39O9IHKioexOVmsreQRqhFw7iB+CR5GulFXa84uwK6GCMU4UeCv3J0wOmIrJWbL6+m2yoJ3lkoN2/npEiyfYr8MV6dzpZWUqFkgcOViVx8oNwdeze9AqwufKXx+kM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199018)(4326008)(91956017)(76116006)(6916009)(66946007)(64756008)(66476007)(66556008)(66446008)(83380400001)(41300700001)(316002)(38070700005)(36756003)(6512007)(8676002)(122000001)(8936002)(38100700002)(5660300002)(33656002)(71200400001)(86362001)(478600001)(53546011)(186003)(26005)(4744005)(2906002)(2616005)(6486002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51DA3639B1658047A309B1A6DE35FC54@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7583
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c3657b5d-eef7-4807-04d2-08db18b28e08
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DOw+Sk8vr6sqlOTwyHUXdgl78LJ49oDVJDMFtGv6fBmGF3LciLAVpeWSn2BibAh2vX4LkwgVTHwqg++TQZ//MWfBbnNiwBq+VuDhOkFDhmyXsVe0a9FCoO26P9xFAAyEFKbziy7jp8H7TXE7+RBDrtLKLzwooSbKsBdHXVpav9FAJjYIVS683U8339nD98obgE0kqW7A/eCLOEKk1p8RzMHBMnH+HGTANwDP06ppS8b8R/ezyGMPEoYXV1z5SZAx8tLUommJX8SqJs/eGsRGkX8UB9MwF+qOW+5TQOx6iEn2Cujd8s3ppeuwV2YxZKmDm1Ino3PdDQIhPzfktFBo8qyJdUCZuNITLqh3nrYAgdNCQhwQWjMiPSUlVD15KuPMQHOqHIoWaWr51GlSNdfWC9asgcJHQM0D9Hd3Uzj35eIazbMfBnLDDFZk9ohWC+nT4yFG8aOlSaJQ8zNrehHywh010gQW0R7TSIWaQKvbA9ivu9GMZ6xL1RfK0pSgD3hwp+GDYA9BI8A7/CHI4A/ouyXbSOsnic444Gz/1+boQ5YzKWxUKL8GIaZKWeqlASUZNFQ37PXgxk2WAm/hY3OeLtqFu59mp/k8FYLENg9xP0JP/aMJONTE8VawPwqewASw2aX48kw3/czy1TwlGxIgGHAR2KauD26u49kJ1sJgUJo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(136003)(39850400004)(451199018)(36840700001)(46966006)(33656002)(5660300002)(4744005)(36756003)(8936002)(86362001)(40480700001)(6862004)(47076005)(478600001)(83380400001)(82310400005)(336012)(2616005)(6486002)(26005)(186003)(53546011)(6512007)(6506007)(70206006)(70586007)(41300700001)(356005)(4326008)(8676002)(82740400003)(81166007)(316002)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 11:05:50.1264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12494de8-75b5-4a89-46b2-08db18b295e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9142
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 11:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101296

On 25 Feb 2023, at 23:17, Denys Dmytriyenko via lists.openembedded.org <den=
is=3Ddenix.org@lists.openembedded.org> wrote:
>=20
> Both lmbench and mbedtls packages provide generically-named /usr/bin/hell=
o
> binary, which causes a conflict when trying to install them both into a
> rootfs or SDK. Set up alternative providers to resolve the conflict.

Are either of these binaries actually useful?  The, well, alternative is to=
 just delete them stupidly named binaries (or rename).

Ross=

