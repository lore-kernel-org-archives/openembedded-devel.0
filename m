Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77333CD13D3
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:54:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15439.1762959270153909357
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OlnG7cgt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC53dYR3492130
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=p6gG4Gpf47t+Nlftwbq0vpljLrryscAzbMc+Es3Mois=; b=OlnG7cgt6BtE
	j5koOlFs+k2iIH1GFSAQ90NFm/ozG43nP/+60L0VSUSmhgAyasmXoUzUnjXbQDDE
	gB96M168ZHxpPZLmyWvwibBFGQoCzcDQMgDsezuUbQJyVxIMGYuBLOv0iJPERHWm
	b5isOmJ64/Kvzh+iuux2GlS7SALqPyaC1M24kr7eGdchdASK8iBV16Qpv8+c4bNq
	aDk8k/xiaygNbeJcNnhiYsOutohpo4qU+CY+8N3qFkFgHjlN2mdTbHMqJ1B2t1h1
	Mt+gXsBUyYNAilo1OEVURQAcW/R4vBpsQacfnzZ6hRruDcR5QQ5kGsJ1nqvAnbAF
	uIKKgz6kkw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5fvx-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHirwxJx9AoTcklwHBrvYQcXmOcc0YisvAITcneQXxTyaEEdEbCpF3kFFW78koDn5nmpZEbZ7DyRnL6DJ6YYlV+jSh1HCkIFz3ZqA7P4sPqhKdYWcMQGUVhTe7OgvM3Z4T8Oe4XObiLG6iym/J+ULHyLx7eYYsPpWutYEGdVNEolaNj6M6uzS7FQPaDOg1g88B3PEe4h3NiDDOwWBvo6OnyEg4dOCbGbXHG9RZGK+yvWs7J0SnwTZassVr4Fqooxu73XOwp9qDw+zaGZW6h9FkK0Yz/tha8Veq/hpkiich+lWE8Qg/miB3XisxQMS1/jDoqemics5p3izzYy2vVvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6gG4Gpf47t+Nlftwbq0vpljLrryscAzbMc+Es3Mois=;
 b=dPxixlXY9U5LNRaUnvcqgt/ee19ubQNLkl5aEObbTBqCBVqqyRQsVVi/q5PjKeGcxQqKRrJYqokW6VB0zDoHvOi072wMDuA12/5j0EcPTW8zzohRBssoEfC8dj1xFjH7M5GAsZolTDvS3yhduVMua7v7LAsGzGv+insKh9ZzQVsDLc+T6vwnPyz5RI6WVZ+MSAV4MOWSoYAMCO0WAky/pkCM9iyAoT7SD+6L8sdIzmBhaVtb8g9O1eTC3lPOJztVHv0PRH5V3DfhALzdYx8nyTNiAnUoiAud6zgwEHU0H1vChV7uima6VXDA7eNmcu62MOR62uEVxnkf2lzMNxK4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:54:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/11] python3-pytest-asyncio: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:51 +0800
