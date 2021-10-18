Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA28C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 16:35:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38914.1634574933079873866
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 09:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dS0LXX4T;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=592552de1e=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19ICl1Jf006036
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 16:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jkaaG3yl+RdpmdBBugNiHtykcWobZ0Ub7VXePLQSjb4=;
 b=dS0LXX4Tun+ZFHTgFwF0oeql1BL97GlCODQmeyhHsoAx6cb6hNDnRMu5c0APklE/BE1b
 B1qxMI6jZQEC4UUW632vGWOy6z1W6xoSN/KPDf1L2SIu0eACZ3ox7neXUiyooS3YFtlS
 nNoirG04lX2fkcy3Gfn/VYdjuS8U9fBQMC5JXcBrccgReCJq+9y63O7BIYG89P4TpTCA
 PZQSrEM4ebgKcig3G9wrN0+njC9NVmmSd+5kTv1nILsz78xHdVe/JbZFQADobk5MQzvc
 fkn+JnEgWvlty+mGvtIjTrBYfZ1RjJZx2uYCAUi7LPyzOMJv1i6L7u2dDsdZNyr7/+fb EQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bs6hhgab0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 16:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yy4ym1XWS60x2Fz0WtaeT17zV9+dgsE/VcLv2MTGEM6ZDgyl0Ukhb+0GJeuWXGiUEjepSM+6CTCP+ZlLQJDnTgNklJGuOdB+XniEyoH/qoWBztxHeRacvgWMYa0nnSwIS23kgKYC7XIPu3qv/MaEn6JlSzuZV/22Naqwt5sCGtZKE31J2xaqZklaZThi6ujZKfNHF0oZbrHaUGNgFF3aB0dQPqAivvTvI0WP4O7O/zQexhYtyoTnaBnx2TR9SZd5K8oXEF/Qj13CqrLBhaSrvlYCGBkUnrrCN3ba6Smk19VkLU8DnwQAaWoKHyyiLPp3VZpkjPTs32+RCXo0FuP3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkaaG3yl+RdpmdBBugNiHtykcWobZ0Ub7VXePLQSjb4=;
 b=XnOOS1J60ZA2N+haIO0Y95v6xBze16rGhchomn9SQSs9j5zuzi20KhzXh6EK0XuxJ4j3o8I8jPhSLmnu2waBMbwSgvs0OqeAxMg5oH1eU0mCBs/ZGwi/zU2/TE+4o40v2xgLvEQsqn32aw+NzQ2oxJgDGs8vmsScOfc1vic0ecPcSiF+6fdF1iuaHh/GCKTDI2j0Zl5ZfWZJPGhK7+mGpPb6KIO42jyjP/TT9WlPaHo2VOOokTkgn/AZ6pT2JuGf63pEzzXyRybjls3px9zWd4tDJ1uiFedmNpFjbMifpkCUoixf5lUbGQIHN/QF8rhcVdK0GchV0UcEFGful6J6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 16:35:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 16:35:30 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pyinotify: Add fcntl,
 logging to RDEPENDS
