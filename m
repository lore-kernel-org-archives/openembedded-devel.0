Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6604ECDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 07:12:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33340.1697181173024987434
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 00:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DQGFUA9d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8650b84d85=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39D5dQmb029150
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 00:12:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=G7nlqEQvNxlDgvv3ip
	uCbJFyeb7Xdklgkf7f/GZvpjw=; b=DQGFUA9dnj6RlOhjbRJZdM9sXKCDe8LHB4
	ZgJZ7CNRYFKzJm0LlRViBHpGO2zMiFePuwrqUuFOf9VaPDAL+ahPHVXf3s1oDM4H
	k5kc8cGRbeC08KOp1IA+FyuyZfg4s3g8SLldpqpANYdSuJgYLfMbTF6nblo3gGtt
	Nx6ppBpfFmp8ySZiljE2LXZlXqPxSysNCKnd6UibkvIvBZ3UEz5qT9/Hh4hR+rlm
	r85rHDuKIXpotar+RS83uMpPcnvuy/+YcTKXBR1rgDCz2kOJYE6YlW5KDdclOTcR
	RJ5f8km5IPZ7JLKKGBzzl1JU3K2QkDiKzGxnzSwgpNZGhSFHzOlQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4a7st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 00:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xh5u4QtGJDSWFb+f5U2lRNlui25zrIwRhcJmrhbB8cb2nt5sFvBx0QvJhxpfPwGxWi3hTwfsYJZdT7DGnJHnYMXY4MaQEfNe2zI60ljCchm7zpvqhEb/yCgjv8fZsTbfl9CjKB3f2GmEysOFh+9tDvQYZmjcCaFGweXlPWMlKJXoezrnNDlSKsIFa9BvHatjS3iVGz95jpOWUPeHu01Oqs1rupq8iwsct2yT2wq4bjhLvbX0pyXfPvBDGoRNy6IYRP7e+qskz+k+U1/9zpu+NGkLz9xpbiMEnUV0KeycZ8GuxzU0F4dwSW9JCrf8kSXsyB7r22GQE1MwyCdUfQq3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7nlqEQvNxlDgvv3ipuCbJFyeb7Xdklgkf7f/GZvpjw=;
 b=mbgwLR2+5ljz+DoT7wlIMI2JZflWPy+0LUtYNaFMbcCxBK4cBRHQ28wZog8wyliW8s77pLM8vPm10UMpobwgsQIa2B9nBQQRVWyClHYm84NHaelTITcZKSyQFf56tEwf4kIv4Ow0t14ajuiFrWpjlNJCnqdSMllkK49NdKYUXMbCvBxGeO+dNWSQ4W7gG7oId/aXcglrn0Uy6C6/jSXBwv03Rs5u/24deT2/Al/zg67VRF0ndlWMJ72pktNv3yKo+C3KMjrodE71/8qL3PmpsVqYtOFwu3/rkInHSBHkEre/5WU/0uarmfZPlT/R/84NMT6F2heNQZYBBSC7lEUVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.44; Fri, 13 Oct 2023 07:12:50 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 07:12:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] mbedtls: upgrade 2.28.2 -> 2.28.5
