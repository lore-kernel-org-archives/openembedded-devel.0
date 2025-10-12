Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676F0CCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 10:10:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16140.1760263815670912741
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Oct 2025 03:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FUiNWBJc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23802d874e=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59C9t1sJ2910817
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 10:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=hD4/XQV5Gg0JZmOV0JBg
	jxOTnDRXGw0YaiLexY3xzQQ=; b=FUiNWBJcjf9Gv5ZGch8LhM/N+uTBdGVmKJ85
	PLdvtuzztz3j0QBj4ouc4mGWdx50Q6eq4tKjBIw++libUHiOvWoHqrm1kf41aXlm
	z3kru8QAYB1u716rXtIW0bz4HXzaCFZoqpaX5zdUNgFO2jXMjTRCWy9hBWYm6UPP
	7DA94xL2EB1DxZ96R5ED/8orC2xkjvT0tnRMtotX2yHck8i7ANpjgiq8p+DE11PH
	bqtA9EkU1cFOuodbbZvZtGWE01oGWBE7d0u5qaz3g3eDLWWc5iCO0jMrU7DAFs5J
	GOBzs4Rz6YHZT2YrHcdBlHZ7a9zpWQ/WnbnKZUtdYCKB1K9v7w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qe768v97-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 10:10:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDU9xxh81H2xpHT/dQzCfVrvl6PEdYBVqjv6jYTuM/tA69S9dqrVoNoNAjGUGmHIahV9ilZ2wDq6DZsgHhYkjjxHa2CV8q/DCwiXKXz+WI6U0ABo4QQ9Md9A2WeqK23fJXxhte84w0c/m57dn7dLuJ9DsHRNTRKTVnDk2mGR8GW7eEs2VzsITRMeITOnL6lkCDaE3ikv5Hi9qv2CP3/AyXB/wV6L3ZgzqYdKAQQul3aUq17yxGjDQyPyKP0etQvR5tiFG0hpWQJjz3kRn+LaAsAKtNujzN7nP1rdlBdj7KVMCAtelt1V321ANsGO0+zYfKDGRkYZaiKZxcmBADNjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hD4/XQV5Gg0JZmOV0JBgjxOTnDRXGw0YaiLexY3xzQQ=;
 b=KAtK3fLsdGBt5HCDp3o21Ip+gS20jLFtqAIDzDavU2rM4584WVUqlBBjEySvzeKryC1APk2qOZmdhdf4OI5gmH5H0+4tQqwSmzaeYlJ8FIzVVPx7py8I3kn4cjO7tA9tIAOxlw5cGUfiMhCQ1wQqcSX2zwep3TsQAhLa3tE4kJRbuwpxTITGAj1eQBkfM4l5zqas2zG1sZM1ws6XeKK4uCG+vU6khZxy3Ovz5BLjNSSBFpJUjdm8U34bya4JN5XxU1634R+NHtIF/8DFAAPvvL+Rf2NXRCHXPdSjrpiVPqvK3nbaLL4hNRSMG62uLiEwmzKflNNcQ4mugE4vcFNGBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 10:10:12 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 10:10:12 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][walnascar][PATCH v2] python3-m2crypto: fix test_IP_call hang
