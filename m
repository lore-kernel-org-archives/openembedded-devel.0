Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DA7C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 07:00:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9684.1721286006237220422
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 00:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=792994667f=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I5oRTo016735
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 07:00:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erhj07tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 07:00:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdhLhMsVy25LrkPC4KsvHh3j/7QM7l7GrCVhrhZ/ippOAvR0l1LvXJhA5EkksFd0WczVhWX5vNeKMOEriFIH3LCkV+P3qYH7uqy/pzvd8u1Boec/t5hylUL6nWgUICOesGXjhRNdhTqxO36Mc5nBi3Utp4fJ5UqbX1zXTfhlNHXXTBPbfJV05PbT5UtuK09LVVFmoFoRID9Qnl+VyMX8auzLS5sBWQt1NoC88PDVe0xkHNN6Zbfzl1xZ7AifOD6O6ONL5terVakNIOZ6myyxt6qKYgqavwMFwsXY0jt2elkzv6GcZGI7BnVB28t6ymSuA3vExvZiGq+Ncsp7t388Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3GRARTHLgdjhyrpayDcyNL+X5e6lpKOjN66vylzElM=;
 b=Opew2ifw6GSrf0ISmt/Hv1B8r8umMp/WmesLjIj49+YYaujZy5mXjrLIJaLn1JE49bGehBnMCyYBu5yy+sBe/robZj3y2siEMmHVd+Lgc9xatjBodensuh5cMuClJy+5zu3lwdzkBx2B3SO2sgWG/GYf0WPsK2Q1jYemXF1imKrOKYbaqvG1QL7VCrDnvUKTEhkC5sEsXjbdInlIz8J6GJM4Jr5C9izuOxZI6U2OKlQ7p3fgmY1cF2yK3xaRwoyAlmAmR7jQFx2IiP3aJn8ONbA/PtBP80Ibl1ZZu/zxwZuyDYoPa3CP5hQA7CrhRINkApuaeGA/2hZYvpLCNvlcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 07:00:02 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%6]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 07:00:02 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/2] nss: fix failed test of nss.
