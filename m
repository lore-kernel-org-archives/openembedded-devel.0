Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A4FC77B61
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 03:00:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5139.1681182004660076325
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 20:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=icqqDALz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3465c715be=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33B2cETw032705
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 03:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Bv5BU3rSKewJ+p/aIIl4f9e5QpG3NarwJMgVv7ictJw=;
 b=icqqDALzJsq+0r9w7BLHl4bdGnq/6Ttut2nnYSEJJY79SyxZFbzDmpb0EkOkL4a4JKTt
 75CSUMd1QzUGB37AmUvs9ICkMgSn/z4nEZ3aekkwM4+L+b+2nENi77L470it/7IOtZHQ
 vkw/N90EtARTlibKrX234YaIzziRXUg5t2l9P68wpbWYzTwP8Q0rp6wrJ/J3EaKAHcBP
 yR1vLShfK+zzq4nfH815VErpunXJVil7QBc3juCSEuQHmTswPqkYWTKhoQ5Lb0D1XCQU
 22xwbcbpztzfOTBYzy0v6RTuFHTuRtWOVo1kx8lsiUhoMOpqLsc3/4PHFIa6GxyyOlL2 Lg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ptwg3tmxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 03:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=js0Ot3B5qXHQrJJDM5Y17JOL4Ef59dHadsX/BaZxHZkniaXClFip144pLnY0s0krJlcQRskVav0Nhn9tuQ/yXJMHpLXh9kPB7ING0UGKcgFQGJVwxOfIwCnervIPjgA6Fbk+omTzIosrtUnR6I1OdJ7Cls0gfRAu7eBdS10zbeIB34P4j5Y7Cxdqqz/ftpoC3IHLnWXQiVaRE1NUbnvc0g339fV6K+Az7s5R7yMZ48DKV6Xkgj0PNsferhRWhdI1meAYOhywG3qoq66We+bBGUlIoVuwZGMEw/UiIGRdQL59tV2HjxyERSLB+zWdeC/PZ8iDVhtkrlbVCEIrsbBt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bv5BU3rSKewJ+p/aIIl4f9e5QpG3NarwJMgVv7ictJw=;
 b=fZr0P/OwFQE7/8RH/F57pK38zV3hYZcQ/Y2+6gSvbh1rSXCgTNY9Q7uxoUI5kZkiXqherywuUELhJ7/Js2PiUtGGwEQ2lG/jHwnEkUQ1W/26/u1FjYl2Zh3VC0/EO1C1eH0No2wmRmmYOxj5odD/+fE+aLnFv/GqfGjcOgVOzzpVBhDN92XpQb8AzpuEMqREYlaztfJVxgajAuxQkGiHm3pEvI7DoB4xTSCG/WwfJHhKh33qwt3T5h930KplTe2pWiz5I9Rd41Td8cRRqFSSASrGi37hMC0j7BaKDpq1Jk2dCU49QxPt3XNEtxLsYG7Rf2z4VawfCUeMcKPzsluCLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 03:00:01 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::9ad:892d:ae85:59bc]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::9ad:892d:ae85:59bc%5]) with mapi id 15.20.6277.034; Tue, 11 Apr 2023
 03:00:01 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nss: fix failed test of nss.
