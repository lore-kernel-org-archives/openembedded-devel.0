Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.259.1585090146556374518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=jGIwOxhG;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFzR+txkEGUQcdIaEyVYVhy+GRFcIR2k0+IMU8bNSF3Sph6fslNsdidmYZo7cMKuwID0Fe+0dGd9Pjbh8Rz9G75KJbjBr2A8zrb6tmj74B9RkxKmtfm9V6lC+8gBM7pgVrLCwqanek1a0PqqbPYcZJvMB5zRGELcE+HD32AGkCRffxDQVpWOUONrsIKLWdG93ccpydIVwut1Kvx49D4LVXYtDKrB1FsM4H5MVfTZzM7doARCrUf75YSNkQFp9CFw+2cpiLrMQ4oLAcjfPxF3UL76x75qrWMBcKq7R6N44ZBS1CMF6eMjWg1VJFWK36IFhhON3kC+BIVp4dypyquXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2UuhsCjWdtS8lb3AsunE26ZAPbBHjU5wK4GwQdjdlo=;
 b=S59a02nAI90W//iPKGMoaqGVD5OXg/8b3Jm33nKGe6vA+4IriD3ZdQDRn12kfrGuyFsWEfzUb+07d7T1kT/S4vYl598xp3JIAKbeg/FL27Rp8/+F0nqjAqRBCRcDHJCeX6oUBTE3rTcGoSCCGCwF5k4PPKTaeAj+nGNsaEepXml20QqvClLvMusFpy7cGMlde+BJ88D8kb3HCsJoHDWmeu1zL2BIlfaUTgOzvRHhVu7SX/SoqE3Dlzt7nV19nnN0W0/WGR7fiV2QVwbGHlZXa7seO682ENZ6pU9MuFQUXDi6Upy1rY+JY7LZRl+z1i7y9au1jGJSEiVq7WCdivjukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2UuhsCjWdtS8lb3AsunE26ZAPbBHjU5wK4GwQdjdlo=;
 b=jGIwOxhGxiUDQCpP4x4DImHhFV/NXKAWq34czF7Gkmx9UBZYGpctM+mKHv2WMwQfbPX4SgiCV/U9Lny2o7e13rZW45RbdCu+vgejRSUP4YXO1xBQ7HFnx1oX/KlDMVRA96Q42zVY7uNXHCQ1lCVd3T4vnp4JydZmexG3DpdWJMY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2091.namprd18.prod.outlook.com (2603:10b6:907:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:07 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:06 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 03/17] python3-can: add native,nativesdk recipes
Date: Tue, 24 Mar 2020 15:48:29 -0700
Message-ID: <20200324224843.752394-4-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:06 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27f462f0-6742-41d0-61da-08d7d0458edb
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2091BD5A284C3E70FCD3AF52ABF10@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(39840400004)(366004)(346002)(376002)(396003)(6916009)(66476007)(186003)(478600001)(16526019)(66556008)(6506007)(5660300002)(66946007)(26005)(956004)(4326008)(36756003)(2616005)(6666004)(1076003)(316002)(2906002)(107886003)(52116002)(6512007)(81156014)(8676002)(4744005)(6486002)(86362001)(8936002)(81166006)(142933001);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mIcaP4AnveolZIK++KWEFl1CLw79SU2jlaG2JS3Nu0E85oTUJtDMXncblzdRMvnxCkSJpc4/aMZGpFyxV5Kv4jp7ODNjsFmgipUVaJVNQkrNoyKfut8FL1qOo1rpN3XwqxXWKPhuFJF1Zu2Gw38GTl/jFOMSYzTVpXTqF+AmL7fbBj5nSHQ1pa7t/vO7tsJDBtB9wxULBaDUb/p9r9BdmXFuX6XHn0bfyZusLBVPTS6Wt1t1gE7OpdfM9KFHGhXF+S62snICpIO7Ku1zZakqvCYnptIAL9Q6jctt7l/3r58sr4ztNBbUPlXTygRNqXHS5pKHfP4igeymsMDViJPJxmr0GOoicBmogaxACWNvT0pXslYcHYg738kDxwaBWZwlU8xiW7j2l5A+KoHED8ekIjGC2KNB7HTdYor2hYwIzyZV4rd71EHAnEH2WB534TqJ3yn3IQIFCVtsQh/TGME9eKHAepUZBhcyB+0uuoXbXdhsriqvkZvWFKbsUrT9PYkZ
X-MS-Exchange-AntiSpam-MessageData: 
	Dh/xfHb8h06rnZx5X0VYd7Am3d0/nqwE/IykbSzG83ZU5UmVCZNTaRFdwQZ9PnqCBvqTV/qkX6LAZeZowIZOeLtCHfTohgFp2Dhoahx2BiPI4HIAj99cWqTf1fp6Vcww2rGrsgfFVafMOrI0h7r5Mw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f462f0-6742-41d0-61da-08d7d0458edb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:06.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cv+xzdoVxeaQDi3fKPGjTGYAwF47ErrVwOmK5LKXRYZXgCYWUe+3NZJjnaTOi9Nx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This builds fine for native and nativesdk, so add recipes for it.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python3-can_3.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb b/met=
a-python/recipes-devtools/python/python3-can_3.3.2.bb
index 4597795d5..5159695f4 100644
--- a/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-can_3.3.2.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN}_class-target +=3D "\
     ${PYTHON_PN}-sqlite3 \
     ${PYTHON_PN}-wrapt \
 "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