Date: Thu, 18 Jul 2024 14:59:45 +0800
Message-Id: <20240718065946.3964212-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0219.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::15) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: f5752598-4e4e-4f68-2e3a-08dca6f73ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?97NxhC0d4BRRwcq3qXJ4DKIrrv6bV3s8HsDdHA/FRsq6+sd6/JyabscBfb5y?=
 =?us-ascii?Q?XlcN40iqyz5Z+nBximgY5f+U0Fo80lpFcuZWROFOm85PM2aDIhkMKQS50lXg?=
 =?us-ascii?Q?bm2mIjAxIBsFcSw0QmJfOBdo+WundcvxAjRvFCJc07IoGKR5XQbX1NDY0dTZ?=
 =?us-ascii?Q?eyQNeLE0sPQHzp0yqPGJ+wGDvf/JEZRk4IulVQM18zCwaH7wO9b6HyqM/Ob6?=
 =?us-ascii?Q?3Tjhno0P0fPZPLzb+LqE87K8yAh4jBTAOq0nx63rN4N/esQ43SOpt5k+5seF?=
 =?us-ascii?Q?6bru5RxIlEKMvGcoAlAwUC3eCDtXNzb2TUFqbg71lnoitc2MbpRUgGiF01oI?=
 =?us-ascii?Q?395MAxzlaFoE2DVeNTsoo4i+WJwZ3XYs3nTZAq/PJ/knCgWsoneNJZaiPTe8?=
 =?us-ascii?Q?H5Wlb4MrbNtD8tBxzqCpQkUT2aah+sncKmsf3NrekJPeTIejV8iDMs3JrmPi?=
 =?us-ascii?Q?EfNDWNPDKq+CWmwg8M8/Wl2+4C6UiOm7NTwpdUZk1u4fPl5Ofvvq3b6QNqkk?=
 =?us-ascii?Q?j4EoM+lHQsxxfZC6vx2hfXIXjijexxzJLQNb9UpHd5JeOFqkIiLOFj12dtwb?=
 =?us-ascii?Q?kNa5T1M/Zxf+7s3Cl/tZHSry3sebKnAmrlJVBpnojMQwa9e+uD+Gv53XVjC+?=
 =?us-ascii?Q?h15KskHS0yKVqVRVpKCP8j9QkFJ4a7p7i5fXOVSdpTYbOgiAg06qBhF1UqOp?=
 =?us-ascii?Q?ARikcm0COz3WlwljIBQG/Do47Bevi6ksQyJgVJDCn5ppbiinjk7LzLY7apZS?=
 =?us-ascii?Q?hANrH34fHOp0tRsvsfu7CKmdLTMUOTDbqHMzJuzm0TheEiOP4H4bjbvMXjeA?=
 =?us-ascii?Q?CJmoBnupaJReTdxtDme5n3NaBnDvFXbzMtrrTiQftjelbgb/ox3kICa7H4kv?=
 =?us-ascii?Q?XdVY3v+ovKTNplImjhfdXfNu4JzrOqzKnH0NJiA+oFh64Xgj+h49ekPawa2k?=
 =?us-ascii?Q?5vK1nAjq0JZb1TV9IYFCvlDlOh1W+Z+zACPq+wrPr9uQhugF3FJnPNuvy1Qe?=
 =?us-ascii?Q?uMNTGTXR2/dgUXyOrGA71oY5SmFGBkKpWGD/TzzWG9pUWE+8PX9q4OnhvjbA?=
 =?us-ascii?Q?K0uFJgHaWZWjagZ45/aQl1pIPtnQGGCNo/c16UrGb9vcYQXK5W9J0hcG8qPb?=
 =?us-ascii?Q?oiHEk3bTzvMlTnbFSgrEd3iAKt5Yfj8Z/Y7ZoeZcE7KBv3VYhtf1v8pOnlYB?=
 =?us-ascii?Q?fF+4xL7Kt+wVocXeUf6pok8SE8oEDukuwP2tb9xyAu/ZhxUApmOivdTr71TI?=
 =?us-ascii?Q?st6AIcGVwi4Wx7CZm+Abvho+PPO3GKlqkAfghfIpRkS8dQ6UaKaUZB9qLPXi?=
 =?us-ascii?Q?0IzAuHYKYTSyMuW9hCyh2+rd4a254qQ1n1Jk5YgnucQ6Mdv6jdqWqEis9Nrr?=
 =?us-ascii?Q?O5IdTds=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qTx5rs2BsiY0d3cUjYYHYLN54Kpq4bpJFGWOh2lq98TuI4g++Y/9+8dcjrum?=
 =?us-ascii?Q?WoxHpwOsSnwa36CBKOdUGQ9nd5MLo658Tyv+oGoMihpqYB22EGGOqLjfNqVw?=
 =?us-ascii?Q?k9ciVs9merosTmGld3zB5l7Z79CZUrWsjz7yZw8wny8KbiDkpkWV1xuleWMN?=
 =?us-ascii?Q?4yByYmy0NKZ4WayDnPI4tzwy1QuiC+fwltydETL3lCTsvbTvdJQ2WiDelLuj?=
 =?us-ascii?Q?7rQtxIIKE5XHciU4gBmBI4QnDV3zz2anVQSCmxTJxAKCt/OJY5bTVuJTtoBn?=
 =?us-ascii?Q?3i6922dALgRUNn/XpnSq+gp0ha50umxJObms+y7bAWHgiFVSpNRlZrKA2KI8?=
 =?us-ascii?Q?ARda5JkAtMYCCRj8LcWVKYgdHR19B6fwcG8WsjnmLRcrhddemHJAWg2yuVZN?=
 =?us-ascii?Q?z7UBpf0wDiq0RspTJooI++icUzvszVsBJ9e9S9AyBip56WniRLvTzXLMjUSw?=
 =?us-ascii?Q?cK8pIwy7U6ctsyJEBjjlEo/CDFguoBM44bRG6EcUccCcQl0FL8HeVnfJPejv?=
 =?us-ascii?Q?x2AXNnkIMP5AG08YuCDIQLGccafC02K+ksKS9dKFQHZp5OTjoisjdWRhqSpI?=
 =?us-ascii?Q?Fjvqo2edNL+CHxx7sJ/pNSCsoSXvw8/Nq7X6LYoOsXACS9p9OGngyds2ShGK?=
 =?us-ascii?Q?VoF1jZ6NeXhS2fRiI1k5CFKn7Zj5PhumlHPPKBP3QXT5OSlG7yBVl1wM7Sm/?=
 =?us-ascii?Q?rFEFqP58+HdCjtW27jKKGdfWhmj7pErYeMzfpZq+jZ5/wN8utojpvd1U2uWW?=
 =?us-ascii?Q?m6vzsMiNF2E/6HTsbahsJXxMZ4XZK0sqVNjhougd9Xx5koI2Y1+41gLKYE0N?=
 =?us-ascii?Q?8SxNYA0pYp63M85823CaGXXVKETVT+B1uYGSOMX7pi0tF8/BbItINht+6634?=
 =?us-ascii?Q?n8hfolIcpXnKsXi8TCEr/+N40tR/RIWWzoZ1mQZd3HCAl/CV1qM1VMfMXoSP?=
 =?us-ascii?Q?v+tPYd3Pg6hUThRzAppkpXv7EDMHCO5wCv2NtV0jp0i2H43fvhK2jBqM+CGS?=
 =?us-ascii?Q?0QW5GQXiGUTHjgb1Wq4LOpyjNfoClLnz6BC6M4chZcWioKW4OJ0LS1+aKdnT?=
 =?us-ascii?Q?svNXMZEqBtDU7KzFkMApmD0bipKJur8C+dBYxKAQ72+6YQNWAeROBwGrKOnJ?=
 =?us-ascii?Q?krETF3clnDoAAFG6nP28vsbFF0IDQp6UMLFqJU1AwU607hUczFVU35iDoAsf?=
 =?us-ascii?Q?h4Ndk0T7hdSyNaDhD15TlDiigEaMTkvGv0BQ8J9fPAAeQH9VpWK5EzceMHns?=
 =?us-ascii?Q?/mqqOHm9FnRAxi93zfVyAySmALRmy3YqObZ2OmNWxE/r4Qm9YDbaxscgfrhA?=
 =?us-ascii?Q?0N9pRzg50RI8HFzta717/eXLicg7cYCS6oOtZYa53rCoqSLqhGibqGAYy5hi?=
 =?us-ascii?Q?Z5A+N8UhHtUUfQCBrxR9qmZ7t0tmEmoB3m/Fg2XkneydrnNdTN0YXfxxvuhm?=
 =?us-ascii?Q?HQYvwoOI2DJuAH343lWBy/Wav3dHdoO6nDRZPgzI0eyFXB4ZEumruKDNYp8h?=
 =?us-ascii?Q?H9Q1cMnuxb8JNj6DXU2xJ21ndhRQ7do0HA+nIYSje5nqdMl9fq3KqHtNZiKR?=
 =?us-ascii?Q?On/+26K1aGHKgDZfZXehVmjUuEI7gGl9z0QhKoQ40Tj9LJaLq6HjSGPtny+W?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5752598-4e4e-4f68-2e3a-08dca6f73ee3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:00:02.3739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CBkKv30fYWZ6rPMt+420ZMgd9cb2/IGfZNCBbzg22FqmWTSfOmZsmlXTmvWZNWOrDr6xx+3sYHAI76M285t854gAIPwbQe3L7wvUZ9/XR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
