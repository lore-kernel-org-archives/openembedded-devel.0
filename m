Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.41])
 by mx.groups.io with SMTP id smtpd.web11.1105.1585960847664234261
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 17:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=f3qqoUKK;
 spf=pass (domain: xevo.com, ip: 40.107.75.41, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtSugAz16mUzcYQwxlpfKI3kUUrqcWkbZXWSkAP7fyG4/kcLK8d+ViNTyGYU9iZth2o87zxRizrT3tWedLREUFOD04hUuRCEIAUcTpccG9kef8QdirEFNd9SBEItuvfsIqvDaXiCBGR0dW1QJZchZwXjV48gildMM+gVg4zRKa3qkLhQsfi+r12JpCIcbV+McPnIq3kXXCV/h0G7UfMvEIL07nVCWOOP4A2eFIZ31V4apsU6UpNV++y5Di2QnxqUz7vGdyFrgt9bIu8G0s+nW3AXRB8PuW3w9Vxx0dIc7V+LgjiTiGcRHrDPOKdGnQvQ4X7JWECqtNRd4G8dr8PACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7rGYayWkbiRLj31PKbD5FkIoB2eqJroow5a2SG9d+M=;
 b=F2BkKNnpqE8c3Q6JuJYemzGwYcycrrnh7vRO3bp9cArlAUxKTYFd29OGSvZbdwehKtCZic1iIevsQuehhTYucp20zr2davo5sUUdKHpvH3xmX4YesKvqoaxjV69wUkHjA9RKwDLQQyKhs7X1wAS/48giwQj2WZzPXG9vAOpFS46huHUaiiaPjXiIIzWby8llcusLanEZe9SN/RjZzkdStVjlJP1klQYbaLpxw7GvJ3QqbX6HqeQE4tJchZ7oQstcN2pQGa5stCxvYuL7aI+t64MqUqFaGJ2EtwLnOwPMj8MoC0KFTg5CK/ZQi8HZpUNfH4jX4pe35TbRypUeJAjO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7rGYayWkbiRLj31PKbD5FkIoB2eqJroow5a2SG9d+M=;
 b=f3qqoUKKe/LPriRS6F2N5Tp0p/+igAib3nIaMUPmRBIJxLpKgk8fCqIgzB32cy+sGe1MhaDAkFqpnkX9BBEqk++MYwUH/OQVZg1pdrw4g6V3yV+T9/1ajEEs/S/FeoIFnAw/kktka5NIEMEDOTslXTip45I1hB813rncf2dP7Qo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2122.namprd18.prod.outlook.com (2603:10b6:907:9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Sat, 4 Apr
 2020 00:40:45 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::3d:5c5b:af00:a4a6]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::3d:5c5b:af00:a4a6%5]) with mapi id 15.20.2878.014; Sat, 4 Apr 2020
 00:40:45 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH] python3-typing-extensions: add recipe for 3.7.4.2
Date: Fri,  3 Apr 2020 17:40:30 -0700
Message-ID: <20200404004030.63281-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MWHPR12CA0058.namprd12.prod.outlook.com
 (2603:10b6:300:103::20) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.54.140.49) by MWHPR12CA0058.namprd12.prod.outlook.com (2603:10b6:300:103::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend Transport; Sat, 4 Apr 2020 00:40:45 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.54.140.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6af84a9d-6dd4-40c9-82f3-08d7d830cfc2
X-MS-TrafficTypeDiagnostic: MW2PR18MB2122:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB21223CAE59E67E60CE0B916EABC40@MW2PR18MB2122.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-Forefront-PRVS: 03630A6A4A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR18MB2236.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(346002)(39840400004)(396003)(376002)(366004)(136003)(186003)(26005)(2906002)(6506007)(36756003)(52116002)(4326008)(1076003)(6916009)(4744005)(2616005)(956004)(316002)(6486002)(16526019)(107886003)(6512007)(5660300002)(81166006)(66556008)(66476007)(66946007)(8676002)(81156014)(86362001)(8936002)(6666004)(478600001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dLPhvqZwp0gIcj2P2wVkY8mFsFymfdSPYV/C2ac/7vk9q5cT9u0H2KAlamRf7edOwPsp4lo95h/Bo/DDfh/GCamuMZc1zduiDo07EDsm6sLgK0PZzEPSg9Vau2+NpXm9a3ryQpTqH9tOXqNwm2EPjLTcYkj9y22B48OS6eJzWgGvLuTnebJpCVt07PkDrq1a3/KyPt9uUkAY2WfuKzAGSBFajiqOgURNWUgHK0o/J8DIpxvbCaMDIIEcAI5Pe+bmvLsGZ0MEiEX2Uy4guOsAc+swYgXiWrrfC2H/bAOwfNfKFhSU2brxm+PZbl6jwVvfVT1kQr8YinL9l7M8b+XleuO/VogVr4zgptkD69yFAvoV8Q8d/VsCso/CpRdhUQbASLMw9TsGFtpVuh4oB4SzGOxaXR5kBMi7wr8pxQxj0jH7gJNzXjfzwO0PPWe9kQlf+Z2yxFTHS1Pv+m7AQo5kCxlW5Cv0sqf27mE+QYr9NsHKlygvv7ZgHHYAhk90+xyUYMkVTds0pqxJDe/5Dwts5w==
X-MS-Exchange-AntiSpam-MessageData: 
	2M7GhaokGjxK4mJSMqKGa0KS/V+oGShpnE650guc1RNRiA5BX7rhyNHDXC8G1HmcQySeLYgL4er3wHd0LIJWdRJCOq7NoW0ZiiX2BhfQQJzccKUH7DAz1tIMQDuRofdrRFLvMDhw1HCzM9dZ405uLQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af84a9d-6dd4-40c9-82f3-08d7d830cfc2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2020 00:40:45.4584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhoL2xUaOggZMlnWEEezIuQTA5ubUxMoc1k5B9B7BipPchT4jHBajZ8P1SCju9Lj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-typing-extensions_3.7.4.2.bb     | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-typing-exte=
nsions_3.7.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-typing-extensions_=
3.7.4.2.bb b/meta-python/recipes-devtools/python/python3-typing-extensions_=
3.7.4.2.bb
new file mode 100644
index 000000000..51e9eda2e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2=
.bb
@@ -0,0 +1,13 @@
+HOMEPAGE =3D "https://github.com/python/typing"
+LICENSE =3D "PSF"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64fc2b30b67d0a8423c250e0386ed72=
f"
+
+# The name on PyPi is slightly different.
+PYPI_PACKAGE =3D "typing_extensions"
+
+SRC_URI[md5sum] =3D "f2674282966dc088d10170c2347431cc"
+SRC_URI[sha256sum] =3D "79ee589a3caca649a9bfd2a8de4709837400dfa00b6cc81962=
a1e6a1815969ae"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

