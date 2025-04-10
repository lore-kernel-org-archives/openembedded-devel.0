Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59CBC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 04:11:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26714.1744258299748675751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 21:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A3e2I4016715
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:11:39 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1pdg8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:11:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XB277wkihUQIryNuLJeDYzSIkf3IaELLECj/DvSFev9H/uU8iCTMqxyUc8vc4IxmBd1Qdtv5p4Jbf4TQ3YUfvx86WW4uin1RGDCCJeSejZ3xqf+RvzmHTLxGdjoFEOqhwgdXFqxX0MjNA5/i3rUormXv6GedP/P6VuIsUKsJl7mA9WDhjWqgFRkKCbgMuswQ+SPDfmvIk+rtkY52vrgmeHBgu3ZnzyGZefahgS3rJg/3mRWgiNZX8zLcZ6BwoiWdtluA8b7ZkvEIhSVpXGEY4jQyqrMTxheatxulMzc8WHboa52tXnETrEZr27zgWWRkEQMKGO1AF0TXx7Ew9EtBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMGINEyg9h5nfIiNuDO6FnwTH/4aH+7+RKQ2k/UccSU=;
 b=rWRnW1sF2LGqXIUtwOe4rax62a0B6ubprL2jOZuwwEb0Buk/46sUEi6W+oVXakL10KilqpqW3H1GrUoXtnmsPPgj9vFf2VDsvTeptaNjT/r791TWC+Gniaa+Rmf72II0MtLqY0ChgGtI3XfoW7oUduMX0DijLyEaJkChKLt5W1mQLFCcbAhCBmxhxQL9YtlVqQXZP+O2bGihpsERywb0SEtfyR7Ba3NsYo36ZZQbJsSQCCDDbVjiQ9CS51QPFEx6DKfJB65+l+Hxiyob+JzoDFiPnDhnlsFHvd48eHE6smaNg/FVwvqS95WI01um2CcVtPbcEeYP41AG6geP2wjH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 04:11:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 04:11:36 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH 2/2] waf-samba.bbclass: adapt to qemu.bbclass refactoring
