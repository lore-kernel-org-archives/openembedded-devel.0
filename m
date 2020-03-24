Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.259.1585090146556374518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=i+QvVzmD;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8+QFcvQAlW9kS0eUQAOCbqC2DAm6SprSDcaXpIIheEN/crhLpCwi1NpUUDDZWSI5J9cYqPb/UrqFafkQzlMYYBZKLae+3anoSSs/+18mq5swCq2zN/XCMyKVdpY6xiQQsJqNrUpWcdlU3BvJo6PqORE4xoTmX/KxvZ1ivrv8aqbeK/h03m3wZbAwiiH1Ft+GLTRTPhkj9L0zO5X1yZExpFqOULdPuywNBgvHvUafqwT4rxh2/vlEzh2s3wbGN0HbFAOIpxdEE8HIHsd4DqNh8kJkmcjLsbZDEBNK5GHN6cMAtt6ihSvcgn9vHCvF4ij6PnhxEv5KK+SM7rSHcRh8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/KPWZwuy+DcEJnwb0FmIO3/gs+AOnYk8eK/Pccgiz0=;
 b=fEHZ7o+XWtNAGLnJONGHGAQdlScC8XB0JP54l0Hck3lm+DXFfT7tJidsROvmeSQYF3YrOo85SRMKN7CvNaYCje5gLCKS4XczYILz8s0SO2gHTu1fjUdd6ANYZ0NMUxPn5qOMrNEmwGgAKQb8fbHSvjLTRjm/IPbweP2cYO1y7DR4QY58D/+u2mDeukpSKUCOZwjAp0WyV6IkwRHsND54B4wL2Md3GJhVcdDtJURwJtbBH0FimQSv2/TRfy4y3oWJ41PpQz+NYPtQQ2XHVZePjtdeynUtPQs1VvX7rw6UrJOeeXeeGXA57FANs8mRi2rhldC7QG8C0FhkRZcJSDuU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/KPWZwuy+DcEJnwb0FmIO3/gs+AOnYk8eK/Pccgiz0=;
 b=i+QvVzmDbpjLiqepPqgrlGrWSwK4rBvl1LmdRxPPeH6JlMuD7I+py1NSvDK+jqQI2/SsV2moLymc9q/q9KB3uh7VO7/ot5Z7qIBB0g1R+V3UN91wWrSnTeKMk6SeMjTbED+sXClMyVj0Arr91T2VVc0f8Jmwl5EPni7LOdseGV0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2091.namprd18.prod.outlook.com (2603:10b6:907:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:06 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:06 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 02/17] python-msgpack: add native,nativesdk support
Date: Tue, 24 Mar 2020 15:48:28 -0700
Message-ID: <20200324224843.752394-3-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:05 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 150b2fbf-5b6c-457e-44a9-08d7d0458e6f
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2091D2A802392E03B54677ACABF10@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(39840400004)(366004)(346002)(376002)(396003)(6916009)(66476007)(186003)(478600001)(16526019)(66556008)(6506007)(5660300002)(66946007)(26005)(956004)(4326008)(36756003)(2616005)(6666004)(1076003)(316002)(2906002)(107886003)(52116002)(6512007)(81156014)(8676002)(4744005)(6486002)(86362001)(8936002)(81166006)(142933001);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pp/zGf+83IRU179oH1C/0dNcjFiP7N4BcrJ8vYaJeKWWPBk8913C99pxoOuD4JHVKI2RBGoMXATAxDL0u+uS24AhTPHszld29QYL7R33Z2Biyyq4C1jfPz/md3zhzQBnrzvSPP5CS/kUTwafM+GDxK1gF8uLVlRwBorK4XWGrLoGlLgBZYlZ2VjgtkPtFHn7kJoEGZXqV/2KoHaEvkYykR/pKI1p5v/r/49YVw2gdSfymp8bx5+tGP2W2Ed+9X5OoPbsZKeE1SaFs4TgXRrZCzu0og+OFyuFRrqKgKfGqNUkgJf1nyH5r7QUYGTOH04TivSOa/Fd1MRltDsFHPz5TLkrF9reMKuNY9yDZGpdkoQX9wU70+AiKqPp4DP8rNJwfwDFlmVEFxPGGX6oGeHINzi74J3DfJmq3AptSKY3LLrv3ZR0h77nraETtriskMgeXDNrcJ9m3tynokfqC2eDj1xCyUpSGLVcrrNiDQhRZAszGwrZ/spTRHOZLeLcJrPS
X-MS-Exchange-AntiSpam-MessageData: 
	9lGmygfdS3biMWART9b4qvcfhL95wQllIsHdhttzt/yTJjylYes+TwL6WXu6PwYNFkIu9ce7JCYZYb7Waxl5WiU7+zuF954MdqR/pGuvALh/NgjxG+j3kahXVe3KMJZrrd/Gu4uL72LAF/h0qRjwEA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150b2fbf-5b6c-457e-44a9-08d7d0458e6f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:06.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4euY/Tql8nV1UbOgRiWE2BTnyyd2xjwP1q2i0w/JpTqMrcX2W1FsuFiXa1UzmnB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This builds fine with native and nativesdk, so let's add it to the
package.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python-msgpack.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-=
python/recipes-devtools/python/python-msgpack.inc
index adf5c3e9f..dba5dc44f 100644
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -11,3 +11,5 @@ SRC_URI[sha256sum] =3D "ea3c2f859346fcd55fc46e96885301d9c=
2f7a36d453f5d8f2967840efa
 RDEPENDS_${PN}_class-target +=3D "\
     ${PYTHON_PN}-io \
 "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

