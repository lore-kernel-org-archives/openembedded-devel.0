Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACE0CA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9574.1790856346448975732
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eCHYwK9i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6918Elw7955840
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 05:05:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=nDuz+aSW18l1bN6QE86YKVAVcdnf7oqisX6B/srkvpk=; b=
	eCHYwK9ieXG3WzzmirkWSCuHvNrrp8CRx2BJbFMdsKX91jmpJRVDFKyodGEYblFq
	I2Chjq9In7/L4pYafWZhAuVSWZDoSNIlNcDs5WecO/ftbcVPLjhYj3fXCpt0zK1k
	TWKcZR2+Wxsv/aiDttacchxlhjZOgedMLKkS2CcUmMNBpkAYEncvYWgCEw7ZXEGl
	+zIgiQudhI9tnTDrEwSrBBPOmOUIK9z7qTwNdLWtkrY7Zmfp8amhgo5dxhlbk8ju
	Z7rCbg9zrd2qjt4AnQ51ayzyIohifAO98/Tq5YTfLSuNrVdMnlXgoOuGFRAlzFQ0
	2+/YURSbDBpkGxtMRnNJzQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021111.outbound.protection.outlook.com [52.101.62.111])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1ku8gasd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 05:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihjPtM/Lf2HUzAwJE7t0son4CPdK6vutyhxTB0oAfr31aNFrMaxX7S1YX/GRQOiSn3TS4Ysbhh4qXfLwzQNtNbmyTTGO95M9RQ/fklbLQ1I018tRE+JcWWqZHZ8gGMC9QnxOCRAZZko5SKHTf8jwOPEPR+JH7SrepAGzSBC+5IsMvc4vJhuywz2EquX+cUGQo3ckmJ+HxOZzt0qMKgCIr80HxwRKgI0kB86r1Exla10WTzzrltld7ZIpcH9B6m/YsQQXReJC9/lN4rvdjvy8OR04jMVArzBtj8ZniCYNZqBt2pBCyE+xZQjNJbqLC75RVNbRlptLwWy/SB/8fnBEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDuz+aSW18l1bN6QE86YKVAVcdnf7oqisX6B/srkvpk=;
 b=bVd7fUbXcttC9bo5++HgXeU67nksF8/IYwGdBmnePjctDkS3afUUPvVKlQBNnhGEg4i9mSIxKmD/TNThS7tOX16HBkSls1u4uoKY2/7C8ntYjBDLNGbD8QoKvUsb4q0M/Hjbvkob+h1PG2LmVMxQ7VWNXKCMsanp/JnXxHdvoziYvf4e0NrdBeHBlwlDNv1Sz2vcrrx/4dy8V5ZM5xGYW9wZUDK6QhxGvY7F9mmuuyInZKVMy3KvLHkEV+mWpK52yGK89Rt9ZXCO1FexlGF4rW+o5FJh8ABUZB6AErvE2wKdEXQ6SetaKtIw31BB/P1swo6dbZ0FQFVynIKH6dtx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:04:53 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:04:53 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 05/11] strongswan: fix CVE-2026-78129
