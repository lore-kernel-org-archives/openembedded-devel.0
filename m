Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA53DCD1297
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13709.1762955088661530911
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aYA4m3JD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC7a7hY1928398
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=UMmjudLodYGFwpmC2J1B6QPqLlRJKLInFj+WC4s9YNU=; b=aYA4m3JD+Kd7
	irBKg5WOP5rr9jor/8iPg+gqmT5zN+zIOI2VP8tsRsDYCPhzx4T0C4QqQQN3amat
	kO2D0H83k6L9XNsHAMl8z5y25qdTIgfOU3HVp9EDMo2+nnmLG9JiPR/wWQ+LeFvy
	RuB2j6e8MwPi5Wyn4+vw8pTkypAg0tCzuoDdQBNt5K2Kp0wYZcoXitHgnAtBocPb
	dkWW0skGELFAN9WhnTF6MZsMPuyJU49kIMJzJYjaMbSZdRgvzNeBMuxnsp3JO6AS
	1cCGJ3Ee2FeaKxuTCpqROxwGVqdfAdb7UhS2X2vG+sq+AvJA4LhQYiy6cklIm3yE
	IA9DOzvokQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2135488-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pF273emIrnFA3CYLISZrDauuwBOVh8ojx+RNh7IKnUtlHhbJZryeAkbXAwqfAmx2GbhgcesfJPNmghSpDpKqkKixfIWZKULEGYZq49bkz4kXOglBJH9AD5QOvXam7Bs8R22nN/EOmBHlh08jhvWa5nNskLPNFY7MV23xbTptwG/ZLQMqspT7I/KvOYWcn898CbmbrKp1GvagDKOTaXDRGbZFTuPCYmmia1kouW2K0NqGeNXAWTCDGqe9mJWzdblP6sEYLQWrf/5jNrilTjiD+fXbx8C+e8eLR5Y1Yphy3IRpftleqtueqnQgCprDROzCYhS0DTqbDtcvayOc5P4T1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMmjudLodYGFwpmC2J1B6QPqLlRJKLInFj+WC4s9YNU=;
 b=AaVxqsBjOnneT4XH4ar2bN+2CivGWafToicAo4/PX6iV7Wk6+fRIhWA4puqVJyEdnRcMx/b1wo/oP1K/QQNhDxGPBKPWZMhC56q5Bu3c4SyK0uM9aqb9q3rhgcaVwiSj5+f1hhfLzOpJoxgIH9prS+f6aJKOAt+RfdDhGjlI7bDyb+tUJUSNL68lXlO5UZwKcJQXQ/D74LJaViaKnXKHzVN7HC4lreRxIZ0EshHZHrRWSOk4ZVAMJMAKFKBuCrpgAe7fcnkYoKpNTiH5/Cei6TmTm9sPaC6shOvErQPdyU9GBoeECoFwzeZoj9JipmrIwitCekiOsL7OrF5qOet08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:44:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 16/19] smartmontools: add UPSTREAM_CHECK_URI
