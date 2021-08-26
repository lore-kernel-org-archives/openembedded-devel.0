Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.26061.1629950053190694290
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 20:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YY8GbNA8;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3872e16120=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17Q3rxpx030361
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 03:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=PbnfI4hqiI4UbfuPHqmbNVPgTttCLpfLLsZGr1CU3dI=;
 b=YY8GbNA8q9ev9uo5otlEzc6Bi86GEGToiPGq3ZnyDa/LLLjJ0iTmoUeSL7oTuMLBfYxm
 BZItgBWPVk79pfc2nFTbm8atha1pHQFb+86uSZ0z3d+ewvWcuAwAeK0kVgcfFbSwd3mD
 ZOah6zZjaQ9bXOoIp5T8UtlPqzazFCaAhp9Dd7DmhbhFS5E4iZXhD+OlDbq86LEaqFud
 RSK0uIJO/BguIz+m9tb8UIH/tiV3Tng19KV0EExvbBuOo9dUbnuPFP1WNNNG/yY4Js8g
 O/skOFMjkp662aPhr/ujMAGQozKHobTcL4JpZL1CNC2/C6vYcYGbd3vWVf1mAhdC9J3P 4Q== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com with ESMTP id 3an90bs1qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 03:54:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8cZYH7tYs09/sMvbMXESlPt7M8HNvqTLq7qwZNHB0JVU/yt5bn6J3Txcfpc96N+Lqav6ZqOfVfCa9MvQiZg5eXZIm6QhagaoFgAw5kYoiyesovNQglxIEKPAackaptsQg8MsxOFZf3SlaqMHMVZ+KWDgXIPx38qjdYNpyWk4PQXZWDmC8WRuWIC6tUBqM8IUW98RE3wdl6FTRHylp3QWwDRncbJok2AzYvBGwIUhzS2nRT3c885vK7mdhKgV9WLFdpGAcNwteYX+UYHzcPen1OLra3lQk+g73mHTDsjIfVpmF3UXf+BWH+MtNqmQYtfa/p/KDN74E6YZhdwB9HqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbnfI4hqiI4UbfuPHqmbNVPgTttCLpfLLsZGr1CU3dI=;
 b=jvTb7QT4sNu2BdxT1q/BwCJzc1Wv6oMSNbwNz7FvGsiQFGJ9NzjtK+tOztDjUqeSbLcSXOaRxT8Mgxsjf8BF6zGak55xaZTFiUaiEA7Pg2PATIMN40ESfixRMpgvJ//YfDZWHFvDDd6n96vHas6RsVdxzStPrVylDokdZiq3n3ExMMiXpLIXqR58QpVkcKY5eNcjku9KvylcNEBBbKrtK/w2jEtUc6tDDCqdw2Se9F9Am26A37kVYj3tX0SfTfkWG7ThVGUTw/Ah0QbzucO+49QqqfGLjjyUjM9fBO91gaDblfqd7OH6n0W0rwP5DvKFAmLB9yYsgw5oC8ahDt2Tiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB0046.namprd11.prod.outlook.com (2603:10b6:301:67::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 03:54:09 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5dd9:8ef5:89d7:8b3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5dd9:8ef5:89d7:8b3%3]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 03:54:09 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] krb5: filtering out -f*-prefix-map from krb5-config
