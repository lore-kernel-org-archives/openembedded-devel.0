Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415C2C636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 04:02:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6424.1675915354242801309
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 20:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gLbwcedf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=140437523d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31942XGU013397
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Feb 2023 04:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=P6kta/MnUAnQ3dIWsmEv4lw2Dvdd2B9U33vWqUN9ktE=;
 b=gLbwcedffSEMRWS6VCoEOxFgIkMnE4/u01dky5HyxQrRNHekt2FOxu8i3UrH8jfcQZ+Q
 gsP+agezqDfMzw2XYXf+eaEGxfoZQRWekBw3Cg/uYPg05cXq34LH4uHaxAebb/PBaBm6
 L3BpPw6fu3n2h4IyMjVSSiJKLgt4qSbRNJjO9sU2b5pfTwEZ1gSJ9KnUHRsv9M9gBPiQ
 ojRxIejMnpemZFQy0gvKL6mti3phLx3th9k8jtBmhsuKjEVYAwvJ+z8VWh2umxguAl77
 Bqs8EyzmmIi7ORIlcvhBsqaQN0FSf3NRnySZ3sx6SqLFqbboTxurVs2w2J4otVMDZ5mF 8w== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck34x6h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 04:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zr/uwn04r0wvyTsVcMKkMDUQeknfO/bFMH/EEpNNoLYmA2hqJjzkpLAinf+QOXlGLLpR+Ep7K0atKQdk9VN5oIh3SCX/p8sekPtZZT7dClVkKgTBqY6KSwR/fJdqjoFTGARb3LF6xGKYEmDjg0Nz8CzCqDxVoqi5gIKPdtYc88fK/vxMH6/a+nBPDIrS+oBdec8PIZDpE6sWxD8e2m1PsgXdkhAc7Q2avOVMIpwWC3DIe+d4mnB6cdCCL+OhLup4+H7u8SUZYRPMgrdvvvhmly4Kz44iFMcQR7URPnycIbkM2TOkuU5guHcQjSPVV362da4eVm4CJ+nS/OY3786ZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6kta/MnUAnQ3dIWsmEv4lw2Dvdd2B9U33vWqUN9ktE=;
 b=Oiwcw4GTFKxITwU/RLJRtcn/BWdI+TfgFAhDLN+R9B6Hp9A11g0Bd68IbQscvezQ5hpO5kCVxMVFKwtAuZg80Mo+jOlC9xnIYwxk2CtsienUQolunU6JRkG8WpQ7GBLGWdDoS/tMK+375eW3DPAV8Qkck1oB7eylicOT6/LZO7JdH6j1mbhddTwxLjGY3tjN6sQ0RDhphgbqArIKhJgX/R5XkjFg3MopzLFL2tCIj8iqEkCKIRm2ZEoPINeTcB9EPwyq2A02f2734r+wCafrKuJSzekdHjVEW7hOMjOzvIfFa4B2Uvxc57uxsoE+vlBkZ0abNmsDlcL3iYaeEsvLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 04:02:32 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 04:02:32 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][meta-networking][PATCH 2/2] frr: Security fix for CVE-2022-42917
