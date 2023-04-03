Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CBAC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 08:17:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.64897.1680509817674220164
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 01:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kCjnsvpz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3457a8b20a=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3337I06G025619
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Apr 2023 01:16:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=CJHcIJFARwd6BpxbALlezMKBwLJTSACDnL8wBkU8gSI=;
 b=kCjnsvpzShF7PZ1KfRqaHZmQu8r4hikY776LZXpeu2aFYtxFPAoVTvisuZFEExqL0SZL
 ILDZlTWdcnSN7QWYLnbUb0MgC15zM9/bbu047eWt42CrvGFRihVxbSVa298acE8j3Yus
 CPKTyQYsgNgoUI4440OgEEP0oitB+wX2Q1e2LcDut0vM8vAv5W+YDx9gPk50DFo5aFda
 VCCKyq/ZPePr/92I8hvbnE900q4yLalowEiscgomZLN5ifPQjG8NFQgV2dypPL7AqhxH
 GqMVSgZ2un0Ho7P09Ss35PZzybuuKyhsIAGtqavANxLoytgXa+FvXQs4geQkmeHZBGK4 IA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppm4p1dvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 01:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4VRbQrPmKmjGnPj14dlvMviaRiCbJ1uFvSyBy0aMJ2C+jd6H6XP3RaxUcENcWijh/doUlggb2eMM74msu56sQ1TBQRTsl99JD8vflvo0Jml9tdTUw4Lcv9IhNHl2QdqJmumDYBBALVXmAHmP0m9cFdH1aYsiXJsxA/JMsDGLkyFanghKtd7CgtopnWqNs0HYxgcLquuOOJGiRPDRZxbac1nxaYD7opw6mgX6X2jEF+pO+dZ75tLhDHX7/IW2ShbC01lv0IZWC/RHnCJGG/NZPHfdEbVn7qGHAMyIW0bPeuE//6kn+nrXpwO8WUtCEqHtrBnMZ+mRNTcB3ss0WOl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJHcIJFARwd6BpxbALlezMKBwLJTSACDnL8wBkU8gSI=;
 b=BWnkQ9Sy2IZcq67VM91Whg60UbWw7FD+DS70nLrvwPMZQlBUUOWevhb+xT93MItVKVEk+BJi8AAAE2n4VYc/RnwSipK4heSq+pZmA5sLbXhHdqTJn1N5BPQ23+9sHGSjgi7rjirGuZEx9pxEztUAQvZAaospEBtBVBlisXPzsBQqPvcYho+5qvktGvLAKcoGZAVJtECfcNK9Blztyvy6EYiMRBZtXARfRmhnGy8horcKYighYwDlCykvrz3ppCVhGbSR58ZM04IGCvJaO3Z8xpdqhhjeSbcPbd5FNLryijr3zK21yNuLevqzpk3Cy/6qr4+aseuhxWoHrVCnUCXP1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 08:16:54 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::9ad:892d:ae85:59bc]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::9ad:892d:ae85:59bc%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 08:16:53 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jemalloc: include the missing shell scripts and source the corresponds shell scripts for some test cases.