Date: Thu,  1 Oct 2026 17:34:11 +0530
Message-Id: <20261001120417.1280843-6-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: af3a1aea-0cff-4b69-e8dc-08df1fb4338b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|3023799007|25016099003|12006099003|6133799003|29003799003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	h6Mnr5OBsOmyQr5biUiGNFp+2Edszr+eqwCsfFCFGyonPscPr+SbE57nLbf8+zUXuC+kC1emCQM6lILmzAgy8UQ1wdACdbyLajk4GaWQSEUvXoex+w/0bnK0tido5jTjdn3MPHmuoBezNVOpM5GsuggHz2VYtj9rOYL4na2BQrpzKpulP2atTLIzGN+HJJvZmIkGkgerHqABsfV4RJYL9tXQCYYBvS3l3WDqPIFfr1bspsZS10UjAOOfA4PV8NBGISpdVU7PEpJJCVvORoddNrLjgo3S531arqCRelvi8a3f2EkL0899t4aIX4cv4d0Drpw5dv08u8OmkUMAGRB1vuyaeJYs0yUO2C4OZbBmOmzfttw/qOLbQ2Pp3HHYMztiPdpc83Qf1mA8nvXoPCWcTNeeiD//TXtHU8jSqNVCyTQogqS7LcdjCNiI5JA1jVaa6hdlisSj2HLKpuNcql+u3GdWJY5opq7vxGAgiNIqP7u8S4GgowagXEliDYx8vfC/IIp9EVEKjmOoi3ZZHC8btKGYiu7gv6/6YwCkXYyD+LVptJnr6S2sq2OwR08WcqJ0xGFVGYysWg7Dudu4d+3dkzhgkqcn08LtB/rShvNBL7+eDzBJ598qLbzWPIh91Gc4JLSsRz5Lro+PcFYXGIihbblCIfAtuCqTZGm9ns8hpY8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(3023799007)(25016099003)(12006099003)(6133799003)(29003799003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bG5yqIaVC7c/JL4Iu3MsKhaY0S2diLlrUK+PA9oKZ5osDvG/56dT1RMsQwE5?=
 =?us-ascii?Q?PL1Ch9RVlDhr3IuOea7twAikNmv26oa5hODoeoAROqtewjTlJoq46395OHxi?=
 =?us-ascii?Q?reg/Ul2VKnPKCo9PWJXKriZRNIVtP5/izrk/EWG+v67NgjLVphWiidSRKUrZ?=
 =?us-ascii?Q?iX2aopb0hEVVWOt2hqwvmDDE1Jxod53SErF6RoiXLL7GQB3vGbE5buC5c6Oq?=
 =?us-ascii?Q?KTce4b0PcnCRhUWlT9xqLOYseRh/0T9AMVk0logMluhSUnR89+6XJzHk4dGE?=
 =?us-ascii?Q?ZMtX7KGOAjG1D1kKINy0LbEYhQ8q4piZVAuiN+WBmGO0toFVzml6RNWOZeLW?=
 =?us-ascii?Q?KwInCySwL5DbJ/Vz0E5KbzMkaz8uT3ykgZut22FHxv7FpfF5kMyXMafJJBla?=
 =?us-ascii?Q?pY0piGsFoCNcS122LCLPsIly5F9unH1yYQYXFQTXaJA77uKQT4WXNhXCKlac?=
 =?us-ascii?Q?EGf2vLgUCGzKsNsavPcEgZKhWpK0noLWRXbywDRiTJQXbmVA6EGF9pxe8V26?=
 =?us-ascii?Q?san4kIBxXOgObkmVGEwK7AnwVuyKe7PJ4BWAhtB8HquAIvgGc6LLhpIm5Kqh?=
 =?us-ascii?Q?gfrNPwYuEo8wv7aa1PjI3B+vbVV6+EI8pHzW0vw/KI8esb7Hv5oNU8FzSzf8?=
 =?us-ascii?Q?iW55IRqi15t09Y3sbtqzVUygUpf9kjwzkuzsBo6GqbKaCGDmo1/yxV0JNQQh?=
 =?us-ascii?Q?QESOCxHnXqdrrIObqPp+D83Y1E8w7c7AOqhV9smDRb2zaloOYXz18+ol3tNg?=
 =?us-ascii?Q?Lo33Sm1Qf5f1x9Fj7n9hxyxJR9MBHn8aUNHKTDTf1V+IurWgPSGUm36CrtI2?=
 =?us-ascii?Q?ck2P1SkCG+C8GahHEgITSAQVDKzV4PYHupdnvvProY5knLBt6HRnocj/forJ?=
 =?us-ascii?Q?d8ORp3e36husR7CTtfAZmxVsfgZkvwS11AnO4q8c9H6pkqzR8vpQsOBkMQOx?=
 =?us-ascii?Q?lc1tDvlzIDEkxWDYYBzK9BOSBM7KWyyqmxL87dfEVv01zxYzGcUoyHuz0L/G?=
 =?us-ascii?Q?6pgvRo6sAhUeIAxoRHVo4Bde20goWqKSg+1gYrzEFSFFzbyaoLhjqYjMWLtO?=
 =?us-ascii?Q?BecAiDiC51D/jUGCoALZHE7noSNSwZTLj3PJMg61A2+2GutV6vbf7kNX9bKj?=
 =?us-ascii?Q?iH2C4PQx4DeBKXvHbRK+v6w0svyoqqIFFSbPwv9yD83HjABQnnPXMVPgx2BH?=
 =?us-ascii?Q?XMgX86dzfA65Eeg8Rk1g5/Rion0zl7CX0YS2E/XxI2aEK9s+wsGRbISb3v5e?=
 =?us-ascii?Q?7Pu8fQLxQ8uvODlMQXZpj/x0eEWBdM+LiUDY86OSe3em2O/Pgz70zgWt3ml/?=
 =?us-ascii?Q?lX2VFwNbZtSHY+u1mR4iWzA5zmvkFXnQPSZQuU3bSqakrav0G4jOmOjivrkC?=
 =?us-ascii?Q?9zxHvJoXEsY4Q0FzVa7nL8Jk8atofkcj8EovX1+jYbmtRGjomeAdNtz5iM3h?=
 =?us-ascii?Q?dplVUXp5Ivh0D0fUhOGEHGjckgpLZcTYddL3uol7V2ZizFZ8I1mq0bzUEhw9?=
 =?us-ascii?Q?B81ejY0JTn/VEmuO3phqjSGeSU0I4pqMVYdi+Yq6wSPQ5YAShPmak19dXZLL?=
 =?us-ascii?Q?EEBZWIjiTme2fYQUT9dcRtgX0JBx3Nnc1WCM8XRHA4cePzbGoRfw4lcVqQ4w?=
 =?us-ascii?Q?IJS10rQ8+cMNKW9asb1IaShmmF+q+C/qBqfqLuuxhv4MMpzA7pdaYB5XV5TV?=
 =?us-ascii?Q?2+IrRMoYuWZO6AlLIBmFp9Dzv2FxhhwDYyIluEGGjZdFIXf4VPOd754Y9fwY?=
 =?us-ascii?Q?nsG4qiisLw1z038JmpkRKLYIHp/b8i2KHD7jNaQAuFIIP1ikSJMO?=