Date: Wed, 12 Nov 2025 21:44:02 +0800
Message-Id: <20251112134405.3706508-16-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b13eb88-10b3-41ea-bc0c-08de21f1a41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VGZO6TPZxYocllxeJBO8POAsI1KJE10mJHNZ3jLr+NbJsy/B7/p5EE3GkirH?=
 =?us-ascii?Q?M6DaZQRjm5ETJagQ3KBMO0jGpdKQSENtH1zJf+aFRkFYDr7xg+tWtwJxqPUs?=
 =?us-ascii?Q?/QnzRZ+T1XCYY2C/PqMDM8AIpq5PxCUydTYDthlYabh+g43m51MZTP3K+QhH?=
 =?us-ascii?Q?7ad/AlGo0a9vgFeCYkpmfwOaGeVKGKQe8ibpK5GJC2JjyRsG6bq2tHo+YsS2?=
 =?us-ascii?Q?A8gji1q+U5SjPgVghppTeDuT8CBaZPJC1ToXVo3s3LtZgzKTEFhUnx5M7Jld?=
 =?us-ascii?Q?6lBBaPq07Y618/MmKBlevJAwtoP9RdmLwfhrYIAGhHA6efiEAi3HiLZrUlow?=
 =?us-ascii?Q?TSrwqpTBBXT90nmjTkVKMnVdlfX1msZwikh2PAEY2Jn12sN6VCukIk3Tf0BB?=
 =?us-ascii?Q?eRnOen/BUhuyr1DU7LonG8bOhFW13uBFq5l1UKSHyCEwOtkckfOBMxBJkZph?=
 =?us-ascii?Q?52r1UWXZB4JUZQuOVoCk9WeLwkJfIPF11SJovhWHnZiw+gFBB9rg9bfO/UiN?=
 =?us-ascii?Q?ZFjA+MoFoQq2n/cQApxRzZQSIxfneXIV+w4m5qwvUkYz1O4RqpvDRCZGbqCL?=
 =?us-ascii?Q?ZcsFV3SufGN9CNhUWxNjKxdA/AR0WWbrBttWyvfXn8GTAplVF+6OWEgz7Wwx?=
 =?us-ascii?Q?0fBT9uRIF0MS5G2rZtDZ39hSXM31vujOOE8YtgD46YVuH1/zxCtV5VkMrLnA?=
 =?us-ascii?Q?UPtmlgxx6k8F0ib8seOlfVCEnS6eQuvC/MVFBYntE2MbG9qf8NuSrI52L5iu?=
 =?us-ascii?Q?0WE0LFgprJXXJXGXmq9ytEQMZh6Ll90gduFPMi8dAoVvvSVN8MVK71GHOTSM?=
 =?us-ascii?Q?TBXXrrRrUiJRkptfw3QDMHxgbNUx5RItJY7XhVMV0N1tAle05p810mvQTEy5?=
 =?us-ascii?Q?LmG/ERVg/dFTaBLpC9B/sca2LOZReeuImBjunof4da+TG2F4bEq8owKcMlmx?=
 =?us-ascii?Q?KBQhhGIHxGW+PwlJmAaBqagnJpz1Mo7IaBTgSM2ZpclqtQsY4cbGWMMX7UOr?=
 =?us-ascii?Q?qC/tgLZVURukRS0tIUKU2Ulr7W6h/Jv7nHDGHgnVGgUg/I+oWb8IdvYM7wGd?=
 =?us-ascii?Q?yeVhaPfSGIlQ+j1Fn7+pm+dy+wVI3V3G1awSUgk6kjqdCqoZCh3Axbfhtsey?=
 =?us-ascii?Q?iMMPpLwjlrR3BH+/NCFhB4zfsxancTIp/uJyRnawnpzgwUdPfr53r7ekoi4C?=
 =?us-ascii?Q?ZSp5VEcxup2t+F/pyvKuGhQbNbdRLd88n+4WV0tSGiDTQqnDqF0HEVytUhto?=
 =?us-ascii?Q?FZ++UEUhJRJhZmOomD+k1avNpAl0rnFRl5yCojO9C9saBb+0OFot4oRFoDe1?=
 =?us-ascii?Q?u+dxyMixr8xUw49n4YqZ+Z/kHD7uvP8AeOHwFNNNu3SSO+/qVr0wJnBM3pL2?=
 =?us-ascii?Q?YzQpIlrJF8AXpMXR1qrSIOdkeNESdHmSNuevYlbZRweAgc1wapwaiN9Eknaf?=
 =?us-ascii?Q?mx7ChGm/d9yolmIOD4e2KRnzPHCBSxW0uPl2dY5dogpOr1bU6+T6jN+nDnkG?=
 =?us-ascii?Q?kXCP5zj18+Li+Ehtl9FWOled4ho35FRw3kPu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3yBuqkxFKE8163F0gXgup1ChJfVX18xcXJtpEo/Be1QxtkfxsMgxwiNKeLSF?=
 =?us-ascii?Q?wwKjh86bLRtR7mKwC/1A/d8O43X+c0IXrdKW0OBt75cnenxBTFxnMdbWpw+F?=
 =?us-ascii?Q?e6hvWH4yd1DXO4QHKXtYzLCI5iiKdxWjkJjmzqovMNx+iN1qEaF89X50SpLY?=
 =?us-ascii?Q?IImlw4hgTEylQ+LFL8Kc/+J8EufNVPFJa6+K8gK+cPtI7H+x7cIqaT8MH6JN?=
 =?us-ascii?Q?DcwysfGuGVjVkNrAu6EYClC7WPR4dJZw/8JN4kT5hvCVQpMKavbUOSE2kmRx?=
 =?us-ascii?Q?n05MxieiJ1pugGe5YJEsG+xQVt8mAJJZoZpuTeGgsgx7OoQgyLHN4rtjG3v3?=
 =?us-ascii?Q?CTQWdQBwhnY2hG5yKRlKatZVOtlC8HcMVAMTlPxPm43CCphZhJ8oyLw3prh+?=
 =?us-ascii?Q?bZvSqYyNWv5CZjrkSUfQqOoGTKPdL2ogovEUgGf0EYiBbCIW+n1jBKxHQAn5?=
 =?us-ascii?Q?q7LUwQUJGJ0kXQ3N3u3q84NJWICpEDW6YHXzEkDlBbJePedPesc35SBitAyx?=
 =?us-ascii?Q?SHh++BdlzzJjktZI61G7tK88au+PIm3lVIrA+l/YkLok7ebRmVVAv0ZtehNg?=
 =?us-ascii?Q?fo9J3c7ha+bO48Zey9l10oo7NCFiu0A3o/JNf2JX24s9gIHRIGB8844pcW+4?=
 =?us-ascii?Q?RZj5A+5ES9d412rm/XzwzKN7q/1L+SNPW6s6WIs7eOQKN08tBjt69WXWvUfH?=
 =?us-ascii?Q?zQTFblXqZ/gByTKsEj+pa4mcoWRY/Zikw7YXTevOsgDuFkdRdthxZQegY13Y?=
 =?us-ascii?Q?AlLnKc9ZpMMAY1Qye8O5A0X/eRaAJGowpo0t5YjzSqn64JkfLxiW9MsEL7dq?=
 =?us-ascii?Q?Udd6icFg6LC9N8rLE782EA2zFvqhP3OgIGsqllaDwiD1gP7I5ktLV8KRcljC?=
 =?us-ascii?Q?1VTPDHzp1EhEReLRocFMaM7FqA6bTDYcXxF8vY0NBewxXEL5l6yr8nUHr7Ag?=
 =?us-ascii?Q?djBE5QJqgJjTZhyFDq7kh3zZSY0VCe4PlUZSL5LD3Db0HkfBmaRSL2NByV5z?=
 =?us-ascii?Q?yCWXNLVTe0vFy/rxieium8NXsa65gMxMQb3091KafHl2ptW/Ip+2GkBUIVne?=
 =?us-ascii?Q?j1gZogavvRFjvCqs0LMtpG4szUus4jPgvU2mBhQOTjXeOHB7ndw5KtpMu9Rf?=
 =?us-ascii?Q?L2gL5Ewm0f1r5J3QqSthxeGwlQ1SU48J4SBsbiCL1CLq1ytiOWCDUSpQmt7l?=
 =?us-ascii?Q?0AL+h8YvCnGeVhSjDP7jOcQdyHRdyh7vbG1sluEnZzPGmK3RzUKh8BFTsf3i?=
 =?us-ascii?Q?4oCdXQj1jrMFGVWjW1LO2fYNF6hKkskvi0+q0/G1I9xiN1K01lb4z+stFT2Z?=
 =?us-ascii?Q?lihhOllbl57p/z3piU1RF6NlffZEVJlxALUmLvHKyn1uVYxVYUGFcfi5raFo?=
 =?us-ascii?Q?u85BPCVP7IH27daITNdyJdtYk6L/mNwwgW9dEdHC2Rka663Cq2ECcuqaYSUO?=
 =?us-ascii?Q?flleKf0ideUOCab5gg8iaQ5Q1STAF8noV5hTMWNXu0tyqyLbc6NjhWK3r21l?=
 =?us-ascii?Q?M8WfmZc2VPpORLhJVdNYnd7bZJaLXab7BIxAkLbLVG0/ol91KiGnLZoGII4+?=
 =?us-ascii?Q?3Fg6fXJwzZTvJk8Oj63AIB90Oa1Ww6lNoXS8I0aB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b13eb88-10b3-41ea-bc0c-08de21f1a41b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:46.0602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5JMP+hmrHsXCW5JHza0xRluyISfw2J2sBDmlWQolztdNFCZ4fp2852CtOEqImA9iVuql/W9azQc09thV3Sn+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX5jqwyXtpl8JE
 K5gd2hHePHB7baNr0A0/AqmyWHO+UPzKjwbJS+4O90fR9JxU8UDo/GZNpwWLtQ4DDuhLAIzJuPq
 4TVuXeZBKSNEk7ZKFP0QT0hhcZ0BFTcMFJEeNrXSGBdex/WWpMk1iFpbOsG5HWIfaHqJeMV/zGo
 sizG5on1KVGRFJgpGi261wQvZKAHgFfKIps9lH1Z+UKhk0L8lRibkUh2HvNDhBjkX1q0Nb+EvSD
 FOByx90AsZYwC1F8rEQS4xhRV9FL+vv3JOxRBO03ByusIgQQNqAlIA5OW2yTJAu65isgQaBUzWY
 Sb5Oby0cACIFcELK0GD19Y634GIBNbCalPMhWpGUDmsm0HSqIcFKy7tq/itULdZBdvcjNe6nNWF
 0CwBueqWheI6w0pDkN1wMNm/CuaMUg==
X-Proofpoint-ORIG-GUID: G93GUu6t2yN6Shof3Yuf7OFp_EJuzehQ
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69148f50 cx=c_pps
 a=cvmpvQQCsZncHh92cDAFKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=Ui3wpbzUDAAzRqXhoHUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: G93GUu6t2yN6Shof3Yuf7OFp_EJuzehQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121545

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version smartmontools
INFO: Current version: 7.5
INFO: Latest version:

After the patch:
$ devtool latest-version smartmontools
INFO: Current version: 7.5
INFO: Latest version: 7.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb
index 6f3bf49c07..96e48ee924 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb
@@ -19,6 +19,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
            file://0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch \
            "
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/smartmontools/files/"
+UPSTREAM_CHECK_REGEX = "smartmontools-(?P<pver>\d+(\.\d+)+)"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)}"
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
-- 
2.34.1


