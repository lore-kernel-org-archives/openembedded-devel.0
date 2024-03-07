Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C5BC5475B
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 02:26:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14121.1709778412584569014
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 18:26:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L0+/rn9v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3796226880=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42720Z8R028441
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Mar 2024 02:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=3YAN1iqFID9iJO1hFZ
	ZQ30t/7tMLoa+Jaq9fTwvwSVE=; b=L0+/rn9vJ1wn1EL/LhHo0elbbuZALiL73F
	/Dmu9hyY6JgsQY3ZSI92ESbrHyuCNgbhLoN6WdJ8+EQWuUeujPtM5G2i1JV8PTny
	DZbOo3ifCXUmikaQqxYaRUUOccXZAlFo7puZnk8dM1Unv7v4mEtmmMzHM8rxDfSG
	UZaIzfCReQeS9Whg9Fla7B94R5mgb9N4YqRaC/38WIac18778qgGlU0xk7Ob6jXQ
	F7ysWT9sbt1Oudg45+C6UbcmpsZvztnCRNljdi9GVuqZ5taRVAygJ0xO8l+DyG1E
	OsLhLk3xakUom3m5ERy9HJiui6ENCBNGNOgDTh6oPBcmC7KrXoHQ==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36cmb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 02:26:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T98iUP8sfjDqmhTUb2+6751jHPhgj0jeTZOfUp3OkvowmCjGFtMJON1FIvAur5T8BZMMNp/1agdSa3kHgpS8BVOo5nUvjf5VCtgLQvDSIuUvV1rsUlfw7pFtHugZQpkRn4x42w0Q8kY0brs2lKyy/+Yan/mUC1KES/aOv1jiy4flZjmXo26mMA10DI71FQI0EivmIcKYLKYiB2XJ9YEWCwvny7ytNShk5vGPx3uU9Hf7d2csODmvL/be2vFAyEhg4nV36oLlbGG19bkFMhRfSdI+oTPbhK4xPU01FTx9gwbbzLrqGEw6aspHRydoyHic10OxWUoFOuIK0S7knSGM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YAN1iqFID9iJO1hFZZQ30t/7tMLoa+Jaq9fTwvwSVE=;
 b=jU+ww2YdALoYfyt03Z9kdpWS097Co41eg1h/QryoMnLPYfup0ccZljscaqpMFBbvtqZKePIVPtRtkCPAM+GAwd0y2Y1UwSXiQMKR92A39SpSiEWQf+1oP4nROfIoQZJkh5Px8FN0wcLR+Wo7FpfYn47iKc2p6tAQuJJzzev8BtZMiGk/GFBo2JOQAo3uvoou0YMqgyW5SxX2jaelzHQstRUPc8s36B7Z3rm5tC9FHPhZheHrmk3gcn/z+3fHEcHIRXWDxFuoCuYxq2sRRppsJTJHdZeMckFL68gjSwAu6vkGRPdvQMytsVtKvdXRkmi28vtTYEUwr3hTZqbLW1OWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 02:26:49 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 02:26:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: upgrade 3.8.5 -> 3.8.6
