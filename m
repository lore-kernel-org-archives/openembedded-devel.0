Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.76])
 by mx.groups.io with SMTP id smtpd.web12.1502.1591391782075908828
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 14:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=NpjIvOfX;
 spf=pass (domain: xevo.com, ip: 40.107.94.76, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ig7RWSuq0B8AJh+AMV4DauH4USJ1VibyfUy4/F6xY4+29vMtz8LicsMfI12VuTz+xeo7qUTNlKFBqV6tCwYxO8vxrVg2WHm5AxcNVshpTyLkW1GywxR+gELY6SviwL27VpdM7LpDKRsuq0cBpm8jZol6Uo3HOj48yj2O+dmnr8sy5JsW1C4x92Jc1F3BUjDrLEiHLcuFMUPrlO60/eP71msJn7G7II7nAkBy/Xl4Y+7y0DETo85UflANsGI77l1PmweGUXZB/zlxu5TeX7xF/qNCh5GRn/BS6re7hN1JhCOgrm6bvP4hksgIhJETQW4LukI6/Tdggz3vtSV7hX4sIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OABbXC37kai1wPRiPIsnZPzy43hFrpMgQtunXWX1LM=;
 b=IORJjSFR5+I0c0BwPGz8YgjzvkVqqDV7LSut4a0wjBBtfb1j/mjJmK6T9DrphkYmSyX0/mnx5Kc4KyGusKQHZLQlZyKRD1TS90u2eJwor+6ySwZPNpKqANwhgWeNCzH8cj311cWGVrtI9EQGayHZ2JjLBULMrJrkim5f5yYTHJ4SfCkPaaGuIR1zp4+TCrfBqV+JSGo/Ux3b2YVB22jJwWRWvTy3SJYd0MphM0SfMEtfTbW9JenLpGizNWNTqdq7dxQv6yUmL19lpPOU1ND5+AoDYh7QCfxW2c+K3B52UFW6BiniQIT36ZnkI9NhaO8pa3+UJDryt2iCrU7TtJkLjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OABbXC37kai1wPRiPIsnZPzy43hFrpMgQtunXWX1LM=;
 b=NpjIvOfXJpahopcBX4E5rkkpXv7gMr0d6+us3xjaaxPFWpkk8A7LBF2yp22j/S0sOxc7JRsJmLKAELI5x1nEY8VhNeb5mg33KgEAEZyW5cu5/4fQEUKB9FSLniEE/avUHNRk1YAEmsuae02F63fs9IvR1AwJCv3ns2e6L2VLNXo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MWHPR18MB1183.namprd18.prod.outlook.com (2603:10b6:320:26::22)
 by MWHPR18MB1373.namprd18.prod.outlook.com (2603:10b6:300:d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 21:16:21 +0000
Received: from MWHPR18MB1183.namprd18.prod.outlook.com
 ([fe80::f183:20e6:b346:a1ca]) by MWHPR18MB1183.namprd18.prod.outlook.com
 ([fe80::f183:20e6:b346:a1ca%8]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 21:16:21 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-networking][PATCH 2/3] msgpack-c: add native, nativesdk support
Date: Fri,  5 Jun 2020 14:15:59 -0700
Message-ID: <20200605211600.575432-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605211600.575432-1-mkelly@xevo.com>
References: <20200605211600.575432-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR21CA0050.namprd21.prod.outlook.com
 (2603:10b6:300:db::12) To MWHPR18MB1183.namprd18.prod.outlook.com
 (2603:10b6:320:26::22)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.corp.xevo.com (50.35.86.191) by MWHPR21CA0050.namprd21.prod.outlook.com (2603:10b6:300:db::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.0 via Frontend Transport; Fri, 5 Jun 2020 21:16:20 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [50.35.86.191]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5be7e96e-a19f-427b-07e3-08d80995b1b5
X-MS-TrafficTypeDiagnostic: MWHPR18MB1373:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR18MB1373181861CC4A31617292D4AB860@MWHPR18MB1373.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7fFplx7eoqSGWvrszBBDKgd9PulZMDBd2mQbsF/mzjnVLCkk5KrGo1c5/5r2GczWLxbnVoV5w3/lrxCivDrcRCXCswZBOgnGAVCorPklliqnaOgIzp/OEqnJ/M9vFfdI6M9ANuAcN8D9G71sbSD52mohiF7lFhbBzD02h+G0Bk70Ys2K4ejAXxQsEX6pIWg3OEyQzKAnO/hGu3cLbtNSOCpUJSBB74QxQMXJqKPaefZaubTWXo1JIcgljHi0pw91UvPEWIdKMIsBxoQ/DdBhlYGsBbHaPTQQhOIngQPj8rGwDxhBFQHXNVNO4h0MHGki0UkX1IHTHrSqalUTisiQgQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR18MB1183.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39840400004)(376002)(346002)(136003)(396003)(366004)(86362001)(6486002)(107886003)(52116002)(1076003)(6916009)(5660300002)(4744005)(7696005)(36756003)(16526019)(2906002)(478600001)(26005)(4326008)(956004)(316002)(8676002)(6666004)(66476007)(66556008)(2616005)(66946007)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	wQ5maI767Erl1ssh36zgMv+qmSuCvarIVPs42jZT5blP4Hl6pqZyAt+m+PfU+0iESkUAWL5OHi944bcraZa0bclMP2FIth88JYer1vGD0yT8toEmShrPRddAizSCWVMh2quIw4yBZTwEO7HxUgGJMhGGXQfHfismAJ3kBGXkesYyqV3d2slizwEf5w9v7qOD2M64TY7gSYUBPhRpJG2Q4kLK9s+xtnZOq8OAqH7o7tHvVqwuvaeMjP4X+jGZAeECGZCUBvWmdaP70A5YMpXpwXqF1/8m9kI+KId2uXYnlgRyN6/NvghpNSjjZsC2RiZaY1FdSlMKPTTgWSTtNbm040eqLxSKwBm17/BmI/2PWHkypqtnhVYFRIkEieuSTDbuv5wediR7VdK+t3wfo4ccXRVCQ6q1k855qIky6kwjGu1IcOF1YlfYHeLiDe0tr6c/DfGNlOxGwxN9NYl411cpAc/qlhCziSPC+h6B2NAD+eM=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be7e96e-a19f-427b-07e3-08d80995b1b5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 21:16:21.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1dAa0i6lEYd2lAE5MmCMxtCnz4682kEhNNahi9MfA8q+Kx1p36n0z06jAy5nltV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB1373
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb b/meta-oe/=
recipes-devtools/msgpack/msgpack-c_3.2.1.bb
index d410dc6e0..5224f32b0 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_3.2.1.bb
@@ -17,3 +17,5 @@ SRCREV =3D "8085ab8721090a447cf98bb802d1406ad7afe420"
 S =3D "${WORKDIR}/git"
=20
 inherit cmake pkgconfig
+
+BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.26.2

