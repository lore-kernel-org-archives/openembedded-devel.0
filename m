Return-Path: <danc@opengear.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
	by mail.openembedded.org (Postfix) with ESMTP id C774B75C60
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 23:34:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=WcHbEj2AWUPw6xC3inb0fFwdHfAKHsU5wPggx4iApexuRUT3IXhxvgjFuKJ48vR8QM4+JoIIhzk7vjdlMQIv3RsrMiMStKJ8UVHgDq35HgtJ0Bsv6xnMH5H993W3rnX+sRGrtE2gxuEyw3mOR+2cYUPlzQjeThI6vBPrwBh8eha54NLDMItENsj/ZCcQKBVIS3+7Oub3pGcpDEZoRmlfc0pAHOk3bUa6nAazH34EFFZAfDzfibRL5+saeIQDRyuLL1NxLxQ2nJUKq8ORbI93WjRbyWVSlP1LsLIo2qgQcAfBN1RfKeU719fU+xvg2P9jltZDMnyBErW7lv7Y8RaBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=r/UtZV2YUEZbLnHxBG0dg0tpK7NNRXbcBH4ED928+gk=;
	b=S1LUHPj/+HxlFT+JY/HUNJOymv2oVEmcLLct5XEdhxVQe4UdbJW8+7KzptI0sLn0aia57QohOc/mV7mR/qUt9P8uU9lc7CDZsYhlLsPlJAy7JNCS5nUUIVzcAXwQcTmF9ngXmXujpJ4/M8b0tYdogVvf31syQ69Gw1CQ0l2N8XXMkLcj1WNiziTambod3xJGPlXrdrn3+m/6lQc/lntOA9HQf923SKqctgnbOR8E53Fm/T9IAfXHGcOSyu2tZeKgVy2mVeVapgREsiyvJZpIAbqOoacFSi1w5JVf8kNjsOsDuxD/c0n3vcz8/xGlvpTDN1nOUXmHw2G2nySzA+OQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=r/UtZV2YUEZbLnHxBG0dg0tpK7NNRXbcBH4ED928+gk=;
	b=m5+ooiCb3kXaqv/G/PPTE9jbefdfbqdu/f/NuCCBPtRBmgmdiyZc1P9tJVE4/ERK1zPdc+MBlyyVsKoxE9rCjeHPoIrCjj2vSMpdVtdD8yjc5hQYzDAUvYGNY0EINjQ11m5GzVDOKI6NQM0piOm9E1QgYhmaMHMVT8TpTonECPs=