Date: Mon, 18 Oct 2021 12:35:12 -0400
Message-Id: <20211018163512.134466-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-tgamblin-lx3.corp.ad.wrs.com
 (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by
 YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 16:35:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb381685-ac10-4ccf-9588-08d992554c40
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5868:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5868E7776F4725508845B7EC9FBC9@SJ0PR11MB5868.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8Pym296aDJdOJHYJ3211eG2tWuGDYJSVi951S4zCnPG5ktMynXuNDLjUQn/+u8LOutzwnOJcmLWpsqmY0K/zuYJgbfKAegAr7nw81b1ZOQ7htDHOonsa7pGBYxHFNYsJCH8obhTyN7lgiUq6t4GMosKN7DorOUID7ztZ09ihQyW0zWhRGx9RvI/k2X3SDcqYfsJA05QvljI2irld/rhjFHwhRzj4wLH6fXCALJQMm4Ip28YHfRLgtvPHfmJY3gA1bo7X+eXwERkgN/7PIcYXVrDGi7gwlVr0KKzr/17RyH55oa0NVyLHRB9hl3E4dPSSrQ6xW7NDiMKSbAHYmkZH7A0vzgD/pHMQGL4BAB2sG2bK6sgSdsX9rI09wGJ82h7a+I7PzY03vAogqmd4Q+qa69i3TyyiOkha40VmQu5QsKZaJTMGkuqr1hZEjMki0TUgCkvQ0MBKZw1UbC8S0zLmxKrmENfVe33GS3xybaVku6jCBZ0pffzweDrKpPcGpt3XAqOtoYIrO+29DCsizxtGQFeHAf5DLONNqRqVaabEq1aFVO5pvKOvGnjIg9KI2lSDMu01E3hHRpAkp46GUVLDVQ0X1YNAKb9FUvs8rE+QZVUaW74S3lm7Gg1pbLQNxtSsedEzB6GNYbg2yorpKmmNlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(66556008)(6506007)(1076003)(36756003)(6486002)(44832011)(52116002)(2906002)(2616005)(86362001)(6512007)(6916009)(508600001)(38100700002)(8676002)(6666004)(8936002)(186003)(66476007)(316002)(5660300002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8v1GVP1egKxnZJJqi2A75r2vEKmJkjRTwY92jg5WFkDcGzIG8Do98vixNws6?=
 =?us-ascii?Q?6hHlpnAA6PRlqUBA8bVBpEDrql21UjW+DBCrE8Bnu511/aPVS49a3hK9vA31?=
 =?us-ascii?Q?fJm0wnUR5R7AAkbM9964Shi9KQa6euTRPyg/YdikoLZkoUxQVfECWkfo+A+1?=
 =?us-ascii?Q?sftgdIaO5sQix23u1uI56vevGFkzfb214qFdHofFN2HAHQFWdqdVEEaACoAK?=
 =?us-ascii?Q?aD8ekWogBPLz8WEZXCCEKyLYLnnX1/nrt/dgluyHb6EEhAI65EM83dCCWAjH?=
 =?us-ascii?Q?sGnLDUghFMcs2YCU3ziwgDxMxBKPVsOrRqZcg+yH23XSaDCYYt6uAwGbmacW?=
 =?us-ascii?Q?2BwEDk9LeUjZ5ToIZXU85SEPwFJXeIMiF6yGTOhMtQa2/dLveIQ9A2YY27/+?=
 =?us-ascii?Q?+l4ApZTzpURTY+dd99FB0qQPu9PCDTKRFCyPTnnvPyEl9ARce73ec3+gE+cq?=
 =?us-ascii?Q?rP+xnCFty4pwUWtcTHOgi0Z5NxAoWvuVgLfRgUImGD8Q90tfhtCQ0aVvPPPV?=
 =?us-ascii?Q?wUtToKZO6jz6cTU/82wnM30A8Ify4pOPfvAP5LrHXy9s4vRCbOvAa2iNkYCb?=
 =?us-ascii?Q?xPm6fIlFGIQoXYI22s9aPTsWPShcRgEQxKSLZpy2DkW8XjlwtqCqnDnT3j5x?=
 =?us-ascii?Q?x35HXbjcSBLnvRZ4+5gfxDb+hrQK7ji2dmQcY4ghYPJi+jm7KxOq0ji0AMNr?=
 =?us-ascii?Q?kPlVtrBg8/J0bJPtl7ZaJOwa+9VzcRJG/MQ8+pXE3SXJV5yLcsdbsS5RQOBx?=
 =?us-ascii?Q?b3sNcpE5uTMqGZstqIpC7WmU9+QTKqtm1Bfu/pVTxgwfzuB/w+eyxMe3xVMd?=
 =?us-ascii?Q?2p4zawaBiYIjX5ypcq4oRm1JuHgEW2WDDo9qmMeQsZ8yAtBHdAwc6g4a2eSZ?=
 =?us-ascii?Q?caj/d/BQMYYtUX92qyln1SGCaxurZ9f/7laxxxRvV859KgydMSQcUdkN5QNI?=
 =?us-ascii?Q?KoCOCC/+vU2qOENoBZmsPex/7bqLc6/M4Tt7tYOfHuEiExZOXJMe9F0UhFLS?=
 =?us-ascii?Q?KGu3M9wfu/ylP2mRCxURLpyOcyXZj3reD12nDN/WzukUFYG1CpxEy47ntrMw?=
 =?us-ascii?Q?3Dj7hz0LNhHqqlML2TK2B+TFiRK+30WVcZMFtdz4ekwJn0yQQZEQuMf/ftAV?=
 =?us-ascii?Q?zxvUqJru3rSRPuYcwwl5PYpjuq/RwYRz8FxnZ/lEvQ75FlIzhF2Gn3KKZD37?=
 =?us-ascii?Q?ITmfRNJs5a8MBoCIu2T5WhZoIRsX224T3EfjrR394xwIMENdkIhmivNdHpq8?=
 =?us-ascii?Q?aP8ZNrGff///khOsOzR3wCMRR9z+tzHZB4yjfMOmt/GgXhanD1VrBZqGNVOo?=
 =?us-ascii?Q?WKp+ZzeDbpa2/v/8wz7tldm9fGbqg4coUvL81rw+M21oYt4GnuEgKwvPxtJR?=
 =?us-ascii?Q?terdDpmnRoSXXCSpiI2rnML0HgzH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb381685-ac10-4ccf-9588-08d992554c40
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 16:35:30.0921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qNgQcwIo5dmZmfeVgXgFCfbYIOe8UzmSXvoyffVs5ubQELH2KTioP/A0B/ESYkLn6LMnbW5sLqBzcO591LcjQV35qL3sAtp1Xj8/3ZNURXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
X-Proofpoint-ORIG-GUID: bMlM3WNhv8TZ5WTyU-9ZdlYFxktkP06A
X-Proofpoint-GUID: bMlM3WNhv8TZ5WTyU-9ZdlYFxktkP06A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 16:35:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93432

"import pyinotify" throws an error for these modules if they are not
included.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
index 8c6550a2b..8dd5e1580 100644
--- a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-smtpd \
-- 
2.31.1


