Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BFFC3526F
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3248.1649310417770601949
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 22:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ewhA+cKp;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1096d98c70=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2375bd7d013329
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Apr 2022 05:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Zxlsb3CJNMghs842FsBFhy1SkFfvrIweJx73M7tYU0k=;
 b=ewhA+cKptbQX9EmzKGmpk8qI6sbirmxNLKwosow35ffv/ONbD11DpQH7NtRE5SMQ7OnI
 tpBqhgWcXsmY3G0FkNwuVx32jcfAypbQcZDKhqiP7jcGBCYWwjKv4WiNHMMQpyJT9QQL
 RM68h8SCpYmvL163ZV/b8E1umbhycfZ8MlLKjkZuk06e87i1QcTamHM6/1/oEFSjeWxN
 uTb1psCH6oeciWus16JR3JpmQqRRCFHL6CfNIBQLYEilRdHmrHcGmUooLraAmX2XcfwJ
 +2OM0ruHYdAsMKkmsQeK8CKNkGMcrbuLMBSS4aVaGxfibX7VB396qUXvNdkIF7ZhSouY TQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6df8uyt0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 05:46:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAb+81WbltwSF0wEaMNTLHxpGTQItAshNu4eXteBrTy90DYN9EqWNJK3wa6nd/vfYV15GQ0ypGTcXjKZa+iXQ1/NLRW8HTyjElpAxuBbPEahh/sElUX5OreqGw862mEGGg8/Ps2gEkyxmjHfBBOE9re2pqIf2FTew5CkHIquVbef8Jl1HLOsEwVLrUfeb58qa1SWCE8zL/MVPMHrRQfCr8YivSJ+FER3YXEx//eryHJTkr9CtWRSVsUpnWRRWVoyPDjW3Ch9NR2HXRXu8FrJSDOSUXVcnDwZ1J8OSB9/ShkWbgHBvq54y9ZCcL2VMG980C4l+pm/ujAXJlgJfPOCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zxlsb3CJNMghs842FsBFhy1SkFfvrIweJx73M7tYU0k=;
 b=GPf3R6j/HtVbWASBduH2z322mqf/DWdzO2yAyFwMea7UaiM1RPIyQNNsOQ0QPvmDaptQFm+VkRnIBYWzz3kAImF5aKtUP5w63cxHxPDOiW5Xspgp0VAOOGGn81JCv0+YC5tAj3xWn8CvI5qPqlYfV3s2IgY/ktxecBiwmb9lDKUfv403AngRTPUqeGdg/57Vt5KzeVdJ0libvVq8QzOfgu/uRCitgsuMAxDHKgx7MWzf7EB51rwEtJPbIjq7XQghTtz9JrneYFjADuLp0bXOLyJ3hLG5bCsZjjlLrmqu+AkFt4C4zbvGdvjuIBUUYrTXq++lFZVpGYzkKQrdGrJRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 05:46:53 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875%9]) with mapi id 15.20.5144.021; Thu, 7 Apr 2022
 05:46:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.14.12 -> 4.14.13
