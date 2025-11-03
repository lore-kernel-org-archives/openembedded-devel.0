Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BBACCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 13:57:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21173.1762178225151479980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 05:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fIktFhzI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3402012cc0=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3CG6Lt937745
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Nov 2025 05:57:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rdd8zNN3SXi5c5SyPY9P
	Ijy2s6DrEYDtLj2+mEPXqdM=; b=fIktFhzIR2O6ZgWXyWAAhQR9OdSPco8sa0Bc
	8XJHVmimuCH1Fx41V4IIOmh/qteEav4jYSRaDfe1+fJpANHB2HqoX5Z+fp9+Q85H
	tM417cR1iTp29rNZm/vXWKmX5o1Wr84ZaU1d/jRIHPtaOpa47jkuihqHAK+mVOnD
	b/n7L7cvcb5HReONzGpfkwtTjA0kZ+Ki3BhwEF2b/DmuVpB79Uh1+6VMr7zv+WHt
	AAYdIxGzcdVXWX2WOIuhYNEwSro0DH2fPFt9ruuBd+Dml6aaDtxLqAnHrhthLWBp
	0IzYvCoRyWzE3ohjSkBRvkxDs2Eu/aalUR4rz33dw714/AnO/w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011035.outbound.protection.outlook.com [40.93.194.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a5hqehjpr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 05:57:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxfdqXfUAIlqqAn8Keub5R5pNw0ef2Dx1QoQt7OYGeIBGKaV5mLeHKzXF+e2PZ9IJeFlRBbDmcYic8apEqGtRbWMo8UNHdun3T8yYhvQrSemdycKkbO5nvEx0Zhh7OseWXB0WEKP28qHBcNumMB26LYZ99AMexWT9pkbNZxAhApUizVKKNZ9/XMbrX2p0Ik7HJ7BnFdXDzyrOFkRWfSH58H3kA6HaLB2yHYLQATyUrBB4rNiXERN1Cn8RHZg+WwXy7wKwwJygZZ9tNO5SGyIFXSxyZqVmDVBMpTPSmpxPOOXYoWzrdpskgp7t2lO9JmB00RYVz+VyKM1omgCuaUXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdd8zNN3SXi5c5SyPY9PIjy2s6DrEYDtLj2+mEPXqdM=;
 b=MoAVwAHKktmW3eCcLzpdbnrn2CknnKAun+r8ik7X2K9+PPLNA2iozMl9w2XEh4pqHbZ2SY0poYHbtDi6R2LmXf1TfKrqh8C7+BEay7YTvg8OfWvP0z0vGnR2l5RwCkJt06lrfhDF7MZkp7b+g7DZxUUGe77nx7MCP99+Y1shMCM2ExeEtBPYya21Nkm8Ko36/4XoxTN9TDnn4kAfSfJmoJ35sF5+SVg9hoWi3lfh+XuEFzrmDSzAbifusP+VS49h7Eg05eMEmWq3WexEY49E1laFdTyd1yv/TCxEfxKaiqfirP/2xUITjdwJTEKA4a1KaLrnspJAeBUZEJGmUj5EkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH7PR11MB7664.namprd11.prod.outlook.com (2603:10b6:510:26a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 13:57:00 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 13:57:00 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] python3-m2crypto: correct struct packing on 32-bit with _TIME_BITS=64
Date: Mon,  3 Nov 2025 21:56:44 +0800
Message-Id: <20251103135644.1370270-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::13) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH7PR11MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 4380d54c-df9f-419a-d96c-08de1ae0dc57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UiFh2KUOK4/p54dMuvKqjVyxcZ6TCay27zCjleaKV0qlHBGySqZaNU2nZP+U?=
 =?us-ascii?Q?x7ArXG7iyee1xgo6UFQDb26uv7aQO3SRjfY8wuWpRpXheiYN70KrrRWsXqeA?=
 =?us-ascii?Q?AWd/xtCGfBlNpEFXjUwGEmCZbQur+21d4qBniCP34+YpLSlCDMCeMe3fW2rE?=
 =?us-ascii?Q?y1kzt/+YHDzhhJRVOIq2TxlICTAvVshW/sK2cCK/Ahi+ZPoEPLoMywjixS4M?=
 =?us-ascii?Q?1NLfDjWr5tJSY0+27lxUxoMPdPr/EZKiS9+Ti9kDpAyl8YdEyvmS/ZzsOxe8?=
 =?us-ascii?Q?8nDmn5G9Acs8Y1ffHLqqcCui8Hyi1F/NS2DuqtH6L8ui6bxjHs/1HyJue/8A?=
 =?us-ascii?Q?VbfpBcjXoN7Z9xBM4AWicOdZjHCU+hq4wmknCWLWUetIzNgH7iYQ9AozDV9A?=
 =?us-ascii?Q?2RQJcBrY7bM8iiSJl5xiPQi4ACwJj5dRJEdXoaqmW881rufCPOIPQ/CrpDGp?=
 =?us-ascii?Q?RFDHkzfCNukGNqi8146ipZbLC+L2tVUsR4zt5MV/0dHbv8jwlCPBqDmwxUre?=
 =?us-ascii?Q?LgzU62YFZ+EhQaToOVyiSD2xG+VS+tsLhM7b5a66o13cEBNLlcRWarWXRWE1?=
 =?us-ascii?Q?/ReVaAoHp+r7xEva11fIATp512N9Cfcmm37rK1d9Fi7yw6zlnJ1ggeeam+Zo?=
 =?us-ascii?Q?d/1WWgIGRZTJrmH704az1/0VcK6t5owYCZpSBRNG68WNkIaSMJ2v78K4xVFA?=
 =?us-ascii?Q?k4Hmn6TlPiObqk5XR3PrXBIzOalvBZwcotgWgIsKtjq5Comcjcl35MnC1NFI?=
 =?us-ascii?Q?XyJ5iUS5IMO8mJYVuSIW0M4tLS9D4VAGsm5TrYFKIpYpbGTEMU+2OkuZB9hT?=
 =?us-ascii?Q?ik2fbLixfVueyrp8/2SG4cPY3SBtO+R8bsVqLbkzTzY6yUNw9J30hIONQ3Fn?=
 =?us-ascii?Q?AuRilPSFFSsw6K2Hn5QIkg//6ixV/c61eEczuBojVR9GqQQQFEqiHvcF7lxq?=
 =?us-ascii?Q?koPtwnJaVzxHNbGw1ADrrwy3XrxWBLvFPbczSlXJnP0qnPN2KvpF++uO61+l?=
 =?us-ascii?Q?cTQeS1mmQiaMOx39oHxZN/kKhDsaV/siF7JQueda6pujRrkhsQU86ZEBOqc+?=
 =?us-ascii?Q?uKIdt/McUwdGnJR68fnjVBannJgRlaTf7j7yI6r30XYCmkd8lFIskMRCcLBH?=
 =?us-ascii?Q?PNtVP5h/RK72zSVMuNgBGZy0rP31AwXJbnL6If7lQclgsUcYjZHYqTuJe7FK?=
 =?us-ascii?Q?exQYTkk7fdQYr/BlIwx5YRRIswGgKBwdnssX/ZJFnydkwAd1bUzti89AfFhn?=
 =?us-ascii?Q?W2qW9BXinspfPJtdj2agZk6XMRmqXeuZcymPMTM6fn2sVPouTGJwqdmDhMg7?=
 =?us-ascii?Q?JB+6PiBIgj3aLYHDk/W2nqzHy4uHVLqDioW8HB1UhrVinMW5N9qlQCa0a+ul?=
 =?us-ascii?Q?JO3CrDabn+1w44SOroKnQlhb9+Oq3up78fxhZjuJc6P74Lj4oBovd1wyM0kn?=
 =?us-ascii?Q?u0dDGbnBgvfuIr9MEKx3KAi8k1HJJGucW7YMmyulmwvaUnogqwjlww=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?foBJnDJYDcBP33bx/Mnoqan38qkCOdsTC+YpZ018x1ls/H38FESnN4HQGdiJ?=
 =?us-ascii?Q?/q+7JL2ghKd921pjxgyRB7eONqiznuzQj1nWuSA5gSUUqKAIxF/XHt0VWJOI?=
 =?us-ascii?Q?OKhE00EqaOzKbn8RttzyqJs6i4xQ3kDwUkz1dBLMvsitZyksM0QspfAVNtKC?=
 =?us-ascii?Q?DV4wZZHtUI58HrRz/K2y/JI8PZhPF2Kxq0kk26b6okJKYqIJn6uLb5vXEAgn?=
 =?us-ascii?Q?DagA+qjaeMynQf8yQ4U3l3RC3VVTlP2grNsldTbLiEeuFrNkFXu7vnJamhop?=
 =?us-ascii?Q?4+Kczfftl236FC4uTihd4Jt7ahaEmDOgbxhoCp9LszkJbpPZ2h5n8sRfFm/Y?=
 =?us-ascii?Q?/fQpLrdjWvsN+dpkdOrmN353yQnVj4Uxqho+IeksviNGrPn3bsr4o4w69+6/?=
 =?us-ascii?Q?2hxNiUMbbUCqhZjt3/xic0kAyi5VNG49W7go7k4w1GxvEHVtWX/cRgdn7SG9?=
 =?us-ascii?Q?mzrVVUpB+IUiLzXnAuuSaSFsqw9orZwt54CIuIXeLVG0675fJmsgN3Ur/2Zi?=
 =?us-ascii?Q?vEMRMux6fx/x7MxOQ5D6fQRMj+Uux/tuFer9/5XrhwZAAzhM0wat81UWhqSC?=
 =?us-ascii?Q?d8C29ZSFaoW6ZZ9XoPByEVkjn59q27btS+rhzvENnMMWgba73ENX8vIFqM40?=
 =?us-ascii?Q?XdLLb4+wBorVe8ckMinENVoITc6xy6J7kk7Bs34jAnwmCDjO2PLIm5lKXsoC?=
 =?us-ascii?Q?IYnaeNYPyveIkftHZA8g/vC8vatp4EknhZKHiujvTK02tGfD3LR7r0psOL5C?=
 =?us-ascii?Q?k4avI2Cnsfui/jH4dfS1OhMy0J9nkZ3tI1wZqPB+ccwEe8XLDAQ44EpZJraw?=
 =?us-ascii?Q?02YH04zG0nErbB6Oz8rkMg6JHYiIlrd8VFCcIgpKEYRilRZv2TezufexVfjF?=
 =?us-ascii?Q?PdhYFHWiUr25MUaRtg8x0lJ+jeXKnxpY4rOORBS3Obz945H/NY1C8gS87HJ7?=
 =?us-ascii?Q?kg3PTV0micymHCw2v6AqKB+7dKrxz9mk2fwi69cjJEv7dgIC82J0AgXD2st5?=
 =?us-ascii?Q?icwBEFYkCx3DUyKtcdD4d7zp778Hq16AvoKIdFnJplKPmAtfR3kMmFjHPb1g?=
 =?us-ascii?Q?+JIgf9qfwgyA5TOjr+CHt88xuDiwFF75woirHYB5ZFXgel1Yfk/8o4HbCko3?=
 =?us-ascii?Q?rDx/GdMje9Jn9Fp+ZUfAkdk2nvtiIhlkOZf018S4jCk+Ic+nGA5PlX7zgf2r?=
 =?us-ascii?Q?/XrjGVK/yrnm6C0v5zDsroDeLOXhxW4j87fsMXUfTLCih94ZdHI/OqtvlVoX?=
 =?us-ascii?Q?QL/nInCK3/6QbZiczMd1d/POz9TTCeLvcanv9ZOFWRp3SLf4rHUzuFnkJ6x+?=
 =?us-ascii?Q?XGsxIK7bFWJ/2oLMIbnxxHUh9hfjFjXOdhIekZ//NoXvrlqBciSVrPuJvpm0?=
 =?us-ascii?Q?PkQx9KjPuylULx7Glu76b+qb4HKrzchjjZRb1Ytr3FVmRaYV4yQU8a6TFO+s?=
 =?us-ascii?Q?HfXh+644PBwmD3TRvJ5GFJhbK+dn9M38Jzfy8C/A87Mvl8nOwSRVnn7Mba1l?=
 =?us-ascii?Q?sfHNGP6xzlcIicLJeIAXXk5NjMncsXaLS/d+C4Ie0YVAopxsZu7NzDgIE2HB?=
 =?us-ascii?Q?e965tviKJk75v3kTRJ1CANi3C1CqOw5vpsJKcHz/H0+t0ZfwePZFMLxz9CRF?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4380d54c-df9f-419a-d96c-08de1ae0dc57
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 13:57:00.6534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULJPa8fz9TK7c253dJepvfP6uXaJGJA0xG748Kb/dPY1NNW0mSxNndoBk5Kcwg6Ddf06jA3uUdG7w+9GLzZ4a39JdqsQt/xkj3InS9CMYN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7664
X-Authority-Analysis: v=2.4 cv=HJPO14tv c=1 sm=1 tr=0 ts=6908b4b0 cx=c_pps
 a=ALJIVG5iHo/ZE5SKMfQyZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=bwGbKnmsAAAA:8 a=t7CeM3EgAAAA:8 a=9bvMihcPMloT5LnCeeAA:9
 a=nuVVIWbBudwLbAahYuja:22 a=FdTzh2GWekK77mhwV6Dw:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-GUID: ofa7EI3Ub4lfV90VJ0nQr57LDYtTac8N