Date: Mon,  3 Apr 2023 16:16:35 +0800
Message-Id: <20230403081635.4030112-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4938:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 577d4ff7-15df-4a96-7833-08db341bc804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QE6R5b5QRXuskF77f8XirG9P8Y4zjGmXG6uZN/lNkGkOAjXFckgAZAq5by5EJaZjuyr/W1eGuvLTKnbjRKGBfIxwVT1oykHC3x32sIYDDTlfZx3qAK+SdZozF1fVFgKzo3N/DYR/kF2/lSgtItXcV4pSiO1+nM2SAFft/eONQjrqRtw0P+0eEL/VekAtD9AnZD14U+I6UacphxJS04fGjybuI3VCp+AZkcZeUHp0gUeKgGbX/lcqCWJp8PvV8AP1P20SfTGWArao2o/sJxkxm0uec150J8T0tgMTuZIegkMSyzPFXLvkudDj+WLHZyzSwkNL8NOY7lQgCFUbu06Hp4RLmPQad4KONKuusrvcVMtgn8+8J4A6biLvAj6SipFBOzc1vPyKSTHmqRgFFs/dc+QuxT9IaERb093ysBw+tKR93cAOqIYubXEMnZplzobj9n3iDAlnePBPVWA85+5SzPhdHFAZbkqUWaD7UTnGwkvQhW/ZoCie/WEoVep9ZEK5Z6U7ofpDM7PKi9L1ScQo9DnE539vEMYjYT/ekgzHZd7k7Y3bxAZZFitaWOOeYPSd1M6LNYI4aYx0jdfXigu4JCCJyePdfFqpvnM/+TGsteTXz81xKE0u/OBNquvVS7v7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(376002)(366004)(346002)(136003)(451199021)(41300700001)(8936002)(6916009)(26005)(316002)(5660300002)(38350700002)(38100700002)(86362001)(44832011)(66476007)(66556008)(66946007)(8676002)(478600001)(2906002)(83380400001)(52116002)(6486002)(2616005)(186003)(36756003)(6506007)(6666004)(1076003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0dRHugodF9h9HVtG/NxFfMwUvWJHmJ0ftSDfp9Sf3EC4U+2s2Fgf6P0vHXZp?=
 =?us-ascii?Q?QmPhxC2Kfr5xZAcGkKn1q6dYaP7EJQPxb31tjgGG4StnZUfI3pktOCjEWIQa?=
 =?us-ascii?Q?6SfuNMmyqoCqGQPlddGP1DxWvz7iP9+O8DgWD5hFjBFgFTDf+alA+vqxZfIL?=
 =?us-ascii?Q?fc60HstfZPsJRZXQDmmTJRY3E4hMY3EG2f1g6VD6wP4Es++3CtIy19SUP/+k?=
 =?us-ascii?Q?U8D0tp0MHLA2eYhZ/Vrl6BW0+wLH+kJhKinGAHG+lWf/k5F3bCTJcvOBfsuK?=
 =?us-ascii?Q?Ti7tI5GraZGJI7f8WI4AFOrLRtNrXjTcaTGJSBcAbezwGbgplj8Zkh0RVZpz?=
 =?us-ascii?Q?QSRTtUyIrcAt2ej8oS6KzwPpfO3pxgH7Zia9PBnn/O5ibYB8WMuv7wFNCG5P?=
 =?us-ascii?Q?YRdJlSXo9FunNgV1zZeFdknbtlZuGGkcm08xN3fJGEY/Jf24eCBEW6/GAxt4?=
 =?us-ascii?Q?d0LMLGTlTY0iTL1Df2ZWH+HdRsSNkeqaUUBNpa/E0m2pp2wk3ZTFaSC6ozAw?=
 =?us-ascii?Q?h9fVgokZUrjRQeBMVO4K1uzhW5VE5xo27d8DeXAYndQT29e3GmKtyxaEC8YZ?=
 =?us-ascii?Q?/srdl217ONSpeQzaMdBkLXDTyuO3H9h8VXXWCZLhCQ1lj1GqJfIZVuAiA6F7?=
 =?us-ascii?Q?jdL1m4foU4A45T9WnbbQwXQyJhBeSIe4M8DzVjksqkYzHHenP0lRudZip9kS?=
 =?us-ascii?Q?1puqrt1sVjZjultQFvM3yww86lPO1KqQzuwuNw7ZV2d66BzACOOmIh6s60D5?=
 =?us-ascii?Q?fH4YgOCQiqtK6EHGrARmP83cZoolUkas/cNtM/DhrIkHi2v8OI6Qd15iY/DP?=
 =?us-ascii?Q?YEkj0MrizjuWiBzzGr7iGZeYj1q8sDnMtcHwQJJI1I5C7ryd4B7FJKao01n3?=
 =?us-ascii?Q?8YMuN8oggsdx8QSEnYOfxqVzamqptRpaGAgHBzu+WZ6MMuao+tmkUKBRuR5l?=
 =?us-ascii?Q?Cua265GwqgFWTSrm9kvSipCzHxpGK0bILsPsZl3hm2qFBczKKfkrDXHeBaL5?=
 =?us-ascii?Q?+Ml1bnPLhkYya3aqzgBnnEK0xG6EW+E9RBjpYDHKhN1AS28ZHZs98F4cVEM1?=
 =?us-ascii?Q?YsSTeojsttJO3cq8Ayo3GDUyrU8haty7ueXw4p75VD188RL2LgSw8O5vbW4k?=
 =?us-ascii?Q?ZBVECENOnRVWMZVQvlcW0kaRJaCHTezoWcQskCszp62KgCHYnAK1MYOQq5oI?=
 =?us-ascii?Q?oyfCYa90xrrJd9Ok8bMxzSGNFeR9l+DbRfUHh5NHkjfrJ40y7x3TtZ2t79ew?=
 =?us-ascii?Q?/qpvM5kQBSez6/CxToBX9EyQTJpIejACKteCckN4wsi6r6l8XJ6Ja7gqsmTh?=
 =?us-ascii?Q?BqkhXNTGTSyqfyqxgStnKkc4GAgoBFTzYvLKIz2f2O9Vc+xrsuZysFknaTzp?=
 =?us-ascii?Q?Zy61hoDtuDuUSvhxGrMs7IlWnbilX3cNN53/gOKplGDe4kDV0KzI8dRiVm37?=
 =?us-ascii?Q?ZhTrSZ0U/nYL7LjgMSpzvLKPDKNT3UJybUT5kfrUViqrgqiYby75q0ePj9SQ?=
 =?us-ascii?Q?onhnHGlAccbhj4Xh+OnX8ZmQ+XDHPCsDJUrmbZ/ZZ2eNj4EPLOebncaaRCUx?=
 =?us-ascii?Q?e9w+nbWzkMrhgxspF54aFmmyqvtl+amU/vgPwPfD55E8YNqzvhicfI6BUPsc?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577d4ff7-15df-4a96-7833-08db341bc804
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 08:16:52.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZNF6fClLuiAv6n58TSczdkoE5Z8/gmTOZ9eXUFQwMMddXxxgryEPwQE083Gi5PqxR8LHMJxdPTLe3q4r9iFIrZ+SnrewUptmi1IDus+js0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
X-Proofpoint-GUID: jJGg59e8gfXeAbokfcMIRUG--CtlQ00F
X-Proofpoint-ORIG-GUID: jJGg59e8gfXeAbokfcMIRUG--CtlQ00F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_05,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=717 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304030063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 08:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101891

The test cases in jemalloc require the appropriate value to be exported
to MALLOC_CONF, which is stored in shell scripts.
The privious script just ran the test cases without exporting value, causing
the tests to fail.
Include the missing shell scripts, and source them before running the test
cases now.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 .../recipes-devtools/jemalloc/files/run-ptest | 29 ++++++++++++++++++-
 .../jemalloc/jemalloc_5.3.0.bb                |  7 +++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/jemalloc/files/run-ptest b/meta-oe/recipes-devtools/jemalloc/files/run-ptest
index b351f947e..5c826a176 100644
--- a/meta-oe/recipes-devtools/jemalloc/files/run-ptest
+++ b/meta-oe/recipes-devtools/jemalloc/files/run-ptest
@@ -1,9 +1,37 @@
 #!/bin/sh
 
+export MALLOC_CONF_ALL=${MALLOC_CONF}
+# Concatenate the individual test's MALLOC_CONF and MALLOC_CONF_ALL.
+export_malloc_conf() {
+  if [ "x${MALLOC_CONF}" != "x" -a "x${MALLOC_CONF_ALL}" != "x" ] ; then
+    export MALLOC_CONF="${MALLOC_CONF},${MALLOC_CONF_ALL}"
+  else
+    export MALLOC_CONF="${MALLOC_CONF}${MALLOC_CONF_ALL}"
+  fi
+}
+
+
+
 saved_dir=$PWD
 for dir in tests/* ; do
 	cd $dir
 	for atest in * ; do
+		if [[ "${atest##*.}" == "sh" ]]; then
+			continue
+		fi
+		if [ -e "${atest}.sh" ] ; then
+		  	# Source the shell script corresponding to the test in a subshell and
+		  	# execute the test.  This allows the shell script to set MALLOC_CONF, which
+		  	# is then used to set MALLOC_CONF (thus allowing the
+		  	# per test shell script to ignore the  detail).
+		  	enable_fill=1 \
+		  	enable_prof=1 \
+		  	. $(pwd)/${atest}.sh && \
+		  	export_malloc_conf
+		else
+		  	export MALLOC_CONF= && \
+		  	export_malloc_conf
+		fi
 		if [ \( -x $atest \) -a \( -f $atest \) ] ; then
 			rm -rf tests.log
 			./$atest > tests.log 2>&1
@@ -18,4 +46,3 @@ for dir in tests/* ; do
 	done
 	cd $saved_dir
 done
-
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index 950b64ee9..9ad83261e 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -42,10 +42,13 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
-	subdirs="test/unit test/integration test/stress "
+	subdirs="unit integration stress "
 	for tooltest in ${subdirs}
 	do
-		cp -r ${B}/${tooltest} ${D}${PTEST_PATH}/tests
+		cp -r ${B}/test/${tooltest} ${D}${PTEST_PATH}/tests
+        if find ${S}/test/${tooltest}/ -name '*.sh' -print -quit | grep -q .; then
+		    cp ${S}/test/${tooltest}/*.sh ${D}${PTEST_PATH}/tests/${tooltest}
+        fi
 	done
 	find ${D}${PTEST_PATH}/tests \( -name "*.d" -o -name "*.o" \) -exec rm -f {} \;
 }
-- 
2.25.1