Date: Thu, 26 Aug 2021 11:53:58 +0800
Message-Id: <20210826035358.298158-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR02CA0221.apcprd02.prod.outlook.com
 (2603:1096:201:20::33) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0221.apcprd02.prod.outlook.com (2603:1096:201:20::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 03:54:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c286b36-c95b-4118-1160-08d96845289f
X-MS-TrafficTypeDiagnostic: MWHPR11MB0046:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB004613EE098E58BDE205D3A8F9C79@MWHPR11MB0046.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GEvF+ccs6F+f+qt1WahWAYe5F39IzCEIF4NDQ1UkcyPDtzawovfltWRsoFmVYk+1PAaaiOHJD/UcfGJdKRUcLBNoQE2mw6PyJCPyu3HMF5XbbWSQTmBCLVRUUqfhYNgOm58VKjB0sUOSaaG2KMhEgnpob0ZfFKjPtIVv7h2JaQrv/e8ktIMZ6tzoYCyqR10UlLDwLeUDbdZb79IfaMAhzlBFxirspgmMZsKsbgx7f64ogAHgLexu3CDHSfj6ChQJL55JnZihmYmvLfj8UnL7lxXhRjRO226iMEUs43NnUdyoUgUcR8HTSGorNoxmNM4nJcc1z3DIWh2Kye1qRg4oIkuOTeT2O51VthkoD9J/W+h3XL40G1lq3egWZ17Rgi+13Gk+Wv7SYPOErpxJqbOv5w1fMrXC5b9YKNCSuOc6wPoS02buKnvvctSrr0Me1pU/A3RIzSsJngWjG5y7DCifwstXOD+UwsCjWRMRUd5tX7u171py+8NZ4RPVvW7KaerUcl+kZPUbiDswAvn7aqXid3btPvKWGhT5DnsQD8G4nA4z3VLaWkXRsHYrM7WV5AqY7qVMsa2XMurE4GybQv24DlfMu9H2Sq73EENUIGUHEA1dckQC252ei3AkvbM/T1n87kItFT6C/3wRh2nXiZxg8wHdWizTBVFrLpAUF++5S0yWwAwvDbPOzzXIo5ti6H4SrxjnpBAs+DnrpHr2lRE4Eg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39850400004)(376002)(2616005)(6666004)(956004)(6486002)(4744005)(2906002)(66476007)(66946007)(6916009)(44832011)(66556008)(316002)(6512007)(5660300002)(86362001)(8676002)(6506007)(52116002)(26005)(38100700002)(186003)(478600001)(38350700002)(1076003)(36756003)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PGDkcgZlW0OOdnNsLE2H/BZI+g7KQiEciKCxFUXIZBIZeIV7K/YHAMUnpoZW?=
 =?us-ascii?Q?lm87TWndPMaLtm17TVD4o1Qzy+XjOOSzbrpA7aCoum3Peo5w7z/k2yMiSjLM?=
 =?us-ascii?Q?qsmkFgvbWjn9m6a6aqyrvny6aZp5Ez5duZ6LPA0vwMRZKe3UkQAhWrYYuJc3?=
 =?us-ascii?Q?cFFDoaK5hUBJRa9zSBU7MWs60c3hk2aVJBhf/HOsMvJ12b+RmROFAqHUDQYo?=
 =?us-ascii?Q?QMH1hX3+LlAclInDGLTqs7vB37TkiOb8KguSzCBCQuMtIsaq6pLdHdkznOY0?=
 =?us-ascii?Q?CSZyOXwPaBF5DGmN5QDlD/D9YLEvzOe83qT3ar1dPD0ml2mrzla3T0vrA4jK?=
 =?us-ascii?Q?xgJnwcvuBkPKVA+coHwIHqCtsOT9abCTjPub2uo5xQx1//sFtSRz9hhmwhzC?=
 =?us-ascii?Q?/A2fEBMJ/QOhtTDKo5jwb7ZT1/fiQOyefCt8a/3Xvj8Wwc0sVSAx9QzXm9DK?=
 =?us-ascii?Q?9f2g1nXVcN0rYAgcOIi3yobaTUzXnXriNvvRf8uiPRJQZMlt+sNLI6LGjjPr?=
 =?us-ascii?Q?sdARz8v2e5ABWes3I8DT8gd1Jp5ul6gYAJiN8zd7wQlU1hLmdloodbvB+dN4?=
 =?us-ascii?Q?RIfMDoOgG9VbbrdOlf56IOUlr8cszMlTmlHLXwnPOhgpgYs7Qlv3DoH+LvbE?=
 =?us-ascii?Q?2iF5z6vPiktjBCmdp6eJP5/xcaO3LcAyjIFPO7+IDzQfo79dHtjwAJuU8ZW6?=
 =?us-ascii?Q?CiRunjzE8ZhWvrTWsG7WJ+Ia0eYSV92VdOANS1nGNn3tDLnEoxW0scflZLtm?=
 =?us-ascii?Q?ceRoA2/wINK4+n+Ya/4mBuLLWCCWscMWPqFZJ87wPyNIt3ZiQKEgnb4gLFcz?=
 =?us-ascii?Q?PinmW04LcxZnxxyivPHA+EsnGpw/qJI49VldZ+RhNtUqA/ZlZTaih4Mu6ago?=
 =?us-ascii?Q?hdumVr+I25ivef7msFU0HJpY1MkhU1jSZVXeEydGqQFLcFiju79Rud6lQ+EV?=
 =?us-ascii?Q?jpd7DqqiE2z5pBTuNX6zjzY0c/ro7LaIsvy5wgqwg3w290nKiqEfpm8V+/iL?=
 =?us-ascii?Q?COZtcCvhBHx/HBKTxhx3PIrFTMcPXsyNI0CT7o1P1eZbr5J2ZITtHybOBBZK?=
 =?us-ascii?Q?ca+19lgcC+h+Gmn0PTSt0whXWcmun6VxeiLoc15pfaIlx1+Jno3np9SaD8P6?=
 =?us-ascii?Q?udXSf7G8iHvF8ne9WfLGQ9pmkKibLDx+kbpgf507s8bYdDofLkcIJzZkE8iV?=
 =?us-ascii?Q?swXw7LqXshA+chDICqhhaC633hjpK9nuBvMG0keibEKPJ4d/oD5lKy71nIgp?=
 =?us-ascii?Q?DYDwnOsh0nEY4qXkx82GOjGpVNQy+j10LtOuNk2pC+BxkLTY4BfxzDVVdf9H?=
 =?us-ascii?Q?HSO8zWag4vvGMX8RUeGi/yPd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c286b36-c95b-4118-1160-08d96845289f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 03:54:09.6237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwPpuW4ogouuME9Y0uiTcWwULtwwEPmDJS+5MbEknA3/efE9niUtB/EiV6/CP5QadcMFueafJ5k2i+ORenPDiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0046
X-Proofpoint-ORIG-GUID: xfSiE63KiUdnk9rk_K1MaqgSzNQOKSSF
X-Proofpoint-GUID: xfSiE63KiUdnk9rk_K1MaqgSzNQOKSSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_09,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxlogscore=754 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108260021
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove -f*-prefix-map from LDFLAGS in krb5-config to fix reproducibility
issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index 8b83705f6..6c4b4575e 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -95,6 +95,11 @@ do_install:append() {
         install -m 0644 ${WORKDIR}/krb5-admin-server.service ${D}${systemd_system_unitdir}
         install -m 0644 ${WORKDIR}/krb5-kdc.service ${D}${systemd_system_unitdir}
     fi
+
+    sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+        -i ${D}${bindir}/krb5-config
 }
 
 PACKAGES =+ "${PN}-admin-server \
-- 
2.25.1

