Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE677C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 20:33:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2305.1648067582518587541
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 13:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AA3TN2jl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00811796c1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22NJk9TR015179
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 13:33:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=MDONOjgTTr5z/JfiraTKM0ZMmm3wOZuW/kDQWYiTkC8=;
 b=AA3TN2jlOKb7TtKEvhW1RovEdvA7bZ9ZZvcykb1zMEEoHHyTicp+RhOvbNP2q0x/WFxb
 /+Y0AxO9zz9Mug5n+wS6flqyDhTyJ5UWmgqgguBxeSk4WEhWulwpqgMiEVFPAqTi4GQa
 XBpwHJDAWFwnktTTB93ao/b7fLGnqQGT6EwmFsbdFMjRb/Q0jMGX+RUHIAT+qZfvar8f
 3Sjz1YpOSt+C/GyG8lB/5YUwWSTALfXz+uglufGKRlT1cLUzx0Oi58dJT6nPumDhU8Jy
 iaej+0WFe9FZIwKOKPEpHtR47xNyqSUIio50qtaZbVFTLpjMNv4f/IOzo0JVgwEelA5y 4w==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3uqc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 13:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2E8vKRU+mYcmYr8eo0005kwt1om12SAH29AmIWdsIL+y8G0icBTlg9bOg48Ynt//aq25t6fcELj1HxhHvlX6lzPCRFsQyQKtI23itej4koDsf7WgJ0/7RqeUuEiN6rODADfBXJZJ8zKd3+ABoBNp6SHF6ka6u0dfH/rdPitct8Iwjsnn7CSdBpXKTSqef70WpT1zTaZ5Re4ObjUgwoYPI9TUfuQ/6zoM0+O2ZlxZoLrU/v8V/w4BvPiBrIsJoL/Rnu/iV5lnqHFHh7B3aKl29ON+9T7AeNRuIsyLJbfYZvM3lTlkJ1xNldgV0LchLyZqAsCMykfxmV2CQDipD+vDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDONOjgTTr5z/JfiraTKM0ZMmm3wOZuW/kDQWYiTkC8=;
 b=jDe3RJLDjYzS35ndukVJfnoi3c5juudGlKwaig7srKgUrz5pj6R3fAZIEhF7xvXXPc/ten0u9cTEBDAjP1S4jWt765xxSqWWkJLIpFeMqhL7IuTTxYnyN1iu/1lYvXu1/g+Uodho1kQck/0YjK72R6Mw2ObQ9SxG8kJ3k3SAxE9AOS3i8MlV6Q0vh7RqdZdvX+U1vt0vbRDcz9j3HTpmZLUXBVhbteJaByD1M0DzrcjHi0UehHVn6Bf4oAmkuEMPwiNi+yhnbBlUmrA1tk22hLVHRL8BCaU4jtCDQAsbaiMERu+LegK+aik79fL/RPo5vG+UL0LXfpeyXr9gJw9OTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BL0PR11MB3009.namprd11.prod.outlook.com (2603:10b6:208:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 23 Mar
 2022 20:32:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 20:32:57 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] packagegroup-meta-python: add
 python3-pytest-lazy-fixture
