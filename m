Return-Path: <mns@gomspace.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140109.outbound.protection.outlook.com [40.107.14.109])
	by mail.openembedded.org (Postfix) with ESMTP id 679617F88B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 13:19:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=fACYErvqZHB8WP5MUy2KmHe0JOlr2ExD5qKqM6UcUx/M1Quc8jnYx5tf71N19YT0CHEbfsWV/gB9ycbnChZQOanM32J1oXyx8o0Z9vVza2GqOmAaADpPCnDihpcJe4u7e0IoNMhRB7YRKoFpE3Bo/GdpT5Ri4Gnh9Zuuhr7Zy+5MTyQugVag+Y/xicaI2St8CF0vbFgCeIMe6xeOOi2rbcswZ58nsqQMdd9gwNFSahulB2OLP0s0P0fJTBYQugpticQ96GTkw6Zt9hKeT6nHVO+OEv5maIz2dMxXuOzH0Ly96JfbC7pYl1khPvdoFXqeC9jQlBU9e2RmT+M628Eyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4TMV8mCkgxQdbMAH9poA4eEhSkJRSvhBRYeAhNd2vOs=;
	b=C7qU19Z6CmN6UDAl8Hfsfevb9Qpz7dQunsocLsmNFcnrLk/j0cK8zxwy1oVKwvuB5o+jj4odJcB7Csx0jSBHVMcQ1lFWL4WiAaCaJOLPpyNtTdCMROPbNGKa+5DigVQhJXuH8bswkIUxPbBN1lmB8lEzNF/smIo+INYgKYePX5dUyiY/rp52/miEjm7Lbrf69qfp0gon/ZZN/jeHuHsEaY8lY2ZE0RfsM+d+1vfiq3E9elLxBArkMBhIefcHW+HE2idJ4k0LQy4HlZv4NvAK7cgRx3rbq5ueV+wwNcVXU2SoWvbXqhgbY1JXFkcZELl95iI6VsLRNthXJ8dsOqrz9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4TMV8mCkgxQdbMAH9poA4eEhSkJRSvhBRYeAhNd2vOs=;
	b=I0KsBy7uDZKhLcFLddUWAHq139mNbl1NJ+TBUvnQkqtZmjF+4K0EUH6Yknp0KB4qWrwiy7BEgP627gNPZ4x31StgmCcjOeJ2MMGRUODIFUQhBbtxGWrKWMenZUPYkzfMvEimB9hz62vsmwUd7uwygi7wjpTJPrTHtgFky0QmhXA=
Received: from VI1PR08CA0263.eurprd08.prod.outlook.com (2603:10a6:803:dc::36)
	by AM0PR08MB4355.eurprd08.prod.outlook.com (2603:10a6:208:13a::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20;
	Tue, 5 Nov 2019 13:19:33 +0000
Received: from HE1EUR01FT056.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::205) by VI1PR08CA0263.outlook.office365.com
	(2603:10a6:803:dc::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24 via
	Frontend Transport; Tue, 5 Nov 2019 13:19:33 +0000
Authentication-Results: spf=fail (sender IP is 79.171.149.172)
	smtp.mailfrom=gomspace.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=gomspace.com;
Received-SPF: Fail (protection.outlook.com: domain of gomspace.com does not
	designate 79.171.149.172 as permitted sender)
	receiver=protection.outlook.com; client-ip=79.171.149.172;
	helo=gomspace.com; 
Received: from gomspace.com (79.171.149.172) by
	HE1EUR01FT056.mail.protection.outlook.com (10.152.0.229) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.20.2387.20 via Frontend Transport; Tue, 5 Nov 2019 13:19:32 +0000
Received: from Ex01.gomspace.lan (10.0.1.60) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Tue, 5 Nov 2019 14:19:31 +0100
Received: from Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20]) by
	Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20%4]) with mapi id
	15.01.1466.003; Tue, 5 Nov 2019 14:19:31 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe,thud][PATCH 0/6] libiio: backports from master
