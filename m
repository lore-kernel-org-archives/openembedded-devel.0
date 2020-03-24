Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.259.1585090146556374518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=JN4q/G4L;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PK8i+JChgWLrKLimq7uRtst/rvmZEWtfRZuK/I0eCeTGxgwsfWa8FnCWyZeC7ut/LhGV3yE02QNiUd6LvE9mgQ/jGpwgPGyiT++rLStTz26iNeyUpPDUM1++e/EUPIM1mq/R+OctMnIGPMdLCj22njK9uZZhkTLJac4GgME1bKGZ6iucfvkkjPlaBZHNpw+q4XyUgMKVWeeG6IqVSEajh9Q4Flwv5F52MXLCQReHksXDGLz4u/XFHHrNstXx2/xrycLkEkMwD9YumHD3QFYROYGRDvTaoV5SdCA4TggKtnYfkZr2AIO2K8GhmIgybCiUbaVFrQF3vZx5Ducvkg7fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWcI1XDyuBwGfDLvJQqyswI/nFR/klfwCjJVkPDiSOU=;
 b=VyBuIPFS9iTY/d999SYeUP5IQVW1T+I8+R8hG0SfXKb03v6QEmTnZ3vQlmd/5cbcq+js8KsUBqULxg1OSJhBCIefzWOkOvQ5UhlHyfCz+rdvpXtAT1MDnCU8dveOJpwgRmib6KJ+vsxfQxpqZ0KHHtF7H2OYN7z6+MMHaw71YmkjTG/kXsmfCcwKLKqH7vqzxu7vpdC1AVs5iYXEP4WEsdLkhFinvY0ecxYounXcTo5a0/JcVXc5+gzHVAMmt3mC0zkQqqwSWTYl6XNibL9A81IZgSMTRon8pXHN6Q2oXf3vVXog8HYXiZZW7OkDnUdeavH4pLNrnOOqrkNZzy9RPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWcI1XDyuBwGfDLvJQqyswI/nFR/klfwCjJVkPDiSOU=;
 b=JN4q/G4LhpxpwILK6a0RHXrkcbFUgJA6NgyxIuLHRHjKiwvfi4o/pueHt2dqrcp4zc3wh8qUDtg0sIon87JcW7VzrhvaFh2CjM1GciAO80sOCnr5QBYc3Ml6GJPs9M+7hYHOiYLCHRUeoQ3esX1FuIrAmjWJ+ErcY2fatngHT4M=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2091.namprd18.prod.outlook.com (2603:10b6:907:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:09 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:09 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 06/17] python3-can: add missing RDEPENDS
Date: Tue, 24 Mar 2020 15:48:32 -0700
Message-ID: <20200324224843.752394-7-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:08 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d6cac4a-65bd-4dad-eadd-08d7d045903d
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2091AA615F660D6176F27B33ABF10@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(39840400004)(366004)(346002)(376002)(396003)(6916009)(66476007)(186003)(478600001)(16526019)(66556008)(6506007)(5660300002)(66946007)(26005)(956004)(4326008)(36756003)(2616005)(6666004)(1076003)(316002)(2906002)(107886003)(52116002)(6512007)(81156014)(8676002)(4744005)(6486002)(86362001)(8936002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	is0QqbRazpEirbOQtk0hfKCAqSlqenUCuE8KODwkMKtknxwDG0sTAP/42NrF0Ue4ZudcgDuklsli9SDydTfEktImSty0g69cH7obwZ3ysRpJRpkcmXJMGtFISz40vEUHOsdKT/3jeUO4BpN8/TH5VcWWKH4Hl2k5LkDYSwidrf7KNHPjHMzyBySxwlNNdsfoAEy8sP4217X6cwXROFEqL8v6+mhMLBZnw2oMUSc6dAJYNIo5d/2MQz++wovlbez0aJPQ6lNH9qnbKnSlVaHpfqW6B8DU4jzxzVKdkUOaSSOk2WBUD/y2hOVXnl9471Jrq+31kJ1K53+vDiZSaR51LniADHk9GFxJud8MYeiNXdkHDosfx6LrqByu7W64GoE99IgHixzbY+WxAlLpDOdfQ5BBeL8EO6DwI1acYxz+oPCBV3rSlril23ruAqkLQbF6
X-MS-Exchange-AntiSpam-MessageData: 
	sHJ1+LycJBubS0M9HmKGurJs6O4kErvl3qWxImfJC9tzTOHRbfj3/tBf3gAhInMail2kse/VyXDYhkM2CIiXudPKxetWTyWx1bIvoH0C1TETHvG6AyF/snKMXGz93Ywr04u8boLt0hidS7ILiiQwxA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6cac4a-65bd-4dad-eadd-08d7d045903d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:09.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYYaXoKOKx8c97J3QccT2HtYtCtjz1eyd7d1wJpAwX7xXl4gSyYHaMOBCMPjkdB0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

python3-can has runtime dependencies on aenum and fcntl, but these were
missing, so add them.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python3-can_3.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb b/met=
a-python/recipes-devtools/python/python3-can_3.3.2.bb
index 5159695f4..698eaf5b3 100644
--- a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
@@ -11,9 +11,11 @@ PYPI_PACKAGE=3D"python-can"
 inherit pypi setuptools3
=20
 RDEPENDS_${PN}_class-target +=3D "\
+    ${PYTHON_PN}-aenum \
     ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netserver \
--=20
2.25.1