X-Exchange-RoutingPolicyChecked: 
	tzqHa+qGMTIq0NUImQrGqa/Wulr/sYCOPNurbT+hPoV4IRWn+uP1OfTOv2c+ii5FotSctUT4g08GPFtA6DpSRlgb/zF2Ihvy/u6FZcZRvsbcaCRkUmK+bdoucvfO0p3j+GBJQtcwl7Stpr1lzHOiX/HjZvwLorW0WV28qpGHX5hi+e30rbMFOhknltXwZnR/fA66eNs0ibPGMwPdFK8Jxmzbo68p+DsZJLb4aXfFMuosb6BTPf1Y2kfpknqDhnuPUE5F7mZZgm02BuvZss9qdpFHVnqrxAkjCsuF5qHowwh2N6KJs6joeKwtJA+AcxarHXjkVsGixy+8ctLX+7e5qw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3a1aea-0cff-4b69-e8dc-08df1fb4338b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:04:53.1057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gajHKUVyHmhrp7N2AIWsrVgwVwvrAhMLaaVS9O4QvECGFCClhArr4jqq7LRgxTyPrAI5f3+6NNG3RLCNVb8MHOhcLR0q9iA3rw9wvwf3n5FTdVQ5fGJmwo91pYA0FZjI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6abe4c99 cx=c_pps
 a=pLVGl/zQNnluPJXkQhez9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=YiY5I2fGxHcONxC-_OsA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXxIRG6WWEq4EK
 04zDwzPPcHCDz4vJKwKA0Qv1IzHNRmm2zYMQpjS7SAw6LxF154Djw28SCJ5alMg8nHBqyw2TeV3
 neV3q8QLhq0ZaXbTfX3yDOAwCfUB3g0SK3bUmZ8+HLYF2IhY6yrU
