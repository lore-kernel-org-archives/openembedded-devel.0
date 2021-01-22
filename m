Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.66])
 by mx.groups.io with SMTP id smtpd.web10.5405.1611295394547693741
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 22:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XRQ0sq/P;
 spf=pass (domain: windriver.com, ip: 40.107.243.66, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mS+tuQz4KYoHpl4YjmyeGcRzhoFm9rdBQVXiB7DLA86reEQJV1jC3BTZskZoZPUke5YqDqCrgImApLkLlmIK7niEdW764XohvQWNrFnoQH2iR2tGUU3Y3DL1raPelm2M3ioJYcroeZkL/+Am0lgmiRyNSBvmqL0VNRLQm3bxiTYX7hG6u3Mo5kxw6BfaITsfctrEatqwdPE2MKBrPGhYrhlMnmnnRtxbsR08HH1Np+Ldz1Djij7aBbv0tgs0C84YsmIEbR3wxJ4ardLA8NksQQiLLL8GDHkrL1KgvaGO7EsR6k3BfgOnocSxdN+cX391/A95ZCZitk4gniszOYh6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjVix5aIJJirVj096OcqmJbHlIzG0kr8lyJIchS84iU=;
 b=Kf4Yg2/Y34+iQ0+wMhXAyOHUEOS0ZoaFBP2Dje7FZv3gsbewZqavoWxNqfnvIZvtlfhEvG0IIu7z2qSGHrcqAKb4qeLrG66kruxDhju9P0nOIrhdEuIOAGrsFI1d35iWqVIYbU8thkxJYburyF7I4TxBRcjCYkBCuCnrv8CAkF6Rk0JlVw80nNLwnktO5kTmwrh8q2MEi2NUSE/AIzB1keaY9Xscp/ZEhc+uLJlOCAysZY6j1Hx0JjT0wGd6uJEvN9RY8WnDLD8TC1iwWAQSuGVTqnRAreszSXHuTKB2hXiwlPYu/J86oyJazkHvVeyMia1qfMfU5uj7ai2emWGG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjVix5aIJJirVj096OcqmJbHlIzG0kr8lyJIchS84iU=;
 b=XRQ0sq/PRZh/zzUfKA1bPdhYxfmxBEx61XIgbx1KbkBXjcQ0DThK7Or6gah5qm6o7mnsAKW6bM4fbx2tBGyro59mB7+OqqSzCWIc/8ClQBRAo4SGIx86mRhaOkoo6d26ti/0FiuQiihm7sVKJzYog3dHvAzOQbb7Njn1N1cMwIs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by SN6PR11MB2816.namprd11.prod.outlook.com (2603:10b6:805:5b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 22 Jan
 2021 06:03:13 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::f5a6:5d68:aeaa:6c19]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::f5a6:5d68:aeaa:6c19%6]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 06:03:13 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] minifi-cpp: set correct python processor directory in configure file