Message-Id: <20251112145357.3788595-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112145357.3788595-1-yi.zhao@windriver.com>
References: <20251112145357.3788595-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: c71fe485-4b7e-450d-5dae-08de21fb5c77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9bHQOtE6+7qgjYSyMq4u+5lG8V4Nfmf5k4c36EX033UhFwcDe/SJv1TG2UgC?=
 =?us-ascii?Q?MDXEteF0H++vwKIoPlWxxkUsE9NYLY4/E5Vy6phccQQ90FmtNgaAy+Fg5cTI?=
 =?us-ascii?Q?wBGjt8pTb6zCjePc5yoccT8uxb4QoN6f9uCcxrEXhdsuEzY/x18vMiywwtbG?=
 =?us-ascii?Q?IlT0T51Cni4O+EEhqkUWZi590vol277eKLz+Ehi5Ijo3NFqImnasLciKYCZR?=
 =?us-ascii?Q?y0PTMO441myXZZcIHDjVUPoE8R45iQYr3WmCjRf4e+Q7lJ3bJ+hzer0wg4aN?=
 =?us-ascii?Q?jyJQVCSepFJH07AKvXV9/K/HVpmS8qdbzbpkhqSao+gqyRrkXkFdyB7HeH+N?=
 =?us-ascii?Q?ZXhJfUfDbXeKpi1ulOoobfpLKXiBg2iqUbGPHiGSHg8KcoNYwpAONio80zi5?=
 =?us-ascii?Q?agIaA2igLkWLoIcc9WxrqbGl5HvHzy+wmfvXpz8WN/hJMvOET1eeMBzFHITN?=
 =?us-ascii?Q?dipbYgryFjEd4xNLQD6LU2unaA/40YVvHCR7W+v5Q5jA9/JzRPxZEV825H73?=
 =?us-ascii?Q?83ws2XLiiLxXNYEUNq9WTO590PEztHg8PSRgIHZUTfXjX761++rrqP02MPT/?=
 =?us-ascii?Q?rCHCFeDhM3qNKEnDpqYKwPgVYWZzgbqiDZl36tm1WuoRzmraYiTPQEnt/sV5?=
 =?us-ascii?Q?4B54v3b0Df9x4X17lqsM1gVfkU+7+vYwQcWt7s+qYKpM7Z59BZvE/pyccdER?=
 =?us-ascii?Q?gTRYqSz3ld9pbkskwA02Y4HKquDNBfSPg2pOOFOC9o9MgvCPYUQBsATwuGt5?=
 =?us-ascii?Q?ph6zc00Dm0u/jucFrCjW3iXDtENu3y0zcnWOYM4VwfZF/5irI0R5dp/DgSql?=
 =?us-ascii?Q?tunjsACR8aIiuoBRj2rm0mahwKYDLjYgc35zUEonutRwWQf9v/xSjiZ+W4wC?=
 =?us-ascii?Q?Vh4MO/MKuCcV5uc+G25+DuGEErK5kLGilMggc9JaiwBm5IdLytgxPy1elz/s?=
 =?us-ascii?Q?Z4pNuTEmM8Uy87OWEWdIZvu6gU05E0WfU5h2y9bhZ+9+QYAV+cAxolNmSeT6?=
 =?us-ascii?Q?C00nXcfllOr3Kh7t6+zEL9FyM+Avg8DDWa63W2WiHHwD9nPhT/P+kutwJLXM?=
 =?us-ascii?Q?rwD8cNXYtNeH7dnJa39Wxkocw1wrJq1OMwR+cxl+TWDGVX9M7/t/fXcK3B95?=
 =?us-ascii?Q?g1ibZyCwGVBfoh8yXuNUekO9r7RzzOzYSQNk3t+7uFD6qvQ4Guda+1a28HXP?=
 =?us-ascii?Q?UibnpFcFVYfGpBUQVDRazHDPyEZb6ZtiX/oWqBlnJfYl3QFZ2FLll8EXCjg1?=
 =?us-ascii?Q?n6SVU8GLBbNcV3Rjv7bmO7erlzC72nOOKUtKr8Cc1pDMysREhTNsoVYXwMax?=
 =?us-ascii?Q?BHnqbefpY5nHAHDw04lH3ZoKQ0wkM2j5LNqDv/rdYC3lGaSYw8hqRfSS+qz9?=
 =?us-ascii?Q?l2++XJ7kIaaioit0mIYU0/qZbkMGFh9EKEO/NNjAgHk99MUmlIVqzKVQ8kYf?=
 =?us-ascii?Q?VAVpHjfhoMLQ23hXgTnroSmDx7b8WZg7JVOL/g4Vlnz/L+34DCWDGwMSd9pb?=
 =?us-ascii?Q?j9RXZubY0lc7KWfd87lIMEFlAVw9RgDEa/0h?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PoWRaZIFZjz7NbcebIIylLJEsinBmuNuvZuo7svr0Fhpn64nJmWYDYkc4TSL?=
 =?us-ascii?Q?DonBl40JM2mkXBmOVJ/LHz6E212gOQ6v6/Ger6m7H5lDeP8yw50zI5veXb3D?=
 =?us-ascii?Q?M+C7U8nWBWM6Qjd477UFK0qhJvPoA+6GVKXniPMsdbunD8AvOeXsfQWRXEdC?=
 =?us-ascii?Q?cl3HUuaPxBHhJpjEdtdqYp/Jo/W+bnbQj3NjOXwERxUFfMnZE/rsFiul/SPW?=
 =?us-ascii?Q?bZOL5vVrDA/4jb77+LidSGsN37ZCMsjLzNR1sD/gQ+AQtxKL8rGzsmxZent1?=
 =?us-ascii?Q?alXhKS33ZOZLjuvBrWvESUI6sb01Vlk0ehF35bXRHe5G6kp7fUTS10AKB376?=
 =?us-ascii?Q?aM+netLWqZPG8HBAEuqmqhJYSCmwN5GWicnFIBYGcibiC1RscE6utqm/VbqP?=
 =?us-ascii?Q?JJBrZ/3jccHRNDOkfF7kFIQQQ29A8PgFEW3zLsgeSia2lfo2q6CqDvMFO16q?=
 =?us-ascii?Q?GkisGsSpI2R3YrK4TTzwZ5ulZMhTkHYriGhc/gMHt+AYYRqrqeceSEXuiu7Z?=
 =?us-ascii?Q?R70dLnjjtokF1Qs9glZjxXamwPRxMLJp3j7Ktavxnw4FZkjKLgUY85aeZbys?=
 =?us-ascii?Q?JaM7HTgJ5/tx6JaSPoMqURQqE9pky3gjuLwB1PUd/qW2ZT1BCbw1iclOpUDT?=
 =?us-ascii?Q?y9BBCrGbLHzNJWdr1wd4N3nU1keI8WYAPimqZX7dx6r+h2N+w7GrPsIqt621?=
 =?us-ascii?Q?sBuUO6KjTJRxGfCrwD/m4EYDEEDU47IkpElDqj4K8qQT1i20B7yaqlNxRC6C?=
 =?us-ascii?Q?iaVV/kxW1D2s3npCCH07/V3EjUEh8Eeh0uiVlCadU7g59gp3QR+caCdm3Gy+?=
 =?us-ascii?Q?TP+n/KEVQ1XPnEsVi/nSRp//3mSo4akMXHjomoVouQHB1Ic3oknXTxs+8OAD?=
 =?us-ascii?Q?kn6LDJPC2MatI6MMT7pM+oMB4sCCBvhmbgAy9eMtVcHN/XZjYp+LStcvykbR?=
 =?us-ascii?Q?Tp/EYUGRx+ZdILkjJCYuZWLsrH0t0gHbc8Q/2movKybsvKq3wKYoGh/trqay?=
 =?us-ascii?Q?vmTmOQN0sGUJWpf/+RwQXxH3n9hFbftM4C311slC6JEdQI5vogJ3Fl6F4tF6?=
 =?us-ascii?Q?to2Nz2fzq2i5TTppHisxvLqAMZm2KOIeuvU7ya99x+qPxo9YZDD0Up2wQJuA?=
 =?us-ascii?Q?LSnGNo5DRpN7qma05VcEWuY4rtawuE6CecWknk3cE3dAIfqPLRyiIZ85n7SM?=
 =?us-ascii?Q?zQ1F1rEGmKJ/Ho+GPAHSWIPJApW+9NY2xTQA6ZkXQCrliRWZ/beCGp23UM9+?=
 =?us-ascii?Q?QMtAqmIQ7xuP9ckfs3W99xtXOUXj3eYYJOJTgSb+ocSwfw7Sxeyz1vZ/nHzu?=
 =?us-ascii?Q?Zp0H7XqqCvi55GnF0XqWnOzZaRjRmXVIESKTPnAFadlU1IgQSJGtaaxOobKQ?=
 =?us-ascii?Q?q3hUFfyfpZsnsOYbXH/V4pLueAi6yZyGOPpC9b2USfFt9VCfucvpvwH+6b42?=
 =?us-ascii?Q?ReWuU8KVKzHtIDKS6HKTYzxMyRJYOhHAwLHEJbOUcw6dI+ZbDqwSjI7cDFxm?=
 =?us-ascii?Q?5lLObt2Xta3dld7s39R2oqkt9TECofNYr4XF+2joT+GBJlPkuHtyrZw21LwB?=
 =?us-ascii?Q?gaiyfkYm0br3D8Kjpip3E9z42XSzxBU2LVb7nlld?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71fe485-4b7e-450d-5dae-08de21fb5c77
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:20.9903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sxfCKKeWAIOVEaCDFBlVBhDzqsZUzo1O/KyeatoPLWmLtAHjtLg2jyQy34t7WZD/9CGNFjdFwVYAcFTvHdumQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfX8JuZFWmIvoUU
 qyhg4hYaj3J1IM85GHeeMoBX3CNArCh4tDHJmAovxGKLZVqftYhDx28AX4y2b1NdpFblmc9Y/nw
 bsP3UxrsA687I2XT5ghDQnFu0P/xHwD0t39kCsKtkgSn2Mbm3gEBXv9DmhKGqZ4Sw5vd7xouo7j
 CAhPjsN/aXzRfWvWDh8nRHlWnKwdmesTa+KRs503ZvCr0UBDS3wwG6cuorW+w93Yg1b3UaxdlAo
 kp+eEy7+NgB50h/AejpsX3np7KFtXTAJx/Y9JCdtzQ9NnJwDH9MOOg/ghhPqS+/uJwVm2OxvzlR
 V6m1gS5A6BKrWpixIDMejibGHA6FM34aEm2REhltL86WFLy4+v8CxsIKpc6sUC90Uk7RMRh+t9n
 U1m1bB20IFsnZU/HV0zG9SKLhveTKw==
X-Proofpoint-GUID: FCLoCX0nVa6e6pPMNKOozC5qVsqCShVp
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69149fa5 cx=c_pps
 a=0PDhd3HO6khzWhHQYbQRQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=rR3rKrEq9my3PbB2fw4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FCLoCX0nVa6e6pPMNKOozC5qVsqCShVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121553

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-asyncio
INFO: Current version: 1.1.0
INFO: Latest version: 0.23.6

After the patch:
$ devtool latest-version python3-pytest-asyncio
INFO: Current version: 1.1.0
INFO: Latest version: 1.3.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
index 4ac45fb1a8..38c5345852 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.1.0.bb
@@ -9,6 +9,8 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "pytest_asyncio"
 
+UPSTREAM_CHECK_REGEX = "pytest_asyncio-(?P<pver>\d+(\.\d+)+)"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
-- 
2.34.1


