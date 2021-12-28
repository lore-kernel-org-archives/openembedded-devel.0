Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE5DC433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.35896.1640677108076482732
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rQEkEath;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7UHkp017574
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=agOLOdlGcgwMNfMY5CIrfjGxJIT5FnUAkomCnXalSvE=;
 b=rQEkEathKfoJeAkYBPIaHmO7g04FJr+crVoOF7TrtLuqCFP4tfOZHF6Kb4j1ZLaAmqDx
 fTYH3FReNji1/CVMgh4cydYy8jOd8ia2RYYjmqodQPOimC5ARNNjC4LQzVlFY84Mx9A0
 ZA2N3NsEWoEj7OwSVs4242RXWZQpQB+vePNMFxpwhzmda9GxrEK0Dwb9s+mNVzwBjGEc
 zOWYjyWs9EAMbF76ScZJ9WzT1bxfpwPFuYZ6OJiyumD9l8CT7T1FIC3YbzVDDcV3j0TU
 GdUc8vQtuc49oVh2JZwI+mM7K0yzl2bQvxLfkHTxd+iagfQnfg0JDt9hks53m4UZgfIe Mw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:27 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cQxT001224
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:27 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88mw-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRnAaxyBfcGDdkC0A0KZtlOdHXgkNL2ogHwzZbZhzOwbYIshSZfiFwAq4EXofKmZvZnKXBKC91JxkpIWLIdALjbydO/sK5kDHZv2mRkD8SXr8GvWhrFnS0Q0u1lw4GxFDy2KAr0d4JzGorYDUu076fCXKnD5/nkUnZvDlHmCafxpGLNOfzrq0NhPgO71dyzUaQwX/ZY2zq2RjFvcwOeAgncDOdWntat4aac+56vNSejBBjEMNrtrF+T4C+26cR40occi9IOLXNs1P2rRRSYKE4Jlfx5q95BeLV94apzkVacV3CAX2y/guuNa0CJvFYKhZ42VfNN34YtFTZ0MdB0P5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agOLOdlGcgwMNfMY5CIrfjGxJIT5FnUAkomCnXalSvE=;
 b=YgNoopGF78/LqOIMe+WfGtY5DhSW2m/xkMjmVXlOMdV42AfQSOFxPKv0SrFXrJ8JRhePc1XwiU8YmtrlVbTt2ESwI5MSqwznf64sNtblV+OtxYVn47KY5+omHYAPXU1zV95SoXbeVeYoOuuiwjmFNKBySB7MAzJjsZypF09Oh5q32qnwBSSHqa+UsgDZjJtK+Hb7GMn6+Lk6v1MVZm5R1t9y4L89CETUxh+O/4Vj8wZQ9hVCeCvQTb9YPdBm7CG81mYlHTZpLrlodXYXp/IyfnBMTShZaya9D1YmYUECeMvwsBmPC4SDCCLIW6O37pmyf4hILEx40vVO+mQektB0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Tue, 28 Dec
 2021 07:38:25 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 05/19] samba: disable check fcntl
 RW_HINTS when configure
