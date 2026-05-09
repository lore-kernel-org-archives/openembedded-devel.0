Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572C9CD37AC
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 03:08:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5369.1778296081682809963
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2026 20:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QLFxOQeR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9589cf1815=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492SAP52052745
	for <openembedded-devel@lists.openembedded.org>; Sat, 9 May 2026 03:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=bmJG7szSUV7Qm4DcVmTE
	spiyTlSIo0xuZjTMKyh/xwQ=; b=QLFxOQeR1G0V2x7R8MK6m8yyUcQxuIDUG+AG
	upHTcFZAjVvTgDMmB0NokjXtVTOPIYLdOwxemAULfiDfsvx3h5tb4fE6oOn2kJ4T
	FEIsf5RwXcYDGjvmmj4V1WiQFdGK7gQmoOaqgVyo9sv+vwS3fNG8pk6kNbwjgtnf
	dnfLNsniyQADOJskghpD1BVca1sKiO5SxNCa+siQbnj+PorKH2Ot9r/ib2iHVLp8
	UwImKiEFK2yzUMweFGT/XqUzuVRy1gv7SDGdwoS1Pv/XH6S+JyVTz++G1/qYUn4C
	Zvsa7UXOL5pnIFXAZv/MNV5eRz+vULNiU2PIFrsmXZyBtnn3JQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1uw6g17m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2026 03:08:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFjSNCcFl/P1U9NISEpqqGHJFKDnwugH3QSsH1StEjQLfuuWri33zROduxc4oN000nxb7uoCyJZ0XpcnU1c6wjjDU1YZjX9vRB3hnzl54IuyEbFX3Y9fHCfmS/Gqwl6BVb6sRrkIqutfETiKSB4WtO9OBCbtd9ilZEPeEhnz9K34zdk1ey3naK/c3DVtxfhAFdqJYR7rLr4G953HiUmQrz9YUOb93XQLlxcp0iJuc17+KsFM+uTrT9zocvd/kNzl7ozWS9q5PtDObgFh9uMWtQPjYEWxCJYzuZRiSTt7QKEN98CH6NL8LDVG0DzA94nZV/qeMqkynuJQ1yw4XufHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmJG7szSUV7Qm4DcVmTEspiyTlSIo0xuZjTMKyh/xwQ=;
 b=EbCyGsqRDeQ6OkEnlfIfODBzPeKh8Hhl8YAFS9MNpcRcNMwP90vBI7bnHJDAnvhahI/QSsweMlJ9a7qQ8t4qpcCtDt2MvbDg7e0ZCxHEkPNZakL52QaAI+n+RAXhO3ScDzJAWOeBASvZXeFvbLDfOSo1x3VN7j/mpdmBoYgqGMmK1Wa+ZZVRyXhqCkwMpW1HjgJU+n89SWW3drfYRZm29D6b+pRURKQXaGArUCvXAXLS/hJw2vtCXoLKGYG3a2h5B+1afnjJmkxrW7B9o75Jq8oWcgWggkYPYketdGwIE75EV/eZrUlmcuNtFYY8CABJCh0t4fLPGZVpY9zFr+A1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2633.namprd11.prod.outlook.com (2603:10b6:5:c0::14) by
 SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Sat, 9 May
 2026 03:07:57 +0000
Received: from DM6PR11MB2633.namprd11.prod.outlook.com
 ([fe80::7989:d63c:1bdb:60ef]) by DM6PR11MB2633.namprd11.prod.outlook.com
 ([fe80::7989:d63c:1bdb:60ef%6]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 03:07:57 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] bpftool-native: Fix -Wdiscarded-qualifiers errors for glibc 2.42+