Date: Fri, 13 Oct 2023 15:12:36 +0800
Message-Id: <20231013071236.4163253-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: c15e62d1-5ef4-44cd-e431-08dbcbbbcf20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cYvMfEr6ZatH+joTtbxLUux4FTG0mWBIsdB0rTdFS1LY/2mDmYdJhQ5JP2AT/6LlfNaW2QEgX/a5evSgPr+yBpw0pB3EqFr2Yl8tSQG2RU9HRvcs8OULAKlApApVblMwNrNEv5P7o9IMJTQ89qcs+PmZ2jw4F5Esc1BjBt12ISkmVYsZWUkbcCjQzkgePADjlB+lcV0EEl7CSDlaJFr5fegGttmvOeqwYVI02aEuyEdEqnHsqT60rX9OX2Czner7n2+47Oh1KGIBzV1x0dOOPwXTVs4HCDLRpaRXGJGA5giYPyblG1yZ5MHYCAGJYCmzQUBT4NOkpVc+nBjsxOcZrOo1Ja4p7PGdB5kgxeKGC6ii5hSQtIsiaPR3Ano6L2dsQcDxlLyB0eXggkqctABYLIb/6yqmZHnOCSAQWL14PNW8lpKeVA4jBvCNCGo/O/VvaMbWV/76edtPjDkO3Lv3ckbw4j4X364wMhalxflAy8R5LrCHuFdILFH8oPJFvVp9/CIzYjfG/21G+wil7DwfNQlhtiRdDw7IMfuyYksINe217cT5qJg7WSGSO1RqphltNX3lm2k6F4x/60BcvOz2qwjQlEjmdtwtHOupbgD+hLc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39850400004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(6512007)(6506007)(6666004)(26005)(36756003)(1076003)(966005)(478600001)(6486002)(2616005)(316002)(83380400001)(66946007)(66556008)(66476007)(6916009)(38350700002)(38100700002)(41300700001)(8936002)(8676002)(44832011)(5660300002)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2cWH9usE6LoNjinjsZbS42AV2KC+SwgYBHknqixagb6WxqmkppcEWyGnlcwE?=
 =?us-ascii?Q?cXkgkwlXo8JNyYOZ5qDihQB8YPpDTZe1bJN7rj9fHXxzZxn8riqsx6wlqKQk?=
 =?us-ascii?Q?Rkmxk5THZ1RThbvMjRwDrED0U52Kf4jDklbPEsLFTmlEN2/6JOb+07tT+aMO?=
 =?us-ascii?Q?OIkhAH7j9k7qojxGqYMqmhZxrFlMzRjwBCfK62vXNOqpZC2gZABhOMTAjn9U?=
 =?us-ascii?Q?g/pkukVXNiwfID61Mpw6UZddLSlpWeOc/2TnA4tjXCtI/gjt2EKyTZf7nn44?=
 =?us-ascii?Q?zho4tCPj2RB9C8MKYunasVmnTvCD5tu3W9oiIHhuPztFL/1KKoswQFtETIt3?=
 =?us-ascii?Q?vw2ugFOFrAUBVa8aXcxdaxdkzvqdhGxzbWixetxQPcD3IjmLPEwgxyJS0Swf?=
 =?us-ascii?Q?djEw908jBYo/gOOwGG6dzGxtAxoNqrHuRWsmKWiUwY6V8bnI7aXFHIFJ8IeX?=
 =?us-ascii?Q?lE/h6jK0BFZ4FRjja11lFYFJIWE74jkOf66dl5KmGTw29yIks6P8twn8iyac?=
 =?us-ascii?Q?yrD5239UK8rOgQk5j/fqM8OeWTXlABm9Ed6E1x7TBvBRW6CtAmIVbEcghn39?=
 =?us-ascii?Q?CJvoZEtmK6qhDdnKUb8ONUgJlHsKmPpBoHjHxHXdR88CX5CAbUuxXL8CEdaz?=
 =?us-ascii?Q?HqWTFJMmY4zFyTgolnxoRBaqxUjZdzmg0INy3aHvO9bPS8S1I5yvcQp2qeSk?=
 =?us-ascii?Q?3O8ZnDH4K4/FjXFz3AfsQgYDN/TMPR+ldAiQKW92Ge3weYX+WQ2flxSjG5NE?=
 =?us-ascii?Q?WnoXpgPigSv8VZxwGNHYOfAuQFhJ9iThFLu6bi/0mxv2jLlI+VX2VzXwvc+n?=
 =?us-ascii?Q?UznXNPCwnbBaFQOUKaORpQL2PVph8/Aa4meGDy6dof+302uDG3P4fcnqnQb5?=
 =?us-ascii?Q?CpS8+CDApsCCEBr43l9t4heZXog9Sx6oDSnP7nADpQIQHdfVAHEYazLUFe7V?=
 =?us-ascii?Q?XbKmiptwAU56sjTMLNjPQwM6QAOU5BLrjUiZs0mDwqEniQtw9wk6YWzgQdP+?=
 =?us-ascii?Q?BcKKiVAKeF/2wzxt6rHwU9/xFnZ/Q4e+yFiBO8Kv6UwpT/jI9Vxaxqxj5OcM?=
 =?us-ascii?Q?pNIp90NIqbM9EZgppuX7Nd3HYCm8Hw6jwFZtPkAgDusnYltJZs6SJ/+ezALc?=
 =?us-ascii?Q?VZrhMHcBdpgU8KMud+/chkRnGGl5Cn9ktMhCro70AhrLdGo4mtKsL8v8MleD?=
 =?us-ascii?Q?rv5qoaGlQ4nnTh0M7SrwSoVkp3YE+mnMotOyiTAQALm8qjXS7NLWH19V6tUA?=
 =?us-ascii?Q?O6vR9H7ggWB4TkqhH2iP4GisJkisq/sFmoifsRD+jh8SNXKCdUNHHytlouGg?=
 =?us-ascii?Q?ibT98n424OnG0v9SzuEeFE78VKA90PEny7ddUOWezMmti0GaMWVfEzXBzcL2?=
 =?us-ascii?Q?ZeaMxmwEfZpMY+Ho0W73vV9cgIBj0VZ2shIVatANwhAappRvMIqHaNacMukv?=
 =?us-ascii?Q?rlkdd35BmMm32npC8k/trg2eZDsm1QQJKdTNNqSQyi0D6nglTcZDL7eODnGt?=
 =?us-ascii?Q?u81EW/gwtlVCMOAUUsRSBP/h53rAqOPcv6fXDp3HHgPi69/GEsZODiK/dWyW?=
 =?us-ascii?Q?WJ0dSnZGUV+tsflIqKVa3wOnJBG4otfMX+7DEVkw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15e62d1-5ef4-44cd-e431-08dbcbbbcf20
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 07:12:50.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jE6tS9yTYivQ+pF2pwf6fEvu5gwRrAXlcIjsZSERDiJO2uBOMK8+tingA87de1Glt74uk/sFrvEtxjQCbzq4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
X-Proofpoint-ORIG-GUID: o99pHLwP9gsWXpjxRZqI03C0mSf3Zng5
X-Proofpoint-GUID: o99pHLwP9gsWXpjxRZqI03C0mSf3Zng5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_03,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310130059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 07:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105461

This release includes security fix for CVE-2023-43615.

Changelog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.2.bb => mbedtls_2.28.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.2.bb => mbedtls_2.28.5.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
index 5696f94b0..a9044407a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "89f040a5c938985c5f30728baed21e49d0846a53"
+SRCREV = "47e8cc9db2e469d902b0e3093ae9e482c3d87188"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
 inherit cmake
-- 
2.25.1