Date: Tue, 28 Dec 2021 15:37:52 +0800
Message-Id: <20211228073806.868759-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bced361-e10c-494e-79dd-08d9c9d50828
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4539CAD78F8BF378D2604C98F9439@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LQdIluhloSaXuYlLKc9SV5dUJdFuR9qrcCWB8APr3CLWnMxjo/zooXuZCTopVJw59eV9xxoVqO5pqThSSjxYNquARsQKYcWuFSrf/WkDhGOIyekQw+K7b+2jDinvTqabmOTLy/JFm9VMdvqX6jbp5EpDzDf0RjOKyG1I1VA1PlrClSPzxKtllUN4Cxy8QHsUv5nGr9h0rNbB7WyCTcnus9PnpRBA9NeyuotGR2KlCLEkvOiZqHfpUNOdrI/SRnjJiP5UcJhleD82dES6NXhA8kP+c0Z5jLU/+evreFWkUhCyOvRV189riow/2rHXPuo8makW091fpaS6++vcEWxruImnyTPocyHTqD5l3BFa5TZujC1BKyJhxhumkheIWynEQvCfNAqLv9bNMK+vKBTQiwMUozfoAbMnz/UpMEHwPNTVcroxQ1Wb/6hhN6vIzO9Jv2hOGWLpKSY6O+SM/M+3H1pmqPyuN/mmUZ+wxdS9bDzTj/ytnqxhM20I9yh6lP+0Z2QgdNJcsaqQy/y9XtYkB+I5Cjcq3aNNvWeLthaavFDkN8Tz3yxFZMNn4jcKpHFLuZTew797HPoQ+aZBZcv3RC4jTuVc6i/BD9R0z4TEm823JWR9i2K7kTmUrSwW+vnqNq79UUHdxTkG02++/hbCs9LGLrIQx88diXFj8SLqd2V749GtT1PGA15JPy+W2mHbUl14CBUCDp5dB8mE4RfsiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(8936002)(86362001)(36756003)(6666004)(316002)(2616005)(508600001)(5660300002)(8676002)(6486002)(44832011)(6506007)(52116002)(66946007)(186003)(38100700002)(1076003)(26005)(38350700002)(6512007)(66476007)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P5lCCtkoqm75eDDTvN1vatSXdJRNZuewdHbjQW9dlkrfpjUGF1eyLjzImBr2?=
 =?us-ascii?Q?0LizXSmK0dSzanElT2tmP5xdVhHsJWT9Wl29B+KgzVXs7NP34/kfUo5aoRuY?=
 =?us-ascii?Q?lR8I8mIjBqkun7EhY3GRI/IaO+yPqkpT9YKaxGtX77R1CAqYeLkncosdP1tS?=
 =?us-ascii?Q?Y5RnDV9BU/xhkqchwoqDTO7coQyQTfJ55eZKqGNaXrRvRgF4mnf4wFRf3FGP?=
 =?us-ascii?Q?B6gfBqOw2aubfXmaC3AVePJGJl6et4ZHujA1mcbRlK04L2ZzmTXsuHvjj2Gy?=
 =?us-ascii?Q?1maRycoB7kCePRZpITciL2WzO72Fb/dDkM1eIyibolvL9RAkjTPT6t3RxtSW?=
 =?us-ascii?Q?2VHPJP5yaH0iSPOIewBYim+TOsCwyOdkxje7p7yEAOWm7O+8us1xSh3/I67F?=
 =?us-ascii?Q?LWSswo4ZgCO3Rmb650WYCuy9uHMDWBGyX/mWG8Vk0173QbLAZQROtLIDWO2Q?=
 =?us-ascii?Q?nfCB5ML2imShlaD9K5QkfDSoFfnmkUtT96BwxbmwE3b2anShs9AkVJaPAqfD?=
 =?us-ascii?Q?aFHMVNt1gcmp7MCto4/DYl6WNa3Pn2TMNdSysk5IipZnvq5oJb/nVL4mD9eQ?=
 =?us-ascii?Q?ImvqxW6Hi6Ida3Mukto8/Ciz/PXIsX4Xo5g75fqN3O7Dw+ttX+0GnMUqz6qI?=
 =?us-ascii?Q?OSaOa75BKKjIRKFAg+Uc94Mgjq3x4Yb8xrEZL+fnXuKxZJCh4a0mI7gyRz3+?=
 =?us-ascii?Q?wbhVG2anVJFYaB62vlEz8zZHUiZvpMCQU3FlIRn+g5oKzGX9fY73+2sTClVQ?=
 =?us-ascii?Q?4asFDusV5iB3lK9SwiE6Mj9fTW75eSDHneMUa0ssfapVB1DkcH8RdN1rej8o?=
 =?us-ascii?Q?H7wOPNTxTwqJrBXCp5shH6VILUyQg2ZulqgOL8FH/iAfzbhFZkHi8En7olgX?=
 =?us-ascii?Q?0t8zJK27bE52L1Cxv6J0MUbo/1FlMRFd4/vXCT6Rq8Qsizs58vrASq9mRP1h?=
 =?us-ascii?Q?sHeBo9Jv7Fv2XDZbLBFMWhHvPeTUWf8N5ypDUoIhclyd2sCG/YpDGC7XWxPK?=
 =?us-ascii?Q?IsPywsn9jffbnUtgQTD/X9XA3YRJAkWgLzYtExinPqsedgYSdTHcuh7blaXP?=
 =?us-ascii?Q?p6Kzl7JOt1Ocjc2KX4NuR9i6fW/etoarllleVZTZLjl08zqTnqVD58rBPN/i?=
 =?us-ascii?Q?ckGXWOLujHvO/DQaosOtKC60/nRAIwwKxJXovfQQWhyHHTougI02+h2SZQfR?=
 =?us-ascii?Q?210rhI0cxsTXr1+B9rC5d597GxV1Zns2Nj49KOaRp2HcGvAEi2SLmJJlh988?=
 =?us-ascii?Q?XB78hR92MIeSiVLBzYFSeEheIp7l0Ano2W3xRZ0Ma2el9h9+N+LvzQQ+vtWu?=
 =?us-ascii?Q?2d2/qEoHHgAaSjizz/vutMjL+VEEg3Zs4T9vW1WeDFG46kSVmCVXC5G6Lc8Q?=
 =?us-ascii?Q?Kjt9X723ftBfJEaRhTaUeYQxTpp0L3Eic0hsFwvKM4oHpOARUBZmo0XsWOpU?=
 =?us-ascii?Q?9zPCAcTATaUP/7lfMVFymo2ivTMG6YGKbnOh9VpE+PgVZjtSpAG8b6QofdKs?=
 =?us-ascii?Q?4FumunG5NewhW1ejLPpI6ov4g4WKCbbBgnB/JcH1DvxMOmD6qplXP7+8A6u0?=
 =?us-ascii?Q?yD2Ei0/tOXMpZMJjQww0PUMmnrj2iQL+aw5rSybpmBEt1OSFjzkE/vK7HleA?=
 =?us-ascii?Q?MX2jzikvlG+ozp/4VMWi+Mk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9bced361-e10c-494e-79dd-08d9c9d50828
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:25.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +RcQESUUvkFMROBInSRa+NXLarbhZnE6YsJFYuURO3gSTRFe5z+FoZZ2XRaSznSmIf5IXxN89HUDCcyB4exPYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-Proofpoint-ORIG-GUID: wq0C9OV-4Kc9EkmDU9IyKYNFBlFpFHBj
X-Proofpoint-GUID: ZqMsktm5jCRJMC66Awj7zchddlE7iRdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=976 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94532