Date: Sat,  9 May 2026 11:07:39 +0800
Message-Id: <20260509030739.1773307-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYWPR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::7) To SN6PR11MB2639.namprd11.prod.outlook.com
 (2603:10b6:805:59::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2633:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e7ce79-4c74-4d18-ca76-08dead782b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	X3NcjUfoOqyfelZ3JvMab1JtfIgH8GqEXSIL9OwlxDvwBza0+pXZxP9BzrIpH0suUHaJJJ8M2LvUEfbZaIJZv/vctmYuaH9DDuNGtCnSuxzV3fMQFqPVVDfBmWlFUbVXbU7yxww+T0n9ZKGUTi6nddLvOVtR3x0pxaz22OD2A6KQ0/5rr/Fl4WGHlrN7JV0I699bM67jxtPcvigqJVj53XIhUaHjIagEZqUHQWYeX0yviXvWtU43qwZeDkL5rAS84NVMqB4s34nTTeBresUG5KtMDgNYjfyaJr7YNOZgYCwlHR0bcqbJPs/Ab1zeEZlcQs/LRxXizlc8PkmZU3jFOrf5kcbkiLAGsLq7GTAaaBga9nQKepgVvhxfOEGnji9W51T4imQkNbEJI7iT0PT/hGaK+S3tcvUWdQ8Vjjopb7FTXgw4G8OFPQM2MMuhGF4Z9084oQqQlekRQKXqe6P7PMH0haIHzDKwCMSJk1iI5UwOAqZyA605qWwp4uGmsqpU9oR0Xr5OiUiI2aKe+eaFfZTbNoganN3iMdoLnP4RbTvvj53/HBIik9dU7hGNH8/p6nYiFXpMChsb7y6JQEgmRduhbai92MlFfSAjGZ/wsxR65cwtWsn9DHV1iSH8FAK6Ju0CJzC0zmIuMWEpnaHD4Q9NR7RCVumUsaJZAE+HqLfXG8vm5wW6tW8xeJ+8XHHe75gsLSpzGmW/4SQa8Qhsq404tvUvw9jsm4dPg7I308UBVTs7LxhLfPwzxntpWs5u
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTNEZjRSM0FiOE81M1Y5T3dkUDZvQTM2bkcrOGtEUGZrcnpneUpxT0NIV0tK?=
 =?utf-8?B?dEs2RHlYZG1VRU1yOWRoLzFHQVNSZVdPWHFDV1kzYkdiejZtWEoxbmZ1emZK?=
 =?utf-8?B?MWtvTnB5VEVrNVlLZUh4M3NZWVV3dUdCd09TTnZrWm9Rc1gwbmIrYXBkWGJy?=
 =?utf-8?B?b1EvalJ6OVp0UmsvOWNRa0tnc2hlQkhrSjZsUzFLOTlzSTN6d2FqWkE5OGwz?=
 =?utf-8?B?cGh3cFNmUUxVWXA1cnA1WmVOcUpxR2lVZTRLTm51aS9MYXU2WENJQVRNMUVL?=
 =?utf-8?B?dUpOZTZPRHRxMWMvL3UvZmttd3RpL2hHaGplYzBVVnVBZjNCdjVzUUN3ZWVE?=
 =?utf-8?B?SDFLWTNwZUNUclZhelFMdFp6ay9zUWFTT2NFTUVjb29GZERTVTZBOXdkUVZW?=
 =?utf-8?B?cmsrZXFvSTNLeDlNd3ZyRk1OT1l3MThyLzI3Uzczd002VkFzNjFBZ09TaC9C?=
 =?utf-8?B?YnpxemZMVW1zVDdiMHN6WFVTR0J1eXh2RzhNY0tOVHpxV3hMOVFuTG1qdGFJ?=
 =?utf-8?B?SkxrQnRuZ21PREV3eWl0QTdpMnpuWlU5cHhQUFdnM3FLOW5ZZWRmUVd4WTd5?=
 =?utf-8?B?M29jdXhUbXE4QlRNKzJiaHloTFRIVzJxYW52aDdaNHpwTUV1TFQ4Z3hiMEM2?=
 =?utf-8?B?elU5MmRVdVlXVFlEcDlFMEQ0bGZnb1FHdExpUjU4bkYxVkMrZ2M0eDRETUNH?=
 =?utf-8?B?S3lTVDY0WitNd3hRWUMrZXlub0EvZFhHL0ViZkkxQXpzTjcrdzAzcDExWW1v?=
 =?utf-8?B?dmRWZmZLQ2gvbVBwdXNwYVJWN2xSUU4yQzFSYmtTb1oxa3dsNmRwWVF6SnA3?=
 =?utf-8?B?Qy9IQlFaeDFnMldDcU9OWk5JbXFsM1RrMDZwRmZJZGN0cUZ5STZ6MC9maHVN?=
 =?utf-8?B?SXZmMWJBMW9YNERZVS9LZkdlcEozMTFITGtlOGFEc3dMK3VQbi9wZExidHdM?=
 =?utf-8?B?VC9Xb1NhSCtsVm5yRUtpcHk0eDN2NC9CMTMzK0dTR1pXR3k4VUFyQnorUTVr?=
 =?utf-8?B?TVpsODJ0MDFjRzJVTmxoUXlTcEhlYnNPK0hXTzZvVHJmbm1ZZWJCNDhaakdJ?=
 =?utf-8?B?NytiZFRCUTRNYzE1d0xaS1UyTUkrL2RKT3RQRS84SFhDbWdTZnI2RmVUR2FS?=
 =?utf-8?B?Z2wzemFGUmJkSVAxZWRicGRUdjZtV2o4dkhYazBneG93alNOdFMvTTNwbFcr?=
 =?utf-8?B?Rk9YWkdSdlUxSUhsNTMrYklIOEs1ci84MWd3N25pQVV2cnQrMWlZVE1xR1Nl?=
 =?utf-8?B?QnRlTkR4RVBLSlJEY0d3UXhiWEZtMlJ1cXBjNXRJS1FxOVdtVU9lL0pJNWp3?=
 =?utf-8?B?REJveEFLdVlTS24wc3lHQ2l2bTVsdmNKK1U5U0FXeHJxOHkrQ1BqTnpBSU45?=
 =?utf-8?B?cFJaQmpVUVdrTWkraWFaeWNGYzAzTm9jMkdSdWd5YUZSUkpJejlKZUNoMXBi?=
 =?utf-8?B?Z0NBay94QUVVdG8ycmEwb1RpbEc0N2E0eGVLek9nSEswQ2dVL0lzaUxSUmZr?=
 =?utf-8?B?MzN0R0lXeVpRTHRMZlN3L3JCREZocDdEcldjd0cxTzNUdENPcmRsOXp1TmJX?=
 =?utf-8?B?bXEvTTZJRnI3bnF5aURub09wLzNkQzA0RVVtTGVhRFRaR0d0S29sa01qaG5D?=
 =?utf-8?B?b1QzL1V0NmdKY3RSOWc2bmVOMGVGcnFnbEh4VEw4TVVRS2c1QjZELy9uVHQx?=
 =?utf-8?B?ZW4yRzBNd3BYUTFReXBsZ0F2dlF5UFhjZ2pWckY1eDNwVTFRNmVIaGNNVVlu?=
 =?utf-8?B?MlMrLzRKUlhLV3Y1MG1qSjlqYWViT2NVUlUyQWtmRUJqOVBWY2s2b0Z6VHl2?=
 =?utf-8?B?WTRQRlpwNVpWSTRqbktQMUZ5QURSMXFZQWZ2TzdGUkpxRE9iVGhGNUExYkds?=
 =?utf-8?B?bTZhSzNLdktZV2dtcDE4d1lpMENURWQvZDgxdEhsekdOamtOQ20yMXprdDBP?=
 =?utf-8?B?SEtvb2FROEc1alN0ck9aMnRIamlnSFhrR2NTQ3Rza1JmSlZrY2pTakVONm1o?=
 =?utf-8?B?SUMwb3FQTVpxMkp1QjJlY04xcnNZR0VSS2FIcytuamVsUWZiMVBxSUYxK1JY?=
 =?utf-8?B?NzNjblgraWlSaTFwTVdPNFRRVWp1L0tUNCtqWmVtNU84b0lsNFRNYVY5a1pP?=
 =?utf-8?B?UndCTVAreG9TakllQ0taalpwWWpodGxnWllXcE1LTDg0QWVqdmEzbGVyb1Ry?=
 =?utf-8?B?SmVaVDhVVUlRZHdMMG1CWnFXVGtpdXB0aEthRmpEMGdhaXcwRi9hV1pZMW13?=
 =?utf-8?B?UHhZa25UajNRNXIvOVhoanFNQjd1SXY0OTFwWTIyOXlOOFNtR2E0UHZCb21n?=
 =?utf-8?B?Si8valRISEhFNWM2SU83VmVYMlZ2cW0yWXZteXY4bGh6a2l0MGQxdz09?=
X-Exchange-RoutingPolicyChecked: 
	EihFIMDO16P9GJG9SjAymdJ6js6sjkp4T5sGLrDE+CpEkMNIeuD/k1xBBKNmkFViTfjIqcq6rivNBzLYWFgHT9u53ZVQPmaadi6X783aGMOLMjaegjmYqXAfG1eEV31B4DQ23eYL99lfDCFOj29QipNqOCZzTGkD3lL5Z78vUGPbw/vyHhPloHFBZ+/HBCl0PKzQhqJ+QfQ1PkgIGOdWzg3FX90HKSFFLk6/Q+0m6mXYTBPoSpbUGrsZxWRTLyhqkrJLa+Y/RWxuUog6MEOsxw4OflWS3c9VO3D0wB5GAbsX3130H6URyTFjNfiSYtUxgbn6Hz5x0AeEr6tEVUz/Qw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e7ce79-4c74-4d18-ca76-08dead782b27
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2639.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 03:07:57.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/Bh6jn+qBqC01ahiIX7sacipmBPhQKshxIJT3tPTIgvGKXXTHBHFPMdzMZEgZTqCB723Q4ZVehtPD1rkvJUgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAyOSBTYWx0ZWRfXzs0EI1SaEzvo
 FBG/FjhpOswaWHni8qUk2BfNUyFCcR3gp59JJpbaplsPgEnylqdlKv5g19/ACoP3PkZZHHlb4SC
 jyf9zQImN2mvvMEkND6+ITTpeaSVqhLk4kHrsVpEgnQmNMrSKpOU5O80PLEHfNUZFi2cKLBuGCR
 l7fpo2oTWPKrln3fz4CoFzjevAL04EJN+sApr9lKun0hGwC/inSuAmt4XpFvFbzJlb05m+XgBHC
 dIfgoTOVTzU8LvRxfqMSrDROgOFXd6askNUCz8N4L7jFEXkHedbja8+l6XSLt2+2VmHyTpCdLl6
 et4wdtGlUisUSJCPoT4me1EbOsIpOGcBUUOzjwb11HWXhLijHkV7mbmNcFxwUtEGLyprBZIRlZ5
 5JOCc5B6HE3DikaHg2XYhE2AUPDDfODvdb+VG5F0FJpwuSY4BLNLhfzSIr22xOQMKSWqXRJg++q
 cvmQpZKzqg0une8nsxg==
X-Authority-Analysis: v=2.4 cv=d6nFDxjE c=1 sm=1 tr=0 ts=69fea510 cx=c_pps
 a=B83JijZ7EzXLHUDiN273XA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8 a=CAchc_BtILMKYomKS8sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: aAg95sXF-UlLKhhgW6ZQTW1IBrKs86iV
X-Proofpoint-ORIG-GUID: aAg95sXF-UlLKhhgW6ZQTW1IBrKs86iV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1011 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090029
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6492SAP52052745
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2026 03:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126828

Backport a patch from kernel to fix the following build errors.

bbpf.c: In function =E2=80=98kallsyms_cb=E2=80=99:
| libbpf.c:8192:13: error: assignment discards =E2=80=98const=E2=80=99 qu=
alifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
|  8192 |         res =3D strstr(sym_name, ".llvm.");
|       |             ^
| libbpf.c: In function =E2=80=98avail_kallsyms_cb=E2=80=99:
| libbpf.c:11497:31: error: assignment discards =E2=80=98const=E2=80=99 q=
ualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
| 11497 |                 if (!(sym_sfx =3D strstr(sym_name, ".llvm.")))
|       |                               ^
| libbpf.c: In function =E2=80=98resolve_full_path=E2=80=99:
| libbpf.c:12085:35: error: assignment discards =E2=80=98const=E2=80=99 q=
ualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
| 12085 |                         next_path =3D strchr(s, ':');
|       |

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../bpftool/bpftool-native_6.16.bb            |  5 +-
 ...-Fix-Wdiscarded-qualifiers-under-C23.patch | 69 +++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fi=
x-Wdiscarded-qualifiers-under-C23.patch

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb b/meta=
-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
index fe3ad6138e..edc635517a 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
@@ -9,7 +9,10 @@ DEPENDS =3D "binutils-native elfutils-native"
=20
 inherit native bash-completion
=20
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz"
+SRC_URI =3D "\
+    ${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz \
+    file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch \
+"
 SRC_URI[sha256sum] =3D "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab4=
8516bcc1befbcd83"
=20
 S =3D "${UNPACKDIR}/linux-${PV}"
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdisc=
arded-qualifiers-under-C23.patch b/meta-oe/recipes-kernel/bpftool/bpftool=
/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
new file mode 100644
index 0000000000..76b9aabb54
--- /dev/null
+++ b/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-q=
ualifiers-under-C23.patch
@@ -0,0 +1,69 @@
+From ab21cf885fb2af179c44d8beeabd716133b9385d Mon Sep 17 00:00:00 2001
+From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+Date: Sat, 6 Dec 2025 14:28:25 +0500
+Subject: [PATCH] libbpf: Fix -Wdiscarded-qualifiers under C23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+commit d70f79fef65810faf64dbae1f3a1b5623cdb2345 upstream.
+
+glibc =E2=89=A5 2.42 (GCC 15) defaults to -std=3Dgnu23, which promotes
+-Wdiscarded-qualifiers to an error.
+
+In C23, strstr() and strchr() return "const char *".
+
+Change variable types to const char * where the pointers are never
+modified (res, sym_sfx, next_path).
+
+Suggested-by: Florian Weimer <fweimer@redhat.com>
+Suggested-by: Andrii Nakryiko <andrii@kernel.org>
+Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+Link: https://lore.kernel.org/r/20251206092825.1471385-1-mikhail.v.gavri=
lov@gmail.com
+Signed-off-by: Alexei Starovoitov <ast@kernel.org>
+[ shung-hsi.yu: needed to fix kernel build failure due to libbpf since g=
libc
+  2.43+ (which adds 'const' qualifier to strstr) ]
+Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport[https://git.kernel.org/pub/scm/linux/kernel/gi=
t/stable/linux.git/commit/?h=3Dlinux-6.18.y&id=3Dab21cf885fb2af179c44d8be=
eabd716133b9385d]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ tools/lib/bpf/libbpf.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
+index dd3b2f57082d..9c98c6adb6d0 100644
+--- a/tools/lib/bpf/libbpf.c
++++ b/tools/lib/bpf/libbpf.c
+@@ -8245,7 +8245,7 @@ static int kallsyms_cb(unsigned long long sym_addr=
, char sym_type,
+ 	struct bpf_object *obj =3D ctx;
+ 	const struct btf_type *t;
+ 	struct extern_desc *ext;
+-	char *res;
++	const char *res;
+=20
+ 	res =3D strstr(sym_name, ".llvm.");
+ 	if (sym_type =3D=3D 'd' && res)
+@@ -11574,7 +11574,8 @@ static int avail_kallsyms_cb(unsigned long long =
sym_addr, char sym_type,
+ 		 *
+ 		 *   [0] fb6a421fb615 ("kallsyms: Match symbols exactly with CONFIG_L=
TO_CLANG")
+ 		 */
+-		char sym_trim[256], *psym_trim =3D sym_trim, *sym_sfx;
++		char sym_trim[256], *psym_trim =3D sym_trim;
++		const char *sym_sfx;
+=20
+ 		if (!(sym_sfx =3D strstr(sym_name, ".llvm.")))
+ 			return 0;
+@@ -12159,7 +12160,7 @@ static int resolve_full_path(const char *file, c=
har *result, size_t result_sz)
+ 		if (!search_paths[i])
+ 			continue;
+ 		for (s =3D search_paths[i]; s !=3D NULL; s =3D strchr(s, ':')) {
+-			char *next_path;
++			const char *next_path;
+ 			int seg_len;
+=20
+ 			if (s[0] =3D=3D ':')
+--=20
+2.34.1
+
--=20
2.34.1


