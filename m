Return-Path: <danc@opengear.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760072.outbound.protection.outlook.com [40.107.76.72])
	by mail.openembedded.org (Postfix) with ESMTP id CEAC67F633
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 03:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EbgmkUQmouw4ylpz7FiTjxfOxh48WaWYN2umtPsMS2zuEBj95Q8rkkN3ZqvZGpwP9Hzn+459nicJeZD38QwW8jZ5RJ4GasQQmwdq6sI1BmixRE5/FOoYGEAUTMjASy+UOiHgeclnkRmvsdWm30aU2liSLJWjoa3q4zWvHE7v6hIdHng2TkmfEn7Pzdrxta289cCLGva+Uyom07EVVBKqU3LU9DHXtcG7oqDihmg62N8vwUkhHhi79Ojc56NvXp6SNxGu/g+GACRKaHT3EafpAdPct9s5eB+g+f5KqNosT50nGXtxYsS/zQ7eJ0+WFc26s7SR3GiDyHNK7I9KiFQCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=olEToWYF4zYUYie1idJ//TUXyJRjbIiOsiAcaD0qlF0=;
	b=HnHKe5TFQMojfQUT3X5oBbPIViBzAAxdIFV06W7c9JbbucMoefBB907ZBjw6bomSgL3f55Jy75xQIC+L4ymZ8KHVQa2G6rQxBkjjuqRbSNfizjfo5bCNuYO6Dahj1gAAEnuizibC7kIZqsJWw8hmCd2r95SPezTOUOg01RBHehfFpNKc0pE+x8o/hr74ltfbGvrCXYM34FK8+3XCQpjKmh/6c2tVnyJYgmHYF8qEqBZTgr9xr8KIlC9qV6j7e5Sq/wwG73M0bspYaJEIp2UOpw26sMsIcVdyRvenGmgQKTY7KnqvdWmwIdYP6o+seLSUoGcmtJlo1AIYVHNZggk54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=olEToWYF4zYUYie1idJ//TUXyJRjbIiOsiAcaD0qlF0=;
	b=PJ7HGbx8l7UmcCKjaJQ8a3pCtnJACinXQ61O1jEDjTas/JPDCWXsiQ17lpR7FhsjDRP/a9hvqvGOMYsm6LyDH+XboOdpTk5JKF5CPWbMogt6Ah4NOdmsn6prlew1qCvBOyLxMdqTfFVwoOnFVLO68wzkx+5caJclqOh1jFt9qhs=