Date: Thu,  7 Apr 2022 13:46:40 +0800
Message-Id: <20220407054640.879122-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407054640.879122-1-yi.zhao@windriver.com>
References: <20220407054640.879122-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::34) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b457f533-e377-47ae-d241-08da185a04b0
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5816:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB58162E3B156E07BDF79D3BEEF9E69@SJ0PR11MB5816.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PmkCkZcmrsSgaJ0fX4b+xXcQMFcjlTzvTTpy2OZt1EgeBWDltJXMlNzGBDnQt6JP1ahg7D/ggA6D+JkQGBOCck1rT7Vk3gviFVRlTjMiLTV9ZYrHtJDTZrPF6IGL5kLuN+MApo8JKQpqmeNvY1aOhqrAPk4yUWlI689tdqp55gqFwzdBQ2/Asc70rFW0gfipg3SmD6v/DxE0OagKX4RtZspkQTwiGPzmkssGZ8Wn46uYMwtBHwlGjBc5h1XrqmuIBs2UTDQUFqPH5U1aG35OsSDt0h/iuW1J2fWiNyeZMgo1JqeQ0l7bwAMLWv7FFebJ7hG0ECd0ZQzXu48dm6oZyl5YW8LU/MclJjDIqown2ng0NGFlmA31QEx9++qZ9/TeYteKKUlB30O+DHhgbNve3T7QQKE/S6SDmu9B1eVNjKAJCXqwJHR5685+THCNPtxTm62ns7DHaHexPmPbLd6xXEcEkWv73J1Pcuqoh8z1btyqasAE1JH9vil8Njbwri8uSzfeCDPAcdzo/o6pFdigfgvRjQEcHsBhxFsb9nl3BVOz39IXp5HnM51oi5/GfudcpFDzC1RBBS277hhPZgiLWRahgudPFrnKU7pDv0S0nuBLhhd4Vm/POOLC286Y+QEHR1y42bpIosZL5ksG4Zlj/RMIm4cyPu85QeBLS20zpTzehIlF7U/lV9s9hwFgCSKg+pRI8qr3CbNfyreOLiQZcpBmj1te1zfUNqcC8HoCA7gwpaoBgEzeoD+J51yU9bzSGklzDNZyOu9YIUMLBGreGc6dGmHix1YfkDwpSWQIkpo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(316002)(86362001)(2616005)(52116002)(966005)(6486002)(6666004)(508600001)(30864003)(6916009)(2906002)(38100700002)(6512007)(38350700002)(36756003)(66556008)(83380400001)(186003)(8676002)(8936002)(1076003)(66476007)(26005)(5660300002)(66946007)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uLa6YUD2rQB2dG+jHZN8q+0FqdVvFjRSKSXdpRn1eLvqVM9S/AqCKbIFybla?=
 =?us-ascii?Q?GHUULGMjYzQGiyiBN0N9iigX77hcKuqMGP+3R2BqzXDh6KPOal15vjX0sqXo?=
 =?us-ascii?Q?SCYJMyHY3PbVziY0mYiG0nsau8cIWnDpjDxnTPbuVtQzOKQDm07rShJeBYkP?=
 =?us-ascii?Q?4Omf91Jo5yv2f7JcYzqIpCXXoa1KsXCw1HFIfzxW+j4LGM22abSwyKCaCUiK?=
 =?us-ascii?Q?AWMySUUjG0lEU299H9JazAw0djZzI0m/+hVuK0Zzn9o/GxtRNJ/xIQOoNtC+?=
 =?us-ascii?Q?AN/oJ0xd1Xan1odCGbzWuGfjl2mHRC6Gqo8yVsM2eQI+JPHr719JY69vqHu2?=
 =?us-ascii?Q?9iPv4HNaAJMTwTg+j7pSBVKGr/Y4gcxykwNm0VNge97M8StWyjNMn8k6jCpJ?=
 =?us-ascii?Q?C6DtuOXkTDzO+62JZNtMi7oCpaq4ynidKUm7xt1kV8HJ9FunbY5IkbvQVbyy?=
 =?us-ascii?Q?5NuH3CiVQXlCs0IKeO/Am0pXTbpL4Jo2rZQ/+H+Jrpn6JDAgTw3XIc3MZrT+?=
 =?us-ascii?Q?XpxGYK+HBlxSEB4frh4DtCedpq8GINB19kOkxe+LzPTS8zAdLVQ7iTkm0rzk?=
 =?us-ascii?Q?BFHfdKauV9BBznFP7T7br315isSaBH005lkh591kijZD0yu1eHA6OFO7/mgl?=
 =?us-ascii?Q?ufO37VnCAkdpsFmhhpUQm9qukXU9j88kTJ9cqYziKhCL5F6gs4agnPlJCsFx?=
 =?us-ascii?Q?xsr1a4UKsvKbYzLQ0S53Ia8pvn6zzXPmb0DbpigqnXr9M3er9wKWw+3NZk3b?=
 =?us-ascii?Q?rhqkqtg3VLLBO+v3eV9b5/L7PiMo1/xAl6WTftiRJRIpcsSiV2x8jC7aJo7A?=
 =?us-ascii?Q?qZS3lXJNqjdL5NMzIWjTPeS86MQ3yf9s8i9ZyaxX0k+8Lpq/nhjPnzkaT372?=
 =?us-ascii?Q?g3ti3KpEgvvvYkMEpxE4tPEKn2wpHBVdtIOirJrWtiYJIUNz5ILOcYfsdkRR?=
 =?us-ascii?Q?/aGJbqYFHzbRfWPTvwdc1k65hOU4VEac6eKWCJengyUSQn2rcOg/c2MkyUyt?=
 =?us-ascii?Q?DPrgS/N6Z607Eki9oSuKsLeWTy5M4yB+yrJnSku3NF5Wzo+5spF97KjNoKHy?=
 =?us-ascii?Q?ojnHI+EGIBjqfVQX21Y9PFCDGqslOfY9R7hxNlOT0G+J96AMbm9mGJltyoVQ?=
 =?us-ascii?Q?ttnQNLyKO7fvp14eZL8+hDlBGmCfh0Qlic4GcqMf1WV+4ZlScBL+hynMoauG?=
 =?us-ascii?Q?4ASmk6CRvveZiZLsFOVgS9/zXyfhUp0d28guzAC/vsZDwBDnjEoVHXo9gTVM?=
 =?us-ascii?Q?JyM4CDLzHR44SKXiiw1WgqXxzHoEf91DYj0S+odcqhSEtxPkJEoun7Hpa9S0?=
 =?us-ascii?Q?V8F1uWuSiF0PsvsOeHf/7oCItuKE5unvylB4lw4Gcl23/HA4GR35slPcIhof?=
 =?us-ascii?Q?fmHBj3FmrDrQkulF8tRJ+4oZCC24h92jA5JxjNwWD7ofPA+sNTCLLIeG8c6b?=
 =?us-ascii?Q?YoXFYhqemeNNhEDL1oAb4VnZ32bz1o4UzWjAbVTP/Mi6yz1o/SB8N8P6K9Yj?=
 =?us-ascii?Q?tqrHbxNAgkk1+kfEk2hZVDESvcjp1ZbSGjGHv3e3vfIXW994HuBdEBZjJUkB?=
 =?us-ascii?Q?BYRw8H2O9et3Rrcr8AOPUEBmUSYg6xSXXqWzuJb8pKFekHAJIR0s4T4M2qDf?=
 =?us-ascii?Q?nSXis/OgSSPJlnd0xT82Q/RI0WLEFvs1HzkbdqCkcioLZsx48ku1k7KeaPI1?=
 =?us-ascii?Q?Huauw4d3i5FAj2269OwLC84TqH93fvcVabxtPvHPBMOnFNINAjn22pr67V+v?=
 =?us-ascii?Q?keb0UGnVAw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b457f533-e377-47ae-d241-08da185a04b0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 05:46:53.3510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2A3d3STU3j0V2gMCESi2go9ysGg7d9mr5ZhXTMhxXX7uHv2NIOY68PV2b9PwFhJlCGDf4c+nAGDAhFe8SFD+tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-Proofpoint-GUID: gK4m0AKKkL0p10EUccyRWjPs4iMb3BSW