Date: Wed, 23 Mar 2022 16:32:50 -0400
Message-Id: <20220323203250.4029016-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c9ec738-0532-4c9f-b281-08da0d0c50d2
X-MS-TrafficTypeDiagnostic: BL0PR11MB3009:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB30093D3CFC799598DEE70D4D9F189@BL0PR11MB3009.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lAA5s9kpsq59iJfsiKTAYgwgsI9jg7Zo8H4Eg9sXTEpncyLH3Q/OFPq/jUeayxNZRq0bTJXgDZumxgNN+gQrs4gGepSxb8n96xZvwQcmhsxHc1L8VBUEJIFDih0eQtiTEpkjo53sBh1naDda2BMRmVCcD8oG0IZTyVXDIfqkGR6Bbi9HHz+pXvMNBoGtK82ZnC6hOumkqlBHyPDukjR5nJSySOBh3RVnnyno0pOZXvH1tFUV9U7/3k6ju0OA/2NCwsNM3H80uWU1q76FLp6Bmg+KbF7ZV/M/288CdocSUhRueZbzL8htwevNBlBbQ/StX9G/QGmSXp/PFu2BJP/PQWJKsqSghl/WD8af1D6C5xpMck5P/VGVxGf2CMUSqihruwl5KObJ8qiMby0HRj18v2q4SJuACzCb89Tb8g1LcjYxCJTIQMlKZQlc51NOIU8IHO63uca+Fjk6yBCXqifrKm6IR2YkUoNKxcJC/fzNCnocwsJHrdkkURTf38ZOes/djmEH1VkCX6BZx8t1TEPbDShc2VFpjUuEU+0qNsXJpn1rqposM4w8NeV8T3JLL5ne/C3Ogu3SwVuH3blWoTJ0CyJkNdXGoLt96NQS7v8nM5tC/tPFEwEz6crfQbxt3kgDNHSRo9OScgjwYtb1p9Gs09OoDN9zvPeDTSzcEeBjnSH72ufj5k4byd9bjxAmQvUQd5qwDUkUrb0kedZT1Q9T8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(83380400001)(6506007)(44832011)(66556008)(6916009)(2906002)(52116002)(6666004)(316002)(26005)(508600001)(6486002)(6512007)(186003)(1076003)(8676002)(2616005)(66476007)(38350700002)(66946007)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UilRWgSfkU+C+PidGHZ/9Y7Y7jwLLkyu9PEpQTURQLV8XKyCYmREP4KwUkaS?=
 =?us-ascii?Q?mBRs7QPMAejnTfgjUMkL6iPbD9R21VR1/TV/GSM6zXsUxADKncZlBOMivT6W?=
 =?us-ascii?Q?Ouj010wNl4Y+XL/CzJMuqNPvP5tLrYFH0yEfFL8KeYGsQkaTJB+61nWsakX1?=
 =?us-ascii?Q?iAoNCiqb3nVhYcwBwCRjrpkeT3Eq0I5ZjHI7wH0S04bgK8lwvzHi/y6Sq7Cy?=
 =?us-ascii?Q?Hjbsnwzj4/VKjJoINZPUClHEaGvYcrzS2OYvC3ezcp0dASQw4wWvcUBj8JG4?=
 =?us-ascii?Q?vdQjKvvLjf9iYOdqHz0D9Svjyx4y5Ef26u/jdXiRmxe4WCiPhmvFrF0fUtMU?=
 =?us-ascii?Q?Ub/KssP0Qb28L/xI5iGtanDIsFdN0KJfY6JNdO9tk5/DU+3jV21Psw0isPGC?=
 =?us-ascii?Q?njXaXAZUro5fj9Mu3OdPZogSfKXvwnYzI7ZUW3WNP2l9HIFmN7JSNhnx/ZO1?=
 =?us-ascii?Q?mr3VwzKRIWlGBnJpHHxh3qpuvfGAFgtbKoDfeYfDRGZKLnPKl++9b4uTCBiW?=
 =?us-ascii?Q?AyZWOGN16rNOBzE2JkhCZDL7PL49nDpw0Q08NDZsfN/XlnAwjmm2fXcVqImF?=
 =?us-ascii?Q?+mypGDrVDQwZslKT539KJnKs3spAmJwzK9IY0ODxO+iVO+du37+M6QfaqcFT?=
 =?us-ascii?Q?2Pe7Ozxk6SqVeE1Y1rD2VDttMhRdqUgk5KrnxCti6k0uaBbR/ILZVhwk6qd5?=
 =?us-ascii?Q?Dd08MYD35LIGyFDZhnbeyBAqBbcfJ9SWXUBp4qOws/eL1JVEaMYPuWSFwlkf?=
 =?us-ascii?Q?9A1ffuwzcdyjo1C6JkoiQ+R/r06g2lyUlGd9DwIt2O9Zx8EnJVPd7vU9q00B?=
 =?us-ascii?Q?GOwBsrTzp0xfUtGtL4RubGhRb+wln6We4eNjeiqJrd4+78lPc3elpUuu5ADo?=
 =?us-ascii?Q?ODgrxoNZ1OQCYW1YmMUwmjGsxI4XNVk+Rez7rMXDzx9I7n89VE3sC4cQ+pS4?=
 =?us-ascii?Q?2vAJ5ZyX83Krdw1u0uuJwzLXy2RJwVzEAWp7jIfhWBJgU14tP9lnvXaYZn7r?=
 =?us-ascii?Q?b4u93ye7S+fOIFE3fjxORThwHFPsywp3mxpnCWH+3jJc1c8Ip8NWHFhli2fQ?=
 =?us-ascii?Q?RjgkDz4bWjk+t1uh/aznm1gDucPz/rgmxyiPI7MoZ1AsvZRu5gIIarZSy2w9?=
 =?us-ascii?Q?ZLVTlV3iHHB55j80KsdaLNEN7OU46LyEiA2+isUC2hweQVschoqbeKkEUPJq?=
 =?us-ascii?Q?TcML2a4KrOdFJoUGwJXHaHRb/E2O46C6H1Sj80E8pieYWghOe7WEPDspEg+C?=
 =?us-ascii?Q?sLvHHwa8JHIT8EDd3CruhH5YOEtl3QDK2a1NiOC7j9HbzTG1vw57ZhLZZYTA?=
 =?us-ascii?Q?4kbLlybbI9mJOsCGkj13YIPwYfOJofsocrfaSxJGW3QW7e4+AYuAnURybUHC?=
 =?us-ascii?Q?8LcaLiTpCkishYryO2uwx8VyUVTg3zo/BefK1s5O5mw3jb2V/G1gsct6V8ij?=
 =?us-ascii?Q?vhaIV9M7ZMf7qEVAwbVDPLV+5ZF+8jpPnTfoHCXQRH+oXobWQzdtHQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c9ec738-0532-4c9f-b281-08da0d0c50d2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 20:32:57.4819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 34tiK1wWLn9uKBg/ibCPQrbBAqGFKXJFgKU450sICAnRuToi6EUSpLMYuZIHYO2yOZoM0T/7McB+3zsSKbhrDv+DXWOD2aCrrkgkSrH2iQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3009