Received: from CH2PR15CA0021.namprd15.prod.outlook.com (2603:10b6:610:51::31)
	by CY4PR15MB1413.namprd15.prod.outlook.com (2603:10b6:903:fb::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16;
	Mon, 14 Oct 2019 23:34:10 +0000
Received: from CO1NAM04FT040.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::208) by CH2PR15CA0021.outlook.office365.com
	(2603:10b6:610:51::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via
	Frontend Transport; Mon, 14 Oct 2019 23:34:09 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT040.mail.protection.outlook.com (10.152.91.23) with Microsoft
	SMTP Server id 15.20.2347.16 via Frontend Transport;
	Mon, 14 Oct 2019 23:34:09 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id C2DB7E84FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 09:34:06 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 9B70642C8817; Tue, 15 Oct 2019 09:34:06 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
In-reply-to: <CAMKF1sq=q=Ssmp69ze-9W2keDZ_nKa=7+6s=5zAOnmPRbg_pYw@mail.gmail.com>
References: <20191014020047.27691-1-dan.callaghan@opengear.com>
	<CAMKF1sq=q=Ssmp69ze-9W2keDZ_nKa=7+6s=5zAOnmPRbg_pYw@mail.gmail.com>
Date: Tue, 15 Oct 2019 09:34:06 +1000
Message-Id: <1571096014-sup-6642@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39840400004)(448002)(199004)(189003)(26005)(186003)(76176011)(33964004)(5024004)(336012)(11346002)(14444005)(446003)(126002)(476003)(486006)(426003)(44832011)(7636002)(71190400001)(2870700001)(2906002)(103686004)(21480400003)(568964002)(564344004)(5000100001)(305945005)(58126008)(36906005)(42186006)(6916009)(478600001)(246002)(70206006)(26826003)(70586007)(316002)(76130400001)(8936002)(6306002)(6246003)(229853002)(6266002)(8676002)(4001150100001)(5660300002)(235185007)(356004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR15MB1413;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 273bb89f-199a-4606-e9c9-08d750ff0323
X-MS-TrafficTypeDiagnostic: CY4PR15MB1413:
X-Microsoft-Antispam-PRVS: <CY4PR15MB1413908D19CBAA8C3345FE44B8900@CY4PR15MB1413.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6zpcJ3NSQTEhDVfctPzV5WaSKw7qwc9bELJLYEdKGOdVUl9pzaSqlpXCuKsoqE0WB/jh38J2XEo8p/04QXmysuEMFGgAU1Ni27DNXVypEx38Q5nzT7jNI6kQXa9yuFFxU8dnjZ0zE8QMnBPH7K4DXvNFnSIjcJYqSj/ALVQiTF2FXBQS8KcQi+8GAkH/kRXkI6XgYuf8Xn28kGs+VXJG6ujiRTYDbfaZL1JeEeQvTjLtXV0NBjqp9YFVzpt0WQoPV29Jx5Z6AfNjwyM047K/NjLJiUK7IBzdsAWA8ZjnjzXXHuBmDHggcxWPVbKJpOgj/4LGtk3bk26RVUDmu7U0lxO2biBY4Xl0R3rGTDOV89CVYxaZXJbhhiR2I+yrrV8/kOkuhlPiuquXfKzBXMaLWDfTox8DSgyTFol+7M9ENc=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 23:34:09.1608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 273bb89f-199a-4606-e9c9-08d750ff0323
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1413
Subject: Re: [meta-networking][PATCH] strongswan: add a PACKAGECONFIG for libbfd stack traces
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
X-List-Received-Date: Mon, 14 Oct 2019 23:34:11 -0000
X-Groupsio-MsgNum: 80128
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha256"; boundary="=-1571096046-579315-6389-757-2-="

--=-1571096046-579315-6389-757-2-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Khem Raj's message of 2019-10-14 03:14:32 -07:00:
> Package config is fine but let=E2=80=99s not enable it by default

Fair enough, I'll post a new patch which leaves it disabled.

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1571096046-579315-6389-757-2-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAl2lBe4ACgkQQuSr4gkX
maRYIRAAm5zP2hheQ+11Z3Q6KM1FNHRJpj0O5TlYaG0ojFN/H5NkPwPC6GocG9JQ
k6Jwn2C8/KG9JCZzbe2v38u8pIPhJ8gW/FNUsczKTGU7Ur6mDs45lJbAEEHEiYHk
eiCXbqHdfusUzSsofavd0f1AVBVNIcO2pHt5i6jLtoqu8HnYakdE6iBtd1iN1MFn
EIXi2p+I/olHIgRjiP7X9kObnvPp2nm0qwITbldG170Ipvn4k+6iCpdzAh/kFzHW
6Emx4Q7Es1NUmygEAruEdb44GDeEZQhXk4SvrCe/K2OQ6V1KSvrfW3mGEfEmDDnm
1xKUP4RI1nEgsZwPWQ+FC9XaWprEDGMnBmRO6Y1ObnMTr14ayBD6ptkKJkm2/0YB
Y/lcUq6D8Mf4mw3NykMVew6z5PmiOLswa0MFpJ8hT9NV1Glf03ZbjtlDDJgNnNUe
GJATPPagXoLVBYfvTsrFdreRIS30PXWJckHtUqf7ZaLdSS250WlkX8kFbO40Chzf
m8kw4jUOObXM5ZHCpUKdKxo0Bfx8SmkeHCqbvZ763fD3LDA1rw3zYOTePSRUeuuj
jk2MhxEQjhPLGopP1WQ+sxKVX1hpZyxGTZzHVtrRhZVBkEMRJSq4CkEaYsGJ9S9K
eS6SVj+5OKaJSbHmrTikafCUlB3+8EtuDjdOTwvjPwzQxcVsV2Q=
=0bO6
-----END PGP SIGNATURE-----

--=-1571096046-579315-6389-757-2-=--
