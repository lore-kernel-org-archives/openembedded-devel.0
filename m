Return-Path: <danc@opengear.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800041.outbound.protection.outlook.com [40.107.80.41])
	by mail.openembedded.org (Postfix) with ESMTP id EEC89762B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 01:34:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=SVWswU1fL+xJpl9R3qfnsLsyF5qXBNGS6aZEl0UR9Ooaz/S98YTE/QHGQLCXxlehtAT8uq2MQfSfYIMDT4qFCJtkbCWQHRZhJ7dA2Tg/F9TteB0Yl7hWWqybhjchCgABeipo4AD//AARl8BckUgUtSkjsM4JcYr6qGGImBbOp82Nngv2DEP0gIdX6GLT64N2y6k0LuCQ2eXmrSz58a9wAl8zoTdutQIXtdLItEZ7sodRgeYVWnV8WpUqLklwDkmkKiZODhF+s71j2cW9fa0ctKRsZMnPJQ8aQ2+f2O+Vk7TrFQLcCaeRn2elJRD1iYnJCsGT7T0LIAcyU5seIHkqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eu08B6BaAQ1PmERN1CwexWU32daJQOXVvsk7EN6bJo8=;
	b=EL64PFYb0+YYNdT1dAQHFFpHgE2alPcelz1rA9MuunrNGn9C5nAsHjrylKleCXAM+ilYsAXfmBH1JlVZqg5km5ZZIQT5cp+Bo4bTBF5hf36o1gS3u0y29RNJoVVVTOpXOGGFtgu5g+o2A+HPQl2iPiku76EaEcr80/IvBfhwUfoWsmqO/d24BLSLEosys6AikUXWbxZbdWeVHfBhDgn/QvnebZfzJJX/cswUopdpvQHFKd/lbc5y2oSRRiBjUfTzv411tVOIM4ISUuJYHgbZNDbLe0I/mKHjUdqRMN6f6bbt86qebLRvZDenuHhNYX2s7UIf0GgxhT/Rlc1N/5tIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eu08B6BaAQ1PmERN1CwexWU32daJQOXVvsk7EN6bJo8=;
	b=fthofDIvbBUkMyvw/8PNZ8WQKG/2O7SDbu7O2hAF9hcWiEQFzJhTBGNnJ3WDByrbKcDOJ/zxGcNQv3561GMcXJOsNJJ55S4eO2l02bWPdNhhrUCbqIEMKYzpU5T6iec19YT7mW8dzxxywsEafCJ3SgUcGVauMEwqmFtduW6IhYk=
