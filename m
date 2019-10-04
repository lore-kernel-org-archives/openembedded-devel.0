Return-Path: <danc@opengear.com>
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730047.outbound.protection.outlook.com [40.107.73.47])
	by mail.openembedded.org (Postfix) with ESMTP id CF9366C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 03:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=cDhj/o63uOssT8W43fh3FFCWc0xPGZ3VzKT1DK70CXO2upoKnteEtKE6TvF01C4FYGHGbmDwIRjJ46Uysw7bHYpfQlG2zlVT8KtRr/WzEM4CGldTW1dxTZiTAwNLaTsICXJMDdR54+gknzoJyfiia0BdZ3RNLowSgiB9uHsOuI1fNtjvP/ajDX4OCkq+1Dz3GINQW37AAPNemKiNoRC5+4Iu03JSJX6pfVo9j3qWZMzPkl8K5oe7voiPNuAlaMy4+lJTMxcRebxAZEddNrcFtgWhL5mIM4IpWCbUy3+jw03Omh3o+PXu0EnGTNaUrXpc5R6AeLW+B/Zf4mh5NBrvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yF8ufDqjN1EaExpofPhlFkDv8CXWiqOfSIVBC99zQqU=;
	b=FwQjEMMi2frM/+B/IwWXScmADjtdd4IP+GXdf4neEDI3VR2LYxcZnl4Jfd3m28uAi3y4xPxABYG6yeB91JZI5GMFPos4UpVI9g+q2Wo48GrzjVwm2dOoPKTApnYGEoxbQza1AJ2ma66rZ9LjjvZLdehv3Qpa4xWxvdDAiNcbrWLxfgjc4AWwfcMLL2fbJoseNurjdsJ1Cd+jok20p/pKuvuxKV4zjezKlHOs9ZD0h4mKhNKZhGbP9+8FfZ3YkUYqu5WyFwNgrvT0/o5ifMj/d7vlGw+S5FKID4+Fl7y9QOf3Z+vmdG3qSwHTViOMgBdvdELKKklOcCGkb3I/XFO6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yF8ufDqjN1EaExpofPhlFkDv8CXWiqOfSIVBC99zQqU=;
	b=ii3Mzos0tqtl8/AreDEhEntHE5jW1CjBwmRx2ZGkcCjaaFAAs63X9k9itQDH95z0QnxC59fxhfgHL0MucN6h3cTVad0hXiFTu0FNj+kIcz/a9ZDe1PEgIHZfWzHok9kKblL3M8y50lXBd7D0sHfnOvYnqhRYjhiAJVEjQnPZAa0=
