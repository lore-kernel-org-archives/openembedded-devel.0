Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C59ACDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 07:16:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33376.1697181376834846708
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 00:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TAs0gLoQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8650b84d85=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39D5qoSQ007733
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 00:16:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=GtPn83JZM6f1aX5TfH
	JmFZ0PaK5eMc3pxlRdpEnucgI=; b=TAs0gLoQeeKN1UooiM9jUSc1cMd1gdves1
	10eiSqFfALEvdR75UR5OM6cUXzH6Ukk/8lv4b2NF5Nq+BQ+m/1zWYNX0xGOkTyas
	cpAyz9Xw6/ZydGac/NTuIp9EnCqjfB2upVtDR1tqZ6vS0iCGf0ZbqCzAZ2+KXcaU
	agb3S3b719p1vsVt+d6d3TYneGiIdQe6fudkdVCmKEHPPU/8Zba7absWKHWXDkfc
	h2kYntzeM7YRwqbCQmxsxeHcojwtcFDDhVqOlc1APfEN6QpNkx/bOtlYQLCXASIC
	P0C2+AkBYvs3m7Opl/H9V8JDE4qTZ3xdZzy+WigMzihrJlJAjHfA==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4t7rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 00:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgCrfRVyWSQ61gUGFy/307R3HZjY9C9q+fF6IkAweOIPeXs670f/qN4mBqzWBidlvg9N3tWtzJ6BdblPk/CfJuLRhlxVYdbEhY65DgNB2SHCS/TfBnFhrjOcywEQdRKHTZI9/L8sVP0fJrAOzIMKuPOECcWXLXwd50v+tgNUbaLH4lJlsbscXAHq5sYZ97wcF9gnv3s323QUgLVKR5xmLFuKtCZLImQiolp3q9CMVd1b1EFxARI922nRlyO1zYPdiWGHuviO1/V/VIZ4VHKYK9Wo/C+5Vk2QxKz6MHZWOD2RW46Hp6H/kMiIysVAmDdo8VZ2kHKZp/KnWV8ltcK0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtPn83JZM6f1aX5TfHJmFZ0PaK5eMc3pxlRdpEnucgI=;
 b=hPO7hS0LwB9Kmvy06pJ2r4/I2F8wApOWJJtJLWSobUDZh874JdON+BXdv36E3CDuIZ4ZnrZX3fYmwHiTMEzSCGfrq+tGpcs/K1QA6bkySaU5tuLrCCMiIGge1xH7aU5VgAb9h5oPCn64AHJ6vJk0tP5fLHl1A2mtz1wltJQsC22TYbCcGpl4XRdvyEGpAC9KV1GS+GRpASVhFvmV8CMCSKiQKcPMMGquVAhicyXh6rhrmIuELxD+qdFPOrjZZ95EXf8MJRD/Du9IuPqsU/nRbewI0Lq12oupWEgD+tJsrVxZ6kp/IQ64wmou67N9Nvd78I+xvYTLtXKODHmAyUT4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.44; Fri, 13 Oct 2023 07:16:13 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 07:16:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][mickledore][PATCH] mbedtls: upgrade 2.28.3 -> 2.28.5