Date: Tue, 11 Apr 2023 10:59:39 +0800
Message-Id: <20230411025939.823368-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::10) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4938:EE_|CY8PR11MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a71886d-6778-4e87-0bfb-08db3a38d7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yt88yhQERaOdx/VeE03j/R0xiN/c/N5pPqy8yuc0j9u2xF9gtp8vER5Br3PFa5YuotTuIsZREHV4WnCNLV7ACZVNwEiXQfnZInjoib3Zltl4yLOf2P62ejOQk3qT/UqbzCqJwpOHrg6tZkpg/Yp+8etNYvZRcM8KyxeKAkKsGtMMgcXp+klCJ3D6F0P2fs+d0Pi8fmzDEwITzxOfIe+gvBIO81gEimEOdmXsElMlcP5lLRn0yOsA0pB2cfe7G/eeXmxKb0cRMzrnEfdMQILt5f8TFvcSkMiJihCftMeDyQ9qylPkcCD38+zqCyfBHjhYoNPqcw1ft2f0RtpSgvTU0NyClJnXhxwrUqvnzDfeDXyWKEISO42fZBARbZZkdkDQ54VUpBPPzCIwhYtvCbBVBMVej5R1raaxD9WkjZ2g54yd4WUOwxT5biTFgQ/HAoGKyW//VDWDAfY6kZA2QLTqrTtlGucjb3DzzC23DENV8SSBUtVsg1/j1+ja9Amjja7M7p2al5r4Roe2zoknwJe8Y9BQM9j7s54hbCtemK0+qXSWe8n3jZ8/ia0s2ELgROEdLOKY3EDJstk6YRraHv//PbR1D8dm3fZlkaqaJZkatqk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(478600001)(52116002)(1076003)(6512007)(316002)(26005)(44832011)(6506007)(186003)(966005)(6666004)(6486002)(2906002)(5660300002)(66946007)(41300700001)(8676002)(6916009)(66476007)(8936002)(66556008)(38100700002)(38350700002)(86362001)(83380400001)(36756003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gxNKeQuhM72gJwE/Wb4HmTkGdXuTHoXnR7KvR7myl+lzSHbOEeMUgMvRFIXr?=
 =?us-ascii?Q?RQPpBbR52Www2uEAJdPsqfnc//vBYJnInvGTGa4CRUC53jZGFhCoOGddw33J?=
 =?us-ascii?Q?ZGmmesDjWJfwmmA5iDFfQ2+pDDJ6QrLX+L9quWJmFiiv6c6HnvAyLucNJ2wG?=
 =?us-ascii?Q?UFQfSlEU+c8NZJLqlHf1BkwxNjLZKOp+U42F3hA+ilkALxe4Kr8Jf8bHnBjV?=
 =?us-ascii?Q?o+8Tmks3GUoh+VXYFO9wluGj72k7iqA+u0z9spxDb2/rFHFE70HcR1vyvK6S?=
 =?us-ascii?Q?TFL5DTAmOb+FyaEWwlcEkjvl9OrtatE89SyHWmTdL4eob6Qelj6VvuEypYuE?=
 =?us-ascii?Q?2BAKdfxFmlATv2sv1G9xUIkjIUzMoeRO6M6NopZ5WJhQNfQ4n6Liaa58ROfz?=
 =?us-ascii?Q?MGuz8KxLSSv2wCqw9hAXbYjXWfBYRiKTvN0uiHGybCCKC0STvdqLFOcWd+Tc?=
 =?us-ascii?Q?sozYbPOg42OS9EgKQQX9Or1uNMxGNsxo2GH57M0Oj/N5i7gi/6h1FbsfYec3?=
 =?us-ascii?Q?sQKGwfK8YiHB3nIcV56vwp+fTzoxfBLM46Sz6Gbqbxp3g/32qUts5yGCEQoI?=
 =?us-ascii?Q?Dtzw8CyE/NI4g7k3XpLJzG8Y6wN75akjSVa1oevOZsaIdas19FG+g4SWWjGI?=
 =?us-ascii?Q?6F7WIwrZ8440HknAvWyQ4PWyCiAlPCP1w0vmLA0wDY9Zd94M+/qW4NjQZQrD?=
 =?us-ascii?Q?VVVFnEw4Ddl6Tuda5l7LPAn9QFrTcPHmzOLEFQZfyGkhQo1sfIBXmuAJAPS0?=
 =?us-ascii?Q?s+MqKEZb8JzgbbuhdOAgNFOoe83y9R8B3moNs2m+ZHn5uBzE/HjBKbLfXVfH?=
 =?us-ascii?Q?TMUBDOeL1yqQGdeWu7KTnlciJ/invnmjisa+m4eGeoswMnmxaJRTI9oB/Agh?=
 =?us-ascii?Q?0Z1gFbGZGLqXHoCJ/ICxngKNoXdmaaGBRf2SoFAny4NDL0Ql/0FDZ+a4JLHH?=
 =?us-ascii?Q?4ufIKildSUdbH8+lEO1BKEvVvVtHEQiJ8w9pl2UVkaoR8mYsXPWX5nUdj+1r?=
 =?us-ascii?Q?NkIsxy109/tc3SPiUlNbg//BHl8M4nGfHbFpEWN1nIUOpSOl3oALNrq4Rr+t?=
 =?us-ascii?Q?3RVz7ky3wBscZZfA94ghUVFeR8gDlxRhAO8Sq3PKSqBliRyp20Z0DRYmyYLI?=
 =?us-ascii?Q?HbZ0JAMzDOUPf/zEFSq9qQzN8rzK3znM9iHpi0mJqDmiohRsohn76kao1wSt?=
 =?us-ascii?Q?xMilO2r4wPJZp5OhnAh6E7/CzZMABQZDg0SYht+09caMniw6RNF/oRNPodDc?=
 =?us-ascii?Q?jWArmODmcfdUQaRO31rM8AZyXY+AMgaFewff2Tpo8vcW9f/OUmgEYQeQtY+B?=
 =?us-ascii?Q?Fs5nI6NxXv8ZqbJWxT9l7+KjSMNUtEOrN/XAzyBYcbPe6ClQxIfGZQBKd4bd?=
 =?us-ascii?Q?5oiCvZsGyHK2rcINst0erlmO0h7fzUpH/kPlgH6ycEJ1m2f03/LqTpOuQMar?=
 =?us-ascii?Q?MNzH8Cwqy0b2pwU3unnj70+xIAskBFNepcEk5CAGGEy7AyL6MBE+5DyBD1vS?=
 =?us-ascii?Q?DWdCK8H0JXKHi+iRL4iZ+xtDJDtK0bDEmhQtYbhM/tFqbwrDqcVPCXjEY0Z+?=
 =?us-ascii?Q?H0ikayEKqUtpDPfQaXm4QePxLSpmBFm/Ez3NTpcA2eqamtjeXz5Bo7VZxYWH?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a71886d-6778-4e87-0bfb-08db3a38d7d7
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 03:00:01.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuJunmusPemfTvgnHM7ipuC4Fhp+6GJ9Z3us2EW/5c5VAKEspiab2YYEQYIgnWm7l96dC89DGTbKv9GRlAS9Y2fGFGIFu6CJJbdr9vqzQYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
X-Proofpoint-GUID: 5zNAnp-em6nqsXttlDs9iMa4pcvm1DqS
X-Proofpoint-ORIG-GUID: 5zNAnp-em6nqsXttlDs9iMa4pcvm1DqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_18,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304110026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 03:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102053

The expiration date of the "PayPalEE.cert" test certificate in the nss package
is Jan 12 2022 and causing a test failure.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
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
index 4a9482fca..a7048f0fe 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           file://0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch \
            "
 SRC_URI[sha256sum] = "88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056"
 
-- 
2.25.1