X-Proofpoint-ORIG-GUID: ofa7EI3Ub4lfV90VJ0nQr57LDYtTac8N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyNiBTYWx0ZWRfX5fpmYmTtaXS7
 u1Br0qpORB/xwXztNN8bf9jdK/yDIFNXA97may7F7vmaRszBcKCmmEACz01cwQ1UGgZTJmTnymP
 M1lOHcOoT+S2PW8EmqKlul9OyFlmju0tj0UbM1JteKfr2AwLOAPPjwHGcTjZLHol+I9yBD9ArXj
 gcHjx3gA0AfvUraDYsbSCiwK0Js3mo/QIYLHYphj5h+tvGswpo09jVSNe+FbLoPE2TeRQjNprpw
 alg/XJS0VaOEz89pE9EaF5RyD0pRjKCQ4dBET3G6UhAdfjG9Uy3xPcXexW5ohRwI2A9u+qm0jwV
 FKgzZbl4vVyxCz7hzZH/haoVH6AasbHZYSOpjCT3aIdk4rMAKYx3alF38DwlR4uqa7hoN1sfOJ5
 n+tFYX1bV9cuKv8GNMdupJSskKXPtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030126
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 13:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121274

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fixes:
   # python3 -munittest -v test_ssl.MiscSSLClientTestCase.test_server_simple_timeouts