Date: Sun, 12 Oct 2025 18:09:44 +0800
Message-Id: <20251012100944.1025159-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: efc148a5-15d1-4238-c5a4-08de097787f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TE+s4asNNrfOSka6sRXXncg9IO8yBVqQ+F9DTrgA8kgxay8N4PLZ655NxJzJ?=
 =?us-ascii?Q?K1WL/ZpYkmSBNNapIA45te2Wo2gqXc4reW26M9zJ970wIUNyo+DeslqduJxh?=
 =?us-ascii?Q?8MdZRt5ZrrruKhdeEh+OCpQTx4nqBstMy3Z+XfgyppZVK+W0+ZwqoY+dCu7G?=
 =?us-ascii?Q?WJE3xAfSk24Jo13Z1P2uhgCYx16xt3xxjijoxU8ANaIstxZ74Bje6J4I5ZjL?=
 =?us-ascii?Q?3EZpas7nBdid/SLwJSB4Na/905/Ars8DXqaf+4E0Th2t81+ETLizt58y2yzC?=
 =?us-ascii?Q?8Hj/bvDbJAc0T1d48XIjdSFjW+B3y4wqq4ujuske9NvB4nw5SskCLU63okDo?=
 =?us-ascii?Q?V77Cx84SzT1HH/zFL8qcFU+j4Ive7TTO/O8kHURWxh6uXDUAD5LGUS7D4f9e?=
 =?us-ascii?Q?R5JKvUb23Vwf9apQ+/2Ce8K6II4mWSTbPLdez7jFu0DzllwQ9hrxeI9aSSVw?=
 =?us-ascii?Q?Pr0tMjhPsSTjp8fdsevJnXCVGFArpltHkfiYQEYCp6/VvYV13PYB0QhW5S8O?=
 =?us-ascii?Q?CWFEs0EHECzsfxu1H/ji1JpuG357kpca4N2m9pxv81dLXw20HIX3HZezkF44?=
 =?us-ascii?Q?zK6Ho0DaHzjX3AmCTv7sGZbmVFOpav+Vl3pGol135ueOmjP49GGYtjLyS5jV?=
 =?us-ascii?Q?Bc5gta9P6kvOxXJlF6ceWjLwt4uXjV8BBQMEd6lk4zsnjVXk27QZk456aNmV?=
 =?us-ascii?Q?ngIMC2oLs4yAkd4+b4dmcxzCTKj/8ujdSyGh1S+5g+467/UkwGTXWI8tnYRh?=
 =?us-ascii?Q?wmTqKz+8zG3FJJV5prflQG7eG1mwB9gyn3SWRr6dHr0LoztgYBLxuNM28ovh?=
 =?us-ascii?Q?EPYRZGW3kFd/YPyI4TFEAVNxKuHDUtCzsR96wBpcjYevzw19XN0y8CNFvsft?=
 =?us-ascii?Q?h+am0YtWN+4j5/flN833V6RmSQWcl/KgDk+wCNBxWP1EtABc9cq1YWGfOPxz?=
 =?us-ascii?Q?sjhfoQ2ZwSW0ynxp4bUOv0umqqrb1Q1ci1bmq4kQorDkj+oCpnf3YFOmb7ik?=
 =?us-ascii?Q?vK/jB+W+YzFjC9Cnbb8kT8oIvyjBT39UzYgq/A6OK0a81cRWfjQKZ2Vh0984?=
 =?us-ascii?Q?nvbY+C5k7OvAf2FbG6MHSdfPEsDR6DvWcuQaUFZGgIWyHu6Z5dp229wnLubD?=
 =?us-ascii?Q?Yi2pNrGIE/opCFyTXT69FjWUNeP5aP0e9xsYGBggqwOsINucSfeftCxoRUz1?=
 =?us-ascii?Q?scyuEIYkEJP9wCaF5EwPUKkTU7+4ABqr1tVLuyrXFQFcm6h+TsxSnqIpmydC?=
 =?us-ascii?Q?mv+Vi3H8eYRh5/uvQFM2K42j3SNzv55eb+9yMNBbuPKFq22BG18Lqqbw7CQN?=
 =?us-ascii?Q?nZL3Z5wSDXBZh7ozdFeaPc/6QmTKujXCUsoi/0hHPzy55gUYJseexmhlERPD?=
 =?us-ascii?Q?Lqbwr1qkKPMfIZO7ZBNdga0qx20PPcciqLlooAmTd3/QcNc0MtBw8XvR1Vqf?=
 =?us-ascii?Q?j36TCERjF+0thnoHtpu7V+7XxHof4eK14M0RP61NGKhDLLkEhLmJ6A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QncJ+6Rcl1sQ1aDHAHBCWWG8lyFLs9SXsN9cvETVYRsWKVZL+vJWKS22ydTh?=
 =?us-ascii?Q?63S+pkFfqjznVOkqyx3Ow7oOjTF5Nn7DRIB+Sv5e74fYXgRgAkHa64FNu34T?=
 =?us-ascii?Q?WuHfY22HDj59t628fOXzptNh8Bt9yGpeFl7Hs4zRUFNMt+Tis+r1wxO1ex1L?=
 =?us-ascii?Q?+llP2cwZv8H771W1amxhKikaD7lxefvv/UMYDJPxuLAzCgtnUmzBguW6Mve1?=
 =?us-ascii?Q?DKhTIZdSSQaakh43xVvkzPotw4fiwJsSdiciCzbMYL65Lx3fXndrbQe+ixbb?=
 =?us-ascii?Q?lFiBxjaRBt7gkKomGUqOVm44G60tjof2eMVrnHS+lqwq0XAXrkJ2andQg2lN?=
 =?us-ascii?Q?nUvNo1ogt+wlPn+bQ7HncJdy2kujQ0MzEmA6cRyh7yul8tyd3CHKPa5dAVAB?=
 =?us-ascii?Q?Lf8afGRGv3Mf8pwD0RNg7ZJ9FvTM28w8qly7JAvNS5bUswoHs14jJeC6ikhf?=
 =?us-ascii?Q?kRcPTnt5OrPjHW6wUOf0weAHcS7wVnjMhD8fE/Ompy3jLMbU2ZwoY6SmXCoy?=
 =?us-ascii?Q?Sn4GbwPvUs5HcS183NTmXpZAdozJhFWKN6/z/fQjGtxK/3iDqIJaBOXRIi/z?=
 =?us-ascii?Q?LxwAOojikz7iSE9/My8YGFb6pp9+/U3GKZnRZIWg0x79uJvQNBDNl5XV7c22?=
 =?us-ascii?Q?Sn+Hc7IRIyJ/OXsaylFYX70KzndQEStME7qxCIAWSIKskRncZ3DHdoYfs7k5?=
 =?us-ascii?Q?K5xbjjmG5pRCiI2mAqpp9KrXwiu1Nm3V3vHW8oSDRjkV4WS77zn20wdwPOcZ?=
 =?us-ascii?Q?ReTxIT5Fw1USwbVFHqPBzp+s6RHVOi9FnYZnU2sMcwY67iJm/ThdgABZlvOD?=
 =?us-ascii?Q?AhP0JarkXHWgUOVIgkrJxfXewAo6+wRgRb1HDNL4KQpPmIFjzv1gUxQmYlbu?=
 =?us-ascii?Q?+PJRPoQ+dPgUWxjUBSUFq9kA7eHqxIDqy+eYJW6YOgF25zZdYTNSxOzDkG67?=
 =?us-ascii?Q?JzWfFNb+iFLxHIQ5cCX3UdopBtZzWPFbq2NiqgDqFj3SvcdoF6QUfhO1ilkV?=
 =?us-ascii?Q?CdpRIFoMppMvRpHhnnRaAfpe+kXTvWTcix2zPwl6LZXoLePEc2nUOYSEB7Ej?=
 =?us-ascii?Q?kxVEwlZ6TXZfRpyj1RI5kJMtHWYaQbcRcTi+1BuwCxV4NLJlaoKQHVl1LRy4?=
 =?us-ascii?Q?38ZIbPpXvENVKkZ4ot1OmMg9vDMqo4jg5fVyfHNOHoSqMpjPA+8HG1fUiIFV?=
 =?us-ascii?Q?MrpPpXmp3rzGoZNozOyZnLqXQeH/EvupFV6DkBma1ZZ0bNm3e2c/YIO4LUBI?=
 =?us-ascii?Q?AXVWW50EpP7iq7XSt5VI0ww8In+OTrNcPWJkRlyQ6SXE7jo4qEsCPjuJQGX/?=
 =?us-ascii?Q?3pdM8uIHDHRJAP60p7DpWf24wAACTpdjRcYlNAFuiREnv7WyQty1QPVfj0aq?=
 =?us-ascii?Q?hVMIxuC2EKdkTZjI5vUcxx3+0BlfweUaojdeXptRjAJKawT8aJpRaeUUVwew?=
 =?us-ascii?Q?22tAjd/ZiUASClBe2Nw+QS9+KJqjWAqd5WcxZX+BOVd2YzX/4f1BXv9VJ1+A?=
 =?us-ascii?Q?pd9cwD27q5rWKXo0idveGCpu+r1+BO046JOW2C2Rt+5pFP5ygnpDqyAPV6QQ?=
 =?us-ascii?Q?aOZx8TLXafmyfZ8wTFMsdt6qKjwrJDvTEl1s6SGkTrz7VWLv+x4UUONY4cWf?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc148a5-15d1-4238-c5a4-08de097787f8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 10:10:12.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Zhys5o6Co7ACRoGiiXVqJlXwHC+RdqWD1YBCAGYCPsvZJY5ZbgyhvldkAhwOhpmoMbYdnWlT3iLUxb3USm1ikqqP66EWKnMxa7g6VWRHdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA1MyBTYWx0ZWRfXw2d5l2h2MUO+
 uw38xazLvC6zj/mhU/bRysYdEGMqboYc6/XsRGAy23L2bcDszt8SPZHiEryxkLhceblIFsps8XE
 wq+mvDoRGxBFhQ07Bl0Qw4/9HOXzUvT/k/mHaUAQFcqU0aYYx83Es6n9WBGreYQnNnYv+Tioa7v
 JVyeymvR/uoEoIALeNJyayWlgSvk3UvlQlbbOLQoGJ5mgzEnNe6Oaay5G4SaoJsSfTBvRmbPbBB
 YyoBKX79WKzT6lG8ItSVQ5uu7Hf6nUQZi/vwW/H/7MieKjprZIIcPLl0eihSnR6M3j58A6wtfBK
 02i2mZmj10nkgivhqLilq9FNo001AtgN7VJrdH4aHFlSBYS8ISgPN3WOcUc+Vh2x2SPhEXoVP96
 38EoWug5btM/D8EneF7oA6blLMeeyA==
