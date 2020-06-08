Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.70])
 by mx.groups.io with SMTP id smtpd.web10.3582.1591658779935261213
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 16:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=WOUntL5b;
 spf=pass (domain: xevo.com, ip: 40.107.92.70, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhliUzx/9ik9+piOet0B45/Ehdpb/imNmbIP5/2cYwFEIhPhYA9mREYDqbk3WwApYDb+C1xTwevsyRZ8c9exTbatXWFtBlOJ7KR2jRIgYh+rwTKM/2uiTiPL75xGhCL1Us+dkR1n4jvZibFsg/HXa3fR3i8h8nbgZV+w0rbWAEDQo3W6536WB+eOeTZDJUZImCDyYEMXbPqLuzj8eYVk8fEADaR8MI3+8gs4WAofy4zL4Iko1MKR5s0Bm4j3l5zVfYj1TrDEFTYrWckRF5oW7HkosEu4zRxYxlPC1XvuViRTRd3UyqghreFvh36R1mvpRObbdEBwYI9308aVDWixsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIy0kQj7qe8CFtUh1f1S2hu7W7piFxCzibrqiSC3efw=;
 b=gjwo7kk7G9HbOPWpzhZHeibFzlCyEK9qp7X0x78uvPN/l52aVrO2egkVdvzyq7oevUdrmRzmMiojBUzApYmkqIqu+OgCVtQH3F3LifvgOOiXOaPcM0lq25bNqTPF757qQTuj5GIwUu8DdeTW9npqmTLsGSY1zoSIMPFMttoyN17K37LaCr3XBFjlrUKHmN99RRbgxMAWJ3P/x6TOkSKwNlbOZicqbqb+br8OO1XwzVMlRErvWxEd371t/NDut2iAF+P5Yf2uCP5x+n7mM8kN4d0k/i2gCDY9dQauNETxlkpODmMOBLZmEi8WeRmPLYMCtlAzsSmZmKz1AleezJfY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIy0kQj7qe8CFtUh1f1S2hu7W7piFxCzibrqiSC3efw=;
 b=WOUntL5bdqfjQnTJC/ETQ3WIkKL4tvo20lUqYggWK4LVlZeqO3kxuCFmbIgkbNZ/lTPzo0LYzEJ4zRps7vQpOE4K66TDncR43FGiGODRb+vUPceHao+PXSgqkA54dgCoiw2uVEzEsaxZ7hYfjr33r4lKJxjiZISh/l6KM6NLiEY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MWHPR18MB1183.namprd18.prod.outlook.com (2603:10b6:320:26::22)
 by MWHPR18MB1167.namprd18.prod.outlook.com (2603:10b6:300:a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Mon, 8 Jun
 2020 23:26:18 +0000
Received: from MWHPR18MB1183.namprd18.prod.outlook.com
 ([fe80::f183:20e6:b346:a1ca]) by MWHPR18MB1183.namprd18.prod.outlook.com
 ([fe80::f183:20e6:b346:a1ca%8]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 23:26:18 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH] python3-paho-mqtt: add native,nativesdk support
Date: Mon,  8 Jun 2020 16:25:58 -0700
Message-ID: <20200608232558.1179770-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.26.2
X-ClientProxiedBy: CO1PR15CA0114.namprd15.prod.outlook.com
 (2603:10b6:101:21::34) To MWHPR18MB1183.namprd18.prod.outlook.com
 (2603:10b6:320:26::22)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.corp.xevo.com (50.35.86.191) by CO1PR15CA0114.namprd15.prod.outlook.com (2603:10b6:101:21::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19 via Frontend Transport; Mon, 8 Jun 2020 23:26:17 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [50.35.86.191]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81e72df2-1b1f-41cb-8f78-08d80c03582a
X-MS-TrafficTypeDiagnostic: MWHPR18MB1167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR18MB1167C41FE889764457753D43AB850@MWHPR18MB1167.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dntkQ7BeQTotRAxmrmEQhXAxCORU2EaDj/vyhF270XrIUN0p61XbEkBBJjyWfh0H7atuQYHpQ7ZzGp0A/yAI0wyKkD9cwy2+/sEQWIOL5LeMgzLTjd4a2qQMUd1FCNOizVTcRT8OKg+VhAQkMMwFawBAOsTwT7uRBQ0ufI2LG4LwM9IcPUxmtnVTUnW5+fBhvH9wKPAWqJ45qnNtT3Qc3AVHaIsKEMJAu4tCaGrNLHa1LiM6znTBIMCw2DB0KhBvMXxeXNVRXx9mkS50gpQ69JdlEaiJP2AFujOM5FcPuE4nbyqILFCdPUJFKIQw0+L8HzfzSz44cpGVZ7Dm7Cel24jMO/g9y48Xp3IPBZWGumOeqOu5nfmaSkPKWrUTOMzG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR18MB1183.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39840400004)(366004)(346002)(396003)(376002)(8936002)(5660300002)(6486002)(66556008)(4326008)(1076003)(66476007)(66946007)(36756003)(4744005)(107886003)(2616005)(956004)(6916009)(86362001)(478600001)(26005)(316002)(8676002)(2906002)(6666004)(7696005)(52116002)(186003)(16526019)(142933001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	p+2XyEFIRf4mKpuRFHE62h1vNLdJVsEbfN7y0145l2od5ldIJjvxd/wyThwXmU/PXeG2eOZ5lWS0oWBQw3o1N+Rx6SHxebja9beA2mM1slTgCn2nPh1x4MHo30dRulyySYyWP3T19epTsAmCXxWlaBbWapq/8xS9YoN0Pvbew6grnse2+GxlmkDFn4HNyE0kAt1iMl6txGlXbePFaxlhObxlH7fjEVynaiX6SvsGmHCWryeVvTeesZg0A5iCWJzgMQn0ag6SMojgycDOTNISaYJk2lVFT4dtm5TkbM3+QGyH1m2SZoGr9cG1To5fwiDp9IDPRncedw+Q1S6XedAASz+Y5nGL5F+6HRCiijtm4o+oD9Yrwm2Yh5Ajv7bD6d5MBmHTPSvjiVGeWBegio04Z/ewM32C0uQrDx4hz352YBooPIQIjQ/4wUvDEB7TRzDK1Z65lVHh0v/iRtWnzlUi9rm9RzhyV/LG5vTSevmx53A=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e72df2-1b1f-41cb-8f78-08d80c03582a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 23:26:17.9373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MThEcy7NP/7pbt8xELgdt96BZIGyx3G3vk66LBzqZBKd0bXz6zDiN1JOBJOZeJYF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB1167
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb=
 b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
index cc6f4dc8c..8bf80e601 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
@@ -20,3 +20,5 @@ RDEPENDS_${PN} =3D "\
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-threading \
 "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.26.2