Date: Fri, 13 Oct 2023 15:16:03 +0800
Message-Id: <20231013071603.4166368-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: a7543400-d23e-4291-0772-08dbcbbc487c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qfNer6/7s3DPAhLwjdKijsnjkx2L/POUhSms0L1HSldTT00owTRhMA3Bq0lxZsQI23X45R1JVfcTVOmhHXg9Fo/bzEapUW3WjNSzZ2ZtMjSm3tO0xqVEXUMzO49VRidAQewODzyf/fIIZv+V3Kk65dO2R9AOnqKW0j3n40t/tiEiuTaNsfbbMcX1RLsO+eeAITV6H4o8XX/VciF58/J1rbDKOzOFEvPxzZFhjuUmm/yRTNYuQH2OkHYGZOqIJNOAyiMrOd7fplFqtaW8lL3wRI+B+Ygha4gU3Gu6untk+zUPf+He82x4MGRbJv78oJayClkJjjATE84g7S/f7BP0bOiam04Z2bSIjunKxzjqR9TC2Fkqc0crz0S9s8umHE0/OG9qiWXg3aW+COBJEmpoDGWn9i2mxEFZ6K+RYedcxh3Z1ssL1n0xBVyb5WHtpF/QyOMu94NeDU4gah8cp67Y2uiUVHdqu+Vg/DlbfEiWi2nuNcMRpur6TOWYf4uL5n9I5/USkRHzgqV20Cp8AFCXzNfLlJAbVY7JTeX/aoh1kp1xkUtBYER1fAkJhwBpLyym109sKFDYyWIIiYvNYoaUaXJp2Bh0u6fMhpLLxwgHZio=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39850400004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(6512007)(6506007)(6666004)(26005)(36756003)(1076003)(966005)(478600001)(6486002)(2616005)(316002)(83380400001)(66946007)(66556008)(66476007)(6916009)(38350700002)(38100700002)(41300700001)(8936002)(8676002)(44832011)(5660300002)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pmryx5dK2vXJ4Xra2D52usSGMHzfj98QlA0YrMImnY8BQqEEAloof44YVV27?=
 =?us-ascii?Q?aEhCKq8FO0w3nQ6GcVCgCGMd58OmHVQEoefnymaVMAZqG+0yDod8Lc52Nk4G?=
 =?us-ascii?Q?qM7m+VYpxuAFatBL8zsv6go4jzEQIwHf2XzJ4xOqawVwCJbWilnbTr7C1fYE?=
 =?us-ascii?Q?6qKf7gTRdCh6oxedtNSK8ZRqQSRCdA+jvidu3/MbQPH471QNCXsMqyLnT3uR?=
 =?us-ascii?Q?EppayZ4AbbiOfJH9jlOp0RFjcS0AEKOdPrZUcgsa7wp25BuMX0l3UrwRz/C8?=
 =?us-ascii?Q?4LDeqI2gaZ3ypZnhqFklVoDx5PoIG2EYeEXgjcQWO52gmYmOak9qc+XDrUhc?=
 =?us-ascii?Q?VvXZTUguaKmb1j/WzWMjZQScGrioVddf+euW7GxE6WLgSCTSlYE2KLw4d0ye?=
 =?us-ascii?Q?q3yt9Hsr6xghvYnxpzBQOjGpm8cRiE4ccJheVt7xq+pTEI59Rw06nN/OcpUn?=
 =?us-ascii?Q?hobev1QI7QGuYWCnX+t6MYCBR/SXV9Cjl4tdNzS32HsJh3aq/eMSGRnLUPVx?=
 =?us-ascii?Q?1CEbzhsOcUJ690jVPBo5rcq3J8eE+3ejGKSJ36qswZWsRx1lYEwDQUgeXNWA?=
 =?us-ascii?Q?xasrYGcbp1vS3jklZxL1rmnKVXntWDMASIKfCNyoKmHjTmW9R7HVGU9X04jd?=
 =?us-ascii?Q?PkH8hdd4ljhllatGPBqJh0bShmBvYaIbLcQMU1NkVSy2d4USQBizA24zECzH?=
 =?us-ascii?Q?TQeIaU7C/s19VG/UgraDz6NJSxZ0w4SJ2zZRh5QtfMXGw+HgoAn05F9PaNrP?=
 =?us-ascii?Q?335Ie5RltprRruaAcW6l54Lab5mbA1oEczeVGH5tNRFtR94hIf/f2+HoCftb?=
 =?us-ascii?Q?U3eCWl8ZGNCBJbtPfp1zP1S7kuE+woPNFKnAf5DKKwglImKDXq/WhavAC4qK?=
 =?us-ascii?Q?hyR++HKSbsN70vTWzySWp3UWRMeKLsJdF6iVJN3BSseL4m9uBF35Tche0TVN?=
 =?us-ascii?Q?YDJ9UI0llBI/KWauGm8KoP6bFypvjrjvR79mn6Ly69myYDpqCbJJijQxHLJN?=
 =?us-ascii?Q?OIMZ6yiKCTmkrU+V1Z1x7P1IfuItx1Eo9uL41dI862IUCS1WV4wNchqoNod7?=
 =?us-ascii?Q?aPHqXCzhL7pHr9klw/gOd4Vdu+sCmjyaRxXIVaJBc7K1p3bIJdBWdFFwRSWM?=
 =?us-ascii?Q?IlcS5GIR/8ggDswMnyzVzW4xRefi9WWGyk+8ll3ZMtwQBDkNk/tmavyXwHF5?=
 =?us-ascii?Q?5d/zH5V5LbmQDHFKUa1I7ECoXmeVmls92RRwvhipXH7M0EkOyCIDXh7YAbaF?=
 =?us-ascii?Q?jc+QAsj7/rAiPhkm+qeIqovWix0iUOyTvG7F3EJGXwL+EtwbjR+sfwTsMdBn?=
 =?us-ascii?Q?fi0l1Hzp0jXuDi5xORLwBOb2XRRXsqhRdu0mW2MsAT6QSnvujrK8bZ5TZmxA?=
 =?us-ascii?Q?NrNHYtF55h7ClKC8XKKaLciUfeFSVLY33TbeibTyAx62KuT+Y+b7KXBc1GbT?=
 =?us-ascii?Q?bNB/aM3cpgfXlbH155E9tfHHVouyOom3qKuuTRLxnSDy8Lnzte8aZAuxxJXw?=
 =?us-ascii?Q?w9DbZorMF3iLFOK7ggf9tehR6jMlrE3lZDo6n41UU8CzYENsOfqrtzEe/lnM?=
 =?us-ascii?Q?G0AM31u+C1EotTtVT4fK4PHqvcWE9Qg5/B5XRNRi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7543400-d23e-4291-0772-08dbcbbc487c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 07:16:13.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipJNaBFA/CGdh0MTNoxzum3n4afxBr6neeiBG7VVpBMIM4TqX0I5cqvHmLCYNCCL0IqAzsu5NDceT6algMmxog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
X-Proofpoint-GUID: _duYpfKkkkZMpnpAeOMqMHaYwmCtdrYf
X-Proofpoint-ORIG-GUID: _duYpfKkkkZMpnpAeOMqMHaYwmCtdrYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_03,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310130059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 07:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105462

This release includes security fix for CVE-2023-43615.

Changelog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.3.bb => mbedtls_2.28.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.3.bb => mbedtls_2.28.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
index ce094d5af..a1c283d9e 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.3.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "981743de6fcdbe672e482b6fd724d31d0a0d2476"
+SRCREV = "47e8cc9db2e469d902b0e3093ae9e482c3d87188"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
            file://run-ptest \
           "
-- 
2.25.1