Date: Wed,  9 Apr 2025 21:11:29 -0700
Message-ID: <20250410041129.1486824-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410041129.1486824-1-Qi.Chen@windriver.com>
References: <20250410041129.1486824-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: cdfe0ac1-fabd-4c54-e01b-08dd77e5c8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iZxuhmGvcK1oAAHCo+RfP7h8MwRr/QjLF9uwk6QbDjRBcRpqL9OOGrwADGlm?=
 =?us-ascii?Q?PSbwsPPzpIK6xICGAjnncP2eR+qTLllkEhCSvPiPYHPfHbv1HOW3eGnuwQSn?=
 =?us-ascii?Q?uY2GiVRxY2AN65UXj1042AX35n3ud4F+548f4GLZX07F7Zd3STd2kBQRxVYq?=
 =?us-ascii?Q?EAx5jO60Z6rSs/Z0AN8Y3NQVYtS8i2VXbIqDOhN65WHJiz29GVCi0KZrhc7N?=
 =?us-ascii?Q?Y6jG2FUMyJlccMfTI1QWYfY/S6ourwIeoiKqr6YTZTzOvCB0QnyehyYDjQZc?=
 =?us-ascii?Q?n2s9jjJL6IlqJ988UyM4/wWkusM0LJoLgmV5CdUPXwzHZNLic2y04VMREdsO?=
 =?us-ascii?Q?U2XYHnLm3Q4sn3nsNOjl6kZbD9lP3uRnQQ0UYmsDa/zVOJkrtUIBvbpNNXZs?=
 =?us-ascii?Q?y6xOOKpX65OQoDjYpNhlqx2ZWeo2xTpC+nrEjzp8dHT0hx08pbQ2IPpf1Ufc?=
 =?us-ascii?Q?sUBa4AdYD5yqPal8jHvFoPXSkUoXCKZ2sHP4JnWuIJIin8gsk8WLmJJfu7Wi?=
 =?us-ascii?Q?2D+UpyWNeYxO/PD6RIeeUBj4yZinMUyPIDDeieEKTowyWlDa2O41Nc6ag+dv?=
 =?us-ascii?Q?x+SydJX90tQQGreR08sajtzEAdmkxvSqRco19MINIC1ybKIZkylLEUCiE3Iy?=
 =?us-ascii?Q?gW++xzjn6n86HLVs7ER7a7aamv8JeE+/g6fsjt9fEN1teUtuR3kjuyDljCPw?=
 =?us-ascii?Q?L7qwRA6NW8iW4hnK5J7w/5DZOJrwkI0wHGKUBjiRitakK1nyWsa01C1lou+1?=
 =?us-ascii?Q?D9A2wrbk4v9RAVoge6Vt9B0kxN00e4EI6mcGdj6WEad0hf8Q2OfmDCQSxOjx?=
 =?us-ascii?Q?Vq8rRLlBJaiV5wd2ObUHFVvVHke190MOEosefNtHcwSkcyPnkH+NXjVvwCXt?=
 =?us-ascii?Q?J8liRlz4OTV71fLLGYhodYq2tqNNqxH440iRgV9P+68/ciyJv5L5tAzMYF2D?=
 =?us-ascii?Q?a4dsnGb9kmVhLAlHwo+Z3QUlfTFp/ss8eYqVxegdr9V/d4X1xmeJvnj5DB5l?=
 =?us-ascii?Q?ekj91KV1DaC8Uu/ACylx9j8t874C6cZQOH1JKCZnXLE8USJrofNSrmqXI1kV?=
 =?us-ascii?Q?UtHWJZYLV1qnrWkw0MAv+8CwYPExEY0kD2wvbydXJlk6aOcu3/RYyf7iraGo?=
 =?us-ascii?Q?3pDLECpcS4qRdiSwLQBvnz5XYROIwmraHUHT82l4xUufiNxtVZvZvl4O6nuu?=
 =?us-ascii?Q?U+Uq1ZSBTVQcfi5/xfMyMKvXMpPwT/OZVErM6ymmDU1820ospB8a927VvFdh?=
 =?us-ascii?Q?FuUYfDZ5H7skMcf1sO3QR0Zkx6/OOPQPGyzxfvJv7My0rG34M5pvx/uNe0Pm?=
 =?us-ascii?Q?kTZ6gl9+x8gEtceZ3oDhMSNhoCDQZSGfoWV2oiJ4I9MZ8WDBRnUxS1ie8D1A?=
 =?us-ascii?Q?NQrZARa5sBDIV/O9WXRj03JwE9Sn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XvfXLrtRDMA+EtAMh2EO7eucbmKxpS/fWRaU6X9/6rkXTDRhMxk0aTJr+hsY?=
 =?us-ascii?Q?X0vdml/PHUEWhGEhNs7wd5iDeNYXyovlJYoD5SmU16M1ZLesiPzdNcrrsC6q?=
 =?us-ascii?Q?bZhDjmt9a4ua86kLKEfqSVcdMRLaomyicw3+hN4hJWxTbs7a8mHkhXsW4c5k?=
 =?us-ascii?Q?IOUJQeSBB94QTVurj7r1aMrkT+nu9/UZrLPaLsIZW6MLMDl7qrujMWEfzE30?=
 =?us-ascii?Q?7+d0RPFxufKKnR9jAwKAqhcSjy4gjW+JLlia1jkZgaRT6CLJDutmPdfrgvdn?=
 =?us-ascii?Q?l7aBlnGM5RpAu7SMLM3YGNHyKW/T1TiW32nYWm+1wMb0KK7XgWkhQNjm8PPV?=
 =?us-ascii?Q?DGlobNhoYMDh2RTHOatr+HlZB2aqGhKfI9KPD392j/Tkpp0NbfqIsKn/XfsE?=
 =?us-ascii?Q?IJvTO5489ybpmdcyaY8tM30AsBogmlP2Jb13GHYw6oDvqIoruSG93zrSuN07?=
 =?us-ascii?Q?hpbVLS0LXs4fnKiC7a3wWPiq2cZLH5+S2iNWhs2Mkt54McSvxLf86rOFg4X8?=
 =?us-ascii?Q?ooVMpjOHcD/x1hPeV7aeYA7PSUC2PbCgoIapKwtuRK6/br7Bz97J7tK5HPNe?=
 =?us-ascii?Q?JFGVcGUnI8Sc4peqhG8OwpQQO6cm1Wg32LQwBRSWyYBUrmuIvC3JYlVi/S+k?=
 =?us-ascii?Q?gfUvJgiyqybfDiMRZ6STQoLP3VrTJocmi6xj6a+clzrDomTJc5KuzNcNsPB8?=
 =?us-ascii?Q?sBvsaq7ou1uoejtisTgL7uY8TlP+B5f9ZxCDkjfPjei2v0OxvGYm6smyAuFO?=
 =?us-ascii?Q?VtyPggMRqol5TY4kEzwXgOHBlyVFA7TVOGoZerfMR94aS3I9OjOCeBG78eei?=
 =?us-ascii?Q?Dpl2fmly7Ct6pEvq9Y/1q2t3Ugsy0YE5fogaeHdYblhJ3mZMiq7QAX5bSWKl?=
 =?us-ascii?Q?dla4c92k+oWR324DEvmHPaLTlVoraPUkVsG5ityZE5nW6kF+AI/+LhcHKwc/?=
 =?us-ascii?Q?54ZYiMgVbSxSsg58D37xMuj9ZOhCNQNpzwCDHiyRk4z7rlMhalBJU8bmgF9O?=
 =?us-ascii?Q?Nl5t4UTnXuVfY+iACSTdyp1TTmjEBKikRp67TXPLE+3TAVHe22CGhNn0Cryi?=
 =?us-ascii?Q?E7j9m/OVzESCQQamTvBhqEG4nyJ/aP7e6t2eqHPmkbH3EV9Q2inYsznizkwj?=
 =?us-ascii?Q?7thbZxpC4Jf6QxD0igOeN2UGPUmQSGBcAzCNjpG1KTTTuC5MUmsrL9JI20qe?=
 =?us-ascii?Q?kG/cWtPoyiIClhcOhUaWPYNfCowNWAaEGg/HEUTPWCdWHrfxbVMBrfFa2kTC?=
 =?us-ascii?Q?SFhsEth+6I5cuYSvTPNHcG5eG+liN3sxgP2IWR46O4QfbIEbbE91Vs2cGjQj?=
 =?us-ascii?Q?EXWK0lE3uFVxEU3um+3LQzpJav/opjlxY0pWbgcRRZP/o2/cGDLEJqmDKngv?=
 =?us-ascii?Q?X0hKWVQ3QF7ovspYTHTGO1lCKRPaPfp1kiJqQrUgNsxZ0dMaWLvQIfARg6zh?=
 =?us-ascii?Q?TYnve5cgIRL/OsS6iMmWuCn/eEIQgAj6DKB6janDRLOSb4ca7jy9xXl8pVeE?=
 =?us-ascii?Q?rfnKRcynwcAr6fisaMIAaKyq1hBHVsPhIevee93DVyh8YeJt5tF4Ff/9f/Re?=
 =?us-ascii?Q?RbQjXe0d5EYwa3LWk/C1mTt7qj5sBrQPrF3oI2kQj+W05jTvLAa2c+bjZjDt?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfe0ac1-fabd-4c54-e01b-08dd77e5c8dd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 04:11:35.8916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3TazceAuv2qOFJ7t5eTE363JcrCicluu3awnYTmZEhTbXDBCqM1b50sbrKoEPwdCnpBHjVkAWhwgBN59MmazQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f744fa cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=0cNpdDu4uiylx8giwlQA:9 a=ahtzkqAwBOYA:10 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: n2zfZz21PIM4pYqX3J6j3abWugTq0dTb
X-Proofpoint-GUID: n2zfZz21PIM4pYqX3J6j3abWugTq0dTb
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=929 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116751

From: Chen Qi <Qi.Chen@windriver.com>

Avoid inheriting qemu.bbclass and use oe.qemu.xxx instead.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/classes/waf-samba.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index cb78ce6b0d..49d64b096f 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -1,7 +1,7 @@
 # waf is a build system which is used by samba related project.
 # Obtain details from https://wiki.samba.org/index.php/Waf
 #
-inherit qemu python3native
+inherit python3native
 
 DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python3"
 
@@ -77,7 +77,7 @@ do_configure() {
     echo 'Checking uname release type: "${OLDEST_KERNEL}"' >> ${CROSS_ANSWERS}
     cat ${WAF_CROSS_ANSWERS_PATH}/cross-answers-${TARGET_ARCH}.txt >> ${CROSS_ANSWERS}
 
-    qemu_binary="${@qemu_target_binary(d)}"
+    qemu_binary="${@oe.qemu.qemu_target_binary(d)}"
     if [ "${qemu_binary}" = "qemu-allarch" ]; then
         qemu_binary="qemuwrapper"
     fi
-- 
2.49.0


