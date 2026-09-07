Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742CBC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:21:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31647.1788776502198048086
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fgssBtPY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3710b275f7=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879dgI83526099
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Sep 2026 10:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=HxujnFIqT
	p8Tc7X6VgGKbeTgg96fKQCYfynIZx8WDOQ=; b=fgssBtPYdKictd4opEoAQkmtA
	i4fpghLfJg7Bm1BCZ3GAqISApcaECY4AlocgiWNOBj3abTlTm7h7DFdNcoea5E/Y
	IqjHch69FOwobzLVBb3ExEtagjGmYEnLEpVVm6LAXtxXorHF4B0Upq3xDYJV3sSG
	JaI+XrRSoYu3/s39eoOWKipLMQvOhyv2AMahoig50bzhBqvw9UK/jc9hRcjXznHP
	bdR9VHqwFm6VQP/B8bS2P+LyQYYJFUghWznHb3eqpIdaaZkZzqH8MRj4ORQ+6eBk
	IFG3/RguGDYKjoUmAA0ruLCnrgF4OJBJrAi4um2GsfxhsttWIQj5YxoeaNCzg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022122.outbound.protection.outlook.com [40.107.209.122])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gga25t7xd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:21:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDCJMjINXNDpETbI5WFgPRreREE+yLdveqrCECPGjluXkNl+eGjB2mliDiJLhgAFnrayLJFrMKrTZdsSG5dmUBBFJJZiG5dUj7JVq1L2tFAhQIaJHivqKnuvTqe5jwW6jUM5YjBi5Nlp3QaG6xU/Qi4WDkUsL89bBJ9/h1B2IWnPfrNYYJM1h/hHJAaGeOBKp/Igog/cBudl10jFHku0m2n8t0MKlxFrMx8Op7OKjA079Sf7neArjy5xVLfuU8d0HajUshauGVVkKMIhbSmRqlBP1xc/Cc80qFPYkGIieqkbuy+5yo9xIB50n7syUbNl0W4XVYxtbUbClWbzff9kOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxujnFIqTp8Tc7X6VgGKbeTgg96fKQCYfynIZx8WDOQ=;
 b=bHtBn8l99jihHYIY5DzoyJYfzG9K4I5EFVfZCkAAGkJIq8+eoX10IsuLFJidgxDXzgODtlsGekRMzI/DrKSgwLVcYXUsRzjlTrmwkIveUa9RVdJH1LWcVDWiCFZlHPepJeQGFHP+MjNNi5ndECgMAywjziYu+0cdNq0mwEoSfjGixykSPQpuTXRQOEGpwVqsYrXFVESw8WZGYWDpb2qqcxiDs+EKzFzNJ91qR8gWwkS0LVJnM4Hr3UsJYwNHgW6AE9JnAmI/qvh3kYJauJFrjwxPdgWU1dlAcPr/FA0OtM+zUbJeBfSACijR8FZxESY15ZSjUkurYj8jxkou2rS7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW6PR11MB8410.namprd11.prod.outlook.com (2603:10b6:303:249::17)
 by CH3PR11MB7179.namprd11.prod.outlook.com (2603:10b6:610:142::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 10:21:36 +0000
Received: from MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578]) by MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:21:36 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [meta-oe][wrynose][PATCH 0/4] thrift: fix multiple CVEs
Date: Mon,  7 Sep 2026 15:51:03 +0530
Message-Id: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::7) To SJ2PR11MB8402.namprd11.prod.outlook.com
 (2603:10b6:a03:545::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR11MB8410:EE_|CH3PR11MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: f870489c-d864-4569-89d4-08df0cc9cbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fw7AaVvmsIgZUCCRfdyEWajAmqGc7vneekZXBB/ybQzthd4z6A06jZhbkOU/2BbNcZcYKSC0zIWJ+mES+qc8gSflrdoP/Upr7fjcCfZWC7/D18iApR+KVxwtN2hG4AfKfe4vcwonzt08cFKYZt9g4i1GbcVo+QmhVGi70jVwbiOzc9u056WzoMV+oXlV1EGTSihgUqr05z5YG/UsBB5WbNJ0DIMC7DlRItDsoVidVQKuhs1vxyeD7ymad7qsxxLbbHy6HqKuOP6qvng37oW1y1xNYchHHfvejnpciayoAF3jKpHQMF2zxFSpB3aphgqbApneBzQY2ro6xdhwi4/qKVtTg2G0aOu7YeCGTcFy/VC9QbG+bdr3P+qB1eS2fmkQsSqfQFfdWgmegnuebUJgR9AepeLSazRkDbYNZY3aPxDLuPxmhDDqhoVgMAPq3+wohL9tIytbvjD8SMiC9mjQSScbp2lbP1QIhWCF/2dUUXX9EakD28uMW2CBYDNCBsqtuHDS0iBX1FpuWP2x1OJlMXfLMoQOXvgfvkLW7zd2g8Be2/LNWmQ9hB3vwAd29WqRjRKeouQqTq1+HPkhBy8WyE/PRLCBEvyKFfg38D3cu5GEgfWXbzFe+v0M5UM+Ya9VBkDjZ1viZhIToUE8RdvL+BczMEND6gv981DkOXMeB743UuWqb6WRL47XUOOJYcs1Ye5qUElld0L91OxIDW1LuvfP1Y5fogsIN0AcsqSDBsQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR11MB8410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UwONNU/cp4pnqV7R2846MUHiIf37bExTjJUkvIEfpdoikOg20bzjvRd1WZcW?=
 =?us-ascii?Q?TcWQF9YZ7P1rFM1fg71J7Q7mY0zpVaGiT5wBP4RFbKRxFmTXnwyESZ2Iw8Ns?=
 =?us-ascii?Q?mUHUelcugFwBn+T7OjszX2nh19oxx4EyKOK1W/KufqwhOyqbYjS49YhIkvUw?=
 =?us-ascii?Q?+w/z5MhovmdfkQbJzJbe8FCaTPFyTGYTqCKThuIW33DYPdi9ZxXc+q+rNQOi?=
 =?us-ascii?Q?FShIrQ4pVgDLDYgs6GNw7zC3MoGRLms9C5Ha4JHWatT5hF2Kqu2vrbC831yV?=
 =?us-ascii?Q?AoiLRf50D+Izlo5ibQPRFfhEaDJEDJjKCs0Cu5d+7YRX8mBCxq9RPYfSDHUh?=
 =?us-ascii?Q?8AbqjW3MUu7vJFrcLkv3rU0jiaybzoG+mMS+7nyvMNZCzqbuy/W1lc6tbFux?=
 =?us-ascii?Q?K7d9bYncemVLdqdfTPZxJPFeTudz+FVCHg2DbGQeW+3e4NXTYmKus5mv0l/K?=
 =?us-ascii?Q?pAvQXE2vR82pQWPQWLU/Hm3wgQenvS60Tn2xSHOoE88UeZ9430gXr/+aeReB?=
 =?us-ascii?Q?VPL4USgYLno5LEwJqw2nKI16Ib/URhmHxhqf52G9xJphUEUBaFX3AGobXG0o?=
 =?us-ascii?Q?+vqNva7BRO9oaz8lD6SmjTHjdsjzGYHnqAhnEQZ+pl/ub7PrMIaoacW/CkCB?=
 =?us-ascii?Q?wEItnBa7mdvuAmJT0I1sYiPf0I2P9Vou7B9keCaGi+2rkfU4WXE1pcFsnGde?=
 =?us-ascii?Q?MfhoZIx1Da3EavA7TP8S399MkPaL90HPPOiSTNJvUQEE5D2mg8Yp32iAdiSu?=
 =?us-ascii?Q?UIiPhGDzXpFHyhHz8YE8HgeRoClwA3sMkX1StnEApdvFHZaVvLol4dLYiuBf?=
 =?us-ascii?Q?g0MfpycK2CB9KkxFIO08abhZa6trNW6hBchOiPyVOppO2akq3MA4cNOxkY6H?=
 =?us-ascii?Q?+WMUD0EyQu0fyKPhCJ5HTzrPpJhHyRulwfX/3O0VVD1vOxNg66lVLC57a1wh?=
 =?us-ascii?Q?PBzOPmEbLXBU9jozs0A4Xg3BZkksIKvPbOoaZbRUfWUu3X8pQw4gurrTMOvy?=
 =?us-ascii?Q?7RoCTf8lvjYHe4xCu6C7xkdtMZ+HBUN5XL5jOOiU4mnleoFpTXErd8sxf1+R?=
 =?us-ascii?Q?5QKeImXrdm0TPlnUfo1vBljbjJ0YR9yHJbFmGIBR6tArHwmXYPWsJ095aLDA?=
 =?us-ascii?Q?eRp7cwapzg3Azd+mxbkVROnSvWTBygky5I/ro8sMTkS+/JQc5f4bbe4JzAwP?=
 =?us-ascii?Q?gPotS2qzzab6LH5WP6LMTaDocOleM0jS8/TEoe+gr6mwfB1bOvcBt9pTzinw?=
 =?us-ascii?Q?EJcnAbS++ry+E3twAAYw1EpJFs4m0WADnW2NEmd2Af/3UtUxstzthODbnho9?=
 =?us-ascii?Q?Ie1SuUKp+kpM8Up1gEbpkp4AU5fDkGbzr7dR1tbHhJKboFyqMteczwH6ukCg?=
 =?us-ascii?Q?g/QVYY+4UoZu5VwYklYAFvUM3QbVkVIN0taEaa0SMBRawApD1jWtC7yDn1Vz?=
 =?us-ascii?Q?tn/mjySmo1MkQKfAzOCGTX1FOlAb99NRUA6H25/nPX1cSzy0jMOBz4hLdh1I?=
 =?us-ascii?Q?fL23R4C6mZN89lUkIO6zATmtj+fLS+d8yL3yVSCcug14q6rKR8PO3Edp1MIn?=
 =?us-ascii?Q?ORXhpfq7I8L0uqb3TGfYnVxs6/nGL/fGMS5TcqB4zb7u3MUv3rpbxxiKH/dl?=
 =?us-ascii?Q?D9p8MRaKujnpF2w78Ub9A/v1dvD/HaNhguepy0rHF6zH6cQIeDJSyytq6LGS?=
 =?us-ascii?Q?oehawBGbkE0s3GMV5atrYKLOBsS8HEN8CkUgIO30KCymCttpVvwtz8U099KB?=
 =?us-ascii?Q?6jsDhpVVONpp+nUamADJOP0QFMzUHgqCL9iB065RY7Trg0rZQZ9B?=
X-Exchange-RoutingPolicyChecked: 
	VfzQHhMHvE2PTbdXHobv6wudAUUmCDpO5Hf99hHnCwIzECQRbD1quCcQuM0vHq5MJdLfDpgwD/KKpzjaKjJK6Akjsi7wIATZjJX7KiEnIg/ye7qN5/gBy/g1JZY4yTlM5rh0cWo3O5a4ut5IrHyytPrlDrTpEolvGBA8iCLJlXpOTWEcED52XmUKm4exsda5vSXJOwHiJJiPEa4jWhgL2RD5JFqakQZxSNaOacP5Pm8wzEJkI5/RFjQAihKTpSG6cwJRcpKKq4jhUcd1xlA/dNkc7augLkPCGgTegVcKQXCgyaLHGsUin3NgqjAulTJmtA09BHgKTqrphzhK6Fp+8Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f870489c-d864-4569-89d4-08df0cc9cbcd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8402.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:21:36.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcNmsB0m7bxtVw5lDIniqidyvD4KyZvb1yOzAs4kFpn2rduYX52mTsJnQrZjrjsiuTvpDXqs7KzR2Has/9L27bxjBU3xKwJoArBN+xbJ8nrhOtp5ScL/pGO/2o9czAFe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7179
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a9e9034 cx=c_pps
 a=Ms9fQC66fVli3+vYcCKl2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=60T_7M9bhg8Sl00-iZsA:9
X-Proofpoint-ORIG-GUID: HA7XIXsZCw6TedBtyaWM9R_DpgoCLbpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfX9H0JqSTsSwQW
 eQbsOowljpzUtP5CgewVlhHYiu/o+O+BclN1/zgv4J7O4Fy5JwOOA70YEkTXSHg/bFZue+XuWJ3
 KeHhdGCaf1WRNvGIpjDPuahu4st4A0wM6AJGQD1G8YIvLwbFSQQxnZSmd9WxHuFcSYiXz63rPDq
 v27IHFuT6kdnMA4ITp0sni0CaA0VZSwF8CwgF8ZtVsO/OTPNQiGgXNKW4bBSsNum1DTtDbV3Lyf
 LB2VL8bg9mRtAtG97Drb2yhEPE6X43nTLgQU1H9swMlgYGi/J1SzZQAzk6Muxtxq08AgQ03eOD/
 efzlRXg0YUaAnTfjRXNZ3V16wU0kl0uJK/ZQAplQaN7XHsTukyP1jJKEf3G9Vf/EsCvJvxpUV7Z
 XwWUpbyh+o+EA0ViaYhBjxhNp7n0Qsb3KrNvycbD33u0F0hea5D8YnzP8SfOZ/rFdOtYOZRIr4E
 yj9z4rY7zP160/pDaFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfX6NPs30wbkER9
 G9or8hnJvugKAt6AhdSYYt+wtXQuP7hSkUM+qQxW1cY8HwlA8vZj3fZ6kaEPKcWZpta8KZE1RT4
 3vzadiloDmHEmvFbHJ6QSHPz22Td2/Kj8x5YmQgq8Vz6MRzQITsx
X-Proofpoint-GUID: HA7XIXsZCw6TedBtyaWM9R_DpgoCLbpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129809

This series backports fixes for four Apache Thrift C++ CVEs to the
wrynose branch (thrift 0.22.0), all fixed upstream in Apache Thrift 0.24.0:

  CVE-2026-55969 - integer overflow in TProtocol::checkReadBytesAvailable()
  CVE-2026-48586 - TZlibTransport decompression size limit (data amplification)
  CVE-2026-48145 - TSSLSocket matchName() RFC 6125 wildcard bypass
  CVE-2026-55970 - heap out-of-bounds read in THeaderTransport::readHeaderFormat()

This series applies on top of the previously-submitted patch:
  "[meta-oe][wrynose] thrift: fix CVE-2026-58662"
Please apply that patch first.

Abhishek Bachiphale (4):
  thrift: fix CVE-2026-55969
  thrift: fix CVE-2026-48586
  thrift: fix CVE-2026-48145
  thrift: fix CVE-2026-55970

 .../thrift/thrift/CVE-2026-48145.patch        | 137 ++++++++
 .../thrift/thrift/CVE-2026-48586-01.patch     | 109 +++++++
 .../thrift/thrift/CVE-2026-48586-02.patch     |  78 +++++
 .../thrift/thrift/CVE-2026-55969.patch        | 292 ++++++++++++++++++
 .../thrift/thrift/CVE-2026-55970.patch        |  64 ++++
 .../thrift/thrift_0.22.0.bb                   |   5 +
 6 files changed, 685 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48145.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patch

-- 
2.40.0