X-Authority-Analysis: v=2.4 cv=E8vAZKdl c=1 sm=1 tr=0 ts=68eb7e86 cx=c_pps
 a=Et1EcG/LeKhR1br1BBFfMA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=0SJgDBd8SxgA:10 a=x6icFKpwvdMA:10 a=xNf9USuDAAAA:8
 a=bwGbKnmsAAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=wT9ZScjMB80q3_kr6UMA:9
 a=nuVVIWbBudwLbAahYuja:22 a=FdTzh2GWekK77mhwV6Dw:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=6_D5ljFcL1GZDUJyZucp:22 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
X-Proofpoint-GUID: RRBH_DxmVFFqg0aTgqJhRBPo9ULue2V9
X-Proofpoint-ORIG-GUID: RRBH_DxmVFFqg0aTgqJhRBPo9ULue2V9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510120053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 10:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120519

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix the following test hang:

test_IP_call (tests.test_ssl.HttpslibSSLSNIClientTestCase.test_IP_call)
...

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
v2: fix a typo in the title

 ...01-tests-Don-t-pass-debug-to-openssl.patch | 57 +++++++++++++++++++
 .../python/python3-m2crypto_0.44.0.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-tests-Don-t-pass-debug-to-openssl.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-tests-Don-t-pass-debug-to-openssl.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-tests-Don-t-pass-debug-to-openssl.patch