test_server_simple_timeouts (test_ssl.MiscSSLClientTestCase.test_server_simple_timeouts) ... ERROR

======================================================================
ERROR: test_server_simple_timeouts (test_ssl.MiscSSLClientTestCase.test_server_simple_timeouts)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/opt/python3-m2crypto/tests/test_ssl.py", line 474, in test_server_simple_timeouts
    s.set_socket_read_timeout(SSL.timeout())
    ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/site-packages/M2Crypto/SSL/Connection.py", line 680, in set_socket_read_timeout
    self.socket.setsockopt(
    ~~~~~~~~~~~~~~~~~~~~~~^
        socket.SOL_SOCKET, socket.SO_RCVTIMEO, timeo.pack()
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
OSError: [Errno 22] Invalid argument

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...-time_t-on-32-bit-systems-in-test_is.patch | 40 +++++++++++
 ...ct-packing-on-32-bit-with-_TIME_BITS.patch | 72 +++++++++++++++++++
 .../python/python3-m2crypto_0.46.2.bb         |  2 +
 3 files changed, 114 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch
new file mode 100644
index 000000000000..d49950074f6c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch
@@ -0,0 +1,40 @@
+From d123b4ddce99c44f2c290fb3d6cc887de98778e6 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Wed, 22 Oct 2025 15:23:56 +0800
+Subject: [PATCH 1/2] fix: allow 64-bit time_t on 32-bit systems in
+ test_is32bit
+
+Some modern 32-bit Linux systems (e.g. with glibc >= 2.34 or musl time64 ABI)
+use 64-bit time_t by default when _TIME_BITS=64 is enabled. The original test
+assumed time_t was always 32-bit on 32-bit architectures, which is no longer
+true.
+
+Relax the check to accept both 32-bit and 64-bit time_t values:
+
+    self.assertIn(bit32, (32, 64))
+
+This makes the test compatible with both legacy and time64 ABIs.
+
+Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/818c3dfda6ea]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ tests/test_util.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test_util.py b/tests/test_util.py
+index e925d03b090c..233fb7a099d9 100644
+--- a/tests/test_util.py
++++ b/tests/test_util.py
+@@ -26,7 +26,7 @@ class UtilTestCase(unittest.TestCase):
+                 not in ["true", "1", "yes"]
+             )
+         ):
+-            self.assertEqual(bit32, 32)
++            self.assertIn(bit32, (32, 64))
+         else:
+             self.assertNotEqual(bit32, 32)
+         self.assertIsInstance(bit32, int)
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch
new file mode 100644
index 000000000000..c36afa5cc0c1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch
@@ -0,0 +1,72 @@
+From b5dbfca23986429853ccb15a38cc526d9df0dd40 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Wed, 22 Oct 2025 15:23:57 +0800
+Subject: [PATCH 2/2] fix: correct struct packing on 32-bit with _TIME_BITS=64
+
+On 32-bit platforms with glibc time64 ABI, time_t is 64-bit wide while
+`long` remains 32-bit. This causes struct timeval to use two 64-bit fields
+(tv_sec, tv_usec). The previous code incorrectly packed timeout as "ll",
+leading to EINVAL in setsockopt(SO_RCVTIMEO).
+
+Use "qq" instead when m2.time_t_bits() == 64 to match the actual ABI.
+
+Fixes: https://todo.sr.ht/~mcepl/m2crypto/374
+
+Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/473de659f78e]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ src/M2Crypto/SSL/timeout.py | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/src/M2Crypto/SSL/timeout.py b/src/M2Crypto/SSL/timeout.py
+index b45f38b1cbdb..5ba52283b6f8 100644
+--- a/src/M2Crypto/SSL/timeout.py
++++ b/src/M2Crypto/SSL/timeout.py
+@@ -33,10 +33,14 @@ class timeout(object):
+             millisec = int(self.sec * 1000 + round(float(self.microsec) / 1000))
+             binstr = struct.pack("l", millisec)
+         else:
+-            if m2.time_t_bits() == 32:
++            bits = m2.time_t_bits()
++            if bits == 32:
+                 binstr = struct.pack("ii", self.sec, self.microsec)
++            elif bits == 64:
++                # handle both 64-bit and 32-bit+TIME_BITS=64
++                binstr = struct.pack("qq", self.sec, self.microsec)
+             else:
+-                binstr = struct.pack("ll", self.sec, self.microsec)
++                raise ValueError(f"Unsupported time_t_bits: {bits}")
+         return binstr
+ 
+ 
+@@ -48,7 +52,13 @@ def struct_to_timeout(binstr: bytes) -> timeout:
+         sec = int(millisec / 1000)
+         microsec = (millisec % 1000) * 1000
+     else:
+-        (sec, microsec) = struct.unpack("ll", binstr)
++        bits = m2.time_t_bits()
++        if bits == 32:
++            (sec, microsec) = struct.unpack("ii", binstr)
++        elif bits == 64:
++            (sec, microsec) = struct.unpack("qq", binstr)
++        else:
++            raise ValueError(f"Unsupported time_t_bits: {bits}")
+     return timeout(sec, microsec)
+ 
+ 
+@@ -56,4 +66,10 @@ def struct_size() -> int:
+     if sys.platform == "win32":
+         return struct.calcsize("l")
+     else:
+-        return struct.calcsize("ll")
++        bits = m2.time_t_bits()
++        if bits == 32:
++            return struct.calcsize("ii")
++        elif bits == 64:
++            return struct.calcsize("qq")
++        else:
++            raise ValueError(f"Unsupported time_t_bits: {bits}")
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
index 0a631c7a07d5..9aac7b344fb5 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "13c2fa89562f7b8af40cc74b55f490be5e2ab8ccfb739f11c16d3ce622
 
 SRC_URI += " \
           file://0001-setup.py-Make-the-cmd-available.patch \
+          file://0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch \
+          file://0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch \
 "
 
 inherit pypi siteinfo python_setuptools_build_meta
-- 
2.48.1


