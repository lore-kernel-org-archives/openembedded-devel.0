Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.76])
 by mx.groups.io with SMTP id smtpd.web10.21607.1585166224719435137
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 12:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=mVHDY8Hq;
 spf=pass (domain: xevo.com, ip: 40.107.70.76, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7PU7I02Wlg+EqUT3iX5tPP6y9Zx+tyijXr2ZGPEQulEqaQosjLqvxEN+q0B1Wvo3sOZj5zqSiHeOmVdtuYKwOvaslpNMhCqOGiGfDOOr/I00Ao9fLh1WeyuUuTFe1k/ij9d+AG3jP33bLsZfndd77LYxn7CF+x6Iv+M3WO1MjK1RdI2alwpf/sHdpW7S9ZDz+SP/X5WA7efhX59Ko1sV6YWZqFxi5ej/aiXPClzLmZCEADelkyi98UJfMYWUWsWrHk+1NCJtWbhPqS9JH2BKn7ZN7W8PLqnVaAAncXCTVQ0JYGOEcqIYd+QaYmRTqHLCaXbuAg/ro9ZRYFsyz15Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwQTFVgM5I+fjY50ojsIAkUyGY5tZtXJGlMO4BrttFg=;
 b=Xu1vx8tFcL0/rr9RWOsbgx8nSPxfwakxlBvF/1eYf7jMyTX/yqLoAw76/aWynnQr5AB6oi7BV+6eZ1cGHLixaY+qyKGy+l7bKq1S84+wTDK/+d2mV4FQ3ctqNkDY8p7R5AgiTrthSwLWfe7B+pqy/SEzTj0xhmBgHGYkT+uvU/VF3ThDQMe/LN/ZIll5It33A4qWLoCW42pvu88irg0Zfcvdj05F5sgXWaTN2ivc7Q5zNsPv0S512Hk67s5fUEZ+u1wxW0QUP9n4dPIDJjuxaj0c5RtS4Td0ksyZE7L8bNlbMYUEI/6lhdTJmyDSph2Ev4tkDP8FSRsln3WEmV6lvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwQTFVgM5I+fjY50ojsIAkUyGY5tZtXJGlMO4BrttFg=;
 b=mVHDY8HqWtq6AeAuyMP/JzWFSGxFIE93sdyveKLOI8qKUk7DW5Fy1lkL6z4BrGn1YX71UKulkLAXmZfeMw9/zOIjYtyc/+WoK08uyUw7hQ6jkbv4tFncwP+cz1CRy5Pk35ba8i/fgapfTPR5+CHffbBkNeSVo/Zqwgay4TcNFww=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2090.namprd18.prod.outlook.com (2603:10b6:907:b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 25 Mar
 2020 19:57:03 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 19:57:03 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org,
	mkelly@xevo.com
Subject: [meta-python][PATCH v3] python3-pint: upgrade 0.9 -> 0.11
Date: Wed, 25 Mar 2020 12:56:38 -0700
Message-ID: <20200325195638.1001610-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MWHPR14CA0046.namprd14.prod.outlook.com
 (2603:10b6:300:12b::32) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR14CA0046.namprd14.prod.outlook.com (2603:10b6:300:12b::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Wed, 25 Mar 2020 19:57:02 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 314cbcb6-d18d-4957-b014-08d7d0f6affd
X-MS-TrafficTypeDiagnostic: MW2PR18MB2090:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2090871D9B4556533FED9C6DABCE0@MW2PR18MB2090.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-Forefront-PRVS: 0353563E2B
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(376002)(346002)(366004)(136003)(5660300002)(66476007)(2906002)(26005)(66556008)(1076003)(66946007)(6506007)(81156014)(36756003)(86362001)(8676002)(81166006)(8936002)(6666004)(6512007)(2616005)(478600001)(956004)(16526019)(186003)(52116002)(6486002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2090;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k/3oWpFv6MCidUsoenBq1EWK6JmAzKEH7psT7jnibhIk/2BiKfP0V5aQXbLLERxVSSF66OjsgNUR7ehrt8PmNPSAlI+ywVWwBuusbujpSEAo8RDpge1PhcludB33TkqhRqTtyWg5vpBoY62BW3xydZCC+sq/7Vlv2nRExRQ+85iUg4m8tefQyU8G7yZKHptFFb2clNNHOdrVb53wzjEvnjWjxK2TKiorylPy6ZphPaDAmzpxBdLgUAL3zZ5klFZVgYxcU1t0Q3Du1gu0F2u2NiKJ+D1SBdHew5yoswb5LOeJpYTdH5b1gAVNP6R4mZXGamTDuao0lkPegrMr05SGemMTg6tJtEMlT3qmDKd9LmKCO/Owhe/hLxjFZgdIRboUeyKzk9tmtqJ9Vcil41FT7EW0FYRLkxbzRfbcOJbM9utp/Ap+YanVtfrEMUj2HOFc
X-MS-Exchange-AntiSpam-MessageData: 
	8uGuQZoiaiN7AC979c9LMFhGFdP1R0Vwuhc8Ha/MYNyAxSnq7n9ra/OFc6MuJk+ikyOaUMfRihN96jplSSuMtuk0C0Bqg9guZGgRtWaFFdcOr8YgQTxy5Zhby6kbAosoNJVwdIHFb5GzY50pP3vvWA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314cbcb6-d18d-4957-b014-08d7d0f6affd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2020 19:57:03.2073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO88Suh+QDA6Z0p9yUxUE37emaeJp4FhYkalxWtUsHzBE1BF15JdGhaaIg2Cq0iI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2090
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
index b40800814..c58dc9076 100644
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
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.9.bb b/meta=
-python/recipes-devtools/python/python3-pint_0.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pint_0.9.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.11.bb
--=20
2.25.1