Date: Fri, 22 Jan 2021 14:02:56 +0800
Message-Id: <20210122060256.16014-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0140.apcprd02.prod.outlook.com
 (2603:1096:202:16::24) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR02CA0140.apcprd02.prod.outlook.com (2603:1096:202:16::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 06:03:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be21c882-45b8-4383-5b4b-08d8be9b66d2
X-MS-TrafficTypeDiagnostic: SN6PR11MB2816:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB281639663DD47846ADC85706F9A09@SN6PR11MB2816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BekAfbF/yjBg3Ncm08fbk/YgGezEN08TFc3n+S7k2iDXixqpNFB+AK8hSqr7uvMgIE89aGRNmuMQW/DYxctTD3BUPP2y+MEFIVVzTpfdX6cpdqC14Zbho296rDJw33rGNAyTkuNW8NKf2VwprpLJQQD6pbQxFxTOWmjJFpJ+AP0PfBKqh8G3H+zkAoLXGWc9orvKWMCk7MDBVNqEqf0iCURR++3M1EhK+vQJ4cIyAPwEeAgVgXDPQ91hJ1YXS9+b3pNF+68eXB/CRYhx/aOULQ59zuvY7JA18f5Zn50bA7mymVj55wDqrIAdGGXQQ2wzmM/DkbLhlJQ+lnK5VTIHsMKF0iaO33rYhE/gNdrsFyvAQoCM589ZXK/uMufXYQ7Qt8zpVq6KMPVtcxG+rSB31A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(86362001)(5660300002)(83380400001)(6666004)(956004)(2616005)(36756003)(26005)(8936002)(8676002)(186003)(6486002)(52116002)(316002)(16526019)(44832011)(66556008)(66946007)(6512007)(478600001)(1076003)(6506007)(2906002)(66476007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?26ritsGE0DXQbgnPO49XUeS7Ion9FBjUhY+fGpv37KAAfQGw/tqT0tHMPEi8?=
 =?us-ascii?Q?0Uze2vUBphGf54gAvkxCeHqtp8Mc8E8R+At2wG93xuD+7pI9NHrRzK882Ewo?=
 =?us-ascii?Q?iYYgONSjXp8yXGoN8mvBCQTW8QYBdqgrXYXiSgs90GvnqvCJkCD7xjd1glyZ?=
 =?us-ascii?Q?TS4k1PP/3NXFpmKT+ldp31+/adojY7RNlvdgYkhRRubQ7FNPLSzefyJU1ZHJ?=
 =?us-ascii?Q?WpQRGA+U5B+EbG/v4a1ozyUayCTTJOW/hn0fbuDXAv2DAx1hBHsg049grorq?=
 =?us-ascii?Q?F/xkIvoVdUTL2XoDcbeDmLBmWwJ000rcKSpS2vY/oWl+yJKiRjq7UwqrU/UV?=
 =?us-ascii?Q?K2a2EYKovEZbFJopL2oFuImvKWwP4Tg+8DR+zy8aLVOn+KHtGxGiCRw9RZvC?=
 =?us-ascii?Q?NT6jWgSizDYaMypgF4gVV18Xt3fbC9YXzTjMnUXxxPJ1wzmInZzIikw6wF5w?=
 =?us-ascii?Q?HquYKAcCV9mK6Ke6xmAG+KwQJAojUIpcMoeZ9ZG22MtEPk95HknCHnYhxYmy?=
 =?us-ascii?Q?ipbGxQSZevcqGX+HvT+VsFaYcLfMcPgQQyFhEZ+TRCJOmAKBBJpS1Rg2rf9F?=
 =?us-ascii?Q?SNZ8vBnyBJsRSIdPPwEo3kSOmEE5GFT5AEMZsvSioqU4bW4G2dqFLnzEOuCY?=
 =?us-ascii?Q?5dmSsjXPvpIuILMzuVZbJQiyKqMFHX6z2xNY74Fb86GzWgl1MLhmxv48aVKt?=
 =?us-ascii?Q?qExScDWxumQdcnOcStUj1+F5gkHLNpIP1kS/pnt8z1V4FzLALeTzDHBnLJWW?=
 =?us-ascii?Q?OZXSdHKDZ4SpB+v9+3SnCIRxFXl39K144p8sT1k/ewpjL1hvM9Qt21vzFFnr?=
 =?us-ascii?Q?HlHIkTPrx6xEXqq+jX/tpIbKsUCREXo3DgWHgJ3TA6YK9ihXvQ4h+zkPeQtn?=
 =?us-ascii?Q?L3VFZm+2YB4XRvMWxvp30pVdmnkhZhEA+95XjFY8QW8TXYTaiyEFGm/uBPSb?=
 =?us-ascii?Q?NUVWZJh5cfmcCcyKb4K3mUe5F/FvYzI4qYIRNHcC65MvCcud0Y0tgeaSAiGZ?=
 =?us-ascii?Q?j0LQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be21c882-45b8-4383-5b4b-08d8be9b66d2
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 06:03:12.9734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8M8dRGv/puPqAp8BkAha2bIdHTkZmhLeJfdchE07pJItMFuaNG12iNpTg7CPNNGdjVUPDVIoYuyTbaRApqOJ7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2816
Content-Type: text/plain

Set an appropriate python processor directory in configure file to fix
the minifi startup warning:
[org::apache::nifi::minifi::python::PythonCreator] [error] Could not access /etc/minifi/minifi-python/

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index b3ea44c3c..ee5d172e4 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -86,6 +86,7 @@ do_install() {
     install -d ${D}${MINIFI_BIN}
     install -d ${D}${MINIFI_HOME}/conf
     install -m 755 -d ${D}${localstatedir}/lib/minifi
+    install -m 755 -d ${D}${libexecdir}/minifi-python
     cp -a ${WORKDIR}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
     cp -a ${WORKDIR}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
 
@@ -99,6 +100,8 @@ do_install() {
         ${D}${MINIFI_HOME}/conf/minifi.properties
     sed -i 's|nifi.flow.configuration.file=.*|nifi.flow.configuration.file='${MINIFI_HOME}'/conf/config.yml|g' \
         ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i 's|nifi.python.processor.dir=.*|nifi.python.processor.dir=${libexecdir}/minifi-python|g' \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
 
     sed -i 's|export MINIFI_HOME=.*|export MINIFI_HOME='${MINIFI_HOME}'|g' ${D}${MINIFI_BIN}/minifi.sh
     sed -i 's|bin_dir=${MINIFI_HOME}/bin|bin_dir='${MINIFI_BIN}'|g' ${D}${MINIFI_BIN}/minifi.sh
-- 
2.17.1

