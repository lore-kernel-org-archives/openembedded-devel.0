Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D912C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 01:40:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1639.1642124400211894787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=NFH/G3sG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80133a60ff=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E1YZdD007942
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:40:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=i0skX/kqcLRCa/hhZMx4qqYgYAHUwY38RWA1EOk2HcI=;
 b=NFH/G3sGDcAhUSV7tk4tInJW7pVAGKvBN8caTOSX/pqZyWrhS+NzQaSn3K6Io62t3B+3
 FyJ6JaFu4CZPOiMP3Ikwnf02wuFd50q1IK53yvgceH8nPJ75Yq2HiROVq4G2Fx0ygpQx
 aOiZoK7k9LcOSTO1nqsce6eUvkiPaQi07W2Bq7SOYYZuFZ7wai7p6XyMkcUsRktQC5lE
 XMKt7YUIuO9luXZm7xibrfdILb/RtVs2QHr+bWfAIuATZc/42/WXZbkSr96LBDmTB2ut
 pWU+cRMknC6IAKKpG2jzwjRjBh7iJVuwxTq0H2b4h91uHrC8wqhDCb72xDdBDoxP4mX6 eQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhyvth919-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpxb5dc9Z4gVoJBqt/83tvyBt/Lb7/esJ+Vuc6dp8XPQZqQZjHGv6tEpc9z2/dbjAE2s6gP4aVq6sYl5tFBeAuoMN8cbfA7GdhmcYh+4r3q7ZYGZ4ArP7KMnwrdgAg8C6fwleYjFztDGe9V51LIm9+TghZO2A3Zvn8Mgc6pWt3efkpZJT+zWkrrSHMRg5qZRFLR1Mp7J/fXfNEMms+ceLPy0N0dW9wfKQcvrAYUY1T+AQqsTwxa9LkigQRRkVYMgeFmtxoQ6mhnoNU4i9YBDedi4ZjOFwoKi3/+F9hGH5Ia1MdKP9l5+sQcrKLiwHRby6ZXK+X4by/KcxDJ05aPsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0skX/kqcLRCa/hhZMx4qqYgYAHUwY38RWA1EOk2HcI=;
 b=e355uuiPiqIxOzjIbJglM2lhTV4Ny8N5se82M5TfrcAYv6956rC2oi2BeJP33UPDWWK9DPOJGil/mNX9gF+b9+erjLWt3Hu+XRRFlANKnE/kXzOAWMFP4861VEuv2+c9OjKwXZqszNYsdeVwB1EKjIaHcs2DDfUAXsCK7pEl+5JoZ3aXE2F8V0hZlpE53bscAPplP1O8vqgFpeZW6GCdtMAYLNnOGqHpEh21w18QKXOI3MQ+QG1RnaAJ2YjI2nADDZh4pI+vYOM3DSro+tltadMoUA9E2XqyKQRausEFJoAImQlLCj0odAbfBSO6QM4Xj05Ux696q29EmlV4vgexYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 01:39:57 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459%5]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 01:39:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 6/6] iscsi-initiator-utils: upgrade 2.1.4. ->
 2.1.5
