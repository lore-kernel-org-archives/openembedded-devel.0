Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.283.1585090157105649637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=TDwCAyph;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4XWTeIKEn3hj+MN9JEZtlNCBUCfhLX9J09dHYcTKiLzPxz29l7pQsFMZllUZQ8G3FrAqe4t7Vl4jfNMi0olk6q3bGwSj2xg4RN9kcLNji+CCu2mJB1L4hIJkBkLk6QsTlTNTfTuRZuwn5zcOS6Gj1nMc04sMqy+9Fp8CXd9RUADLKsLGwkdudU73ph9TtIl9pmmSXWJPd0RTUJ+n5SHA5v1uibzh83Vr1P7u8CgOs+5QKS6nlDpMnKATafNSlGTwgqmq3BZJg/LroIdkPRnOvC1OF7lOR3fx27oyJ+W5cqxDx5Q/y41r0VK8UmXF3ecyoseEN/2yDle6gL/Q+otOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KspYC4lLwCdejNqpkqHqWpNX23mDWTQuGcYq7CoKX6E=;
 b=kB1dNQymG24vgduaxKhTlhOF7vQzuuzImM0lmGBD6/yJYxE/kwJuerc9Hsa2RFxHaIn9GhVJog3Ie3ezKX4WtC7J2RN9mvhDTTFi641qiYt1xW78fDWhLQQKyb6Bv3ZsBQQPuLrs15Vh5znupsdYXblSnDisJWbijMBRTgIeqPlspi21KwdvYWxAU0M/xUPewUDb4bYXm3N43Sjk2x/m4d9Ax86jL/gQ6C+lZK9nKbdhoR1scpxyg3uz1h6b7yvYHv0g1QlKuHtB+OwxIqPwxy7E8yznCMeLoQW3Xyg049PHcL1T4FEk3cTrtqWq8wWbnauETKzzMjCfj62u4LINOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KspYC4lLwCdejNqpkqHqWpNX23mDWTQuGcYq7CoKX6E=;
 b=TDwCAyph4x0QLFcWVSOQoC4xKuQXA1OmFuiO9FA5THQd2kZarCZfsYo+TbGlreIsqfiuhSbcedeU+YkY3yO5yFb2KsEMOacGY74RWxNY1z47ngDxBGZR+1Tcody4RfmAJ98yyp+my8ljHSr+/Dm/Voj++8/LFcydSHqfQ+cHT5Y=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2091.namprd18.prod.outlook.com (2603:10b6:907:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:16 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:16 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 17/17] python3-cachecontrol: add recipe for 0.12.6
Date: Tue, 24 Mar 2020 15:48:43 -0700
Message-ID: <20200324224843.752394-18-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:15 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 889b0d7b-c0b4-4365-898e-08d7d04594a0
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB20915F820EDD9C687CDE75A2ABF10@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(39840400004)(366004)(346002)(376002)(396003)(6916009)(66476007)(186003)(478600001)(16526019)(66556008)(6506007)(5660300002)(66946007)(26005)(956004)(4326008)(36756003)(2616005)(6666004)(1076003)(316002)(2906002)(107886003)(52116002)(6512007)(81156014)(8676002)(6486002)(86362001)(8936002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/jd+7n5LOR5UBXsPL84YZlYu9QKdtodL+kuFFzlD6hK8Tcy7me1X/HwynUKAnSRrYNG8G/pUd4Gk6Pa+tjFxDeCn1Gugm/ogcB3EsuLp7dr0xh8Y4GABauKGBa46D4xvvPTwevtYo0pzHaByepfXOt54+SBtUUXpvIytMRyuoDT5UnPe/HCF4zwmxlzepBv2U/swpNJAA1LF8Kd9S+77ZfZgwYKdGdt/3fGnAMfbgfep+aZ5mLLc8YlHfI97ZYG2jpNDywOYWlUBbUHRjJgjl2m3OgImAPlwrXeeTokS/VqLwyUfboqy2EviijyOYyAAPJa0lC6YKO4aLG7QePl8xkdNUSJRNdyP/Mvd+wWZW/rzJwwvA2AZdJTZXBtKAUzfo92QR8+j84VTvnQ8rQ+1P9N2WLGl6Erl3NZdO2JPtqmr+/s3dnoPP/UB1RI3GqtHZYhYdzB7t0lpLlKJs9tYn5vzhhPcnov+ceSHSm7vMYMW9mSfvK8RzTFOxjSQ2y7Il2fjzVXzOkh//v9VP8P5lg==
X-MS-Exchange-AntiSpam-MessageData: 
	bOXrN+M36hfQuyaWmyjqYKP3/CwxGiIIK19HFpo5SDJgjCzc7SGn52ZG4sZPGOoWFbJ52BMKH+RYBxRtOYQTOhXTH3p1UdOyqyGWMOPdp2wGVj4nJLa/FAN5liCseE6vp2dxGCROVLf3XuotH7Ek7Q==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 889b0d7b-c0b4-4365-898e-08d7d04594a0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:16.3732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqJBToXWImjBV893w+0QQtg/GkBQP6rTPibe0/pun1GdxLc6548BhkyxVQ8bCsAY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This recipe originally comes from meta-openstack, but it's
dependency-less, so it may as well live here and get wider use.

meta-openstack is MIT-licensed, so the recipe is compatible.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-cachecontrol_0.12.6.bb     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cachecontro=
l_0.12.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.=
6.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.6.bb
new file mode 100644
index 000000000..7c45ed330
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.6.bb
@@ -0,0 +1,29 @@
+SUMMARY =3D "httplib2 caching for requests"
+HOMEPAGE =3D "https://pypi.org/project/CacheControl/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D6dc7e1b428eda03d850209fdbd6=
c71f1"
+
+# On PyPi, this is "CacheControl", rather than "cachecontrol", so we need =
to
+# override PYPI_PACKAGE so fetch succeeds.
+PYPI_PACKAGE =3D "CacheControl"
+
+SRC_URI[md5sum] =3D "5890b797f9b48b2b4cd1448cca89e396"
+SRC_URI[sha256sum] =3D "be9aa45477a134aee56c8fac518627e1154df063e85f67d4f8=
3ce0ccc23688e8"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=3D "\
+    python3-crypt \
+    python3-datetime \
+    python3-email \
+    python3-lockfile \
+    python3-json \
+    python3-logging \
+    python3-msgpack \
+    python3-netclient \
+    python3-pickle \
+    python3-requests \
+    python3-urllib3 \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

