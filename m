Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.259.1585090146556374518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=Tk2ZSbvE;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrvXBgpo3SbsDdN8aCdhCuGTpe2sFXiaFo4yQ+kkHbwnlOMdTNd7vk0y34Yt14duRMWyyS49c+p/O7kL23i/0ITtj0D/iZxzGyqAnn4bfOlOWICHE7g9Vc7XDAotXR9Db5S1i2pdii/0IIh4lPJOAJ59YQe09RpgkhGOmHl4aC7qQIN6uSDxa9Q1x7kUHgpNNBeBb5kGErVuFmttqSmLtjIMT2W6MnMUl62MoTn1LUZaK9SgXTW2QgaWXjhDplSZNA0Xmbe/F7smPSQV9cJYgpI00x9v5itsu1yljYS65ljwO8HRrZ0+Wwhtnh/Nz7+XKoyn2G4Zo7TG+3NEto2bUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yIaGyCoKMh9xHuJS22q9R8709K/7kN6XbwCYUkKBNc=;
 b=PUSiI5shANrPFH6aKvkxEFlk9xPozyXptvt6V8nLQx5GOCJy+HJ6y9LAI3Ikxc2eAgdL+G0Lp5V4DmSRO0PN8137diuYqifQl79P6aAGmopk37L2HbqJK8kNdP5LqhhW93otGnaSls3KKH5vFJnE9MqDqVZsAhVHTqwXeptcUlf9bYfhKiFxoP2fTWUvwiq7yIKn6jhSwUHMmHr2Iks3cjAOjadlBAuhgJkd5lmW970gJPdBaNeku11ZsdM3AgbARPSlAcwnGxTF2207500lt9wP87/x2mzqrXc31seq3neuGGpu5L91d6/4AbWT/qyUZlCMBRY9nMtI7BzoixfZsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yIaGyCoKMh9xHuJS22q9R8709K/7kN6XbwCYUkKBNc=;
 b=Tk2ZSbvEoHM5VHWVSxlMaQ1q1MtgAC2u1cmcq/LLnnzpYMFg5Z5QeB2URpuIc1hI6HB7Lo8v1RlXG8VO3V9BKBNQ+K9YAB4Ac37sK6SuttOSgJnMAZ0ewc5LogHLi9avdMuex3c+Ftd1wpblmXKDezPAI3Qu12e1kk0cLnpRCmY=
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
 22:49:07 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 04/17] python-pint: add nativesdk support
Date: Tue, 24 Mar 2020 15:48:30 -0700
Message-ID: <20200324224843.752394-5-mkelly@xevo.com>
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
X-MS-Office365-Filtering-Correlation-Id: c4c19e2e-ef97-42bc-5ea8-08d7d0458f5e
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB209147C8751D29C5D7DFC006ABF10@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(39840400004)(366004)(346002)(376002)(396003)(6916009)(66476007)(186003)(478600001)(16526019)(66556008)(6506007)(5660300002)(66946007)(26005)(956004)(4326008)(36756003)(2616005)(6666004)(1076003)(316002)(2906002)(107886003)(52116002)(6512007)(81156014)(8676002)(4744005)(6486002)(86362001)(8936002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TRwJlUJCmFeCsVI/EpT3KnKygUzJPVKY89nGf3zYoltxzE65ai4XMaUgego1rBK5jfquIU9LdLyWeG56plfXL5EjPZNI/e768l0qibf7Dz9FG2YsMhIkHHeARk1RrpNB/qRU7StoTL7yq63IhD1PZDzncvPn5/cLgI/oYBNYdH/WQZY6fkicnp+4nDrVZaff9V5WASt/8r3xZrEBRmAAJXYuvGfCKZbzhAwtrKIvoDYRNt8XU6OCax9y89Dd+4VDUMMguVfJPsMSLeItXkDWVPpO1GLlKd2BgscDWJwirqsArLIrdoktd9qOODtw+f8tPymQCnKacyQIMxwcyUp3FLeuj52NaZ8YYnAzD9YglSYoWRKmGkSmUUPxXA/shO67EH0dnQYUVw64gzhZp4+ANMxpMz9DSbiwbLoECpvJUW0OCyD7plvuHNWRDIE9lurv
X-MS-Exchange-AntiSpam-MessageData: 
	/LamU3GWRD1rj7zo7jtPKk/xUprWd02snBlI4Lf+TBCOrOTyBDViV5frYC0Zd2TIi7fnLMY2VWKj/omYLLJsy/64LAoJWyJfCV8HKNjvXojjGyT2zR02n5aXwz9iv0UYSL3yKcSME8i1ChZH84H8ew==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c19e2e-ef97-42bc-5ea8-08d7d0458f5e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:07.6309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kmaY/flo11raklb/nnF4fSbTsdB/OV8mj3V+hVuG9yhONo1DXBUfETcp9qWcgrA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This builds just fine with nativesdk, so let's enable it.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python-pint.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-pyt=
hon/recipes-devtools/python/python-pint.inc
index 0900d91d7..b40800814 100644
--- a/meta-python/recipes-devtools/python/python-pint.inc
+++ b/meta-python/recipes-devtools/python/python-pint.inc
@@ -12,4 +12,4 @@ inherit pypi
 SRC_URI[md5sum] =3D "d0681cb7cfaca9fc68ce7edab0d08d88"
 SRC_URI[sha256sum] =3D "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d98=
10a68a561fe4e2"
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