X-Proofpoint-ORIG-GUID: 8v6SYXesfSWQMTV3pSWczB7Juz60Z34_
X-Proofpoint-GUID: 8v6SYXesfSWQMTV3pSWczB7Juz60Z34_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXzA2wQsjpuq0Y
 8bNdo1QaaUENGHu/9EmtA5qn3Q4G5ygnd+bIcxReUEmbTTwXM27lonVJgXn2jKGLJtylvKHf/1v
 4KSSgf74+ffmsv2dqL23xuuHQY+C+98XmLFA/MrRZq1Y5ceILh9Q51LMlhuwyTh05TtxgOwv2gT
 SzcP+eYxo32wdhtenyu7buJj/Gv5/NhCCDDm6Wcne/aDKMkNjWEaATY8V6gZLv2EyJ6VPntTAJC
 SU5YOlm7G1rhyUxOSK+DDwqqQ8CgFqqzXMJhusT6D2yvFtRmOaZCicJbxyNp+9LG3t3RxDRzdAD
 I+22peyByY51J/WEXhYztXEsJuPNXtSCFMWfQpR21zizUtKvEIa9GcAqSvGaAHWf83wJReh2oAx
 F9/idlK8r3hZHkcjXwknk6oFQKahAFDWnXnjnG2uSwDQtu+YAYNG0zZCcMNjX0ybVxohs+D2buX
 XoudvMOwj/gmni/DS1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130591

