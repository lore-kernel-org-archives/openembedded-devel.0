Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.293.1585090151533401776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=RCAX8w8h;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+qrHZDq9sc/if0CwuN6YvHtu55rwNf2qk937Kp7xNVdpnkGrqtIqtn5JWae82y22Tn9iQwtSUYQxoonIBSbnALpgr13zwkiF/2p3fZ2s27YtT1Md+ldVfmkfObNWXSJdjscsVpVGM7gq8Pd/5oK4/2O0DZMpLW4ywZiPMNKpaT0yMBd8p1EQoj5rbdF2q9L9HYmc+aQeaPSRHswbotrsZuEY6COH3bJB39tjm49JTlYDiFJFwgkGl7Zcpog9drwoXncSmWi8iFUWTnQk/krAeWCK3eSyL/R3m/RJvA5PrRueq7La5O0uYuhpDS8GYcaJPtoqxFBwBTMHdbf4e2Rkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boHJ9GkevvDLwlh7DifgMW9fXWkdm8ZFTHrkBxZL5Iw=;
 b=Di5gJtuekT4AYCPUDsqrfbnwkbp+4HnW25d6tI7SKulmzkBKzzKVFOQm+KaILIXCOnsEk9uJV2ZEiemLpeiek/PlPREPa5dkmFXMt/Q8HXYYoBL5/9X2XkPZ84fm2zjOc+9uf+ewTjLvfjPjv67Oi4F0188BhnXywEx5eDS6OuSl/08/76DuhKI7WnoBjuE+pXLaSDcBaRZ+Gpu9sjZdYC1RmJMtjXmJv9ZZly+pp8c+AhnjzTSqyZHRh6amvzjtxx0e32xw+yb3m7x8XZq2/izL1kqPgzacLw1ZxwtfPkHIuxbHsu/yQvVw9h5sg3fgnubqQOctAV1Cpl/9Oghyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boHJ9GkevvDLwlh7DifgMW9fXWkdm8ZFTHrkBxZL5Iw=;
 b=RCAX8w8hCiX30o1sD0Tc++uya3MpyEmRMxBoyQWzsKm0uWD2/Umj8DTGH+FFEiiuUkVCBDbRUn2V70D06IGlLQ10Mgllu1cxKgGGtL1rMBBOrhW6J7LEVAu6fG7APLpFgQPuApXjlnr4uBTw+7PMB6+E12+cfyzAVMx7GESEJA8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:12 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:12 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 11/17] python3-haversine: add recipe for 2.2.0
Date: Tue, 24 Mar 2020 15:48:37 -0700
Message-ID: <20200324224843.752394-12-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:11 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d8b1e58-57e2-4681-7ca3-08d7d045922f
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2169721DC76156EF2D8C5AF2ABF10@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(366004)(136003)(346002)(376002)(6512007)(66476007)(66556008)(8936002)(6486002)(52116002)(4326008)(36756003)(316002)(107886003)(66946007)(6506007)(2906002)(8676002)(81166006)(5660300002)(81156014)(2616005)(6666004)(6916009)(186003)(16526019)(1076003)(478600001)(26005)(4744005)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2169;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nO4jZrMEBngu+9in7OxDSxbLxsxLzYOojLMaLWDUjD0IPa2ynzNzEbk8wLGBTZTNg5NGF39G386lqroPfvbWHFQQc7bC8VmHot3o5hj2h2kKIgKSTBU0EDEHw0OYr+2IyZvwcp/GUZ132VsUfwJ+rNcpfwu7F4zrCtwlj0AkeFHNywokz9SHDU6e7w2HPrnygJWf/ejqbffJ++a7LoaZj1NTzxK9V0CmceVHFBDOpywfVn6epBGodsDtyml37ERfo/82KJ7TSInWV6MrsgdCftca8Y4n1Pqm8OVh0XWC40QxKYb4LpDbJRnAFkwihrpzrQ/31irJaZde/Cs0Ek2n9EpdgxdPgXdA4coBDwCy8AK/lneGRVpmC6airuteYRCVlTeVJ8CaluNsdAMxE030Ns/LiztI3hzrtiDkMl4d4eWLljLEfNS62juRzN+KRpeh
X-MS-Exchange-AntiSpam-MessageData: 
	l07o/agSTPiATIwlXskXbxNi1mAFo5WUFfaSFhE50A9Bmdvumz6SM3rZEYU1cTTdMn0sqUl2Y+7OOGGRDam5dJ7TNDSJlk5tgs1yx8cHijg0SiZsqIASEcd+cS530U526gzEklzNyGYYD2c/aoYkWA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8b1e58-57e2-4681-7ca3-08d7d045922f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:12.3448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZ3ndFuEG9c7Uf79EPlO19ORsEvNtyQxFwxJ/cBBX/NcPyUitHwAzrZfphjfOAPW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-haversine_2.2.0.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-haversine_2=
.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb=
 b/meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb
new file mode 100644
index 000000000..fc2cc7d6f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Calculate the distance between 2 points on Earth"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] =3D "6b1badeb63aac6214c978d07a4ecd171"
+SRC_URI[sha256sum] =3D "b710aaf32c442a6d04aa89678be55e3f6c11f9752fc01c216e=
89b13120b36269"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=3D "python3-numpy"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

