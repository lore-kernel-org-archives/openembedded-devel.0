Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E224C38162
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.15892.1650792486495828035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 02:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gEhOXJxa;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1113be60e2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23O9S6gm020650
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 02:28:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=tMrHUzq3df1S4TQYsywUdK5OQyEbB0YIareBXLyvcQw=;
 b=gEhOXJxah1l6ti5+nAfgZp/4CDqdHcj+MgSVeym+f5TMk3ZlCdXPk5P2Bx1lOzUoY/DF
 KzzDTgjgwN1FmaEU8WxPq9n0fGscLbCRTRm5jvVVHPv5QPv4sOh6Ik1Ye+MbEjlJx+Lp
 KwZ5o5tKCyWzKlq2xf4bL5hAyo2TredHEH0qWUUQaXg3tmBD/yllMFcxRx2G0eMAU9/I
 40gA0VO0DwHDAuu0Ruyb1DLiJtf0qcp3cHZZ1fwWEL9S6/wNho+tejhR+ezeG86eW94I
 hmArutfOU/KWNj1Wx+yqhWYimd/1ho/eox/QmJPsoVUF+hiDoEb1chcZLZ7A13nbmeDx AA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmgykrgss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 02:28:05 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23O9S5cT020639
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 02:28:05 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmgykrgsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Apr 2022 02:28:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSl+UyY19EAAGkMjL6It7Z1jvygMRH2MjJdoh5LtS2hvySu+uaUjJRlcdUmupoXXWN7Ju9r1utpYSf2l6COg+BeqeLCy1FrSJx8piDYfgEnv+r9n4DtcDYZSLl2E89AeijaGQA1Rw+VLmIv9o9pL2oNdJvAHnI+JnOqPazrDw/n48iwJ7Rn8BdfNcov8dLGhFstB/PeZYRRi3y+GNjEvja5MfAuxB9/Rp3Uqjda13s+yncymlwnHVfKAUXHMXU1V1AiRvHKtQ740wnN4/W7QnQ4kmg/VS/toDVg0syylvin2Yl3jLCMYr15wPdqyipGFeZ5vTu/gcTj2ypEmCKbq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMrHUzq3df1S4TQYsywUdK5OQyEbB0YIareBXLyvcQw=;
 b=iiExfExmi5hemgUq1+Nn855U46zugtNQGprt/G4PHSZvlo5CujBTx56SrGk+ybmHTyn8rLwp0WfNeKRDvXhGB05Dg7+DBgytyuimpxVE7V8TWy0X2bb9aFl27KbdFWhwlzOCUf3819le2SwLMKJQ5Uk4iiQOF+YuuOty4nL9/M1Uyg2lVIZIERoLmBb3jSuBQDkBdk/Wk+an2KixgYXZdZnAf2bttFcsouYrDV2rT3R4lGZxI59q/a6kRIvctCI2J0Yc9q++MZkhOIR/8UxlZKY8UhcHZ4abyKxQ0ViH4WKHN+Bp0Jd1+MT3yGdKBr+uxhUit/3lE4IeOhCD1TWnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by BN6PR11MB2020.namprd11.prod.outlook.com (2603:10b6:404:3c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Sun, 24 Apr
 2022 09:28:02 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::eda1:b22f:b900:39d6]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::eda1:b22f:b900:39d6%5]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 09:28:02 +0000
From: Robert Yang <liezhi.yang@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [meta-networking][PATCH] libldb: Fix installed-vs-shipped and rebuild
 error