strongSwan 4.6.2 through 6.0.7 has an infinite loop in
PKCS#5 decryption.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78129]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78129).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78129]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78129/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78129.patch           | 157 ++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch
new file mode 100644
index 0000000000..9d18524ee4
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch
@@ -0,0 +1,157 @@
+From e7a3a51459e795136c249bfe83978b41d7d5ecdd Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Tue, 23 Jun 2026 11:55:31 +0200
+Subject: [PATCH] pkcs5: Validate parsed parameters to avoid DoS attacks
+
+With the unbounded iterations, an attacker can craft a PKCS#7 file and
+send it during IKEv1 to block the processing thread practically for an
+unlimited amount of time.
+
+As the key length is used for an allocation on the stack, not limiting
+it could cause a crash.  We validate it after parsing the params, but
+since `encryption_algorithm_from_oid()` only returns trusted key lengths
+that are lower than the limit, that's fine.
+
+The unlimited salt length had no direct impact (the maximum is bound by
+the accepted message size), but we now limit it as well before cloning.
+
+Fixes: 4076e3ee9121 ("Extract PKCS#5 handling from pkcs8 plugin to separate helper class")
+Fixes: fd1ff46f6143 ("Added support for PKCS#5 v2 schemes when decrypting PKCS#8 files.")
+Fixes: cab127cba66c ("Added support for encrypted PKCS#8 files (for some PKCS#5 v1.5 schemes).")
+Fixes: CVE-2026-78129
+CVE: CVE-2026-78129
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78129/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libstrongswan/crypto/pkcs5.c | 65 +++++++++++++++++++++++++++++++-
+ 1 file changed, 64 insertions(+), 1 deletion(-)
+
+diff --git a/src/libstrongswan/crypto/pkcs5.c b/src/libstrongswan/crypto/pkcs5.c
+index 822656f84b22..e01010b90ad8 100644
+--- a/src/libstrongswan/crypto/pkcs5.c
++++ b/src/libstrongswan/crypto/pkcs5.c
+@@ -14,6 +14,8 @@
+  * for more details.
+  */
+ 
++#include <inttypes.h>
++
+ #include "pkcs5.h"
+ 
+ #include <utils/debug.h>
+@@ -22,6 +24,15 @@
+ #include <asn1/asn1_parser.h>
+ #include <credentials/containers/pkcs12.h>
+ 
++/** maximum accepted length for salts in parsed parameters */
++#define PKCS5_SALT_LEN_MAX			128
++
++/** maximum accepted iteration count in parsed parameters */
++#define PKCS5_ITERATIONS_MAX		1000000
++
++/** maximum key length accepted in parsed parameters */
++#define PKCS5_KEY_LEN_MAX			64
++
+ typedef struct private_pkcs5_t private_pkcs5_t;
+ 
+ /**
+@@ -379,6 +390,41 @@ METHOD(pkcs5_t, decrypt, bool,
+ 						   keymat, key, iv);
+ }
+ 
++/**
++ * Make sure the salt has an appropriate length
++ */
++static bool validate_salt_length(chunk_t salt)
++{
++	if (salt.len > PKCS5_SALT_LEN_MAX)
++	{
++		DBG1(DBG_ASN, "  salt length %zu exceeds maximum of %zu bytes",
++			 salt.len, (size_t)PKCS5_SALT_LEN_MAX);
++		return FALSE;
++	}
++	return TRUE;
++}
++
++/**
++ * Validate that parsed parameters are in an allowed range
++ */
++static bool validate_params(private_pkcs5_t *this)
++{
++	if (!this->iterations || this->iterations > PKCS5_ITERATIONS_MAX)
++	{
++		DBG1(DBG_ASN, "  iteration count %" PRIu64 " is out of range "
++			 "(1-%" PRIu64 ")", this->iterations,
++			 (uint64_t)PKCS5_ITERATIONS_MAX);
++		return FALSE;
++	}
++	if (this->keylen > PKCS5_KEY_LEN_MAX)
++	{
++		DBG1(DBG_ASN, "  key length %zu exceeds maximum of %zu bytes",
++			 this->keylen, (size_t)PKCS5_KEY_LEN_MAX);
++		return FALSE;
++	}
++	return TRUE;
++}
++
+ /**
+  * ASN.1 definition of a PBEParameter structure
+  */
+@@ -399,7 +445,7 @@ static bool parse_pbes1_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 	asn1_parser_t *parser;
+ 	chunk_t object;
+ 	int objectID;
+-	bool success;
++	bool success = FALSE;
+ 
+ 	parser = asn1_parser_create(pbeParameterObjects, blob);
+ 	parser->set_top_level(parser, level0);
+@@ -410,6 +456,10 @@ static bool parse_pbes1_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 		{
+ 			case PBEPARAM_SALT:
+ 			{
++				if (!validate_salt_length(object))
++				{
++					goto end;
++				}
+ 				this->salt = chunk_clone(object);
+ 				break;
+ 			}
+@@ -421,6 +471,11 @@ static bool parse_pbes1_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 		}
+ 	}
+ 	success = parser->success(parser);
++	if (success)
++	{
++		success = validate_params(this);
++	}
++end:
+ 	parser->destroy(parser);
+ 	return success;
+ }
+@@ -471,6 +526,10 @@ static bool parse_pbkdf2_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 		{
+ 			case PBKDF2_SALT:
+ 			{
++				if (!validate_salt_length(object))
++				{
++					goto end;
++				}
+ 				this->salt = chunk_clone(object);
+ 				break;
+ 			}
+@@ -500,6 +559,10 @@ static bool parse_pbkdf2_params(private_pkcs5_t *this, chunk_t blob, int level0)
+ 		}
+ 	}
+ 	success = parser->success(parser);
++	if (success)
++	{
++		success = validate_params(this);
++	}
+ end:
+ 	parser->destroy(parser);
+ 	return success;
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 2ad92d3d97..06668fb19a 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78124.patch \
            file://CVE-2026-78126.patch \
            file://CVE-2026-78127.patch \
+           file://CVE-2026-78129.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


