Return-Path: <mike.petersen@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A471AC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 17:32:50 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web08.784.1659115966621456181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 10:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=R1SnpE1K;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=5209489cf0=mike.petersen@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26TEGbjj022015
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : content-type : mime-version; s=PPS11062020;
 bh=8k5Ke3Mn/tN7aqyhG1WtptE0qFT1/u0aPYa9dFYMpY8=;
 b=R1SnpE1K3MknQzXOQ/2PtWFAboG7YfWhPIri7uxClbmlaw8kSfkP6VMBwOoNZzlwRaj7
 XfbpeJ1JXLelZbRgNb1FezJQmFr5QUZvmnTYsNVqX6WY/7Uik9AbY2ijX95L1Mf2dMiH
 xvFftomVbMV8XFN4F1JM6lkbR+wR8B10COSii+3qnky9RpJp3LyLQg7KZ2BolLjgl3S0
 JTcB+IactIbqjtfznStC5L6WKcuoBIuKhJRUvIRXavCXvAyT7P7MNxaR2JYGZdN/cTni
 NXghY0D3j8NgPJf/KIDyRTux9qPFHCnsER28qz600s2kjxfIuWxNep/kp5807PJocVK2 Qw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3hgegud0jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:32:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=de+NGE1g7badKO4BzVwZ56QAsiwJXnr3VeFckfXWOtU51XcjQNvm6JUAl0mf8+WBwk31mEoB62Rs9+wnScLIHMqq/OXgnSTK6rkITIT0k7UVzqYhip5t4ofZKUzzkVFQtrJoCBlrZJe3gSNy7wBksD4qdu9y8inRqswqNHNYiQfSJuiL95nbpbS35/hzyQ2FboRRoY6hH5Mfq0C0mzBYkVJZDb2CuYX/K0/y6szxFnsZCgDPE3D9FRC2JFmaHtBpKJLPV6LUw3+gTNP2BByybzOADrbPyQ/P5kwHMC7I/Y0ZiiBJ9FSub1Tq31vOEpZuZiIG8TwEt49tIhTjHMdiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k5Ke3Mn/tN7aqyhG1WtptE0qFT1/u0aPYa9dFYMpY8=;
 b=OdOo+I8Erbme9jsHaDUCir5BzSQXwF5yGbwEft3SyZ7y543gRhEVplCrNRwv9nOl7EeEvXMsuGDn4qzUlIQ/Lb+bUvxssR4TtAG2gwZe4e1GqYZk23Rpyrg2LGnkQitt0jRWddevt2VJ5tFJAHWRGU50QlNBc/SkUsyZtJIswd1ANlUEvfYfEM/v68UQvj6dPKTS7TMEmER7wI8L9Utl8FR4DhgArR2uDlQZqlzb2NKZwScliW1Ftim7zdw2SMHZFxVYZ0X5ZfUJmUgLqPTVXVOJpKt4MoP5ciG0J+iyduu8kLV8IPYY1e0y4aJDhzvD/bQnlE31SOT777+04k/m+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8k5Ke3Mn/tN7aqyhG1WtptE0qFT1/u0aPYa9dFYMpY8=;
 b=nMNRmnc18YzM4lfx5j/0CTUE7s1z+OxCZkhUqqb+VAEtsnmfw1O7mTxT+I2GHZfd9Ehq3hyU0axgTJWW8ZXSFMreVr5hTTXUi0gqo/zlPBUVMwe4Bqz47DI7APHqdG4qasMEpp0ueWgaeSuDJ+Nu+qZ0hAkabFg8aChowz2D0C8=
Received: from DM6PR04MB5420.namprd04.prod.outlook.com (2603:10b6:5:105::30)
 by MWHPR04MB0366.namprd04.prod.outlook.com (2603:10b6:300:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 17:32:44 +0000
Received: from DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93]) by DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93%3]) with mapi id 15.20.5458.024; Fri, 29 Jul 2022
 17:32:44 +0000
