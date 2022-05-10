Return-Path: <richard.neill@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDACC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 10:44:13 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.78])
 by mx.groups.io with SMTP id smtpd.web08.8101.1652179443935583269
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 03:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=x0c+Jzxv;
 spf=pass (domain: arm.com, ip: 40.107.5.78, mailfrom: richard.neill@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cWfoRRqp4K/ylugXCYFcOJwmj07AtVUsxMvvMJOJUdc0AjTWT29nkqFJD/X2BPcH/E+FgXGm6LTLyUohDdauf/+CUJWKbnaQaMZ0O+QmwuSX+5qUmV1cY7ySnpxUfla1Cs3caSIQBuTgNxvNI/CiY1OylmxyQ9dz6r7YO6Iq2+vdvZNk9Z7GDPmVTEHAjMHVK4h3bThHyi5nxUtLqkwiA9sxQeqaaWkCcM6zmd6PbU1ewFjVTqsYcRjTG5fheM7sVINhfCiuajdgZ/fDCyoq+KMptbvWuMHSqh/34esaqF6EZW3RT5yXuwx/CjlSOa71g474J44Sa3TSPPgUJ5blOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbOS0GJW3lJzAgLj/mrMA6oNxihtNB0MI8jOFD35D+E=;
 b=S6aSfiX4FtvjdM096xK9JcUazDTOJavzypIkDZxcu9bEKNiN6SJvH+GarZSsycFC7h7q49T5alnGsUXTuWvMBPjwkxY1j/t6BlR9ss69jH2S7sN2byXxey4vGj0ongevUIH+52cs8hYPaKiSdUwpIxr3mYXt2HcN/66xYjCHsZsrhZ9pfIW5cFXS4X2mV5ypR0A8Bm+utbES4ocabD4UCFjwyldVakzemm7sbZ9eICWaTcy/DYFozMyHjP3Zy1r+gloNYXdTmqMMylDfvAGULj+QjXtFZRejG596pxXBrb7wb3UjipzMVgqgxBHlyQnQgfSpK4Q7MoZtdFYztq8rgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbOS0GJW3lJzAgLj/mrMA6oNxihtNB0MI8jOFD35D+E=;
 b=x0c+Jzxvi9HSCT5oLBYb1GQcLs3qSL5GNS6pmD4bC++oaKm1HAL0xyQPx7kN+XzsIstsl9bXzQxT3iFasLSs4jvDEj/ymHncSGHwC/fHkWFNTKqzotLE09xvsAkgAxK/EhXZp1bDZNk+09xskCx8yXV+PrPpQhnuS/1G95kXv1c=
Received: from AS9PR0301CA0032.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::30) by AM9PR08MB6113.eurprd08.prod.outlook.com
 (2603:10a6:20b:2d6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 10:44:00 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::62) by AS9PR0301CA0032.outlook.office365.com
 (2603:10a6:20b:469::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Tue, 10 May 2022 10:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 10:43:59 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Tue, 10 May 2022 10:43:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: faf8b78d5518ed2e
X-CR-MTA-TID: 64aa7808
Received: from 0edd07873b1f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 862D73D4-70C5-4BAD-8EE3-969E7DDE0C06.1;
	Tue, 10 May 2022 10:43:52 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 0edd07873b1f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 May 2022 10:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBS9iy8KLUOJmK4DG+4WYi4/rflZ3WKRNFmk5V4oA9k+5zPoDMUd+RNab/LcNVYwZ0Km5pajOVEIFYCRl1HSlv8NZhP1Ggsv2vq4/t2yKgWJhPfwEzKJ1h7w1l7ke4dUl67bsrfOVx8y6/JEKvSVZCvl95JTbonGv7T5BD/EkzfS+ibvGId87+3Vk1OUxAnhHwvn7WuSxi3wDk4NzsCdmaVgfholFbQke5dcSLi2OWu2X6EcEEFvXUsQ5FHu9NtBRYJ+xqPepIASyRWHkMLd0yH1xdgJA9SFYPZBDdFf47RnR5gbfMSkxHGP6q0WbkUoj/PY90j3qCQe4w65EGyFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbOS0GJW3lJzAgLj/mrMA6oNxihtNB0MI8jOFD35D+E=;
 b=gTXsQB0O8oBNGbnB8AMJvwU4QWvj7ouUhxwyGvgeA6gVGnxJZxfKbpsO9cyMI7ZEBcxVKcBKmgsP1bLAvCbAeEbIiOl2OXI+2Li3cWzMSpWXhM+n7ghQ2Bgh13E7dli/hcJUfbThFVxti4Txxt+4UXhEDWyBiTcBhzA+S6FKwMfi8TXh++dSUMDk3s3EK4FpGa0K15yiFXwfT4wlEJgKF/M9TeazPieSb7sZSofHeNqBj7QluswGMNqcDVDO3LFc0y3RshEJ5Z03qDSXiV0/iF+BDte5zCVVip7W1jFCJNSha3QB2g55jzoyFYrQwRd94f4FV2XH7iaDETXWhcByNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbOS0GJW3lJzAgLj/mrMA6oNxihtNB0MI8jOFD35D+E=;
 b=x0c+Jzxvi9HSCT5oLBYb1GQcLs3qSL5GNS6pmD4bC++oaKm1HAL0xyQPx7kN+XzsIstsl9bXzQxT3iFasLSs4jvDEj/ymHncSGHwC/fHkWFNTKqzotLE09xvsAkgAxK/EhXZp1bDZNk+09xskCx8yXV+PrPpQhnuS/1G95kXv1c=
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 by PA4PR08MB6205.eurprd08.prod.outlook.com (2603:10a6:102:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 10:43:50 +0000
Received: from AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::a875:6426:da0a:78b4]) by AM6PR08MB3893.eurprd08.prod.outlook.com
 ([fe80::a875:6426:da0a:78b4%7]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 10:43:50 +0000
From: Richard Neill <Richard.Neill@arm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: nd <nd@arm.com>
Subject: Re: [oe] [meta-oe][PATCH] bats: Add patch to fix false-negatives
 caused by teardown code
Thread-Topic: [oe] [meta-oe][PATCH] bats: Add patch to fix false-negatives
 caused by teardown code
Thread-Index: AQHYY8J15Usv5vPAr0KnMzkF4oNbhK0X7cF5
Date: Tue, 10 May 2022 10:43:50 +0000
Message-ID: 
 <AM6PR08MB3893049F441F8BB37FF472A5E0C99@AM6PR08MB3893.eurprd08.prod.outlook.com>
References: <16ED7CE56CA0F902.6656@lists.openembedded.org>
In-Reply-To: <16ED7CE56CA0F902.6656@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 9dab6410-d65c-7361-075c-7127f53112a8
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 388e62fb-4a5d-41cc-8142-08da3271fdc3
x-ms-traffictypediagnostic: 
	PA4PR08MB6205:EE_|VE1EUR03FT015:EE_|AM9PR08MB6113:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB6113905ACCED22C7129256C0E0C99@AM9PR08MB6113.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zk8G5AAlhIQsTR5ni7+ggtqQ9iDva5GGZAtxVjO/pvLiemes8Tjukm3LvP051so1Wak1SCbCvl4+aFgDcN+XdvN5/Qz33ITt5h8OKWb2rhCMd7tefaLcOljCiFldjHt7nC96Dl6MHA0YVCGHCZdBwMgIgSSKZNgoSxwhTG5oKgRaqGpQrMQDvh7cQo1FRma0cfqM/ILi2zFm0oCGh6Wom4EaJz42JycOYnITn8ZUR1MxvDn4IJSqZ2UsBB3YpO40bVtJdITOLYHqv5DA/YitqgPwlmciimWbrz5L+G5UcSNJ6SMp68vqmf0qvbW3uB6cyvMl503lAaLIvZvQCuDeR1V5Q7Gy5HXZ1nWy+FW+FecMYv4zxYbhnnla9L9mY8S8LjZPxzsTXBpcvjKXZb4g4zEd17DvCsXVCw9gEc9FDbbhWen9N0k4Yairgx4L6OQYrxQqfPxRrVAB9+RX1gfCWb3PiahaoESHdbZKpijQKzVYNBqliGtW5IWq6HbAYLDdl0EQUqSJAly35SOYjRQAa61fWiP3I60d6JCLxjkiVL0/zyoeo7vdMhZpihWWLfcIfvdI+dPZC506+d75C9a0wI/CbWK7Bd6yaf62qCx0rDuHZuaPA6MLa+5TZWmkQBV4cqJ+WdgktoFxx1SOSU4W+Xae3f1r25mTMr6Do2EFnn7hODhb1bHA651W2YwnmoIBThSBhEpHIsejvZIy0p2oITNsM41sbOYDRns7u9e/WmyqulB9t4AHzFiuYKruOJZHuVOj4XgYNdbI1pas3Si77yV+zVHtcJYVSeY+7boEc6vx1sCyenXN10xsAW6IPZ4ukfV08YnXh6qfEcOLtmTeZw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3893.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(19627405001)(316002)(6506007)(6916009)(122000001)(55016003)(166002)(186003)(83380400001)(66446008)(4326008)(8936002)(64756008)(8676002)(66946007)(71200400001)(26005)(66476007)(66556008)(9686003)(86362001)(38070700005)(91956017)(76116006)(38100700002)(7696005)(508600001)(2906002)(966005)(33656002)(52536014)(5660300002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3893049F441F8BB37FF472A5E0C99AM6PR08MB3893eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6205
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4bc4f691-ffac-434c-a058-08da3271f841
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+63QA4ST12h/P4YR8c1DRo6a+G5R+GFfy/GJXEvDUwqNsxolQY42gNfj8y9Ru+LSJmWcVXv+HrCPApXnpW4kRp1VaIR6MPmc6B25/ALJrJAB9G0pCQEQFceDONi8AgcEGMBr4ry/C+f3g8pJo7u5wr2m5cZY6k+asINGg2Pu3WBXYtHyRF1DbRk+tqC6JtovOji+fK7Tb0jxdspOOTtfFH8EfHJn+P4hEya+BOX30vYIciH+RnjlUmjsTDakVUc32evnXISXYSLuJGNz4R7qXuT6gT+uihdwGPf6rdnQXWfGUyC0TjeVZSTjEO1EgtBZeXNA9Sc7CUkLdXOGJNpY3h2Pd8EG0fRrg8Yi0qRDy4blHD4mYCNzIi55lqYpJJqi2m3/nmvt277MgHWs9qffQ721vCXfFm8lGpGZV+tjhNJ7yyqzSWBWxRogvA38ehKgVaB8Ecd1fMfL48WLRQJkQ5b+AodvO1kSSTt2TxKwlazmf6tcgZBTY77u3kKkRKvFbLZnqHgynp3QMkC0l5YKaWPK/6Y8hzG/YowjfIwkJZMIu8Wf33cGg5ixO4evUTtni31SIHVSgc9qhL7+935bLQBzeWwom+B55I6aJOhuCrk+h98ZoqNPGJT/PAYJpn+/V7JKE843PGUmofhf6P9rhKVTlS5FI5KkT8PXgJjOBWJ+K5gvZqub8oe8WVOWHR7fILt+PVIRdCRWSvD7yMbsWlRuRHCdxIoD0FaiFOGM7eTyhtnFCkmXSLpeILQpPPQGdZbag8kQjNLApZYLb4daaW1Su6oY5X2HHYtxKtk6yeI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(26005)(186003)(86362001)(47076005)(5660300002)(9686003)(82310400005)(30864003)(8936002)(52536014)(2906002)(70206006)(40460700003)(4326008)(166002)(83380400001)(8676002)(336012)(356005)(70586007)(81166007)(966005)(6506007)(19627405001)(6916009)(7696005)(508600001)(316002)(33656002)(55016003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 10:43:59.4925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 388e62fb-4a5d-41cc-8142-08da3271fdc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6113
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 May 2022 10:44:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97025

--_000_AM6PR08MB3893049F441F8BB37FF472A5E0C99AM6PR08MB3893eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

As the bug is occurring on kirkstone, could this patch also be backported t=
o kirkstone please?

Thanks,
Richard
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Richard Neill via lists.openembedded.org <ric=
hard.neill=3Darm.com@lists.openembedded.org>
Sent: Monday, May 9, 2022 5:32 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: nd <nd@arm.com>
Subject: [oe] [meta-oe][PATCH] bats: Add patch to fix false-negatives cause=
d by teardown code

BATS v1.6.0 has a regression which can result in test case failures being
ignored when teardown code executes successfully. This patch applies the
accepted bug-fix until the next BATS release.

Also, fix a comment that wasn't updated during the BATS upgrade, to match t=
he
correct release (v1.6.0) associated with the SRCREV.

Signed-off-by: Richard Neill <richard.neill@arm.com>
---
 meta-oe/recipes-test/bats/bats_1.6.0.bb       |   8 +-
 ...tus-in-teardown-overriding-exit-code.patch | 150 ++++++++++++++++++
 2 files changed, 156 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-test/bats/files/0001-Fix-status-in-tear=
down-overriding-exit-code.patch

diff --git a/meta-oe/recipes-test/bats/bats_1.6.0.bb b/meta-oe/recipes-test=
/bats/bats_1.6.0.bb
index 7ea1aa8f3..df81595c9 100644
--- a/meta-oe/recipes-test/bats/bats_1.6.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.6.0.bb
@@ -6,8 +6,12 @@ HOMEPAGE =3D "https://github.com/bats-core/bats-core"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D2970203aedf9e829edb96a137a4f=
e81b"

-SRC_URI =3D "git://github.com/bats-core/bats-core.git;branch=3Dmaster;prot=
ocol=3Dhttps"
-# v1.4.1
+SRC_URI =3D "\
+  git://github.com/bats-core/bats-core.git;branch=3Dmaster;protocol=3Dhttp=
s \
+  file://0001-Fix-status-in-teardown-overriding-exit-code.patch \
+  "
+
+# v1.6.0
 SRCREV =3D "210acf3a8ed318ddedad3137c15451739beba7d4"

 S =3D "${WORKDIR}/git"
diff --git a/meta-oe/recipes-test/bats/files/0001-Fix-status-in-teardown-ov=
erriding-exit-code.patch b/meta-oe/recipes-test/bats/files/0001-Fix-status-=
in-teardown-overriding-exit-code.patch
new file mode 100644
index 000000000..f4b1db931
--- /dev/null
+++ b/meta-oe/recipes-test/bats/files/0001-Fix-status-in-teardown-overridin=
g-exit-code.patch
@@ -0,0 +1,150 @@
+From aa628ccdc4dec1c129c1bd98b53ef94d8c2e119a Mon Sep 17 00:00:00 2001
+From: Richard Neill <richard.neill@arm.com>
+Date: Mon, 9 May 2022 12:20:48 +0100
+Subject: [PATCH] Fix status in teardown* overriding exit code
+
+Patch fixes regression which produces false-negatives in v1.6.0, where the
+teardown function can cause BATS to report success even if test cases fail=
.
+Fixes: https://github.com/bats-core/bats-core/issues/575
+
+Upstream-Status: Backport [Adapted from https://github.com/bats-core/bats-=
core/commit/5f372058b05f817e4e3a8dab27f83c30fd467504]
+Signed-off-by: Richard Neill <richard.neill@arm.com>
+---
+ libexec/bats-core/bats-exec-file  | 18 ++++++++----------
+ libexec/bats-core/bats-exec-suite | 12 ++++++------
+ libexec/bats-core/bats-exec-test  |  8 ++++----
+ 3 files changed, 18 insertions(+), 20 deletions(-)
+
+diff --git a/libexec/bats-core/bats-exec-file b/libexec/bats-core/bats-exe=
c-file
+index 298441b..63452c7 100755
+--- a/libexec/bats-core/bats-exec-file
++++ b/libexec/bats-core/bats-exec-file
+@@ -118,7 +118,6 @@ bats_run_teardown_file() {
+
+ bats_file_teardown_trap() {
+   bats_run_teardown_file
+-  local status=3D0
+   bats_file_exit_trap
+ }
+
+@@ -144,9 +143,9 @@ bats_file_exit_trap() {
+     bats_print_failed_command "${stack_trace[@]}" >&3
+     bats_prefix_lines_for_tap_output < "$BATS_OUT" | bats_replace_filenam=
e >&3
+     rm -rf "$BATS_OUT"
+-    status=3D1
++    bats_exec_file_status=3D1
+   fi
+-  exit $status
++  exit $bats_exec_file_status
+ }
+
+ function setup_file() {
+@@ -250,15 +249,15 @@ bats_read_tests_list_file() {
+ }
+
+ bats_run_tests() {
+-  status=3D0
++  bats_exec_file_status=3D0
+
+   if [[ "$num_jobs" !=3D 1 && "${BATS_NO_PARALLELIZE_WITHIN_FILE-False}" =
=3D=3D False ]]; then
+     export BATS_SEMAPHORE_NUMBER_OF_SLOTS=3D"$num_jobs"
+-    bats_run_tests_in_parallel "$BATS_RUN_TMPDIR/parallel_output" || stat=
us=3D1
++    bats_run_tests_in_parallel "$BATS_RUN_TMPDIR/parallel_output" || bats=
_exec_file_status=3D1
+   else
+     for test_name in "${tests_to_run[@]}"; do
+       if [[ "${BATS_INTERRUPTED-NOTSET}" !=3D NOTSET ]]; then
+-        status=3D130 # bash's code for SIGINT exits
++        bats_exec_file_status=3D130 # bash's code for SIGINT exits
+         break
+       fi
+       # Only handle non-empty lines
+@@ -267,14 +266,13 @@ bats_run_tests() {
+         ((++test_number_in_file))
+         # deal with empty flags to avoid spurious "unbound variable" erro=
rs on Bash 4.3 and lower
+         if [[ "${#flags[@]}" -gt 0 ]]; then
+-          "$BATS_LIBEXEC/bats-exec-test" "${flags[@]}" "$filename" "$test=
_name" "$test_number_in_suite" "$test_number_in_file" || status=3D1
++          "$BATS_LIBEXEC/bats-exec-test" "${flags[@]}" "$filename" "$test=
_name" "$test_number_in_suite" "$test_number_in_file" || bats_exec_file_sta=
tus=3D1
+         else
+-          "$BATS_LIBEXEC/bats-exec-test" "$filename" "$test_name" "$test_=
number_in_suite" "$test_number_in_file" || status=3D1
++          "$BATS_LIBEXEC/bats-exec-test" "$filename" "$test_name" "$test_=
number_in_suite" "$test_number_in_file" || bats_exec_file_status=3D1
+         fi
+       fi
+     done
+   fi
+-  export status
+ }
+
+ bats_create_file_tempdirs() {
+@@ -322,4 +320,4 @@ bats_run_tests
+ trap bats_interrupt_trap INT
+ bats_run_teardown_file
+
+-exit $status
++exit $bats_exec_file_status
+diff --git a/libexec/bats-core/bats-exec-suite b/libexec/bats-core/bats-ex=
ec-suite
+index 05c66f4..4d440ae 100755
+--- a/libexec/bats-core/bats-exec-suite
++++ b/libexec/bats-core/bats-exec-suite
+@@ -135,10 +135,10 @@ bats_exit_trap() {
+   if [[ ${BATS_INTERRUPTED-NOTSET} !=3D NOTSET ]]; then
+     printf "\n# Received SIGINT, aborting ...\n\n"
+   fi
+-  exit "$status"
++  exit "$bats_exec_suite_status"
+ }
+
+-status=3D0
++bats_exec_suite_status=3D0
+ printf '1..%d\n' "${test_count}"
+
+ # No point on continuing if there's no tests.
+@@ -163,15 +163,15 @@ if [[ "$num_jobs" -gt 1 ]] && [[ -z "$bats_no_parall=
elize_across_files" ]]; then
+   # shellcheck disable=3DSC2086,SC2068
+   # we need to handle the quoting of ${flags[@]} ourselves,
+   # because parallel can only quote it as one
+-  parallel --keep-order --jobs "$num_jobs" bats-exec-file "$(printf "%q "=
 "${flags[@]}")" "{}" "$TESTS_LIST_FILE"  ::: "${BATS_UNIQUE_TEST_FILENAMES=
[@]}" 2>&1 || status=3D1
++  parallel --keep-order --jobs "$num_jobs" bats-exec-file "$(printf "%q "=
 "${flags[@]}")" "{}" "$TESTS_LIST_FILE"  ::: "${BATS_UNIQUE_TEST_FILENAMES=
[@]}" 2>&1 || bats_exec_suite_status=3D1
+ else
+   for filename in "${BATS_UNIQUE_TEST_FILENAMES[@]}"; do
+     if [[ "${BATS_INTERRUPTED-NOTSET}" !=3D NOTSET ]]; then
+-      status=3D130 # bash's code for SIGINT exits
++      bats_exec_suite_status=3D130 # bash's code for SIGINT exits
+       break
+     fi
+-    bats-exec-file "${flags[@]}" "$filename" "${TESTS_LIST_FILE}" || stat=
us=3D1
++    bats-exec-file "${flags[@]}" "$filename" "${TESTS_LIST_FILE}" || bats=
_exec_suite_status=3D1
+   done
+ fi
+
+-exit "$status"
++exit "$bats_exec_suite_status"
+diff --git a/libexec/bats-core/bats-exec-test b/libexec/bats-core/bats-exe=
c-test
+index aae4572..57bdf18 100755
+--- a/libexec/bats-core/bats-exec-test
++++ b/libexec/bats-core/bats-exec-test
+@@ -94,18 +94,18 @@ source "$BATS_ROOT/lib/bats-core/tracing.bash"
+
+ bats_teardown_trap() {
+   bats_check_status_from_trap
+-  local status=3D0
++  local bats_teardown_trap_status=3D0
+   # mark the start of this function to distinguish where skip is called
+   # parameter 1 will signify the reason why this function was called
+   # this is used to identify when this is called as exit trap function
+   BATS_TEARDOWN_STARTED=3D${1:-1}
+-  teardown >>"$BATS_OUT" 2>&1 || status=3D"$?"
++  teardown >>"$BATS_OUT" 2>&1 || bats_teardown_trap_status=3D"$?"
+
+-  if [[ $status -eq 0 ]]; then
++  if [[ $bats_teardown_trap_status -eq 0 ]]; then
+     BATS_TEARDOWN_COMPLETED=3D1
+   elif [[ -n "$BATS_TEST_COMPLETED" ]]; then
+     BATS_DEBUG_LAST_STACK_TRACE_IS_VALID=3D1
+-    BATS_ERROR_STATUS=3D"$status"
++    BATS_ERROR_STATUS=3D"$bats_teardown_trap_status"
+   fi
+
+   bats_exit_trap
+--
+2.25.1
+
--
2.25.1


--_000_AM6PR08MB3893049F441F8BB37FF472A5E0C99AM6PR08MB3893eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
As the bug is occurring on kirkstone, could this patch also be backported t=
o kirkstone please?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Richard<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Richard Neill via lists.openembedded.org
 &lt;richard.neill=3Darm.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, May 9, 2022 5:32 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> [oe] [meta-oe][PATCH] bats: Add patch to fix false-negative=
s caused by teardown code</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">BATS v1.6.0 has a regression which can result in t=
est case failures being<br>
ignored when teardown code executes successfully. This patch applies the<br=
>
accepted bug-fix until the next BATS release.<br>
<br>
Also, fix a comment that wasn't updated during the BATS upgrade, to match t=
he<br>
correct release (v1.6.0) associated with the SRCREV.<br>
<br>
Signed-off-by: Richard Neill &lt;richard.neill@arm.com&gt;<br>
---<br>
&nbsp;meta-oe/recipes-test/bats/bats_1.6.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 8 +-<br>
&nbsp;...tus-in-teardown-overriding-exit-code.patch | 150 +++++++++++++++++=
+<br>
&nbsp;2 files changed, 156 insertions(+), 2 deletions(-)<br>
&nbsp;create mode 100644 meta-oe/recipes-test/bats/files/0001-Fix-status-in=
-teardown-overriding-exit-code.patch<br>
<br>
diff --git a/meta-oe/recipes-test/bats/bats_1.6.0.bb b/meta-oe/recipes-test=
/bats/bats_1.6.0.bb<br>
index 7ea1aa8f3..df81595c9 100644<br>
--- a/meta-oe/recipes-test/bats/bats_1.6.0.bb<br>
+++ b/meta-oe/recipes-test/bats/bats_1.6.0.bb<br>
@@ -6,8 +6,12 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/bats-core=
/bats-core">https://github.com/bats-core/bats-core</a>&quot;<br>
&nbsp;LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE.md;md5=3D2970203=
aedf9e829edb96a137a4fe81b">file://LICENSE.md;md5=3D2970203aedf9e829edb96a13=
7a4fe81b</a>&quot;<br>
<br>
-SRC_URI =3D &quot;git://github.com/bats-core/bats-core.git;branch=3Dmaster=
;protocol=3Dhttps&quot;<br>
-# v1.4.1<br>
+SRC_URI =3D &quot;\<br>
+&nbsp; git://github.com/bats-core/bats-core.git;branch=3Dmaster;protocol=
=3Dhttps \<br>
+&nbsp; <a href=3D"file://0001-Fix-status-in-teardown-overriding-exit-code.=
patch">file://0001-Fix-status-in-teardown-overriding-exit-code.patch</a> \<=
br>
+&nbsp; &quot;<br>
+<br>
+# v1.6.0<br>
&nbsp;SRCREV =3D &quot;210acf3a8ed318ddedad3137c15451739beba7d4&quot;<br>
<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta-oe/recipes-test/bats/files/0001-Fix-status-in-teardown-ov=
erriding-exit-code.patch b/meta-oe/recipes-test/bats/files/0001-Fix-status-=
in-teardown-overriding-exit-code.patch<br>
new file mode 100644<br>
index 000000000..f4b1db931<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-test/bats/files/0001-Fix-status-in-teardown-overridin=
g-exit-code.patch<br>
@@ -0,0 +1,150 @@<br>
+From aa628ccdc4dec1c129c1bd98b53ef94d8c2e119a Mon Sep 17 00:00:00 2001<br>
+From: Richard Neill &lt;richard.neill@arm.com&gt;<br>
+Date: Mon, 9 May 2022 12:20:48 +0100<br>
+Subject: [PATCH] Fix status in teardown* overriding exit code<br>
+<br>
+Patch fixes regression which produces false-negatives in v1.6.0, where the=
<br>
+teardown function can cause BATS to report success even if test cases fail=
.<br>
+Fixes: <a href=3D"https://github.com/bats-core/bats-core/issues/575">https=
://github.com/bats-core/bats-core/issues/575</a><br>
+<br>
+Upstream-Status: Backport [Adapted from <a href=3D"https://github.com/bats=
-core/bats-core/commit/5f372058b05f817e4e3a8dab27f83c30fd467504]">
https://github.com/bats-core/bats-core/commit/5f372058b05f817e4e3a8dab27f83=
c30fd467504]</a><br>
+Signed-off-by: Richard Neill &lt;richard.neill@arm.com&gt;<br>
+---<br>
+ libexec/bats-core/bats-exec-file&nbsp; | 18 ++++++++----------<br>
+ libexec/bats-core/bats-exec-suite | 12 ++++++------<br>
+ libexec/bats-core/bats-exec-test&nbsp; |&nbsp; 8 ++++----<br>
+ 3 files changed, 18 insertions(+), 20 deletions(-)<br>
+<br>
+diff --git a/libexec/bats-core/bats-exec-file b/libexec/bats-core/bats-exe=
c-file<br>
+index 298441b..63452c7 100755<br>
+--- a/libexec/bats-core/bats-exec-file<br>
++++ b/libexec/bats-core/bats-exec-file<br>
+@@ -118,7 +118,6 @@ bats_run_teardown_file() {<br>
+<br>
+ bats_file_teardown_trap() {<br>
+&nbsp;&nbsp; bats_run_teardown_file<br>
+-&nbsp; local status=3D0<br>
+&nbsp;&nbsp; bats_file_exit_trap<br>
+ }<br>
+<br>
+@@ -144,9 +143,9 @@ bats_file_exit_trap() {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; bats_print_failed_command &quot;${stack_trace[@]}=
&quot; &gt;&amp;3<br>
+&nbsp;&nbsp;&nbsp;&nbsp; bats_prefix_lines_for_tap_output &lt; &quot;$BATS=
_OUT&quot; | bats_replace_filename &gt;&amp;3<br>
+&nbsp;&nbsp;&nbsp;&nbsp; rm -rf &quot;$BATS_OUT&quot;<br>
+-&nbsp;&nbsp;&nbsp; status=3D1<br>
++&nbsp;&nbsp;&nbsp; bats_exec_file_status=3D1<br>
+&nbsp;&nbsp; fi<br>
+-&nbsp; exit $status<br>
++&nbsp; exit $bats_exec_file_status<br>
+ }<br>
+<br>
+ function setup_file() {<br>
+@@ -250,15 +249,15 @@ bats_read_tests_list_file() {<br>
+ }<br>
+<br>
+ bats_run_tests() {<br>
+-&nbsp; status=3D0<br>
++&nbsp; bats_exec_file_status=3D0<br>
+<br>
+&nbsp;&nbsp; if [[ &quot;$num_jobs&quot; !=3D 1 &amp;&amp; &quot;${BATS_NO=
_PARALLELIZE_WITHIN_FILE-False}&quot; =3D=3D False ]]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp; export BATS_SEMAPHORE_NUMBER_OF_SLOTS=3D&quot;$nu=
m_jobs&quot;<br>
+-&nbsp;&nbsp;&nbsp; bats_run_tests_in_parallel &quot;$BATS_RUN_TMPDIR/para=
llel_output&quot; || status=3D1<br>
++&nbsp;&nbsp;&nbsp; bats_run_tests_in_parallel &quot;$BATS_RUN_TMPDIR/para=
llel_output&quot; || bats_exec_file_status=3D1<br>
+&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp; for test_name in &quot;${tests_to_run[@]}&quot;; =
do<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [[ &quot;${BATS_INTERRUPTED-NOTSET=
}&quot; !=3D NOTSET ]]; then<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status=3D130 # bash's code for=
 SIGINT exits<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bats_exec_file_status=3D130 # =
bash's code for SIGINT exits<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Only handle non-empty lines<br>
+@@ -267,14 +266,13 @@ bats_run_tests() {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((++test_number_in_file))=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # deal with empty flags t=
o avoid spurious &quot;unbound variable&quot; errors on Bash 4.3 and lower<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [[ &quot;${#flags[@]}&=
quot; -gt 0 ]]; then<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;$BATS_LIBEXE=
C/bats-exec-test&quot; &quot;${flags[@]}&quot; &quot;$filename&quot; &quot;=
$test_name&quot; &quot;$test_number_in_suite&quot; &quot;$test_number_in_fi=
le&quot; || status=3D1<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;$BATS_LIBEXE=
C/bats-exec-test&quot; &quot;${flags[@]}&quot; &quot;$filename&quot; &quot;=
$test_name&quot; &quot;$test_number_in_suite&quot; &quot;$test_number_in_fi=
le&quot; || bats_exec_file_status=3D1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;$BATS_LIBEXE=
C/bats-exec-test&quot; &quot;$filename&quot; &quot;$test_name&quot; &quot;$=
test_number_in_suite&quot; &quot;$test_number_in_file&quot; || status=3D1<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;$BATS_LIBEXE=
C/bats-exec-test&quot; &quot;$filename&quot; &quot;$test_name&quot; &quot;$=
test_number_in_suite&quot; &quot;$test_number_in_file&quot; || bats_exec_fi=
le_status=3D1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+&nbsp;&nbsp;&nbsp;&nbsp; done<br>
+&nbsp;&nbsp; fi<br>
+-&nbsp; export status<br>
+ }<br>
+<br>
+ bats_create_file_tempdirs() {<br>
+@@ -322,4 +320,4 @@ bats_run_tests<br>
+ trap bats_interrupt_trap INT<br>
+ bats_run_teardown_file<br>
+<br>
+-exit $status<br>
++exit $bats_exec_file_status<br>
+diff --git a/libexec/bats-core/bats-exec-suite b/libexec/bats-core/bats-ex=
ec-suite<br>
+index 05c66f4..4d440ae 100755<br>
+--- a/libexec/bats-core/bats-exec-suite<br>
++++ b/libexec/bats-core/bats-exec-suite<br>
+@@ -135,10 +135,10 @@ bats_exit_trap() {<br>
+&nbsp;&nbsp; if [[ ${BATS_INTERRUPTED-NOTSET} !=3D NOTSET ]]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp; printf &quot;\n# Received SIGINT, aborting ...\n\=
n&quot;<br>
+&nbsp;&nbsp; fi<br>
+-&nbsp; exit &quot;$status&quot;<br>
++&nbsp; exit &quot;$bats_exec_suite_status&quot;<br>
+ }<br>
+<br>
+-status=3D0<br>
++bats_exec_suite_status=3D0<br>
+ printf '1..%d\n' &quot;${test_count}&quot;<br>
+<br>
+ # No point on continuing if there's no tests.<br>
+@@ -163,15 +163,15 @@ if [[ &quot;$num_jobs&quot; -gt 1 ]] &amp;&amp; [[ -=
z &quot;$bats_no_parallelize_across_files&quot; ]]; then<br>
+&nbsp;&nbsp; # shellcheck disable=3DSC2086,SC2068<br>
+&nbsp;&nbsp; # we need to handle the quoting of ${flags[@]} ourselves,<br>
+&nbsp;&nbsp; # because parallel can only quote it as one<br>
+-&nbsp; parallel --keep-order --jobs &quot;$num_jobs&quot; bats-exec-file =
&quot;$(printf &quot;%q &quot; &quot;${flags[@]}&quot;)&quot; &quot;{}&quot=
; &quot;$TESTS_LIST_FILE&quot;&nbsp; ::: &quot;${BATS_UNIQUE_TEST_FILENAMES=
[@]}&quot; 2&gt;&amp;1 || status=3D1<br>
++&nbsp; parallel --keep-order --jobs &quot;$num_jobs&quot; bats-exec-file =
&quot;$(printf &quot;%q &quot; &quot;${flags[@]}&quot;)&quot; &quot;{}&quot=
; &quot;$TESTS_LIST_FILE&quot;&nbsp; ::: &quot;${BATS_UNIQUE_TEST_FILENAMES=
[@]}&quot; 2&gt;&amp;1 || bats_exec_suite_status=3D1<br>
+ else<br>
+&nbsp;&nbsp; for filename in &quot;${BATS_UNIQUE_TEST_FILENAMES[@]}&quot;;=
 do<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if [[ &quot;${BATS_INTERRUPTED-NOTSET}&quot; !=3D=
 NOTSET ]]; then<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status=3D130 # bash's code for SIGINT exit=
s<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bats_exec_suite_status=3D130 # bash's code=
 for SIGINT exits<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<br>
+&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+-&nbsp;&nbsp;&nbsp; bats-exec-file &quot;${flags[@]}&quot; &quot;$filename=
&quot; &quot;${TESTS_LIST_FILE}&quot; || status=3D1<br>
++&nbsp;&nbsp;&nbsp; bats-exec-file &quot;${flags[@]}&quot; &quot;$filename=
&quot; &quot;${TESTS_LIST_FILE}&quot; || bats_exec_suite_status=3D1<br>
+&nbsp;&nbsp; done<br>
+ fi<br>
+<br>
+-exit &quot;$status&quot;<br>
++exit &quot;$bats_exec_suite_status&quot;<br>
+diff --git a/libexec/bats-core/bats-exec-test b/libexec/bats-core/bats-exe=
c-test<br>
+index aae4572..57bdf18 100755<br>
+--- a/libexec/bats-core/bats-exec-test<br>
++++ b/libexec/bats-core/bats-exec-test<br>
+@@ -94,18 +94,18 @@ source &quot;$BATS_ROOT/lib/bats-core/tracing.bash&quo=
t;<br>
+<br>
+ bats_teardown_trap() {<br>
+&nbsp;&nbsp; bats_check_status_from_trap<br>
+-&nbsp; local status=3D0<br>
++&nbsp; local bats_teardown_trap_status=3D0<br>
+&nbsp;&nbsp; # mark the start of this function to distinguish where skip i=
s called<br>
+&nbsp;&nbsp; # parameter 1 will signify the reason why this function was c=
alled<br>
+&nbsp;&nbsp; # this is used to identify when this is called as exit trap f=
unction<br>
+&nbsp;&nbsp; BATS_TEARDOWN_STARTED=3D${1:-1}<br>
+-&nbsp; teardown &gt;&gt;&quot;$BATS_OUT&quot; 2&gt;&amp;1 || status=3D&qu=
ot;$?&quot;<br>
++&nbsp; teardown &gt;&gt;&quot;$BATS_OUT&quot; 2&gt;&amp;1 || bats_teardow=
n_trap_status=3D&quot;$?&quot;<br>
+<br>
+-&nbsp; if [[ $status -eq 0 ]]; then<br>
++&nbsp; if [[ $bats_teardown_trap_status -eq 0 ]]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp; BATS_TEARDOWN_COMPLETED=3D1<br>
+&nbsp;&nbsp; elif [[ -n &quot;$BATS_TEST_COMPLETED&quot; ]]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp; BATS_DEBUG_LAST_STACK_TRACE_IS_VALID=3D1<br>
+-&nbsp;&nbsp;&nbsp; BATS_ERROR_STATUS=3D&quot;$status&quot;<br>
++&nbsp;&nbsp;&nbsp; BATS_ERROR_STATUS=3D&quot;$bats_teardown_trap_status&q=
uot;<br>
+&nbsp;&nbsp; fi<br>
+<br>
+&nbsp;&nbsp; bats_exit_trap<br>
+--<br>
+2.25.1<br>
+<br>
--<br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR08MB3893049F441F8BB37FF472A5E0C99AM6PR08MB3893eurp_--