Date: Thu,  7 Mar 2024 10:26:37 +0800
Message-Id: <20240307022637.2433460-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: d80cb682-755e-4431-47ad-08dc3e4e0aab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l8wpfG3TK/BpavFRlT39ZvqJToFFY45mNMDT88bFhnsKCKdxJz9VEsURzzbITM/z6SRwZBrCXYRU02IsrItHliBfwfvVIT4rv/TA+SkAvXTrRgvN9T6+v10069iVVFUT9YF3IYoIr0pcmLa1PIPJDguRL8/UXXmifdqnYtQsEDC6i0k3oXhCt5PPePstcjAbi0uK45zs8Zi39L2/lMGUcekETBYPgdya/FCCeugcZtU46sOg/kx/8mw2nE/kQVdsrHUOaZBNwur+fK4E219J5DwaTXjP22r5O6KutoA3oqsZpGc+vhI/JUTODegDEzmKcYQwhhCTpaKJLoLqK8C3at8loLodj7k4nK69wgQcHukDinBYlquiO+kXazxn2xxuDtUVGhFPo6gx9SQjlIuLIE1ycX8kT+Dz3+/ZJBspTLg4CnVjYbEmhPVDvwhom62ISpGgMHa66NNF3aSWV+CGJmaXAAvujnHHM2GTp7ps9Xrxq3+29KI8Ec0sTy82DVMl9f+Z/HibVKm6SIHOIQsrXSbebV4L4kRxaZfhuDDrCcK/K5zeoyn6DhVkZcDseQGHf3SIiNAcdXDWMSwE30TRsMRX/pTPXA70nN1dp8vl4jp6F9o8px4wLFVw/bhLDximbvrBC4axcuEUkLUjSqhtd1eL3KEj9laFljfDNLE9wkM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mxmQ2c8ls5ZTOUCd52Fkr6OM4X18iWzDRPH+7udYsyjlq2GtatbPRzLwrrfb?=
 =?us-ascii?Q?/SEtO95KF/lOJbO5FjCM/yxDndXpbO6xQPSRW4vS9MtbKqWjceGH1PD2qx/u?=
 =?us-ascii?Q?Klxg8A4zoOMmiwahvp7m+mfRQUPg07/vFVFalxGinTm2cS+gNmLAL5gdIIXt?=
 =?us-ascii?Q?NGZDD5kCZdLISKgGV1Xn4KGBuzptb79tU5vS/gmttFxRlQw1DGQeWXYZrrxA?=
 =?us-ascii?Q?zBw0X1EPe2O8zQ37mUTtcm2KQKlS/hhvVKizQFXrjHDsPTTtiJL4Ro8OAjNg?=
 =?us-ascii?Q?6HlJYlt9jPLD73VE05ditkM0hqIZTK9LTOtGAKHUp3GUHr1EYbOdxAwwcok7?=
 =?us-ascii?Q?5lYZfhQV6hkXWiggF1lStETkDJP0qUKrNSPSgbptx/pt6FyUS8Wl05FFvgYB?=
 =?us-ascii?Q?9ww+15lGMRojEulUzZBfijE3eW5X8rx9OtiXiF4b7oEjV7AOOFWE/eYzKJqU?=
 =?us-ascii?Q?UtepoTvMgiMUlPMff1QyqTVOEpylX/Du+OAmVHmzUG0u/vsZ0zglbXv2fG0s?=
 =?us-ascii?Q?tNnCSESwID2zYCEsNYU1j+GGLt+a+RhpIdLM9fzt4vJtijF5LJ+ETjzCl1D6?=
 =?us-ascii?Q?HANGj/zfU//HrQmE5fBH5N4Q3gRn/iQJsf5Jp6KEQEdC/Snawgqfy7STd5KL?=
 =?us-ascii?Q?FbHWpKnOdVCE7mr5qvBUrNSEv9qkIAFj+tRI0YpefOW9nZVBIVu9G35QB5y3?=
 =?us-ascii?Q?3Aq4oF9kFnIsbVrsHT/7CLVakMZYzmiErzkoQy3cYL4zrModRVUxYl53p+eV?=
 =?us-ascii?Q?OI6hwvv1Zt6yvC70HG5yFycK6DKNKUDsOivxdis9rDdXXeVuL1D8HlsLENjJ?=
 =?us-ascii?Q?eJifgl9i9rd1/CkV2hweoRZqsNbGU3nQMxmz18eO1jgojeqC7rCCBHRYTcho?=
 =?us-ascii?Q?2sJXW9KIKmH5PFfDFWTKPmdS8FR/IwjRJ7HAwDUG7wBcHmJ7JKPwtUI/ncrm?=
 =?us-ascii?Q?DFdkK0z0W3afv48RByj5SfOPVb1mRwBP/q6JlyAct0o8V/gX1MQO4bWK4/EI?=
 =?us-ascii?Q?41OwjJuc42G/166gwFFQ8kBmi3otz/uUV1ftbaNhyb4T2pGaIRAObVwfJ/sq?=
 =?us-ascii?Q?FwSsbtezpkFWF9Ra6Kpe1LY5xvTn3qBQ3j0kmDYkSpCWn+Bnv9ZjeoHkzW1B?=
 =?us-ascii?Q?QmqUcdiD1CO4q7TfWuHKKHfhScZsxSFEynz6jpXAxV4yvzYSRb50yxghG+zr?=
 =?us-ascii?Q?jbYssJokErGzdGe7ci8r7jXTwfukO6wW13lomGhLSLcNS+bBRQAKrW9KgNeb?=
 =?us-ascii?Q?bstop+Wu878D+qVF1a0vfBaus3/Z+XAFro0C378ZAgGHLXtZOZr+or4MpKNO?=
 =?us-ascii?Q?pD9kY1nC/n4gNBA/VuC8oJbN8skz+rzWhHvalKe89v9ch45FkqrimJ/HLAtU?=
 =?us-ascii?Q?jazfUDYDv9UvFBUEceFmj6vmuc2/W2OMd0xD8liyx98vr6iGoLGcNH2tiMz5?=
 =?us-ascii?Q?2nkRsxT54JPRo8gqCrMlYfhuH8/D/lJ1inOgPkdK6PYELGXNpHt0XpNAF8s/?=
 =?us-ascii?Q?k4yJwYsu+1r85Bgj2Lupa2VXQt+JO4dxtZtEVwhawDeuoSqMIjw7u1tgUlzL?=
 =?us-ascii?Q?DMJ67HLNdUcgLhTNRONwUaha1RZOdsxt8bcWj/j8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80cb682-755e-4431-47ad-08dc3e4e0aab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 02:26:49.0388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ls26wzCQ67jVigpwDsBGLWt84S30v8zZijuAsPFkDQdyS0N00on7dYtXqZu/PHZ3qGjz8Hyo1hhTy3Uyv4f2Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
X-Proofpoint-ORIG-GUID: G_7RtD7u_6KLQGB6EH119FXUDRHbOQ_P
X-Proofpoint-GUID: G_7RtD7u_6KLQGB6EH119FXUDRHbOQ_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 02:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109185

ChangeLog:
https://www.postfix.org/announcements/postfix-3.8.6.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postfix/{postfix_3.8.5.bb => postfix_3.8.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.5.bb => postfix_3.8.6.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.8.5.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
index 1c92c07a3..0e433bb51 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
@@ -28,7 +28,7 @@ SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "f3e827a2b2e410359ad25d31341970434ab07e36139f9a2ef93981b0ec564c85"
+SRC_URI[sha256sum] = "4b6e17c826cc438cc3016a9c0a55ea7e77c6cbafba7dd57241d81b690b0e9774"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.8(\.\d+)+).tar.gz"
 
-- 
2.25.1


