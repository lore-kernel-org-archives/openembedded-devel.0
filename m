Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.259.1585090146556374518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=dbolMy3r;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6lodutoChtAvslGnCn0X42fXbJFnQQri17Fl238vTlY9g27xyMm/p4mxEc7bIvwmrK9ZQd0HKvkMjhiIX9hvXZEvh+ohsHRn2ECz/7R1YopZtwHwVZ5VfddNVq2Hz9zKfTqBmqll8+Pu5I4vjoHYLhQyeAoEw6letr4NGukbh0E3FipOzxrP+qZyFor4cHENtT/fWHQ4UxQCGGL06VyHC6Q6v2C1lWpFGIy9fALwQUNtR3wIhLPks9zjBctZV3Dlvq/R3tu65na6sjy9SRhX2t2PC0fXGb0sYgh0gf5ZdCxgvGV0irMOEQU1GhsICTaybW61Z1ZnzP/eJbriFAeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+hFH//6WgK5kbjlx+/I9zbJzopD9C8W6HzhhachKCQ=;
 b=YOoYRINKwDKK5rorr5NsoZ2p14wmAy/m6Yi/d8Sht5RniULDhHiDFF2PYNymiX06UpNg4Snkbur5vHkos5/z/WSnBIn/rFoVST1dbWpPx20NW7fwrNT7rQYZ9i1LlbTFQNHJYnnuUwcl433iaHuffrV+Qx3hVejb1++4u5aVVGNq49olWWMBV+LK+bBiirhaYOOMeziOyV1fKBuryius1IbKwnSNv69VqM4rI0Pz7tqc4AA0NOLHq5NOmqkTallRXm+mb/GMoiEF+mDz40y4zXzoSOWQZHp6IaXkdXX4j4e5bNShOacRbo6KGc0foCqoje1RDJKbH8Y/cJJ1DHCrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+hFH//6WgK5kbjlx+/I9zbJzopD9C8W6HzhhachKCQ=;
 b=dbolMy3rkzG7+b52Q1JJJ9K0mwjoxPqsXnXu/r+dTIFmYjBdK7wbVYuuAexgTB2UK6H4UMzbBNu5uUbdu919mptCq3Pf7UDKYBXW3Hvp/+1dSEpMgT0X45rIPhkSKlvZR3EZ+EEq7MKzw8xcdVUyWhlfKoUZLWQnlA/dVy6qvkE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2091.namprd18.prod.outlook.com (2603:10b6:907:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:08 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:08 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 05/17] python3-aenum: add recipe for 2.2.3
Date: Tue, 24 Mar 2020 15:48:31 -0700
Message-ID: <20200324224843.752394-6-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:07 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 059dbbf7-311c-49c7-3cf5-08d7d0458fb2
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB209124975302814972FB94A0ABF10@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(39840400004)(366004)(346002)(376002)(396003)(6916009)(66476007)(186003)(478600001)(16526019)(66556008)(6506007)(5660300002)(66946007)(26005)(956004)(4326008)(36756003)(2616005)(6666004)(1076003)(316002)(2906002)(107886003)(52116002)(6512007)(81156014)(8676002)(4744005)(6486002)(86362001)(8936002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xu28KbZmWQ0Q8i+P6S7iHnRjG29qJDw94NWB/fz8fFlWnd88W0cgcWZ8sip7+GWnpsfdwys73dUtwT6ZSyB0gMcjhmu7/XPEveps3ojME3DM7kZ/M90an1s3PmKeFB3WxchdlpSR0wdOUjI3jGhSpqJHc1hzja7YPCBIUBb+SucwDVv2qIfUPf3b6ff0emWdbr80qVmatQrD3J49vNqrXGH/RP518SSumKMFGEXQzA8dLWQcgtIf98kNaarROxJ3y2PZXSq3ZXo7t3ovjAb0GxQZ3DfoDLdFTkOCVHqdad3rI859RhcsYh5VdrvuaC90IwoCpWaPXWBACnyKNTntwoBd0E0kcB4ax09oitMMQQ39LD2uY2lAe+ywd256eqhyFo0J6Z9YFdnYFHgy664ER6vPplzl191PFvW8QkoiITjjWBX14QdAO0KzV4VYmTR3U8bcUY4FkH6ZXIJLzmdJeYfOBB98MvWb97V8+pWRlVSULdsJqocgEpkOaxCg1XTY565eDJ/L1sbMOpPnlatqrw==
X-MS-Exchange-AntiSpam-MessageData: 
	9twqg+AMX+skyoSyEa1tJRgCNFBCEzgaoe5RujRU5ze2TV6vcitxofMozQHnb9PRYGDPFZhf9HvT+s3Q7QR+aOZ4AQjuHq+y02nwFiofBHFX0ARtjOxoCBYfLkKZCzVUj7Jkk+VuKbE/H1q4pBV8SQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059dbbf7-311c-49c7-3cf5-08d7d0458fb2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:08.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5yxIgdqlYePznRwHhzEmb3rcVc69er5e37ADX7mP2ercJ4MyzyD4PoXJ2NV2LO0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This is a dependency for python3-can.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../recipes-devtools/python/python3-aenum_2.2.3.bb    | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aenum_2.2.3=
.bb

diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb b/m=
eta-python/recipes-devtools/python/python3-aenum_2.2.3.bb
new file mode 100644
index 000000000..16d2a881f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aenum_2.2.3.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "Advanced Enumerations library"
+HOMEPAGE =3D "https://pypi.org/project/aenum/"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://aenum/LICENSE;md5=3Dc6a85477543f8b8591b9c1f82=
abebbe9"
+
+SRC_URI[md5sum] =3D "026786dbb37c15c2c8dc91fbf5828e97"
+SRC_URI[sha256sum] =3D "a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c=
966c3a330260e8"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