Date: Sun, 24 Apr 2022 02:27:56 -0700
Message-Id: <20220424092756.107402-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb8713ae-6eff-4a05-cdb5-08da25d4babd
X-MS-TrafficTypeDiagnostic: BN6PR11MB2020:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB2020D24331D417DA59C8944EFFF99@BN6PR11MB2020.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BK184t8Jlg9ZxUCYAzl+no/55LYp/2rC9bz6RM08yBE8dYIIbG5p/dBFxGh8KHUKMNwlaP/1ioqfAaVvc26ZMsxy5Va4GaYklDB8AQq3EZWWfgUo6ExVmyvPIlLCO2URbn8EefyOgSpMfHXgC2BnyPgoMY7BMWIaPLvTNjR7maNrr5d49eWvr/bLtcvruNak/+AjvIlhKCXYKZXaibcBvpwhmovxjSx9cctg7Q8AGgwESLOhp40WC9JePFqvR1FFprh748S6QYNA4wF9DcU86HaaQj/2prLyvZPoEs/u0VjMB0r5+D2BW56MeD05IyWPq+jOJKjXkVwQqZzdvkr6vRG/cHXbp6ijQ+QdMsdN4qZ17Q/bpkEzGGgk5yT6T8jS1QQe759k0ndiPG7MMa5HWFmX626MmoIcM8iuJqMrLdHAXTj3NP14xtdmAn7tVD2jWHZdg2SFcMl5V8c+8ZQ1giY/6LoKbDOKThIJxSBZhp4xYwiTLqUsqEvtNpScAB/TnH4K36FfgZn+kZANmaBeOKnOYuosDwOdAqDs+20lLNTAx9AY/y8+cGvB3vhxtkldxF8MLSnHLU2KQNLEn7T+9ymmTLoqEqIKrQcvXPsXedy11Y81LMxhdeNv+cBy6fkNCMMA3QeaowhMR7J++UO+4f4JJWBiPxHlz0vGe2F3HqEP5wNqqHxT6BSQcP826ZuJ2dvUYMFQLXuXQD8dUyGRNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(26005)(316002)(6666004)(2906002)(38100700002)(38350700002)(508600001)(86362001)(6486002)(6506007)(6512007)(52116002)(1076003)(2616005)(36756003)(186003)(66556008)(66946007)(5660300002)(66476007)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XaBtemoUexATEp0JBkKMTrkpV/gHzrgi7uiUCNhyhVvlU6IS8UfKRzcN/2rR?=
 =?us-ascii?Q?B1H1c2IwMatdtBQZSTXpZ2FbUjQW80w1OmpfjXThmqiwfTM9pBzw71EEysjV?=
 =?us-ascii?Q?tdT9FSiv5M8heLoenZ5vOK78vVZKzH1s++7+G3pCctxXDpVq0EB15aToaB+v?=
 =?us-ascii?Q?7wJGJdPqRNytGbL1sru6J+96Y4zSkgsyVcagUwg6RlDV+JS/Ih+xOVdnKpsN?=
 =?us-ascii?Q?nTtEUCgE6S8GOh9Cb2QN+N1qCgi92FkJ35BKnwC/0PyeLvlRxnGEzubD2xMt?=
 =?us-ascii?Q?//TLkZ1zHOSkiN28aQVadWQ8mTMcLY0TYbLMGAC3af3Z5R9kBKdl0aBgw5V9?=
 =?us-ascii?Q?eMJwj6Gu+oIRJugwtLSl7+CCzbsKej7OT4JcDI9JwumJ5Aam4JEqkuu4BTo6?=
 =?us-ascii?Q?YIfCIeUbdBhY40VTWWkbpUWLsTZuu9eT7GUhj2VPy/XaYzkf+krZFydLZZcr?=
 =?us-ascii?Q?hA92u+/kxC/Gn4lyzZsflL5UMGl9p2TnAl296zwN2wCV5g0VMUoo61GNsIMK?=
 =?us-ascii?Q?nV5mo0ujpdcbYy+3iY/szOYDhkOhx/BMfeOajvZywASBIGPquMqfdd8EX3R5?=
 =?us-ascii?Q?9hBsACoK7SDCz4zNHxY9jGeSnrJVx/dftWFc7uGZklpbufzhsvowhXgf1ypy?=
 =?us-ascii?Q?r7OobIT1dlQJGvY0cXsD8+3DYAWCZk+kMHs6qhteVByhrYUYsc/oUpm8tEdV?=
 =?us-ascii?Q?P+61u8EAGLVgKwuoUfXXLf1c5kqP9B9gDJnO8K7UydzOknxWRaXp5lN/YGB5?=
 =?us-ascii?Q?RDAvaPl/jcs4V3HrhgUN+wNaTk1cnalUyy73dUYC2KF+IJphaY+hJ0kb5m3f?=
 =?us-ascii?Q?CnuQFG1LFtMlVomCY6357aX7YrwUJCL8V6vkupzl2MCT5pru2kBU/pgAfe1M?=
 =?us-ascii?Q?3sBsZXBSi7bNkArHiumc0BXvnmWTwSGmsISFojIvyp4Bl8K+3Pz0kzac6mlD?=
 =?us-ascii?Q?PlC4Exym/XB+gKf3B/ZdJ0nYZSGVp3VT5r+YwnrGPe5igd16m3DxyjF3Wx3p?=
 =?us-ascii?Q?1JxL2fI9hpatLpbo7EL62lO/8OS+cgJk/nfS+OIk2YmK8krT4iNlhw7e4Qvs?=
 =?us-ascii?Q?QutEi3K7rscQFC6UFHMKpF+d+fyDScWE5ssqhd0onh29Z2ImnQgeHqaNbs8U?=
 =?us-ascii?Q?TqA7B53twr3GyniUU/FxaSRGx6wJ8N52NJ/CD41rhP8E6ehk4PP3BbLRAWDb?=
 =?us-ascii?Q?f2PSXauGWVUTqHIsaIe2MUjzKD1VVpr/7qhIz/spknJeTK4C8SbmA5F2K2sZ?=
 =?us-ascii?Q?iTvcPcObqzVC4iUD9hSM4tTdyoMrM7Wq/Tio1usVwjZSRT0EMVZM51gI9fzx?=
 =?us-ascii?Q?8Et8R8pbM/vJE9qMkmHD8i6bjAEYiamBFWeOxWc7gUWV4sAmLuREDh7a8RvH?=
 =?us-ascii?Q?KQDq1FSqv8NM2wwEIhtpT58771bQW36oQro8MiQepO+d7Vr9+Ci8iEYJpdEO?=
 =?us-ascii?Q?aXNlD6ar3aOBzBhy9bawjiC8D0vbFTRS+ZLbQNeQn0UWInqv/lsmTSqYl2V+?=
 =?us-ascii?Q?jJiTC3D8w3Mf/S9txBCkZrWMF5MQQP8ZETuWkyrx1KtjAaQNXqoXAcVx30V6?=
 =?us-ascii?Q?Pc/OsBElytTp3GyNSLg6mcyi8X0FXA6TylqhaJrlBpflhGh3NjWbEJhTzK0c?=
 =?us-ascii?Q?uKJb4IMAV6g8TYYlTHyStO7uB18ZQKPnZ+usQqvVc1ulxO2tTvMmZZLXuZAI?=
 =?us-ascii?Q?YbXl9BjVKJZBauuq5jrKNC1uZldCWFVhE092+rkxorzuxlizL1AkCIodogRY?=
 =?us-ascii?Q?lvx2KN7NYJM5LHCvKcoTGykThKIBKtc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb8713ae-6eff-4a05-cdb5-08da25d4babd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2022 09:28:02.3735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PbWQcjtfHPr5zsaIo69cnUl0ENqCISJIHGZi/zTPzAWPi/rtfTR7HMjd+GzBEnm8/syZI1HiKrsR2cRhVDrtuLD5WlEML1sOQVFNa6rXn0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2020