Received: from MWHPR15CA0037.namprd15.prod.outlook.com (2603:10b6:300:ad::23)
	by BN6PR15MB1522.namprd15.prod.outlook.com (2603:10b6:404:c3::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21;
	Mon, 26 Aug 2019 03:46:29 +0000
Received: from CO1NAM04FT041.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::208) by MWHPR15CA0037.outlook.office365.com
	(2603:10b6:300:ad::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via
	Frontend Transport; Mon, 26 Aug 2019 03:46:28 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT041.mail.protection.outlook.com (10.152.91.18) with Microsoft
	SMTP Server id 15.20.2199.13 via Frontend Transport;
	Mon, 26 Aug 2019 03:46:28 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 74392DFC7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 13:46:26 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 605D040EA94D; Mon, 26 Aug 2019 13:46:26 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-reply-to: <CAMKF1sqX0ZQHNczqZDbJKSEzBjkCgrQ273vBNXV0RSyLX+yUvA@mail.gmail.com>
References: <20190813051518.27073-1-dan.callaghan@opengear.com>
	<CAMKF1sqX0ZQHNczqZDbJKSEzBjkCgrQ273vBNXV0RSyLX+yUvA@mail.gmail.com>
Date: Mon, 26 Aug 2019 13:46:22 +1000
Message-Id: <1566791105-sup-7030@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(39830400003)(136003)(376002)(396003)(2980300002)(448002)(199004)(189003)(6306002)(71190400001)(186003)(33964004)(8676002)(5660300002)(356004)(8936002)(6666004)(235185007)(568964002)(76130400001)(70206006)(70586007)(2906002)(76176011)(2870700001)(486006)(6246003)(476003)(26005)(126002)(21480400003)(52956003)(6266002)(336012)(446003)(426003)(6916009)(305945005)(5024004)(5000100001)(103686004)(7636002)(11346002)(229853002)(246002)(316002)(478600001)(36906005)(58126008)(44832011)(26826003)(42186006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR15MB1522;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d71ee026-7071-4eaf-7eec-08d729d7fa2e
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328);
	SRVR:BN6PR15MB1522; 
X-MS-TrafficTypeDiagnostic: BN6PR15MB1522:
X-Microsoft-Antispam-PRVS: <BN6PR15MB1522DBEFB6C2E99502920038B8A10@BN6PR15MB1522.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: R8GjrREgCXxs3Ep9nOGaFKQt3zB4OsCpwljboc7soBPT3s3Rj8Ned5nVmSgqt/mQ2O9/CVlMbqOIv6IrpDOExYfgCfuBoLfkk3wbE3s0fHA1PuGRLnGmKVu4NXtu0sPGFlhM/6HDrjzVK2YDmZcrzrA3gZOL0XbeQUbeHpRpn59yHVHmCUjQ+D392DMiF54SDLi0WlWNaIbzZwW/0vHSZltM0Q6eLQoC1wsEnB5lOuLpf7JE0fR9tYUun2OtLNCUXjErtMX2rOQbx6Qvs+MZke2c1eitSLkPvqT6mRTTrkqfm8uJ9vkHo+FOoRRtLHEIXF5TiTvKiXl3X/K7NU2g9ses60eEoWWHyIN2V3LqMDOU1EXUZrlG4CnduhsyTCYJxrK8sQWJSI962p/0zZPxyhbTmniDhzI9ZYmoK2ZOuCo=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 03:46:28.4099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d71ee026-7071-4eaf-7eec-08d729d7fa2e
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1522
Subject: Re: [meta-python][PATCH] python3-pystemd: add new recipe
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
X-List-Received-Date: Mon, 26 Aug 2019 03:46:33 -0000
X-Groupsio-MsgNum: 79298
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha256"; boundary="=-1566791186-376517-16696-772-1-="

--=-1566791186-376517-16696-772-1-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Khem Raj's message of 2019-08-13 18:28:05 -07:00:
> We have to also check for systemd in REQUIRED_DISTRO_FEATURE
> or else it can cause errors e.g.
> =

> ERROR: Nothing PROVIDES 'systemd' (but
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta=
-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
> DEPENDS on or otherwise requires it)
> systemd was skipped: missing required distro feature 'systemd' (not in
> DISTRO_FEATURES)

Oh I see... I haven't used REQUIRED_DISTRO_FEATURES before. I was =

testing in our distro which already has systemd turned on. But it seems =

pretty straightforward... I will post a v2 of the patch.

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1566791186-376517-16696-772-1-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAl1jVg4ACgkQQuSr4gkX
maR63Q//WaePZ4snKQObRWFbpenuMJet4QFgRGLyb3U2xnyuWAgLI7ouaUXuIo7H
Avhtxe7ryk1Z7NnfIeA1hmCOsPVJDBgHxoHLu+PBa5DjOnzqdtvBcdpw27bx7KvL
8RdYlnzi0FezXQNyTrrB7hpvJoVjpMDTboSUmum6+8xV3m5JrU0hipYjopwcP0Ys
FXEEo2/eecZWuR/YdiTfqTUecriv6UTChB8h/lGeQtUNnTMzv71kcvQCWk/xqSjw
cRcou97ouAG860f49KTV+acu+5caxgDJ4aX/TR5AXCXMqQ7MxZTzjvoG45mjxP6u
8d51goTsLhjmY9y8DNSBtVvA6Wrs/NPEcCeuaM1lq9yQig3JRh8WBsn5k6f7N5HI
vH0QNlwcmq2FuLWIpEqKBPJClWgWWuY1JfGMnP/pqsEwoepjrFK/t9QKaTQCIIW9
1EBCF9UBRXM4g+gZnpEwSlYxumUnSNyU8GIRrX0Guy0O8y2qa+Gj8+dfF9qwLzb0
14+zyT7knp2BKo3A4quitgBnKm7TOS89PyDph8ayq2QYsc52BH07JtoVO3UIXwhM
dAJGNRGtVhqGSKrldI6V0imDXoYAKqThk/cQ2d1P6GPSxC47PngDqXKz6y+K6njc
ip9VrgszIRqs/YuPrCiXplkkkzsuPo4tGNAgMiFGde7t+G42Q+8=
=X3t5
-----END PGP SIGNATURE-----

--=-1566791186-376517-16696-772-1-=--