Date: Fri, 14 Jan 2022 09:39:41 +0800
Message-Id: <20220114013941.229837-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114013941.229837-1-yi.zhao@windriver.com>
References: <20220114013941.229837-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To SJ0PR11MB4878.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f87fc525-92b6-4e6f-19e0-08d9d6fec5b6
X-MS-TrafficTypeDiagnostic: MW3PR11MB4746:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4746CF5F5CB383C80A9F101FF9549@MW3PR11MB4746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ERVqXvINt/urhkYFCF0AY/HgXxgiawCBYY9YKtGASSuro7Ioh5TfGfGQfsSKU3j+qv5chTEoaGPmGpUyvA7FXMkb2bhHcpGuj7Mqze8RTCvT8gu8DRDR0HZdfau+7l3XVgWKyG65mBr7693DW6MlM0d0Vozvahbv6lSeW9JAd3c5mR+pdGPZsu9Y5OhY8gHoaecINmQ0qxmHXWObKJRb9o/ICEOsmfmS2mSokkP6nR/gB/OfA43650ciS3jRkPiAA9Hat9EGljyrl/OJbZ+zgy12ZZ7Q/DCcBCwXg+AKHWzAnckT5F/rIyfJT87XhrJFnT2O+qq4XUMCvhDEYnAL8Uk471vztMD8DvgNbOvyWH3JzV1+ZcMWYiFhIDvRRSWT5YvwXFDOxs7A02gKKBj0HYzWq/37B2d1ixLDeborzHok5o6l2KYUNUax/oPRvHkcbjfjDVw5qZpULm7w8n9RP+HE+nbz87dGVsdDma+W6FTkikXVEqaKAuXkh0e9tvxRPpAJG6CUcLlpEJIQzB9yWLhGBcO+Bk8WPhxpb4yrcNPACTyHG7ysjWPmZ7Iq/SzxH0eDvMGhMapQnGbMUoAddc14wq8dBaQvDmB9jNUpAaYgMKdqwcdQOub3DosQpCpoCZLaOvEXC2K8rLm5HWb0v+NIJls2AhpkPPHJ8xXOjdIRcfvz0AnSBUj9wR53okPfFrdwZLhs3ROE1aKJ/jdDj2FYU9XvNV80qGbHM/2p+1bDIuFtwctqUiDXLufTidyoX/4uPgTFjSePbJQ9mQhR5gUtD4ImKtyg8e6VxCaKjCU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6916009)(6506007)(186003)(5660300002)(26005)(86362001)(316002)(8676002)(52116002)(1076003)(36756003)(6512007)(38350700002)(6666004)(44832011)(2616005)(66556008)(2906002)(508600001)(8936002)(6486002)(66476007)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWN2UWVwNHBGVlFxRVhUZWYzeStvOGpjNGdJS3kxcExrMmV4VWJlN2F1Z1pI?=
 =?utf-8?B?U09iZ2k5S0VEU1dsdkJRcmRKajB1bXFsSGc3THhFVmVIWnFHcEY3UWZQd0Ft?=
 =?utf-8?B?N2c1SU5aSFhVV29BZHcyYTMza29EbVNsVDMzZE5FWHJSUWdkM3gxbnJpTXpH?=
 =?utf-8?B?WkpMUGFVQVJmcFhxSlNOZzRqdHFqZjhsTTJETEZVMWpaQ0RuR050UFJwWHBq?=
 =?utf-8?B?Q0FXNWQ1SmhUMUJPNURScVRJUVRVeTk0aGZGZzVacTRFU0pCZ3RyYVA0QUsv?=
 =?utf-8?B?YkprYmRjZVJuckhOZnJsRGRsM0djZVNoakR3WFp5ejVHRm5lSUVsTW43VXh3?=
 =?utf-8?B?c0JvcGtKbjBKUkpzVEc5MkljOWg1N1FHR0Z6L1NDQVVPOGNlelV3d0psaFJ3?=
 =?utf-8?B?bk16Q3dmR2ZlSDN2MDRyenA2dEdpQUUyYzRrTWJlSWowNnYyVWdIZ2gxSkNm?=
 =?utf-8?B?UnlZa0lWQWxoNVB0UXd6WWRrNUdpR3M0UjFQb25qbjZzeVQ4V2diZU1VM28v?=
 =?utf-8?B?TllaT3duSzYwYVQwalVaQzF6cGVuMzd0WW5MTElwdG1HNkgxdlJYMXlpakEw?=
 =?utf-8?B?UmRQTlRPb0sxakU1eVkzSVk1NHlNVUw1WmhkajFuNEdvcDRuVnhiWkJaTU4v?=
 =?utf-8?B?MHRwamlJM1JHUHlBYUhwVEoySHRUbU1yL0s0YzFzK0ZRSm5LNEMwWmxYQ3VV?=
 =?utf-8?B?bWVvcnNSYWcwSThRSWZaN1Bjenp6bk9YcVljZmtEcUo4SnNacHUzc0FoL3Rr?=
 =?utf-8?B?SXlBUGRKQ21jWndTd0o3Y1d4dTM2WGZHMlg0VUdibSthYmhIMlMyd1M3REJV?=
 =?utf-8?B?Q24zbEYxVkM5Z3U0aHJDNEIzN1FnSnE2UEE2dUJ3TmpNS1NCdjl0Z3R1a05H?=
 =?utf-8?B?TUlHWU1WTklKcjQ3V3lVcHhtV3ZscGlUUzRKd3diYkdMUWNqVVhTc2hIYUFk?=
 =?utf-8?B?SzFmS21hNVBZRVMvVDlkcmF3UnA0Y1Yyb25CbTNieU9qNzRhTkc4TjNFdmdN?=
 =?utf-8?B?ak9rcmFSUS9YUXFtcmFDN1hVVStyNElwWkRQRjVVTzRXRklWQVBicEVLdXcr?=
 =?utf-8?B?Zk91cHFtZ2NiY0p6dmdXdlhuejBQRXNQQ0hLaVRYUmlQQkQzVkZWblA3a0F3?=
 =?utf-8?B?UzdYM1pid3hVR3Bib0MwSktUSWVEZTVpd1ptY0dPUGdIdDQrZzVIckl4c1dI?=
 =?utf-8?B?ZHNsN2lnSUxFaGZzR1UwMlJUNllUd20vY1JnVjNzTzQyRE94WDBaUkdhV3Np?=
 =?utf-8?B?K3hWcnFERnBMcytrMHJxZTE4dW9MNkpIV3pBL3RROVZ6VXhWaDM2d1pPWjVL?=
 =?utf-8?B?NE4vZEVEaTFWVXNvTWtFOFBYc1RSNVNxQWliZWF0N1QxZTVJazNWekZyQitZ?=
 =?utf-8?B?QVQ0Z1F6cnhyS1VJUzNoVEtEQ0d6eHdKc2lRaEhOZ1BmYmtjcEhxZm4wWmEv?=
 =?utf-8?B?SHRqdGJJOEUyTElyU04vOWU2YXE0OG92UjE4L2ZkdGc3VlZEMUZ2cGRsOW9H?=
 =?utf-8?B?TGI5VjRSWlFHZjUyRk5WK3dFSHA5ck9NMWQrYnhDTXFKbHpTMDJUMGR0ejV1?=
 =?utf-8?B?eTl6eHJyTC9YVGU0NVNVRTNLWHk4SVgrQ25GWU9QT09ZRmx2eFpUTm1LeDRl?=
 =?utf-8?B?c1A3QTVNOVN6NzgrY0FmTVozeHRvdW54em1ZdVp5V1p3MXE0c0hlaExQMnFT?=
 =?utf-8?B?MlpPRWVpT3pMeDhJZ1ZaeDhFdmVhVjZ4bHpLU2RaeWExRldLMW8rc0JHMGRG?=
 =?utf-8?B?LzMzc2RwWVdxMXA0N1Mrd20yOGtTaG9wVU0veDZ4MVpTd0REU3lYTnZ5eCtG?=
 =?utf-8?B?cXN6T0F4dU92aVozUURXSUlFUS9Ibk0rd1ZMMFM1bVlUdmZVWU1XWjZ3SnN0?=
 =?utf-8?B?VnNJUmxQR0pKcE0rNWFJRDBvSkUyVGN2eHhmME1uaVhKb3UxRHpSTExjYk90?=
 =?utf-8?B?WFppbTNRQlZsQzc0UUozVlRhc01ZVWFJMkdIa25MV2ZuWkIxU2FUZFZKa2pz?=
 =?utf-8?B?MWhqMWtDb0lkYVNSYi93d3IxY1NzR0JDcEptcjQ4RXZwZHE5UlQyRVNMTFU3?=
 =?utf-8?B?NUZjVkdFY3RuZ2NHaXc3bktGZWFJZ1RHNWZqKy9XVW05ZWFsZUhTMGt1USs2?=
 =?utf-8?B?STMxVUNESDRhYlhiYUc2a09xQ3Q1UVZZcDRoRVcxY3oyVk9tWEE0TTQ1SFRB?=
 =?utf-8?Q?2xaOQhXjhNjqfS7l7RONvYU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f87fc525-92b6-4e6f-19e0-08d9d6fec5b6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 01:39:57.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qloqQm+SJGmXYPUFoLhDHLBT43R8DBGPn84UggRMzFUjsal3NIaQ5W9oJjGcgBEmgGC8xtBEBoC3kz2Z8T7eIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