new file mode 100644
index 000000000000..2507d32912e9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-tests-Don-t-pass-debug-to-openssl.patch
@@ -0,0 +1,57 @@
+From 8bd51ee831e13412fda63c7e5ae8a74f8adc89f8 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Thu, 8 May 2025 18:46:37 +0200
+Subject: [PATCH] tests: Don't pass `-debug' to openssl.
+
+The HttpslibSSLSNIClientTestCase test starts "openssl s_server" as the
+server side and passes `-debug' as one of the arguments. This option
+increases the output while its content is not considered/ parsed by the
+test suite as far as I can observe.
+OpenSSL 3.5 (currently alpha) added post-quantum hybrid key agreement
+support. As part of this support keys for X25519MLKEM768 are sent during
+the client-hello phase and not just X25519. Since the keys for MLKEM768
+are large, the client-hello and server-hello messages become
+significantly bigger (since now X25519MLKEM768 is now supported on both
+sides). This in turn increases the output generated by the `-debug'
+switch.
+
+The output of `openssl s_server' is not consumed while the application
+is running but cached in the PIPE and consumed after the server has been
+terminated and the output is parsed in self.stop_server().
+Due to the big increase of the output due the additional keys the
+`test_IP_call' test stalls now because OpenSSL's write to the output
+blocks until the reader consumes it but this is not happening until
+after the tests completes. So the test stalls.
+
+The additional content generated by the `-debug' switch is not important
+for the tests. The `-msg' switch is used for hostname verification.
+
+Don't pass `-debug' to openssl.
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Bug-Debian: https://bugs.debian.org/1101045
+Fixes: https://todo.sr.ht/~mcepl/m2crypto/292
+Last-Update: 2025-03-24
+
+Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/9c27fb1ebe28c2fa2a7ec850bbd716101e9ba108]
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ tests/test_ssl.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tests/test_ssl.py b/tests/test_ssl.py
+index d80218f3fc31..c9648ea080f6 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -291,7 +291,6 @@ class HttpslibSSLSNIClientTestCase(BaseSSLClientTestCase):
+             's_server',
+             '-servername',
+             srv_host,
+-            '-debug',
+             '-www',
+             '-msg',
+             '-cert',
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
index 5afaed4cfea8..6a0adb618dd6 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "384bb4cbd178ee0e74015311b7b1f9f2c377e3686e03fa070b3ec2f494
 SRC_URI += " \
            file://0001-setup.py-Make-the-cmd-available.patch \
            file://0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch \
+           file://0001-tests-Don-t-pass-debug-to-openssl.patch \
 "
 
 inherit pypi siteinfo python_setuptools_build_meta
-- 
2.34.1


