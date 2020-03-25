Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.69])
 by mx.groups.io with SMTP id smtpd.web12.16368.1585154939418465172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 09:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=Qs95FVeO;
 spf=pass (domain: xevo.com, ip: 40.107.244.69, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akdrC6juxyZ/QY/T7uQzRK+kGxnGXBNCk+5qknf6/bWYXhFG+cogwvfswM2eZZnmpA3uKAGjcYJ4zl96DaQDhF3yToRf34b5j4zhbl2oUG6Vtjpa/Sd39OFN9Edyr3F7nmiyc7ulOgRnESUkg/RRCvh/ED5FYeHuGYzPLHChg7Tia+q+pio7kYwxApgdiVVHg6Gc6JdjXOYOR6uDv8NzwLZVvjSmCzjKTrNq+uLaur9TfID9VWvYs2s5OM0YrH/eIcDN4yv+JhtmHtuSFEQHXghVLxI1AkpuDkMjUmmlHs/CFW+rLfXSVkBQeXsTmqJnuJy55gvMXNgmJtGDJDEoag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud9ws+BZ9kPiHD2NaSHpkA65uPmZWai79S+MDiRp3sg=;
 b=lzLoRbnbuaMAlTSRkxjA+/0TdvmAK2D0BgvZkCyWyy+9XZgWkqwmJ5+KvOlkJPzEPfL7AzcAY8LJtKsWW5ryupBxehZzoygXxnh2Y1xgLFFsCp3P0799Qqy1mxW+ss0bnkVkilSjbrXNLRclhdacgVxtx6iHuLql1pMLGU2x/o0CjmL77nxrstgy/dfQTtstooRCJpePMiPaYb9AdFlcJd03LevlZljVY7/W4sWR8YMDx/w58LEc9iXtSo26cKLbdmS0RcfUozWB0UD0cIUAyeKPMnuo21sF+SbROT0Yd5KAILZ6jhDLvjHnwnKDepyHn+sHBEwdqbLCzBH1hw+EqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud9ws+BZ9kPiHD2NaSHpkA65uPmZWai79S+MDiRp3sg=;
 b=Qs95FVeOhyvOggjSrJ0+qTtzlWHcTTVUjsPn9RAb4UgPJkYeuw6HVOPsiY6sHM0paFOxwARh+AN8Z8yLfBnShjEXtT86ci+CgsCz8+072XJf8QNo8gU2VYIx8eZB/A8Q3JQWUwRxEn+yk+LvNfVz+c3kP80VL4h4YUUWB3bHyRk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2091.namprd18.prod.outlook.com (2603:10b6:907:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Wed, 25 Mar
 2020 16:48:57 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 16:48:57 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH v2] python3-pint: upgrade 0.9 -> 0.11
Date: Wed, 25 Mar 2020 09:48:38 -0700
Message-ID: <20200325164838.977493-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MWHPR21CA0066.namprd21.prod.outlook.com
 (2603:10b6:300:db::28) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.corp.xevo.com (4.14.243.50) by MWHPR21CA0066.namprd21.prod.outlook.com (2603:10b6:300:db::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.2 via Frontend Transport; Wed, 25 Mar 2020 16:48:56 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [4.14.243.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42959ad0-6114-41a9-4dba-08d7d0dc693f
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB20915427A83F7A0ADD8B40F1ABCE0@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(366004)(136003)(396003)(346002)(376002)(39850400004)(86362001)(107886003)(8676002)(956004)(2616005)(2906002)(4326008)(6916009)(186003)(16526019)(1076003)(26005)(6486002)(6666004)(5660300002)(81156014)(36756003)(66946007)(66476007)(316002)(52116002)(7696005)(8936002)(66556008)(81166006)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JAjzhO8R3z83fDtUvypVyaBqqA5xfdFEfKFOgoQbw1gaNqfwUeUFraV6DFj2yrLJVAcG4aRoBoz11tpWe3bB7AnEvxWOoX9q5aic+SvcatcnBCd7hrz35CDsePwtyBvYNyxvo8M9ROExSf36+IeliH48ZazfzxUD2mCVowbYkEHXK1StUR6Tcp4yThzCMWy3wPIPGj28G+GRUFa2AcjUEyq0aZ0FXoqywWidJIYZwHfcAq55ZwhqCisxxT82PgaKoC7glIb9wC9hhGzzy8l0Oz9hHAgwEg3Zb3cBHCB/IyZW8FpTxwOeKeF8eNCmrw8rxN7XYoEvdMrkOL1/9AWyZyUjKjr7fLyg5cnmtdGzLYS0ctFY4XEAQcR5xP9mifYp35nHLtJREnIr+jdrNWKJpjESvS02X9uFKYdRNr6tXh2AOntrrFI1BZcXJaKYZtUN
X-MS-Exchange-AntiSpam-MessageData: 
	YXCYbWLe3CbBMDHeuTMA+HqHpjZX20Z9kc1qj1Qrvm3zbgJw+k6O8vqi0d8hYpNVope+pKELz6Q65S1L39z+bF3lwCc/4qZGEw15sdMqmw20xy2oaZ9bkfxd6XhI9c049Kp4W34CTuOum++h9U4Xag==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42959ad0-6114-41a9-4dba-08d7d0dc693f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 16:48:57.5712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OrPnN8u+QkeU8XrfOvwZUjgNXWzSyEU9dhbY7Fzs+yJsCo2VN2yk/Rh+D2FVRQm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Also add a dependency on python3-setuptools-scm-native to make this
build with the newer version.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python-pint.inc         | 6 ++++--
 .../python/{python3-pint_0.9.bb =3D> python3-pint_0.11.bb}    | 0
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.9.bb =3D> pytho=
n3-pint_0.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-pyt=
hon/recipes-devtools/python/python-pint.inc
index 0900d91d7..4a9300900 100644
--- a/meta-python/recipes-devtools/python/python-pint.inc
+++ b/meta-python/recipes-devtools/python/python-pint.inc
@@ -9,7 +9,9 @@ PYPI_PACKAGE :=3D "Pint"
=20
 inherit pypi
=20
-SRC_URI[md5sum] =3D "d0681cb7cfaca9fc68ce7edab0d08d88"
-SRC_URI[sha256sum] =3D "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d98=
10a68a561fe4e2"
+SRC_URI[md5sum] =3D "3a8f29c2a30efd35af4b5c5a224ef965"
+SRC_URI[sha256sum] =3D "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c=
367da359b5cf4d"
+
+DEPENDS +=3D "python3-setuptools-scm-native"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.9.bb b/meta=
-python/recipes-devtools/python/python3-pint_0.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pint_0.9.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.11.bb
--=20
2.25.1