X-Proofpoint-ORIG-GUID: m8qZ5d5CpoLKDZpxi4NrpAqzh9Q0vXmI
X-Proofpoint-GUID: m8qZ5d5CpoLKDZpxi4NrpAqzh9Q0vXmI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_10,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201140007
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20E1YZdD007942
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 01:40:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94820

Backport a patch to fix the build error.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...or-introduced-with-recent-IPv6-commi.patch | 43 +++++++++++++++++++
 ....1.4.bb =3D> iscsi-initiator-utils_2.1.5.bb} |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils=
/files/0001-Fix-compiler-error-introduced-with-recent-IPv6-commi.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-init=
iator-utils_2.1.4.bb =3D> iscsi-initiator-utils_2.1.5.bb} (96%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/=
0001-Fix-compiler-error-introduced-with-recent-IPv6-commi.patch b/meta-ne=
tworking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-compiler-er=
ror-introduced-with-recent-IPv6-commi.patch
new file mode 100644
index 000000000..ba0ca4ca0
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fi=
x-compiler-error-introduced-with-recent-IPv6-commi.patch
@@ -0,0 +1,43 @@
+From 424d5967e94f6adf4c0669d390779af8da0bef20 Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Sat, 18 Sep 2021 16:10:50 -0700
+Subject: [PATCH] Fix compiler error introduced with recent IPv6 commit.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 76350316de38 ("Handle IPv6 interfaces correctly.") added
+a string copy that creates this gcc-11 error message:
+
+> gcc-11 -O2 -g -Wall -Werror -Wextra -fvisibility=3Dhidden -fPIC -I/usr=
/include/kmod    -c -o idbm.o idbm.c
+> idbm.c: In function =E2=80=98_idbm_node_rec_link=E2=80=99:
+> idbm.c:999:17: error: =E2=80=98strncpy=E2=80=99 specified bound 65 equ=
als destination size [-Werror=3Dstringop-truncation]
+>   999 |                 strncpy((*node).iface.name, iface_name, ISCSI_=
MAX_IFACE_LEN);
+>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
+
+So copy one less character, maximum.
+
+Upstream-Status: Backport
+[https://github.com/open-iscsi/open-iscsi/commit/424d5967e94f6adf4c0669d=
390779af8da0bef20]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libopeniscsiusr/idbm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libopeniscsiusr/idbm.c b/libopeniscsiusr/idbm.c
+index b2524ed..6f57e45 100644
+--- a/libopeniscsiusr/idbm.c
++++ b/libopeniscsiusr/idbm.c
+@@ -996,7 +996,7 @@ static void _idbm_node_rec_link(struct iscsi_node *n=
ode, struct idbm_rec *recs,
+=20
+ 	/* use the interface name passed in, if any */
+ 	if (iface_name)
+-		strncpy((*node).iface.name, iface_name, ISCSI_MAX_IFACE_LEN);
++		strncpy((*node).iface.name, iface_name, ISCSI_MAX_IFACE_LEN-1);
+=20
+ 	/*
+ 	 * Note: because we do not add the iface.iscsi_ifacename to
+--=20
+2.25.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-=
initiator-utils_2.1.4.bb b/meta-networking/recipes-daemons/iscsi-initiato=
r-utils/iscsi-initiator-utils_2.1.5.bb
similarity index 96%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-i=
nitiator-utils_2.1.4.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-ini=
tiator-utils_2.1.5.bb
index 034e6ee9d..26b5b5c34 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiat=
or-utils_2.1.4.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiat=
or-utils_2.1.5.bb
@@ -12,10 +12,11 @@ DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'systemd', 'systemd', '', d)
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-SRCREV ?=3D "095f59ca464220eae285de6b5f2ee31185a6a84c"
+SRCREV ?=3D "20d0aa96f2170339b1967f4be81e9c5042bbce03"
=20
 SRC_URI =3D "git://github.com/open-iscsi/open-iscsi;branch=3Dmaster;prot=
ocol=3Dhttps \
            file://0001-Makefile-Do-not-set-Werror.patch \
+           file://0001-Fix-compiler-error-introduced-with-recent-IPv6-co=
mmi.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
            file://iscsi-initiator \
--=20
2.25.1