This fails on cross-compilation for musl and clang.

Fixes configure error:
Checking whether fcntl supports setting/geting hints: UNKNOWN

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ... => 0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch} | 0
 meta-networking/recipes-connectivity/samba/samba_4.14.4.bb      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/samba/{source3-wscript-disable-check-fcntl-RW_HINTS.patch => 0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch} (100%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/source3-wscript-disable-check-fcntl-RW_HINTS.patch b/meta-networking/recipes-connectivity/samba/samba/0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/samba/samba/source3-wscript-disable-check-fcntl-RW_HINTS.patch
rename to meta-networking/recipes-connectivity/samba/samba/0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
index 0833a9146..9b56a6280 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0006-samba-defeat-iconv-test.patch \
            file://0007-wscript_configure_system_gnutls-disable-check-gnutls.patch \
            file://0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch \
+           file://0009-source3-wscript-disable-check-fcntl-RW_HINTS.patch \
            "
 
 SRC_URI_append_libc-musl = " \
@@ -31,7 +32,6 @@ SRC_URI_append_libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            file://cmocka-uintptr_t.patch \
            file://samba-fix-musl-lib-without-innetgr.patch \
-           file://source3-wscript-disable-check-fcntl-RW_HINTS.patch \
            "
 
 SRC_URI[md5sum] = "171629ad42b4b303107e8b0fff942a1f"
-- 
2.25.1