Received: from SN6PR1501CA0023.namprd15.prod.outlook.com (2603:10b6:805::36)
	by BYAPR15MB3479.namprd15.prod.outlook.com (2603:10b6:a03:112::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20;
	Fri, 4 Oct 2019 01:34:23 +0000
Received: from CO1NAM04FT038.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::203) by SN6PR1501CA0023.outlook.office365.com
	(2603:10b6:805::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.21 via
	Frontend Transport; Fri, 4 Oct 2019 01:34:22 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT038.mail.protection.outlook.com (10.152.91.26) with Microsoft
	SMTP
	Server id 15.20.2327.20 via Frontend Transport; Fri, 4 Oct 2019 01:34:22
	+0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 696D5E95C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 11:34:20 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 4BD4042965A9; Fri,  4 Oct 2019 11:34:20 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-reply-to: <CAMKF1srXJ6OA4sUCqJVOoAC7inNGS38UwWgY7TAdEPdMdj5nJg@mail.gmail.com>
References: <CAMKF1sqbBYpZn9a8CnG8Nc+4PWXTtGCZFEes=Ntxzq9_VZt==Q@mail.gmail.com>
	<20190930221119.30225-1-dan.callaghan@opengear.com>
	<CAMKF1srXJ6OA4sUCqJVOoAC7inNGS38UwWgY7TAdEPdMdj5nJg@mail.gmail.com>
Date: Fri, 04 Oct 2019 11:34:06 +1000
Message-Id: <1570152616-sup-1637@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(136003)(376002)(39850400004)(396003)(448002)(189003)(199004)(54094003)(2906002)(2870700001)(70586007)(6916009)(103686004)(305945005)(966005)(186003)(70206006)(7636002)(15650500001)(26826003)(568964002)(478600001)(76176011)(21480400003)(44832011)(446003)(476003)(126002)(426003)(486006)(11346002)(76130400001)(33964004)(8676002)(36906005)(336012)(58126008)(316002)(42186006)(26005)(8936002)(246002)(6246003)(5000100001)(6266002)(5024004)(235185007)(71190400001)(6306002)(229853002)(5660300002)(6666004)(356004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR15MB3479;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea59d8ee-1d72-4d13-51ff-08d7486afbd5
X-MS-TrafficTypeDiagnostic: BYAPR15MB3479:
X-Microsoft-Antispam-PRVS: <BYAPR15MB3479B8CCD531DD6794706583B89E0@BYAPR15MB3479.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 018093A9B5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmCpX8IdnOfj8ew4z6PIOCbFvhs+9oY9q7OzvigVQdJsinVH9/J/uC5W/4AUCPt6eERlk5X0bALeGK9ccS+hHiCy3BNt41nT49JedC9KkiTR6v348xaVlOSWjEGKlxPIew56okF6zMoxsx+vb9QkIAABTyHFxbZFuhciOk5lyTWncWh6vjeztkn/QaFEX6/xC8OylkoAwtyh3CSDkOajq+hxBQy9Ezx2srXLeYM9aFncG7TiIvAWswB9VtcRnQ/tZnsIAdqRkbdKC6wHw44oklgzDqIq82w2KY2S5y87l+VFLraeDWnlTAsINLDtaitMAAreua5bmStyf/L82R8KFExH+g4sPVCXsGusmfvbQaxlEXlisTgVMYJPXRWCfpMMaDIzzo9Xrp72bF3L6ZkJh7Ik2U4hMkDJADlzu5M10I4=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 01:34:22.0845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea59d8ee-1d72-4d13-51ff-08d7486afbd5
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3479
Subject: Re: [meta-networking][PATCH v2] firewalld: update to 0.7.1
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
X-List-Received-Date: Fri, 04 Oct 2019 01:34:24 -0000
X-Groupsio-MsgNum: 80001
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha256";
	boundary="=-1570152860-283955-13880-4737-1-="

--=-1570152860-283955-13880-4737-1-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Khem Raj's message of 2019-09-30 20:21:38 -07:00:
> Fails in configure
> =

> https://errors.yoctoproject.org/Errors/Details/272275/
> =

> perhaps xmlto-native docbook-xml-dtd4-native
> docbook-xsl-stylesheets-native deps are needed

Hmm. The recipe already has docbook-xsl-stylesheets-native and =

xmlto-native in DEPENDS, which should be sufficient.

The recipe I posted in v2 of my patch builds successfully in our distro, =

which is based on Thud. The recipe sysroot has /etc/xml/catalog.xml in =

it, and it contains the Docbook XML stuff as expected.

But when I build the recipe in YOE master, I can see that the Docbook =

XML is present in the recipe sysroot XML catalog... but the catalog file =

is called /etc/xml/catalog, not /etc/xml/catalog.xml.

I wonder if it has changed since Thud, or if there is some other reason =

why the name is different in our distro...

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1570152860-283955-13880-4737-1-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAl2WoY4ACgkQQuSr4gkX
maR+sQ/+Jv2mVNEYAia3BpMJMX2Qjk+b1SmklBU/il008YPK0HdQ1BdtVp7kqb+j
ZPFkTM3lpeoW96GDRlbnT1ye4N35reHtCU+lKaeUuJi1o13H1+3qMp9JgRSaBtHu
nt6kjk7qfMcllLbnCgwljk0MwXAJxWjrg8F+/Qh2RN9cnyw8/2NvvKquqL1AVLVg
OpNijvehUDtflrbuXnCvIK+z7zBkhfU+0DKBAqKWQaYzdI6todtT5TcdZoeXO5hD
GT1VyoCJO7E3chRfwaTq7Zy9BqJ5llTmQVZfOoL/Aidfl0+5VjdPQwUeB7j9R3sq
+DfjPMv+Tw7xzgB6yo4Z2a381Ly6GMNhVrH0cWWuFvb+1Ig/SEWBl8Z5mpwgRgq8
OgUwzwZ+xfek++neKNxGxjZFScuxcFzn8+oPlDeJK4F/6G/HrITClbBCiIRKnL9b
LxtGWMxF/+xwOkF/LzfahIj4U5aVrGX3PkQQXXUsxY86T9gn7ve7eYz/ihIu/VCg
ztH1o4ZC6rEFqHDcEP8T5W9dH0Zi3TWB8NtuCHlHZ6bs00/Ee0ZCkciw2wvOxi4g
BsHhkw6J01Uhregd0x9N6qsCh7lvSakeyrMLT4FiO8qsDQXqc2OmehsSpc5Q3CNS
zxbbIyYuOe8ZDqgK9stRQYFBiQ3Qqd6QyLhqISevq4HyoHydyMQ=
=H04Q
-----END PGP SIGNATURE-----

--=-1570152860-283955-13880-4737-1-=--
