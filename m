Return-Path: <mns@gomspace.com>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10096.outbound.protection.outlook.com [40.107.1.96])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7257F873
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 12:00:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=iBwkq/wGpk9ifS6dfuxFnjKqtObJeGOUYZYVNGf7gUBh9qZ6kNwlkExpk5BRuyCf/0ct2NUv/dZdgNl/UGZDe3Hm8YQJfXvqfBQ/87sRgDiEZ0edkumQhkAQ9UgaHPzk1y5XylihYYgvVyXG2fS1xPnTu5uNkL5SD/2yjk5hpDz/SpjufEfXr01AJQfblNrn1+jquvXyZIw2XhDuFmcXxxNTla/vqTwySd/Ad/3rDDqFdccpRle5hu6No/AMf8tOx/o3Pcz14Knv/h94jEF4b2qMQCMHmDKQDc2o5MtRGJgP6yGx2J7idVAxky4yqzxXQgsshdke81WDpb27wsbVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=F6WXyfyUPZWcr2z711JdYt6e3bLsJipnvK6T3CKYaDI=;
	b=HYx3CQnH9qxR2SxwxZ2hjr6VzP68xc6QXB+x5X4nt+P0+OupQF/6UIui9UTOjvTVhHsKpKzOAmM6V4/L0Wzgv8NQK7tbGXE7F4xwH5GsZuVV0CGKk3y4llgWMG8jDiZ1KlcjnUBpg7sKdXm96P9hDmTn3bwDBKNF0+OhDcoRY9nuahBFpmEffqcwXWnBBh+qluB2ogB7+nVTqro4DtqXMdB7Dwhp6szhbA0vdnkAAb9khyDcxsxPx5wQ441cjF0CciviCDJ3XEnkYTLKNS2qFs8iLDDHZKo49Eq9zsWW24uvjqn7YZtO9OOWpvM5fPtRrdbqM4FS79ciK2YsjA6gtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=F6WXyfyUPZWcr2z711JdYt6e3bLsJipnvK6T3CKYaDI=;
	b=XHDsprsl+3V/cDmkEcMQKSdgL8mHkWUVH8zbasmM0Smgx3WF/2Xw+zR8lAYQUx+mesocf4iTGrtMZ2FCieRWpC3/F3b8c5Vik9IcSu75r9ANZtiaEnGy8mUICdEbMh7VpRIHp4XNcXt0nNcIxCQbDWaQeP/S7j77bJUTog6/y50=
Received: from HE1PR08CA0078.eurprd08.prod.outlook.com (2603:10a6:7:2a::49) by
	DB8PR08MB4107.eurprd08.prod.outlook.com (2603:10a6:10:ac::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Tue, 5 Nov 2019 12:00:49 +0000
Received: from HE1EUR01FT022.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::206) by HE1PR08CA0078.outlook.office365.com
	(2603:10a6:7:2a::49) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.24 via
	Frontend Transport; Tue, 5 Nov 2019 12:00:49 +0000
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
	HE1EUR01FT022.mail.protection.outlook.com (10.152.0.165) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.20.2387.20 via Frontend Transport; Tue, 5 Nov 2019 12:00:48 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Tue, 5 Nov 2019 13:00:47 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Nov 2019 13:00:25 +0100
Message-ID: <20191105120031.6579-1-mns@gomspace.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.8.211]
X-ClientProxiedBy: Ex01.gomspace.lan (10.0.1.60) To Ex01.gomspace.lan
	(10.0.1.60)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(376002)(39840400004)(346002)(396003)(136003)(1110001)(339900001)(189003)(199004)(36756003)(486006)(2351001)(47776003)(8676002)(53416004)(105606002)(508600001)(81166006)(305945005)(81156014)(48376002)(76130400001)(4744005)(1076003)(33026002)(356004)(5660300002)(3846002)(50466002)(6116002)(26826003)(2906002)(6666004)(86362001)(16526019)(186003)(126002)(476003)(336012)(2616005)(40036005)(7736002)(6916009)(8936002)(70206006)(21086003)(316002)(70586007)(51416003)(386003)(26005)(16586007)(50226002)(142933001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB4107; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 965f0bc4-bc85-4c17-fd33-08d761e7cc28
X-MS-TrafficTypeDiagnostic: DB8PR08MB4107:
X-Microsoft-Antispam-PRVS: <DB8PR08MB410734A6BF0364E729547CDEC47E0@DB8PR08MB4107.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0212BDE3BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B3haEOfE+h30Cn8u3EUBaOl8kX1282Z26q5eY1r3tHZpLP56ny7CfMQuZNgckysEoTf87Q8gq7TDa8WZUH19FwYbzreAIVRKh5DJGhaH7DHch4bSq0VEdI2Ow46bd57k1am8pU/DkGD+CSnWpVqiZ9Dw3bwqG3hsCig1TAkMRvbAPLrWZ3LXU8EKipWW1xBGRczC94j9tvHhpB+1NRJInhRPiOam5oE5c9Bq+VU/+7wiHmJhuMcvoivfCsetKday5eDYqkgLY11jTaoyqeCnKBbBuyYbweaS8xJI8vkmAfOP8FA0KYbKbzq8GnlIZYsmmpyMZJGU3EkEvuoUhP8yYu8t4Hx3YoXWwpGwPODsa/4AYHsIJzmrEgoglyuMPoSq84o05htj1lH8dG1vTMzYhLUCR0XNjmc7bF9gBU7scwLloxt6fU4cNXZUtX0sUPRw
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2019 12:00:48.4590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 965f0bc4-bc85-4c17-fd33-08d761e7cc28
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4107
Subject: [meta-oe,thud][PATCH 0/6] libiio: backports from master
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
X-List-Received-Date: Tue, 05 Nov 2019 12:00:50 -0000
Content-Type: text/plain

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