X-Proofpoint-GUID: Xf3IB-wtHw4cZ1_oszxQBlKjcGRu5OuV
X-Proofpoint-ORIG-GUID: z810wkWZVEiscieONKFasvzxXKUBb_Il
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-23_01,2022-04-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=975 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204240044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96752

Fixed when multilib is disabled on intel-x86-64:
MULITLIBS = ""
$ bitbake sssd

ERROR: sssd-2.5.2-r0 do_package: QA Issue: sssd: Files/directories were installed but not shipped in any package:
/usr/lib/ldb
/usr/lib64/ldb/modules/ldb/memberof.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
sssd: 2 installed and not shipped files. [installed-vs-shipped]

And also remove bin/ got get a clean rebuild, otherwise, the rebuild result may
be incorrect.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/libldb/libldb_2.3.3.bb            | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.3.bb b/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
index c46a9784e..6dd3ec3a9 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.3.bb
@@ -68,3 +68,14 @@ FILES:pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
 FILES:pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
                    ${libdir}/.debug/libpyldb-util.*.so.*"
 FILES:pyldb-dev = "${libdir}/libpyldb-util.*.so"
+
+# Prevent third_party/waf/waflib/Configure.py checking host's path which is
+# incorrect for cross building.
+export PREFIX = "/"
+export LIBDIR = "${libdir}"
+export BINDIR = "${bindir}"
+
+do_configure:prepend() {
+    # For a clean rebuild
+    rm -fr bin/
+}
-- 
2.33.0


