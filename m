Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A0DC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 09:03:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12678.1702371802264201066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 01:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WHvpbq9A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=071054a1ee=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BC82Cwv000643
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 01:03:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=R0dL+i5zK54BJq7sdj
	kMPXFTBIzF3OEuiTxfuDc8FXo=; b=WHvpbq9ApHtvJRk5BST+tAZv0bL16Ti61A
	xKwWqo4bYtlyvmPcXdSPJek1gQ0oT2z2O3fEi4e5wbtLNf//xR0dQSUc/l5kPN0J
	9MHFCBDTRTM+dQtnpx2fPU5MBFbs86m0jTcqwuLDFYQ5C9NzbB37Whhoc80l1N/6
	5fXx6ozgx+mt8rdbVvyh08iVIFwPfs6gn7kWhhps6psJz9JpbqSK6RlohhAjry49
	ZcpOOVN8/J/hI7fOSHcXziCV+3txSRaj2nIg4jBQwv6PCzDTNs6FoTZYkFncv/PM
	2/f8q8oY0hPSVyaYQB3bd9j4yM0CAwIHarHu65DwUNx5M8nxx9nw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uwyxj92qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 01:03:21 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BC92Duq003377
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 01:03:21 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uwyxj92qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 01:03:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuCkGHfsrV3GFM/cwmulhkGzZVazmInshEYrVeSCTLH01s4OQgtzKfVpdUmgg6vQdr4+ApxM7LEhDGGUCTlyzS9sw2ZndqugaFjITHtBERTji6ZQNhXn17Id1e6EMV0PhbGmOOx2UzObMvkDgaRvpxOWhzcxS9HbNWMhs0kxNhqvomuGnvA4l0nNrKHy63B1wYsw/wC0TRZdZqlx1tqqQIDO8Rz9e7S6bcgEnWki2zNZFS1KjDkPq2vROfCzUyRguDy3FqTUdwaPHfAxLmXEwsRdSYN7hkEwQnRrFuKWxRYUsqFFa+hYLoUnJsPa7NGAeA65DCdotVGJRcyItZFQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0dL+i5zK54BJq7sdjkMPXFTBIzF3OEuiTxfuDc8FXo=;
 b=mWVtsAaj5ObPhgOufXIMAQbYOJsHMoYMVRioh/3ZmK/4bWZMuXsKznTFvRfF4v0zgA/FVy/5Vy5JqT4zp9BXV0wY8GOCIsf8E111H9/k2Xq3Ydkxhj36anZty2xEUwpJUecv7QMuHS8wJaw3pNx9CoJ8KUwQvUMhyJVSemKGF2Exvex7V+VJRrRhiXYHy2AEkDpFeQeaJTUcLYoe5CvY5thiWPL3g/CKz/r/3Hqld6qecfr8KqtqmUcRauGEtAIMuwjZwGFtdIRz4A0gRfq8eONS3qWNRCAlTN/Qz3RTPiweaKIKXDT+fGm2CUOXkWZBLfnNY8fVjyW9TQ0aOdLFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by BL1PR11MB5511.namprd11.prod.outlook.com (2603:10b6:208:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 09:03:16 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 09:03:16 +0000
From: liezhi.yang@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder aarch64
Date: Tue, 12 Dec 2023 17:38:04 +0800
Message-Id: <20231212093804.1012506-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0109.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::13) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|BL1PR11MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3ea8e6-076b-44b7-dc43-08dbfaf12d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	06gygKXX9g7wfW1q2uuoGjnb11H7JIF4wPXFiv2VKBJJ+gqZzOyWPrJ0FxFZ/mT4lNAFb2FR/w3FHqp3lGeub2Ed11gMDHJtPIt0inRpb6kK8e0QrKGyJQ3dT32jajQw3Ut0mJbwSdS1I8qqnkJAJPpnrouz3zZYdb7yg8U5G7JQxX9/UtOly6bJHaj9NZAiNtSJZtMmXay9S+co+5dYuCotefjJVe7mh+CePB1e53pNZxPpSJWArtYDMjiIErjVxn9a8W/WmEABzgfMYhSAhPoLmYUEHZBJQa8nQ4tpNjN0+NyGsaxOp+zVeTtIA4/RWfSzCmrNI4F4qYpvrlz5v66JctvVV9ejwE7HoJvswPKkTDzUQqYzqMWWXx4ekF4ukrj2WhIBMTRhhwaKDn1rkpGxMq8FyPHGitQls7zoID3IEDCWHm4NgF33HFE1D/5g0l82NKM+VEvdiXyQN7jLHjNDMwTRJfbFaQmLnXcuVu1D8eOm2YFf0CW/jS0YshYvf2D37E9JtFjMiHEtOK0dqpozkuUXqGWoXgJkdPUj2UUk3yzdcFAPnoDrwUb/MZqtlSfo9nD1iCtns9LPHa3cGODOVZYvqs5v5JUu6/z0p8H7OtUNiOwBT8PD5Q94QM+C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(39850400004)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(8676002)(38100700002)(478600001)(8936002)(66556008)(6916009)(66946007)(66476007)(36756003)(86362001)(6486002)(316002)(26005)(5660300002)(6506007)(1076003)(6512007)(9686003)(2616005)(52116002)(6666004)(2906002)(83380400001)(4326008)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TKuJRLAtObLHzXBZEHHfOcjDDwnX62bAuJlBDXi9XqQUPra4T/Xlt2EXw6z3?=
 =?us-ascii?Q?m05pd7vXaYb37eQsnEZbSyNCbu5MPrxPOBcRe/5/RwPcy2JO9AGA04MXhaZl?=
 =?us-ascii?Q?uU9OrcOY+rI/w/WZKyMVG42aCqHXF63zS1gmP9/nELvv0CeHq6ZOyjYuy6rb?=
 =?us-ascii?Q?v4FAAoFJ0bLGTmJumSKCnPVqfW63a1x3f1eJRvsT5GhFYZ5i+aXRSr2noaxE?=
 =?us-ascii?Q?bknwVBSWEJ8YSKBat10qNNAQgj2r3mZmKhkY5ByyicjEKxD8gFRMxLZdtwRo?=
 =?us-ascii?Q?BYNQ8WZRUZgDFKEBiQbI4BxcBlKexu0H0S9asdgfkA0qRdo6whypP0VUI2HL?=
 =?us-ascii?Q?cQ3l5sP4kSHm6H78FJZULoIv8QzIH+wGdcaioy5FoPzlYG5ogpMsqBOUseat?=
 =?us-ascii?Q?Pzozm2OVBmUmZJCbUhy+ZumFfVni8xyc7OdXdrItgPgyMZnkQ5Sp75MeKxHN?=
 =?us-ascii?Q?F4xlELmyt2UZKA92sZ7lcxiuhLEvBb92raqLLBcB2qkyLhGpjGAf6eN5Kyo/?=
 =?us-ascii?Q?qVXC5pzrbgSGBe7Yo/OzTaWiytSNc0/oRWg7W0xI1XA7q+oKuLUeXAIx2mhc?=
 =?us-ascii?Q?0DMyvAVRj3H7OcfEKTeGJccQ6HSz7S7nVgzgB2RDXrvs3T7ZOegoIb35r3I9?=
 =?us-ascii?Q?tk8YEIIA/3dquu5wsECWpkH5pPB8GG9BP0EJzMcLCQgvYNcnAbeyZskLwRx3?=
 =?us-ascii?Q?8oZ8TKKrVw9RKRNqBPZ7mVFRPvg8QxyhiGX2UfdgVMA5I9p4NxB1uEcfxObn?=
 =?us-ascii?Q?sYH7Cg1CpSKh8EvsYofI1JGQYd0e9UqFrTiKAzBLzjEzAi0CE3QDABuBCmpx?=
 =?us-ascii?Q?0tZQ5SV8FvFMX7ZmPkKamuW/hSNFw2WU5veIA7Gd+aB0uSGmqceXL+gPUXXN?=
 =?us-ascii?Q?nD5qI9DBrBhe3yHPfLIqcMUSJYUos3MQmF16GBNVJv2FJh3ibPmfVphUF9t9?=
 =?us-ascii?Q?YwiE7d0IFVAC3hHjuTd1m56BS/x2fa/VJVT4B1T8I3rQPKEMtSba9uRfc87G?=
 =?us-ascii?Q?afZbPkS3p0TtOE5WZEq2h2pBaoOALVZtJ0AK/vFxk+rg52qGOXK2q7tiMnI2?=
 =?us-ascii?Q?4D1uo3odHuYliAryH6B2/1pUfSNUqintmmkDqMVDKCpkbULJKGsLUoMvpbto?=
 =?us-ascii?Q?c0KTf823tN6OxrBCsLpFh+Wmx8ewMPMu9pl4KXgC7XhDIrRxC7Q27k8NqrYw?=
 =?us-ascii?Q?qHMkG/jsaIKAeeejr1k9HW/+wRLT7D/0raE5zaqEUWTOzuo0N8mpd9tGxuup?=
 =?us-ascii?Q?29uH7wIpA8U/0mgWJZWvY7I/Kc6LCfVPYuoKLXVvX7481I9UnhMUaVjJ4loF?=
 =?us-ascii?Q?4wutDLBlMMMIIZ79+XSAhxCuImtPni3TYMag5JXFIY5oUZ1WuXu8b4GKVnaW?=
 =?us-ascii?Q?/RThJ6oAZNCHUZ8U2iDyfaV5NdUgn9n0bX7FSegPEaUv3LoE0VRgsmrxt10e?=
 =?us-ascii?Q?TZ4ax2M/ZFsuut1Hg48m/b15uD0htqExkBNqBitG8oOWg0ssCyNLuOD1HCui?=
 =?us-ascii?Q?aNQGVjg+9m2VWOc2FXK7BK0ZN/ThXvogvIJA9j+xjmwMNLw7p/eOxVRaUrgX?=
 =?us-ascii?Q?leN3p5g8cEJSwmIFAsdBFn3ZtXwj62dDgHC3A6dwGx8raxufwKNSG8MZayYQ?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3ea8e6-076b-44b7-dc43-08dbfaf12d5b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 09:03:16.0859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwZJFrHNdvBUfTDD6niSpAMhJQqL1dtU6ntEgWLPMrEiF3/wPDPGAWHLDUtYEyqMVOYRTk9bbge8aRmXcu2y4jB576u6E0OyK8cMqGg8FxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5511