Date: Thu,  9 Feb 2023 12:02:21 +0800
Message-Id: <20230209040221.1682122-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209040221.1682122-1-yi.zhao@windriver.com>
References: <20230209040221.1682122-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: a73944fc-05d0-4ee0-7f54-08db0a5277ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G6tYKER4RmKVTDoNIAiAbMHFzEAZFrZ3oSOyC3MxBfyBTm1JQdOtH96gxHk2XtVrWBtApgPvVbSolcw6uGaDoLMVoE3A3U292oA/pqkJOlnIoLOsQQjHLlE7m7YX5mA6DgzP1uB8uGffZZW2GmDuKjsxGcHXFaf3LF9lHZb5bHYPebzfn2W+Uz++WpVQotAbL0eIuWtMmUHjLXFrTEe892etSuWlMH0pxyquul/9puy10Y9lBXOOJmFet7EvZE3C2nnvIqUhIuxCKar0HxnhGPydY+bFnaQfKEZ869JkHY6FGdMOKhfR8VT7G2A8ZCxmfH3adDscjPuN8E0SHb6ruUkSkFcZsUaQcQ0/fqo6BO8Fl9KQXpnVv8qnITq4gWDw1x2pIiJ1RIdVt7nFdF8V/9pSh2zDzjcry3LmifyBWKf72w+rIg6kJEqaRWfsltgd9PXagleKKypeGJcXXS4huvcmLLTLkc94FrhRAB+NIhkmO1WyKF8DSrO5HKHpenVShE9RxMYvGp9AMHRVoN0dFYHDeCy99IWtdAh8iQniT5naANx3xPdDKhIaCWw8FrtGN42+8XfJb17IE8oarUbN1ADKCLFObgQ3z26YRuIa/ct58+V3rhhzFyr3GyQSuwaG4JUIMaJjJpDoNuYW30ArNXGejjIqlGqwwj1AntXvlcEpXhyLdN6gJLA+KQelbpGl1p+pubDoxM8tmYqcOewDhoLc2D4jKsCfYaNH1tqNBlLoYCGGWhC0FCIIWWykZ0cSiCToG/iQIl9Ll3pxBPbGqA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(136003)(376002)(346002)(396003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(316002)(186003)(41300700001)(8936002)(5660300002)(66946007)(8676002)(66556008)(6916009)(66476007)(15650500001)(44832011)(2906002)(2616005)(83380400001)(478600001)(966005)(6486002)(52116002)(6666004)(6512007)(6506007)(1076003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VO0Cp+Rs2R4xbMS5lQ66fs9y/CYQdKNNbbv4GuzQiRw7Gh/nINXdTvgD4x17?=
 =?us-ascii?Q?mFDUDrOVzPnPYycKov6Nwo+kx6/I0LsPTjo5ZPABCnZgjd+HvAzz5PY99FvI?=
 =?us-ascii?Q?bNLoTjaaDXNc4f4yyg/PRtF8UlQwSFP1eDVaH90v5UoQV1U62l4YxpoLalmn?=
 =?us-ascii?Q?aQgps6md1eiNdA1/HnAWk/zr88uu0TBQ61BHcN1bUI6zITKgAKiM6r9Gyrvk?=
 =?us-ascii?Q?L2BurGMkvnMfGUtCatwtYFM8mzcuVAtEO2KuQlxurnG1H7AugZzCJNCDztwn?=
 =?us-ascii?Q?jkv767buPTEJeRBnVDSTFiGkAgOg7NGx4kXH7AYalvPXeCy1fdZoN7ipqmMo?=
 =?us-ascii?Q?NDnsQ+Uiln5VE7UvlQffb7rpjLOgFc/UGcfaaVkMIrdcV6e2jZyPnCLxfHYU?=
 =?us-ascii?Q?cqeAqZ1DHaxO162TcyCbh9EbIYE/6PUgDmNI7YnqU2t32v+g8qREBFWHBHoa?=
 =?us-ascii?Q?eKrFZzud1XcasNN5GfJE2yC7mtsDzYmZPPGxu501TaPvtyKYozZWzSPbmo+W?=
 =?us-ascii?Q?FKaGqXKaNstdJO6oazg/wWHzwB2bhEJ5CpsjwaFvsV9rLcJRg4DEvT6gNJZw?=
 =?us-ascii?Q?GTlg7UBjVYoGW3wGvDabVIl2/OhkAA+7PSkcHuxIpy167yuVRLQsoiIQRfDt?=
 =?us-ascii?Q?RIQKwlAxsxpzauQFuKTMBvnJ9cX2SI+/utW67FvYleGdInmzyjJkue/G7JsJ?=
 =?us-ascii?Q?wVJQ+BXfR+JoG87t9jhPFco1qz6PHv6U247Pdyqi+5C6QAJb/ntvyBQgBXI8?=
 =?us-ascii?Q?qDTP2msIvs8sS5bXPTAPZ+Rhun/54kIDdnebHCz9L5J681LNiJtkI5uT6v6Q?=
 =?us-ascii?Q?gUnABKD3P/z58xSw6o/+pPf8/ZL+PQHsTsp7d82n1ov3ZYpiJWXhaatbiNdl?=
 =?us-ascii?Q?esMXj3gstmyFrJp5lqV69Cd0Bw2di3i7yAwujzypRmQ8x5vEheJzrpuoFRmP?=
 =?us-ascii?Q?6rSMrsks9wS9yvVMVTRHNSIDdsf2F7xV6CRxwny2vw3m2MWWefi1wNQa4lLV?=
 =?us-ascii?Q?qPtDtG6N3uGqHBnOI0+knxG3sgmjStBK4NS0A/xD4TL5vCL8K+khSC3Zj33r?=
 =?us-ascii?Q?te2i2noPa5vbLsAuVHimMZbJfHAulHWI06UyfnZPdwbAl9ddSWNDK20Aw4Pd?=
 =?us-ascii?Q?YgtQLiga7URPtdyF6DYBTuXzmK5Vj3t1HBTKdtWGUlC9FIakVyWTJ1qL/26L?=
 =?us-ascii?Q?UChgHheYKW1AhWPRAe75P3j2cy8nO++3XvDDi7DVKw5E4Dm2haP18T21RGOb?=
 =?us-ascii?Q?ELB63CoxY4Wew8rHGMbi5fe+QpDY2oPsVeelXYZeCJgIc0T3n6zqk+yY5a/g?=
 =?us-ascii?Q?Z6V7LSTNwNCX3EHRqxcjuuFBaxatoTCxUsOowBEEg9GGnEBF/ZITW7hk+svU?=
 =?us-ascii?Q?8u90xNA0vtti5KILFvJcX6FCwjub0Fdd+JNEgqQVpdjK62cHld8i6xsX83h/?=
 =?us-ascii?Q?l+LPxFOJ9JCUHKkIcYh5btQHwzqYV7SdT98ARj2aWEEYx8FaBsFUKiy9ynMN?=
 =?us-ascii?Q?2yURpOoEfd44dy3L1Phu+CQ64lzPggzABRdSTORDjcMfdpeWI5Ma28AqqS1Y?=
 =?us-ascii?Q?r9eD5P1PWGvWX6ZhhGoYukqoW3890e2bGR+dm2bbSLzCMkOX5XZrT+pMMWGo?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73944fc-05d0-4ee0-7f54-08db0a5277ed
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 04:02:32.1206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHbOHfyrvSOj9M3x3SnIS3IxWQ6mpDBsQBGrIyNiVM6NcpSi/qwqpLxbvBAs706daq2fGHup+d+wkKHnLiFhpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
X-Proofpoint-ORIG-GUID: bPa5BFuPJWRZ7gHcJWNrcmorU6ibqpCm
X-Proofpoint-GUID: bPa5BFuPJWRZ7gHcJWNrcmorU6ibqpCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_01,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 04:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101005

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-42917
https://www.suse.com/de-de/security/cve/CVE-2022-42917.html
https://bugzilla.suse.com/show_bug.cgi?id=1204124

Patch from:
[1] https://github.com/FRRouting/frr/commit/5216a05b32390a64efeb598051411e1776042624
[2] https://github.com/FRRouting/frr/commit/6031b8a3224cde14fd1df6e60855310f97942ff9

Per [2], update frr.pam to eliminate the warning issued by pam:
vtysh[485]: pam_warn(frr:account): function=[pam_sm_acct_mgmt] flags=0
service=[frr] terminal=[<unknown>] user=[root] ruser=[<unknown>] rhost=[<unknown>]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../frr/frr/CVE-2022-42917.patch              | 36 +++++++++++++++++++
 .../recipes-protocols/frr/frr/frr.pam         |  3 +-
 .../recipes-protocols/frr/frr_8.2.2.bb        |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2022-42917.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2022-42917.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2022-42917.patch
new file mode 100644
index 000000000..73493bb12
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2022-42917.patch
@@ -0,0 +1,36 @@
+From 5216a05b32390a64efeb598051411e1776042624 Mon Sep 17 00:00:00 2001
+From: Marius Tomaschewski <mt@suse.com>
+Date: Fri, 11 Nov 2022 12:26:04 +0100
+Subject: [PATCH] tools: remove backslash from declare check regex
+
+The backslash in `grep -q '^declare \-a'` is not needed and
+causes `grep: warning: stray \ before -` warning in grep-3.8.
+
+Signed-off-by: Marius Tomaschewski <mt@suse.com>
+
+CVE: CVE-2022-42917
+
+Upstream-Status: Backport
+[https://github.com/FRRouting/frr/commit/5216a05b32390a64efeb598051411e1776042624]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ tools/frrcommon.sh.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/frrcommon.sh.in b/tools/frrcommon.sh.in
+index 61f1abb37..3c16c27c6 100755
+--- a/tools/frrcommon.sh.in
++++ b/tools/frrcommon.sh.in
+@@ -335,7 +335,7 @@ if [ -z "$FRR_PATHSPACE" ]; then
+ 	load_old_config "/etc/sysconfig/frr"
+ fi
+ 
+-if { declare -p watchfrr_options 2>/dev/null || true; } | grep -q '^declare \-a'; then
++if { declare -p watchfrr_options 2>/dev/null || true; } | grep -q '^declare -a'; then
+ 	log_warning_msg "watchfrr_options contains a bash array value." \
+ 		"The configured value is intentionally ignored since it is likely wrong." \
+ 		"Please remove or fix the setting."
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-protocols/frr/frr/frr.pam b/meta-networking/recipes-protocols/frr/frr/frr.pam
index 3541a975a..a9ec35dd6 100644
--- a/meta-networking/recipes-protocols/frr/frr/frr.pam
+++ b/meta-networking/recipes-protocols/frr/frr/frr.pam
@@ -1,10 +1,11 @@
 #
-# The PAM configuration file for the quagga `vtysh' service
+# The PAM configuration file for the frr `vtysh' service
 #
 
 # This allows root to change user infomation without being
 # prompted for a password
 auth		sufficient	pam_rootok.so
+account		sufficient	pam_rootok.so
 
 # The standard Unix authentication modules, used with
 # NIS (man nsswitch) as well as normal /etc/passwd and
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 658731567..80f4729e1 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
            file://CVE-2022-37035.patch \
            file://CVE-2022-37032.patch \
+           file://CVE-2022-42917.patch \
            file://frr.pam \
 	      "
 
-- 
2.25.1


