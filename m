Return-Path: <mns@gomspace.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140129.outbound.protection.outlook.com [40.107.14.129])
	by mail.openembedded.org (Postfix) with ESMTP id 56E2A7F9BD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 13:42:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=C1/xtpGKoo4cZjl4PnViiNl5YRXUkXl5Z3WgSJILKvuU34+sh+imx8dJz6VIsWB9O+WgtMXVFLDfyemDD8fySIq6Ew1Awl29TMHxQy1E4qHx0Rb99aLH7QBcKsnWvG/DUMltbVxA4COQOgpT/4j4pMBHstVsIpox6a8ago664z4tB9x/PN/4eFC6/8Bqd56Xhkzem+e2S1yLAphJqAGAq0XS9gAOvwKCtGsZsgWedv6r3BpDjcEvjJZrDO5ez93vOC4l+z5hAExA5SfLNevdFpQgu9ObSPBlXMJ4u6y3SAYLVT3kxn8la/EFEPoJRyj+kgRmhM8ZK/5U4yBFbA8fNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HgqEKXJL9/ZcfFYQaJDrlBQWlyoQt4xSPmf8IP4vMAU=;
	b=B9BcSNjDnyk9jABAsUSXLBO9lo5XRbfTIqhQHIdAeAQMfkvWBS9VqKTpcoH/P6MkdVO9foQVV7whkHP3ukY/eobhVTNf9sXScIyEnNFABLFm1Ql8c4IskPOflW2xqLKkWe321auQ+YejOZk5+lYv2/4kA9pmbhDQYcn81vKta8ypIOVXWyT7qrnfNDZL14ItebJZ48zSb5uK8P9sEXcrmJ+mooG0LKJ1jd6zTwp0sdYR88otyNEn8yxYZ8CMkYD027NiIU7Cvc/T+WbnQa6fv5dtkCpZ/EZKc/5Cw1hJoqWnZjjblI4swOxHNitxTGxxPKG0iG3DebfVP6/LeqC+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HgqEKXJL9/ZcfFYQaJDrlBQWlyoQt4xSPmf8IP4vMAU=;
	b=ZupStx77eQno115pAEQrPr41kjOsFGhUpmNLcsBX3yXsdU7lfOA3S3ER8TuvisR9t8wMHsZ0vQgTERLkBV76MgUp2OqSm/RtMuItYzAMHGho6I08zkluUscNgBDXo4owIFBhvBu245Q7vgbGy/m+veIUHenn++fHLDu1eUMkfu4=
Received: from VI1PR08CA0109.eurprd08.prod.outlook.com (2603:10a6:800:d4::11)
	by DB6PR08MB2840.eurprd08.prod.outlook.com (2603:10a6:6:1d::31) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20;
	Wed, 30 Oct 2019 13:42:23 +0000
Received: from DB5EUR01FT051.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e02::202) by VI1PR08CA0109.outlook.office365.com
	(2603:10a6:800:d4::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.17 via
	Frontend Transport; Wed, 30 Oct 2019 13:42:23 +0000
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
	DB5EUR01FT051.mail.protection.outlook.com (10.152.5.6) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 13:42:22 +0000
Received: from Ex01.gomspace.lan (10.0.1.60) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Wed, 30 Oct 2019 14:42:22 +0100
Received: from Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20]) by
	Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20%4]) with mapi id
	15.01.1466.003; Wed, 30 Oct 2019 14:42:22 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH v2] libiio: Conditionally inherit
	distutils3-base
Thread-Index: AQHVjkKSZ/PXJ/kysEeR9AR2Qt5dSKdyEf6AgADeRS0=
Date: Wed, 30 Oct 2019 13:42:22 +0000
Message-ID: <e807bfbc855d425eae5ef3444940fae7@gomspace.com>
References: <20191029102000.11329-1-mns@gomspace.com>,
	<CAMKF1spaJvH1AS15KK1MUwD7HM-UKiGtb1oB9eRRBe-t9kxHyg@mail.gmail.com>