X-Proofpoint-ORIG-GUID: FFN1JD8cb1GVPtiwLGM-2GNVTaRJ3YAG
X-Proofpoint-GUID: FFN1JD8cb1GVPtiwLGM-2GNVTaRJ3YAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_08,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=876 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230107
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 20:33:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96166

Also remove two redundant ptest listings for jinja2 and markupsafe.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 682814a6a..f7bf36519 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -334,6 +334,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-forked \
     python3-pytest-helpers-namespace \
     python3-pytest-html \
+    python3-pytest-lazy-fixture \
     python3-pytest-metadata \
     python3-pytest-tempdir \
     python3-pytest-timeout \
@@ -452,8 +453,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
 "
 
 RDEPENDS:packagegroup-meta-python3-ptest = "\
-    python3-jinja2-ptest \
-    python3-markupsafe-ptest \
     python3-ansicolors-ptest \
     python3-appdirs-ptest \
     python3-betamax-ptest \
@@ -489,6 +488,7 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-pyasn1-modules-ptest \
     python3-pyroute2-ptest \
     python3-pyserial-ptest \
+    python3-pytest-lazy-fixture-ptest \
     python3-pytoml-ptest \
     python3-requests-file-ptest \
     python3-requests-toolbelt-ptest \
-- 
2.35.1