X-Proofpoint-ORIG-GUID: gONRTES3_lVQM99vyJkwBwGDntljnwpE
X-Proofpoint-GUID: 41vE2wYBq5MFk6MvF2Ca3Dgk47rp53mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=881 adultscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 09:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107331

From: Robert Yang <liezhi.yang@windriver.com>

Fixed do_configure error when build on aarch64 host:
error: cannot guess build type; you must specify one

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...onfig.guess-Support-build-on-aarch64.patch | 31 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-Support-build-on-aarch64.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-Support-build-on-aarch64.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-Support-build-on-aarch64.patch
new file mode 100644
index 0000000000..3086a70455
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-Support-build-on-aarch64.patch
@@ -0,0 +1,31 @@
+From 92fdbfdd6b55ff0b65edd9a283ac85ad349e325b Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 12 Dec 2023 07:27:52 +0000
+Subject: [PATCH] config.guess: Fix do_configure error builder aarch64
+
+Fixed configure error when build on aarch64 host:
+error: cannot guess build type; you must specify one
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ config.guess      |   2 +-
+ 1 files changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/thirdparty/uuid-1.6.2/config.guess b/thirdparty/uuid-1.6.2/config.guess
+index ca2a03c..a858bfd 100755
+--- a/thirdparty/uuid-1.6.2/config.guess
++++ b/thirdparty/uuid-1.6.2/config.guess
+@@ -835,7 +835,7 @@ EOF
+     i*86:Minix:*:*)
+ 	echo ${UNAME_MACHINE}-pc-minix
+ 	exit ;;
+-    arm*:Linux:*:*)
++    arm*:Linux:*:*|aarch64:Linux:*:*)
+ 	eval $set_cc_for_build
+ 	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
+ 	    | grep -q __ARM_EABI__
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 67a2d9fa5f..5059b63212 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;branch=master;protocol=ht
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
+            file://0001-config.guess-Support-build-on-aarch64.patch \
             "
 
 SRC_URI[curl.md5sum] = "d0bcc586873cfef08b4b9594e5395a33"
-- 
2.25.1