In-Reply-To: <CAMKF1spaJvH1AS15KK1MUwD7HM-UKiGtb1oB9eRRBe-t9kxHyg@mail.gmail.com>
Accept-Language: en-US, da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.8.211]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(396003)(39840400004)(376002)(136003)(346002)(1110001)(339900001)(189003)(199004)(108616005)(105606002)(14454004)(3846002)(2906002)(102836004)(508600001)(24736004)(21086003)(14444005)(6116002)(33026002)(6916009)(356004)(6306002)(47776003)(966005)(305945005)(26826003)(4326008)(316002)(486006)(7736002)(53546011)(336012)(229853002)(23756003)(76176011)(40036005)(6246003)(5660300002)(36756003)(81156014)(81166006)(8936002)(8676002)(53416004)(446003)(126002)(76130400001)(70206006)(86362001)(50466002)(26005)(2616005)(70586007)(11346002)(476003)(8746002)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR08MB2840; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb0a9a6a-8cbb-4bec-4c71-08d75d3efe22
X-MS-TrafficTypeDiagnostic: DB6PR08MB2840:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DB6PR08MB2840EF124C8BEAD6D76E2820C4600@DB6PR08MB2840.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YyXImjKShBfrUKhTMmfsRm7RzyBJi+vrjLcszkhKHv30cFeY0mDVYdqCcaHnVCZnlopKwbxjidbuMQXW/tMKU4eti4ajc2tCzGZhgZSwF7sKFP7iITqJq/9PIeR98yOk1CWtH21EdFPEq53iolLrMvaLZeI4DnyDoPr6oUs3OcxMSh/41w5vLqIj6EKMAFIGVT8IFa/yZOZCY77vP+3UA9kr7Qaa5Tyrq3Gc67sIAFKB0gqU/PE5NbQlrRgA/RczBjj/BMyUkHdqkUw2lyTSvSE+w98ZZJQERFDgY1eK9/DDeCf38FNetvJwk3Vc+XlSxRwVPuNsCSWPDDg/yxR4w1HBcFWbBxSWzetfrg0i4pjOp3X60a2zFwAbOA0ouNJ9noE79isMJz3tSBilFEStyotKGw3c1SQdyC9Ynd6uxRWij5ud5AxtRzYSVLVlpC0lr973ZVV/vXBpcZ6ClfGni1gMLgj6A5KVzknLl5hdhjw=
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 13:42:22.8400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0a9a6a-8cbb-4bec-4c71-08d75d3efe22
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2840
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] libiio: Conditionally inherit distutils3-base
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
X-List-Received-Date: Wed, 30 Oct 2019 13:42:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

_____________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Tuesday, October 29, 2019 10:27 PM
To: Martin Siegumfeldt
Cc: openembeded-devel
Subject: Re: [oe] [meta-oe][PATCH v2] libiio: Conditionally inherit distuti=
ls3-base

On Tue, Oct 29, 2019 at 11:21 AM Martin Siegumfeldt <mns@gomspace.com> wrot=
e:
>
>  * inherit only when libiio-python3 is build.
>
>  * also add PACKAGECONFIG variant that allows python bindings to be
>    enabled and disabled. It adheres to the current CMake logic and
>    defaults to an 'out-out' approach.
>
> Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recip=
es-support/libiio/libiio_git.bb
> index e6e0eaef8..ec3a39de1 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "git://github.com/analogdevicesinc/libiio.g=
it;protocol=3Dhttps"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit cmake python3native systemd distutils3-base
> +inherit cmake python3native systemd
>
>  DEPENDS =3D " \
>      flex-native bison-native libaio \
> @@ -25,10 +25,13 @@ EXTRA_OECMAKE =3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=
=3DON -DSYSTEMD_UNIT_INSTALL_DIR=3D${systemd_system_unitdir}', '', d)} \
>  "
>
> -PACKAGECONFIG ??=3D "USB_BACKEND NETWORK_BACKEND"
> +PACKAGECONFIG ??=3D "USB_BACKEND NETWORK_BACKEND PYTHON_BINDINGS"

this change is not needed.

>
>  PACKAGECONFIG[USB_BACKEND] =3D "-DWITH_USB_BACKEND=3DON,-DWITH_USB_BACKE=
ND=3DOFF,libusb1,libxml2"
>  PACKAGECONFIG[NETWORK_BACKEND] =3D "-DWITH_NETWORK_BACKEND=3DON,-DWITH_N=
ETWORK_BACKEND=3DOFF,libxml2"
> +PACKAGECONFIG[PYTHON_BINDINGS] =3D "-DPYTHON_BINDINGS=3DON,-DPYTHON_BIND=
INGS=3DOFF"

this should be
PACKAGECONFIG[libiio-python3] =3D "-DPYTHON_BINDINGS=3DON,-DPYTHON_BINDINGS=
=3DOFF"

Ok, patch updated and resent - hopefully we are closing in :)

> +
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'distuti=
ls3-base', '', d)}
>
>  PACKAGES =3D+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