X-Proofpoint-ORIG-GUID: c54e2Od11nt_E_Imzr7Tc7pLRaZQv-TN
X-Proofpoint-GUID: c54e2Od11nt_E_Imzr7Tc7pLRaZQv-TN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407180046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 07:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111394

From: Wentao Zhang <wentao.zhang@windriver.com>

The expiration date of the "PayPalEE.cert" test certificate in the nss package
is Jan 12 2022 and causing a test failure.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...validation-date-for-PayPalEE-test-ce.patch | 64 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.74.bb       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch

diff --git a/meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch b/meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch
new file mode 100644
index 000000000..d905bf10e
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch
@@ -0,0 +1,64 @@
+From 1109c1b8259ad840ac1688d533f76ca268c67b6b Mon Sep 17 00:00:00 2001
+From: "John M. Schanck" <jschanck@mozilla.com>
+Date: Sat, 5 Feb 2022 11:12:43 +0000
+Subject: [PATCH] Bug 1750624 - Pin validation date for PayPalEE test cert.
+ r=nss-reviewers,bbeurdouche,rrelyea
+
+Differential Revision: https://phabricator.services.mozilla.com/D136289
+
+--HG--
+extra : moz-landing-system : lando
+
+Upstream-Status: Backport
+
+---
+ tests/chains/chains.sh               | 6 +++++-
+ tests/chains/scenarios/realcerts.cfg | 1 +
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tests/chains/chains.sh b/tests/chains/chains.sh
+index 32c7ef54c..e13ae52f9 100755
+--- a/nss/tests/chains/chains.sh
++++ b/nss/tests/chains/chains.sh
+@@ -917,7 +917,7 @@ verify_cert()
+     done
+ 
+     VFY_OPTS_TNAME="${DB_OPT} ${ENGINE} ${TRUST_AND_DB_OPT} ${REV_OPTS} ${FETCH_OPT} ${USAGE_OPT} ${POLICY_OPT} ${TRUST_OPT}"
+-    VFY_OPTS_ALL="${DB_OPT} ${ENGINE} -vv ${TRUST_AND_DB_OPT} ${REV_OPTS} ${FETCH_OPT} ${USAGE_OPT} ${POLICY_OPT} ${VFY_CERTS} ${TRUST_OPT}"
++    VFY_OPTS_ALL="${DB_OPT} ${ENGINE} -vv ${VFY_TIME_OPT} ${TRUST_AND_DB_OPT} ${REV_OPTS} ${FETCH_OPT} ${USAGE_OPT} ${POLICY_OPT} ${VFY_CERTS} ${TRUST_OPT}"
+ 
+     TESTNAME="Verifying certificate(s) ${VFY_LIST} with flags ${VFY_OPTS_TNAME}"
+     echo "${SCRIPTNAME}: ${TESTNAME}"
+@@ -1118,6 +1118,7 @@ parse_config()
+             ;;
+         "verify")
+             VERIFY="${VALUE}"
++            VFY_TIME_OPT=
+             TRUST=
+             TRUST_AND_DB=
+             POLICY=
+@@ -1126,6 +1127,9 @@ parse_config()
+             REV_OPTS=
+             USAGE_OPT=
+             ;;
++        "at_time")
++            VFY_TIME_OPT="-b ${VALUE}"
++            ;;
+         "cert")
+             VERIFY="${VERIFY} ${VALUE}"
+             ;;
+diff --git a/tests/chains/scenarios/realcerts.cfg b/tests/chains/scenarios/realcerts.cfg
+index 305443fc3..f8b0fc452 100644
+--- a/nss/tests/chains/scenarios/realcerts.cfg
++++ b/nss/tests/chains/scenarios/realcerts.cfg
+@@ -22,6 +22,7 @@ verify TestUser51:x
+ 
+ verify PayPalEE:x
+   policy OID.2.16.840.1.114412.2.1 
++  at_time 2201010000Z
+   result pass
+ 
+ verify BrAirWaysBadSig:x
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index ce4137a67..4777f7937 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-Bug-1780432-CVE-2023-5388-Timing-attack-against-RSA-.patch;patchdir=nss \
            file://0001-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch;patchdir=nss \
            file://CVE-2023-0767.patch \
+           file://0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch \
            "
 SRC_URI[sha256sum] = "88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056"
 
-- 
2.34.1


