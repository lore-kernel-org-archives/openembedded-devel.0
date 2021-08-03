Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.2185.1628033096327711171
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 16:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XVtjuwOq;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3849e17760=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 173NMN1d001965
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Aug 2021 23:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=bjBJhkSphvYWvxcCCLPOHolzaKyekckox1i8XZpxQ7k=;
 b=XVtjuwOqWTP7w7WcvI9PY+2cTjpgoM0e+g2byBKtT9NFQC6jKOy6ouZVKUesCht4hx80
 8kpRwf0I0qTAybk9ZNKuh9A7OPXSAWAGGTEy0Y6vVrncyTOGWJXq16HmKwP4gdHTlgGK
 AMICRsFuyEFEys29Z2eFRJ07iFQIz1SNB5zs8wk0Ti8ioWhO+teLFFkYDYBOJeGc1Awn
 A2nsNKysi3xLm0NUB7vOstvR6Txy4UjSppscjHIBfVmT2WYOE5SnGIcfkFptQTHqh+QZ
 cdPDij2HoeBiDlkfN6aSi9LEY4AIpWubY5TRfI6LSS/3PAwTTT69Iib+oESWNz9IfFjs yQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a705h8mb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 23:24:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKd9DDmPda0PC54MuaMZNkhnBE3qJ712Gx2Ht0cwRwWrziQrWSPE8hNOYie0FuvMDwFTH2XStewvBfZytXmbJfIUbSySiTS6SWT0zTauM7yWYJ4vZnYPBsmchFQ38pP/Vt7rxmYfXx+ZG/FoLMozKHZE6XtHx8jYKykK3AAfobYthSln8OamHU1yPwf68wVqYCOxhapu7QgzuKrqN4WuatrjziqTU97eBoC+DI+lJfea1Ev/0JPg7oOJuPONlN2hSoJASLZECAhBTjDjhzEZsJuZqiNDTcqBQLMcZ3TdzTgfGgnWYcJvpBAVjRMXIhrtj8MLwm+ex/tMeFsB6+EycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjBJhkSphvYWvxcCCLPOHolzaKyekckox1i8XZpxQ7k=;
 b=BketMCEe5GBXNxoRH3a7idnmj7oyOqPD5fAT24D45DdlSxOiA0YbyjqDzu3A8xlgI5VjzaJz8lq/XKEZJm1Y4YpJhvnWmbKu5SDsAzHbhR1IpQa49UEp4RsLw/UsA6KQOqoiouTLU4WrRLQuIm5LbBn3GHAcTwBrDBgXzxrSvVrrHmbPmZW3fJw4iwC440RxzKotBK1q+QvzO7EvbqHptBZW3C0RqFAn1PVEaRPIUjY7bM91NdEAjDpE89/t5OJ18VWE60yVTXma3XzS3qR9aPAmeUyl7OYxS58aoaAv8awdwR4VItuXtHmfSLDilNWfMim92SeLSmbc7PNjA1ZCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2934.namprd11.prod.outlook.com (2603:10b6:a03:92::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.31; Tue, 3 Aug
 2021 23:24:53 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4394.015; Tue, 3 Aug 2021
 23:24:52 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [meta-oe][hardknott][PATCH 1/1] php: move to version 7.4.21
Date: Tue,  3 Aug 2021 16:24:36 -0700
Message-Id: <20210803232436.71145-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: SJ0PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::23) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:a03:33e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21 via Frontend Transport; Tue, 3 Aug 2021 23:24:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5766c161-e775-4199-3b63-08d956d5e564
X-MS-TrafficTypeDiagnostic: BYAPR11MB2934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB293419CBDF7F2493EC01C4A388F09@BYAPR11MB2934.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sYtECgYHiU04f+Et7/FmUu77hYQz5zBv5Xlbjb5dyAn0bEbhoM/vMIy3JzcvhGWPyF/0OSu+kqDxgX2yIJITPpcoWopB5htlVMXo2VKYgADKgjLtSN5MMheGFI6sojpzhT6Qlz9ekL707bFEtfQ7yyj/3IRaV3+0z6x3+kq9Pgv03SVM62e+KE2sppbsdePw8jUKUv9yj3LdgA9SPgb8hqf6KBSpnXoDSOnuyy04Ws+WIP+ABsLzjJyHWv5wSEmBx2PqZ9OfwdODVtVwW0FCFM2Dfk3UOPCLpEt/cwHPOFw+5L1JalKJ7qcD1KLCY8mrXdCY77lkUEgMKxkhip+nc7nqMiTVgWFfFahkmhm+f0sIEjp03B10M7ZqRn0NNDZ+Ln7ERq6zqnfAyIx6W7U948shsh1/WCdGJhK9VfNbfnMGvaNdalA0wsBfwg80EQpy3Ntiez9lr2lPxElKiSyS75lZGIKZ4T5MW+AqAk9LjDeN15fiSE+wfbNSb9yxFZyppux0WuJBuH6RG+9bQszt/pPk+2hYh1bluSs0bAL8Og0NZ8dU13Z3yCkbszSKu6Woe14P9IoQL5b9JO7ClfwGgHsUUyVSXxrlk4R1obRBZo4hrVYKqnYzDhy2IroQ11q4cdPRD0/RwwUE8JyJGEEnj2MfvWwEGfclEMgNKK1/pEnaSR3wPmWZP/v2Z/iZvwjKcIU5xMcm38FPi84rPBMDkA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(366004)(346002)(136003)(6506007)(6916009)(52116002)(8936002)(6486002)(26005)(36756003)(6666004)(83380400001)(8676002)(478600001)(1076003)(66556008)(107886003)(5660300002)(186003)(316002)(44832011)(66946007)(956004)(38350700002)(38100700002)(2616005)(2906002)(66476007)(86362001)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PAWUAJxyPq7NR+R3b755owGaEx3x+m6Dhw7aIHwbVUErO3uhGc4ikCqskO4Q?=
 =?us-ascii?Q?aNNnhXVUApZoAAhIYwIRcZ5aiTxFaneGLzL8y5yO7ovbv9RHN9xjpSb0U5Ls?=
 =?us-ascii?Q?nGta4lB8Geq99/lZptT5W85LE63aaFv7nsIkEgZliX8oQ56NXtQ+xCSnKfXJ?=
 =?us-ascii?Q?I15/iLAjuLHhUAiLOFKy/xuv5qOXXhygRS8OfFPHADCm4E7DMhd2v1oRtI5m?=
 =?us-ascii?Q?gD3D0ADKob3wmlOSW7vy/4wNIegueQp7WSw0qRNqF5ctvY52cMPcjsvkxln1?=
 =?us-ascii?Q?9M/noIepqYwykxIORdlkqQqPsh0yYatLrJbd2zN4Is2OjK5SsapLv3UwQ17e?=
 =?us-ascii?Q?ntd8qr5NN0dYSQTJNrglB+zq+evrcz0jiZqaHyE3cWhfHCwKrgKadAuJIc8L?=
 =?us-ascii?Q?hRfUYyIjCrS0bjoI9ri/ONXHLdO1cY8Pbhpx82RH0T/PhWnZ80kUJ6AegQ6w?=
 =?us-ascii?Q?pVXLQ5MbT0WpT+WlJtIP0mr4po6x+CLsSFB+h8qoR3s70KeiqG6dG7uQLHxN?=
 =?us-ascii?Q?P6pg0ijDbU0VBZOe6qpVzxnc012ZmZ4UEYGoYq5I3wo65pxpoQTXf7V95LGy?=
 =?us-ascii?Q?pC/t4qHSe7TOnK4kU5Q0GdQ8GZVR4UCDJ3tyPuok4wrstjd/h2/+l/YzWBFB?=
 =?us-ascii?Q?igWTmFVKRb5ROqWoeyKhKVGy+zfQG7J6Yudv5Z/yR9w84md62igD+elspmTr?=
 =?us-ascii?Q?wDJ6siZdA/YCEr2RCrvPSx/7qYlGkc25SyJ8HwIJhZPEx/iaEg1MwwA1kc+h?=
 =?us-ascii?Q?S6516HG6Mt6E4bWUk3M7wcyTdWNFMWKC4dvz0spiMEMRRqNtd5ccGI2G+uZd?=
 =?us-ascii?Q?Cctb3RbqDXgQLCaamr+FoFEyzxSn3GSVyO9DfIRzSQnaoOIPX5sLv2sCMA49?=
 =?us-ascii?Q?Ja6FKD57ygFDkB4BIb/BQV5cUEfyjURoiPxxDCQ11CJP11N7yqrODBYtadNo?=
 =?us-ascii?Q?4haZh2b5nfdGdybGif2Wm8Prs4LU2nuCAFnFKUcvWfvQVZwVP5jic1nh6x5x?=
 =?us-ascii?Q?AMS4U0D1pBVAfNht+FSTmmoOhjabll0+hpPDanFUqGuAD7P8HcYpJ/4qw08b?=
 =?us-ascii?Q?B6x8KuOWHeU7veVgdw0JiWwv2pvz47PI5vz9wlIq6PMyTLwnoeVhYjLA1fVC?=
 =?us-ascii?Q?KA/TgN3st/O9AB8PYMsj2Mm8LX2HrF6fXHgJUBPknvGlL60k5xZGDyyrJkuZ?=
 =?us-ascii?Q?x5EYTQDCfxWJugNulkbnP8VtHYg1qPUGIEiM7UNZZXE9Bo+pGH/UoD00HqYX?=
 =?us-ascii?Q?3D6iOKrjRNnP+qqP3IoGsBzimSYsu5WPMs+XNXKmg2AqqK5HXS89XNtt1p/8?=
 =?us-ascii?Q?GdA8+VMaQSRJIrTU9pmDZGIz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5766c161-e775-4199-3b63-08d956d5e564
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 23:24:52.8908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsUPKpdF0TIJdCyN4jQ3LBcdNQmDhUwyTDRqZ7x4fUI/VIXLg8Dw4Su17UVNmxQA8WIFqCEVn/ijPFn59gaYHxV0o6WeNdM6B90oiDIaRGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2934
X-Proofpoint-GUID: _VaQWvu7p9sAN4F8CPN7JJvB8unBp1OP
X-Proofpoint-ORIG-GUID: _VaQWvu7p9sAN4F8CPN7JJvB8unBp1OP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-03_08,2021-08-03_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=732 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108030142
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lots of bug fixes.

CVE: CVE-2021-21704 CVE-2021-21705

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(cherry picked from commit 93045c3db744a9f1cd0a9b0ce992d44d9c44c309)

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.16.bb b/meta-oe/recipes-devtools/php/php_7.4.21.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_7.4.16.bb
rename to meta-oe/recipes-devtools/php/php_7.4.21.bb
index 821d9cd04..4d427252f 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.16.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.21.bb
@@ -33,7 +33,8 @@ SRC_URI_append_class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "85710f007cfd0fae94e13a02a3a036f4e81ef43693260cae8a2e1ca93659ce3e"
+SRC_URI[sha256sum] = "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
+
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.31.1