Thread-Index: AQHVk9Czfzm5XOy1Sk2Wglb3BDW9T6d8jT21
Date: Tue, 5 Nov 2019 13:19:31 +0000
Message-ID: <59b10a443d6242929cd9c83a70419545@gomspace.com>
References: <20191105120031.6579-1-mns@gomspace.com>
In-Reply-To: <20191105120031.6579-1-mns@gomspace.com>
Accept-Language: en-US, da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.8.211]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(979002)(346002)(39840400004)(396003)(136003)(376002)(1110001)(339900001)(199004)(189003)(70586007)(70206006)(966005)(40036005)(2501003)(76130400001)(316002)(6246003)(76176011)(24736004)(108616005)(33026002)(2906002)(53416004)(105606002)(2351001)(26005)(229853002)(36756003)(102836004)(50466002)(8676002)(6306002)(5660300002)(6116002)(14454004)(3846002)(186003)(21086003)(356004)(5640700003)(6916009)(23756003)(336012)(476003)(86362001)(446003)(11346002)(2616005)(26826003)(486006)(126002)(508600001)(81156014)(81166006)(7736002)(47776003)(8936002)(8746002)(305945005)(142933001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR08MB4355; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8016d01a-d454-4a5b-84c3-08d761f2cc19
X-MS-TrafficTypeDiagnostic: AM0PR08MB4355:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <AM0PR08MB435571B8209803680257B6BDC47E0@AM0PR08MB4355.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0212BDE3BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YrnnA77Lv+BxBuXkq5CzJoxXHFpM6j6oeifhfo+uhf1tnNYEZ7xaY66jmYKMLz58u7PIg2/WqEXr7Xe+8z0dMlcJr2wDTTHwQZK3HtSzcm0O6BPAC+FAwNTYLr/kB8MWPrtHEq/FycPBgMswzz7EX/mjnUfnIBRqFh87jmGtFy9BmmT995wq1crtMNAQBbs91xs+riX3Z4PkmxNgiBqdl97+fJjlY1x+bqocIegCtfaqhC2V4AxhqW5P9OZ02kadl8tpGfVRdpCBa93ciGLnvKp00w4AxgSPmmsIiTI0wOIDqf5GU4E3MxFASZMBsDyPEvHKUjXjRkZEmjQ5/Z6EbnRyTUfrbmNtmfPzxcV61DIcxcQMQpxBjGDGkmTi4a07fbCBvMbnIcTdYMHVRmzNPfAPB+JiLrVsuIR29aVg0iQwH/ScjXPs6U5TQPBNwRYzzltmh1Rtf2OdK5ei5TSWciCQKx2cJCcWa0ULjFMBvCU=
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2019 13:19:32.9247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8016d01a-d454-4a5b-84c3-08d761f2cc19
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4355
Subject: Re: [meta-oe,thud][PATCH 0/6] libiio: backports from master
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Nov 2019 13:19:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Unfortunately, our mailserver rejected the second half of the series - plea=
se disregard, I'll resend when the issues are resolved.

Thanks,
Martin

________________________________________
From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel=
-bounces@lists.openembedded.org> on behalf of Martin Siegumfeldt <mns@gomsp=
ace.com>
Sent: Tuesday, November 5, 2019 1:00 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe,thud][PATCH 0/6] libiio: backports from master

Backport libiio patches from master bumping libiio to v0.18 and
allows building python3 bindings

Khem Raj (1):
  libiio: Inherit distutils3-base for packaging python files

Martin Siegumfeldt (4):
  Revert "libiio: fix build of python bindins"
  libiio: allow python3 bindings to be built
  libiio: bump to version 0.18+
  libiio: add python3 packageconfig

Nicholas Pillitteri (1):
  Bump libiio version to 0.15

 meta-oe/recipes-support/libiio/libiio_git.bb | 23 +++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

--
2.17.1

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