Received: from BN8PR15CA0011.namprd15.prod.outlook.com (2603:10b6:408:c0::24)
	by BYAPR15MB3288.namprd15.prod.outlook.com (2603:10b6:a03:108::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20;
	Fri, 4 Oct 2019 03:11:41 +0000
Received: from CO1NAM04FT042.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::207) by BN8PR15CA0011.outlook.office365.com
	(2603:10b6:408:c0::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.16 via
	Frontend Transport; Fri, 4 Oct 2019 03:11:40 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT042.mail.protection.outlook.com (10.152.91.197) with
	Microsoft SMTP
	Server id 15.20.2327.20 via Frontend Transport; Fri, 4 Oct 2019 03:11:39
	+0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id AD3EDE95C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 13:11:37 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 90F4842965A9; Fri,  4 Oct 2019 13:11:37 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
In-reply-to: <1570152616-sup-1637@galangal.danc.bne.opengear.com>
References: <CAMKF1sqbBYpZn9a8CnG8Nc+4PWXTtGCZFEes=Ntxzq9_VZt==Q@mail.gmail.com>
	<20190930221119.30225-1-dan.callaghan@opengear.com>
	<CAMKF1srXJ6OA4sUCqJVOoAC7inNGS38UwWgY7TAdEPdMdj5nJg@mail.gmail.com>
	<1570152616-sup-1637@galangal.danc.bne.opengear.com>
Date: Fri, 04 Oct 2019 13:11:25 +1000
Message-Id: <1570158474-sup-7244@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(376002)(39840400004)(396003)(136003)(448002)(199004)(189003)(54094003)(2870700001)(5024004)(2906002)(478600001)(103686004)(58126008)(229853002)(71190400001)(36906005)(2420400007)(15650500001)(6306002)(26826003)(246002)(42186006)(316002)(70206006)(8936002)(21480400003)(70586007)(568964002)(7110500001)(966005)(8676002)(6266002)(6246003)(356004)(6916009)(6666004)(305945005)(7636002)(76130400001)(126002)(476003)(11346002)(426003)(446003)(486006)(44832011)(186003)(33964004)(76176011)(235185007)(5660300002)(26005)(336012);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR15MB3288;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28c0b934-ad1e-4dd9-52ff-08d748789376
X-MS-TrafficTypeDiagnostic: BYAPR15MB3288:
X-Microsoft-Antispam-PRVS: <BYAPR15MB32889FBAC7B37B457D2A2127B89E0@BYAPR15MB3288.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 018093A9B5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 517c8+rVBIwZhW0CWoZOSrd0AMaYwsSMhdeqgUOdw/SnAJhQwhoxxx8eB1rPYVkn41+wN8xMgViZXnlupMoXWrNwJr7Mg8zYHsPHluv/3kVtbXNHKSMst2XaCxIBlYtZhGLtEXodorY/m+sKW9c1qIXEZVOZWZNvVkuTj4e70aUhaoe9G1OaIkUrkdV1YpBNpoTJLZ8zuzQeAPmzv3+T2LptLK2AJeVu203NW/TWpsmDJlzqKSMwsUAQGaRyMSYdG4K7pabbBMXF8a2ZHOocOJICgFBLZ3ygWXSP8neEiMXcTPwf2Myr5xpSF/c04/cD8ris/hL5oD4b9Sc3xI5qOSYGv0ayp8+tcO6sDjVEHhuYGpd3fn/Akld04WgIHbCz/y9iRSsWmqEJFJ6LKhqadR1Eam+cXVrECa4gZMK/gdQ=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 03:11:39.9331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c0b934-ad1e-4dd9-52ff-08d748789376
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3288
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
X-List-Received-Date: Fri, 04 Oct 2019 03:11:45 -0000
X-Groupsio-MsgNum: 80002
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha256";
	boundary="=-1570158697-564311-13880-3372-2-="

--=-1570158697-564311-13880-3372-2-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Dan Callaghan's message of 2019-10-04 11:34:06 +10:00:
> Excerpts from Khem Raj's message of 2019-09-30 20:21:38 -07:00:
> > Fails in configure
> >
> > https://errors.yoctoproject.org/Errors/Details/272275/
> >
> > perhaps xmlto-native docbook-xml-dtd4-native
> > docbook-xsl-stylesheets-native deps are needed
> =

> Hmm. The recipe already has docbook-xsl-stylesheets-native and
> xmlto-native in DEPENDS, which should be sufficient.
> =

> The recipe I posted in v2 of my patch builds successfully in our distro=
,
> which is based on Thud. The recipe sysroot has /etc/xml/catalog.xml in
> it, and it contains the Docbook XML stuff as expected.
> =

> But when I build the recipe in YOE master, I can see that the Docbook
> XML is present in the recipe sysroot XML catalog... but the catalog fil=
e
> is called /etc/xml/catalog, not /etc/xml/catalog.xml.
> =

> I wonder if it has changed since Thud, or if there is some other reason=

> why the name is different in our distro...

Oh, I think I found it. It is due to this change, which is in Warrior:

http://cgit.openembedded.org/openembedded-core/commit/?id=3Db12686ecdd0b0=
bdb36c8d1a2baeeb66aadff1b8c

Now the docbook-xsl-stylesheets-native recipe will itself put a working =

catalog into the sysroot, I can drop the dependency on xmlto-native. And =

the correct filename is apparently now /etc/xml/catalog.

I'll have to just keep my older version of the recipe in our distro =

while we are still on Thud.

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1570158697-564311-13880-3372-2-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAl2WuF0ACgkQQuSr4gkX
maQuRQ//fYAVUIfmB/TJJiV1JMBKo70tqFRXoEltNHjK9lcHpsX35jYCcmQ9N8Ge
Gp5Vjynng1H+pBTiHzp9hC1BLrc+ju+mXC9Id5Sdjc/LVSz87Zu2DQ/H2pW4LHzq
gXlB+xHxGDU4QwxlEILx7h1sdcoyBQ/F8sfa5KIP9UZyOn5AP4GZVIzQGT9GQk83
+L3TQHHYg6qJDcFFTppvnJkW+Burd1Zq5iFEItLPASJHfVfnyHzVqRK5TtJYXufR
QQLyxL9pnKjSkSNaovD2Au4XDHFh/bMddyZAfnn7+TWT/e7gmv7ywBsmvRfY81V9
o8qvgHBGz0usz9mbVFZFyV/Oc1fpiZrezo8eWV9xYpR+T+4+pgseKq15VZp9+/78
PxxAKBRQNAungkCTJJE+sGUmrKuDkCkAn5PyPs7yyACyFuJDzVEhq9KbFll3Mkrv
xNzK4CUxHW4WZ87I8HUxtn2Xd1BeZ9EQNSyaH2WRlAHa/qO6xxRp/UxNMBOgyHRA
o5g7XcF3wKZZJXlvbm1oNGLPrVzzdtJBJpCn2jKsM+JHnNokk1p5VH5hXN/qyl/7
p3zM8GFENPzTMOxQGhqqqR2ORyucB5ewyV7S2Cr5wg3N4ECepXX1XAY+ck6L9v/f
abEC3CWIU099s0xv+nz9K4EDSUcemOGba1EgEjLCYMEA1YXFr1U=
=3jfe
-----END PGP SIGNATURE-----

--=-1570158697-564311-13880-3372-2-=--