X-Proofpoint-ORIG-GUID: gK4m0AKKkL0p10EUccyRWjPs4iMb3BSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_13,2022-04-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=880 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204070030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96445

This is a bugfix release of the Samba 4.14 release series.

ChangeLog:
https://www.samba.org/samba/history/samba-4.14.13.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../files/waf-cross-answers/cross-answers-aarch64.txt           | 1 +
 .../files/waf-cross-answers/cross-answers-aarch64_be.txt        | 1 +
 meta-networking/files/waf-cross-answers/cross-answers-arm.txt   | 1 +
 meta-networking/files/waf-cross-answers/cross-answers-armeb.txt | 1 +
 meta-networking/files/waf-cross-answers/cross-answers-i586.txt  | 1 +
 meta-networking/files/waf-cross-answers/cross-answers-i686.txt  | 1 +
 meta-networking/files/waf-cross-answers/cross-answers-mips.txt  | 1 +
 .../files/waf-cross-answers/cross-answers-mips64.txt            | 1 +
 .../files/waf-cross-answers/cross-answers-mips64el.txt          | 1 +
 .../files/waf-cross-answers/cross-answers-mipsel.txt            | 1 +
 .../files/waf-cross-answers/cross-answers-powerpc.txt           | 1 +
 .../files/waf-cross-answers/cross-answers-powerpc64.txt         | 1 +
 .../files/waf-cross-answers/cross-answers-powerpc64le.txt       | 1 +
 .../files/waf-cross-answers/cross-answers-riscv32.txt           | 1 +
 .../files/waf-cross-answers/cross-answers-riscv64.txt           | 1 +
 .../files/waf-cross-answers/cross-answers-x86_64.txt            | 1 +
 .../samba/{samba_4.14.12.bb => samba_4.14.13.bb}                | 2 +-
 17 files changed, 17 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.12.bb => samba_4.14.13.bb} (99%)

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
index a89d9b358..e91df71ea 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
@@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
index a89d9b358..e91df71ea 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
@@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
index b32967539..b670e4ac4 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
index b32967539..b670e4ac4 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
index b32967539..b670e4ac4 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
index b32967539..b670e4ac4 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
index e8844981e..ad52b4a9a 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
index e78761de6..c799942d4 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
@@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
index e78761de6..c799942d4 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mips64el.txt
@@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
index e8844981e..ad52b4a9a 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
index 4d2726139..ac857d46e 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
index b32d30b34..dfc48754c 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
index b32d30b34..dfc48754c 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64le.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
index b32967539..b670e4ac4 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
index a89d9b358..e91df71ea 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv64.txt
@@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
index a89d9b358..e91df71ea 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
@@ -43,3 +43,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: OK
 Checking value of GNUTLS_MAC_AES_CMAC_128: OK
 Checking whether fcntl supports flags to send direct I/O availability signals: NO
 Checking whether fcntl supports setting/geting hints: NO
+Checking for readlink breakage: NO
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
index 3da397f5c..49e93fc53 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.13.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[sha256sum] = "155d9c2dfb06a18104422987590858bfe5e9783ebebe63882e7e7f07eaaa512d"
+SRC_URI[sha256sum] = "e1df792818a17d8d21faf33580d32939214694c92b84fb499464210d86a7ff75"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