From: Mike Petersen <mike.petersen@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mike Petersen <mike.petersen@ni.com>
Subject: [meta-networking][PATCH v3] sshpass: add recipe
Date: Fri, 29 Jul 2022 12:32:09 -0500
Message-Id: <20220729173209.69103-2-mike.petersen@ni.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729173209.69103-1-mike.petersen@ni.com>
References: <20220729173209.69103-1-mike.petersen@ni.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:806:28::26) To DM6PR04MB5420.namprd04.prod.outlook.com
 (2603:10b6:5:105::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 108c6082-b44b-4155-b8a9-08da71885860
X-MS-TrafficTypeDiagnostic: MWHPR04MB0366:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tBqXoUzx0p0E36eNysTIx8Mxo8cUCPudjgG5mxrZx/X7VRDsCuPEyL9v3/9AdcN3AqcfIO326xUVD9O6TvQFTElLduXm0oQy2ooohUBSCNksWjy2CrBoasRA2yKfIYbFolx42w9qC/xitHzoTI0y5Cbdm6xnqhh+oTPBzwhp6EX+bwIBLcq+jS2NbIHNz3K8cAN+NAgsXCRdpxwhJgLMX+FjKN0vQaKDXESFeAIznaV21oCMSem5hiqwMHHyAQPmi3n7bZ8z9FovFOh4L0WcIsxwiWIgAoy/E1InlkYpp41VSVyVGHWqcL8RJEy88nWh6tv8DKwqBFhgHd7uPMHvptmMxDpPyqnCsXwYm9G5L43HX2s73RvhIsw4DUAF8pilnB03aIofvmMSCSdc/tVPLeze2lVBgnM2z25HkbW/RAl1odwmDzZSOuGYA1gGb2E5pwkGBLTLGc4BCrJTYKy/eVkda4nATI7DJ6+n8lKCcsfbodaf3JJvNimczwJpLjgdJgTCM1Kms2vOUFOqBmtgKWA4838qzy0mS9IXgu6NW2a/e9yhnZ8LZ31rDVIrhgr213x2N2idZT/gp170tib8uHRqi7kmn1/WnoxJI4In0st1xpOfgSqxYXI1KSCnQoD2wf918KK5qBGKtkAx/ulWzxA5osY29LJqvU228tHuktKrRDoh3ZghR1ZSU+YMYLvxZ7tsXiD/zrwzbUl4h4IfALjf+ZnCf5g/cC4KNWGtfNmMH7y+H2OyqWad4zb8j7Wak+ZLa5m/RKL2vUItRcdUFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5420.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(39860400002)(366004)(136003)(86362001)(38100700002)(478600001)(66946007)(5660300002)(66556008)(8676002)(66476007)(8936002)(6486002)(4326008)(316002)(6666004)(6916009)(2616005)(1076003)(186003)(83380400001)(2906002)(41300700001)(36756003)(26005)(6512007)(6506007)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EVcxgGV5demj/vXagBVxgD3xaLu6Io4Zkfd91RGASF17eLA0rIMyOM+yRxWo?=
 =?us-ascii?Q?5pOUSwJY6VAK3MHcqZa1pIQn2+T4IsHbvgarAF9LH8CFbNAu3ATCnC0ue2z+?=
 =?us-ascii?Q?kngfe4GZstrS+ABgG+Aiep5lvMK/X9ORq8wXw0gEDmdHhfjeJdzTrLnos+fa?=
 =?us-ascii?Q?gwMVwEjsYC725kumhX7ImM049MwJ3ThitB+kBbVjNUlvZqyWd4uN3gcqrvF8?=
 =?us-ascii?Q?Jo469rT30IfcNOBX0aIyjbaXh5tnpiB6NruYIvfNg8QJXq6TeBZFb15COIU5?=
 =?us-ascii?Q?umgqk12sVkU9X9ITbqGrAuAom4pC3JuQ7Fu5JAGgKz+ikbpAYss77D/tiLRI?=
 =?us-ascii?Q?IKzq31Pjk5c9RNqsZN1+0cdiGoLYTPYi7F5OZ0eyvtjhbfyRGl1rb0ujeDII?=
 =?us-ascii?Q?U5bce/iyI1M4rCV9ZrImHekCM+M+n3yNGs64gn4t98gZnTpYG32ayTiK77I2?=
 =?us-ascii?Q?fj4pPQPhSZmQMjeAqwTt6fsOd167srJSHnQ9KtBuiB0fWjtjd51Ys4nrEHC+?=
 =?us-ascii?Q?xUQCtgBYZRgLIIB/Wa9RjA0pdSSy+U9AdOOb16mB1b6NIlNVFyY97gb8sYZA?=
 =?us-ascii?Q?sKNkaib4Djei+Db9YUZ+8VkoVFJeERAfK0ENP+zEgxVmdWYYxYJfCXT08Gug?=
 =?us-ascii?Q?a/wH1XKRyx9Kb3rpFXLbaPHmX0jZp2Yu3xrloXSNxsPHevCaSleHtufiZ+po?=
 =?us-ascii?Q?3bsOzi6qykVryTO8V8u9kFAbkxWt0/jiJldVJNZicDe6KSzoFSsZsk6PZytw?=
 =?us-ascii?Q?d7+7J0y5zJ6f9jcIYy1ODl7cgzFv+EJNGBcaubIY6nsWSPqQG3f/PdAOkRIE?=
 =?us-ascii?Q?DiDdqRApkGwcfEoTwp9XAuVw6mSa79djGBMaqQUmd9xFYnugwYdAV/rGf3Or?=
 =?us-ascii?Q?Tpj6TV6MfC9BsqqFkyHiW/Qd8s8s9smZLOozPvDtLi7jMZGjGbaWPPtu5IlV?=
 =?us-ascii?Q?XlVe9r9CY12GuO0a8VE88M1j9E0ZlLtFNekx+0VXkp6bpehIwq2Rg7femM48?=
 =?us-ascii?Q?PLgyieRVdlm/74uMxkYkt5Dmuy/mXFGvrlwRB5eBBdYszbiIC639z0fyYmE4?=
 =?us-ascii?Q?jdyQGDfVLzevfH2xsANjrbbbc0O5FFcPsM7Mg3P1VBPcMv/ExBzL2vb3SczR?=
 =?us-ascii?Q?eoObtfmAhB930pqSfaMjSLdHiwKbZsqMrAvYFgBDnJatvIzIhNcACvhr0vpq?=
 =?us-ascii?Q?Xp8cY0HArwcvCZXsBsYoCIkJg/UlcgEMlqYnZlst8mQwodPVrM4359Hc/KnH?=
 =?us-ascii?Q?FoaY/Q6uIiPVbAd5ZwrPrjWtRTDdB2PrnBns6W0hKFVaxLeRg6job7bYsFk+?=
 =?us-ascii?Q?m4RFWMIPxPFK+ofjAY/gXcUzj4flnEnTH1Fap51WYx83TIfz3ddyvuSHuyfF?=
 =?us-ascii?Q?8MK0VL39le9vvLN+nW6TfVEjzCWEiErfJ83NRphq4wqIq6iwNJHsmKs0K6yN?=
 =?us-ascii?Q?C3y10Yj8kUe+6W8oQD3oZa22QiE8eaJ0u0G9lHvkcVqgat5qtdiRtEWl9eJo?=
 =?us-ascii?Q?LiPL3pfCfE4KLhFtvQQDf8WFubQOLkSVxTQ/3NBeIgGGo8KF5IZJpl/MTLXo?=
 =?us-ascii?Q?W9I8wnFAD4cnbAQJoZErZgmEpi6RKEfAgoU5+xaW?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 108c6082-b44b-4155-b8a9-08da71885860
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5420.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 17:32:43.9664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8yR/m+RSW53a7AgEhpxPyGFScqwrTaWtsXref01p3Dcab5nuFrxgF46JZRv8YMmnv4eMXy340i6dYbN9X4eMVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0366
X-Proofpoint-GUID: yVXYWjTw38v4joB5Yn1v7mbGdZalFikB
X-Proofpoint-ORIG-GUID: yVXYWjTw38v4joB5Yn1v7mbGdZalFikB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-29_18,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=792 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207290075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 17:32:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98053

Needed for automating ssh logins, used in auto-tests.

Co-authored-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Mike Petersen <mike.petersen@ni.com>
---
 .../recipes-connectivity/sshpass/sshpass_1.09.bb      | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb

diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
new file mode 100644
index 000000000..0bfed694b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Non-interactive ssh password auth"
+HOMEPAGE = "http://sshpass.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7"
+
+inherit autotools
-- 
2.37.1


