Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168AAC54F30
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 04:43:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3857.1748580176797966421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 21:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82456d971c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U3vqFf006910
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:42:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u53964vs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:42:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvCWPnxFuGvPkvuue0ZFWP/qepIfita8F8wdrF23L7KLH5KyhUaT18zWeQRkpUMXiZEoRq7fdVno19vmI18maR3OAcOxloPND43qngzd7ZvwpP3t07mczHF/MnDoWvHaXeAdj7tNLw0YNkVhZ+fp1inBWgTC+Sxt5UPir69OPvHAW3qEP1p7x6S7RMHYUYwG2YldNCAgU3NQiTWvjlQ5IL+8avQ/2M4WiBTvkNPAkQN0SHQAk/Mstk1TR889t3V3XYZMUxjRnPCrwh9uMJ9gXKEiOpSRm1vpfRbmlvAVtLwIomny3no9RrvaHOFTp4f/EBEnFLJbeiSGn9glOU3fRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkJJo54HQwBHow1Wo63RaENAREa1uSRTHAJ7ZRL0g8g=;
 b=y8pUl7BIfe6eZDJyOIJtIGo5pNfKcITtWxqbheqHxkn9K33Iml9/H2Mbz3G+ed6Kppp6p9rSQuJUGZU9LvPDzqtr99MMyMWkuHMrZK32WYMfaxcp9chI0pDI4cQkTPq8Cn7fclMa4EnVl6OgcmYmH0PZrqAcDBb0cjor+7nQWUjxbMF2PqDnA+73XtS/6Y3B4GUOrN6FukbHJIeT166nr4DuT792h+VvPWKDgdPNnW3aKy9OrOv1Bqtq0hSttiOtkSKT3brIjsyTrBcWaNtBeQuD2XzryBR5SvR8zJLjhpJ1dDhk8J11cASZpKRbvBVzhcZsLrcodTpDBVLDhKS4OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 30 May
 2025 04:42:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.031; Fri, 30 May 2025
 04:42:50 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH 1/3] Revert "waf-samba.bbclass: adapt to qemu.bbclass refactoring"
Date: Fri, 30 May 2025 12:42:22 +0800
Message-Id: <20250530044224.2445187-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c46ee7-2772-4c37-f1ec-08dd9f346eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XDHFRO5ildb9cWMz0U77V1WSQsyRn9Ir6LG7HfB9+BAYqaMt71NllfoXdzgE?=
 =?us-ascii?Q?jBjQ0xTuQXI4kclmETzDZJg+TpCDyNOuLDklyTVY9r2yzmn/Bhqua20CBUGp?=
 =?us-ascii?Q?uCpiC+Rkt1Y8Xof28LcNTd5AxngJ8dSWNIl+TmT2HzzVmLs264ylgEspjdu/?=
 =?us-ascii?Q?RrqNG2ZVUlDum/ql02cj5WO9nhF3AIc3dwN/weNe/ZaLDOUrlFu0MTa5ZbM3?=
 =?us-ascii?Q?u93MQBbXU6opwq0rB6wT4LUSOpX9RDp+Jpf+WGTJEQ4eSEasgUKaNRM6L5QG?=
 =?us-ascii?Q?yCUR5bB+ejmzf4nYYvn+q/LaYV3NmJ6cdeom8BjAK33diSDAbfAyieyHyAwG?=
 =?us-ascii?Q?54/u13QUxQ5tdjreOzIBijZsScB2U5FC+XRVEZfQcjWMMzUP90KnwGjn0lkO?=
 =?us-ascii?Q?FRRR2QXehL4xD9khr0ieSyIZ8NmDJyPAXNk/ZZPm9tpWlOf5DW/iwoybL8zG?=
 =?us-ascii?Q?orGdMqK78CrqMxX3dtwYY7QWaOY87p7vwVvxSJXGdW6B0Vg8MxHXRrIcqI5N?=
 =?us-ascii?Q?8DJJyYU56Mv49B0Iw72DUswmP+pZxFFfLDOEc1RNpFAR2d5sa0lomQ5Hjhoo?=
 =?us-ascii?Q?lpnsG5vbBXx57xwP7JsXJDa9OsAUE8PHR9fZzRcdWsWpbM/rRimdz7o9585p?=
 =?us-ascii?Q?sqBIz5JlKVODDblT/gnUlwkbYzya8OQaKhq5biBQo2Srv9lLaIsP0rsqVnJx?=
 =?us-ascii?Q?Vq3/oy792XDuHDY/Q9z4ZJdPMPpk9Z4P2ZL9dDP3dvIRZTwdn/nSR0a6axIw?=
 =?us-ascii?Q?t+zXIzJ/DTahOYlj8yWthVZc4svW7HEzi3LF1f2Is7A/SdSh74CFn1wuFvK6?=
 =?us-ascii?Q?+/b1nsAhUXfiODkS38KUKTS1CrWGt7FcpFg5xBkjmZ75AFv4PD3ZbxMOdOrB?=
 =?us-ascii?Q?IufpFczBMopms/f4jL9x+WROmMNHxHpG6priw+rYk/s+FehqZQQ9G5lEWJ3v?=
 =?us-ascii?Q?hPI5vZg92MsJt7me6WApQPuUT+z9x2c10tIwlkyqFcdSTHpkwLQk1xpHSjrf?=
 =?us-ascii?Q?IxGMD0rOo0dvqKexEwT8KikkthUmCxi3X8ifd2yO9dV8Wz2+0zHP98oR1TK8?=
 =?us-ascii?Q?R9PCx3YrAPxAFy7n0x6Eug1YoIFzQH1Shzt2hJ9XLji/pPKkpUn48jfoYHoE?=
 =?us-ascii?Q?sGSv1nRcoxjRTX5cl+Uoq2hq8ipWtiffqLVRh6d/Y58DK96g/XkBG3fP2Iqf?=
 =?us-ascii?Q?9fmPF17jj4e1FXMCovh4hbqyp7t9fVIgdsApTHX/5RB8K5XVV85wl+P38xlh?=
 =?us-ascii?Q?PpBQfQ8VxM77geoLtJ+v5AyX4jq4Zwl8LpocAgKQqqfW9Sp/jxOhyJc0OlEK?=
 =?us-ascii?Q?IB0og4dK7rZZFZ7bcAqK9zLMk2m3HAFJ3VKYv+Rc17gdrgo3bHPDqBE9zK6F?=
 =?us-ascii?Q?GEDIAp+OFL8ivlgB19G6oCcA2FnDTISeuK5rKX5QF60uIobnUWg+kmg+kbB0?=
 =?us-ascii?Q?nxk/tjFxFPg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kqNufxlSd6pUZo23oODbVMc4wYCDvkIHfBUtz8PUQYRshxiJv3tAOTZA/3Je?=
 =?us-ascii?Q?I8O2ONj0GEJhu2NXcgxgNP6co0P8mRgu2N3TUshn2ax9u3G2GyS36fei9Ovp?=
 =?us-ascii?Q?tkba2yTwvwIuAMhwJeNcOO9J7XgxizgTjiAVfR296rbPT1Pc/EBqvHQ6/ArG?=
 =?us-ascii?Q?qg+Hpdf6wfVuGP28HtVzO+Rrk+oPNUbg1+2UNcDVGlOpq1cqSUZ/EbEW9Br7?=
 =?us-ascii?Q?SFAqqoLa5URkJvozvD2oz6vrKhYrpHVcIBKZGLVp45G2u0bywQXjbqp44K7p?=
 =?us-ascii?Q?mjWqGt0aahZchpU9QidZ7SAXfwYBbcsVQY9HByHVPD6FuW6vi7XKnFKb1ggh?=
 =?us-ascii?Q?q84wuC/4NmxKxqKco4JV7R40a3D8zSGjitrCet1xWRZ51YOZwkYwzR+IRDI6?=
 =?us-ascii?Q?CD+UvqVwyd141a1awwoNqYdpJXYe6m6DU1ecYACkmFla7fP7Ky+StQakiEHY?=
 =?us-ascii?Q?7h8I2SJ7vJFP+pBWySzzoAFDyMtxH2NiYnagkTSPKoB4KA1WXCdBHbNvQ8Ow?=
 =?us-ascii?Q?SpFCyPZk8lmI0IBhN8++MLDMdjTV5vYu7DIDQPqNUiUEAkOWCXlOVDfs23rQ?=
 =?us-ascii?Q?TPAcMJRQRkpjljtZZhbWvQTEFUpRbeT4Tz3Imt8uQZczPqxvijPIgfdTMIYM?=
 =?us-ascii?Q?40gSS9s2u51QMEj94J+0bam0lMXJR7ztaYUeapPCbfUCAiZa8g7jpmhJPEdI?=
 =?us-ascii?Q?D9i/48rVOBS+hyhfF4RKpXd/Rxv37cgNNRIKfgJB97cK2A0u2HTbxrnL2YjO?=
 =?us-ascii?Q?f6kIP5CZhy7cOrUcNeCaLhh/eSBCJ0wDeKRmVWqF7/FNVug23llTdgyZyK1c?=
 =?us-ascii?Q?C2g0OHwcQrgtE6Y9xntR84cD7m7Li4vv+yjBDrshPGZ/+lN1m57CUyuwHXVO?=
 =?us-ascii?Q?Auvb2Qn92/RHBBg+t7uFEA0l0Ynkr4Fvrn17/LR97crV9X6BjMZ9KBwXvq4I?=
 =?us-ascii?Q?eC7pZYN8+rAnhvN7L8JoPg35/TxHxfoF38J6B52c4x+Mh8tQVXFnUZ/rC0cA?=
 =?us-ascii?Q?iM4UGUm44Tp8Ys0vLbAwoFUqg7SpgaDKxbXw7i2eW34QlTA2vXtqbHu8Csh6?=
 =?us-ascii?Q?FQcQIGD93jnEnyW5+ephc9Vx7G1Ag1HlyluOor003/v49Ebz1OhcO9KASrh9?=
 =?us-ascii?Q?H494uykQYgRhkH2da3EfRNyWwPoP1EUWHL+LuuAUCBTvnrgjhkGnL+dyAi6f?=
 =?us-ascii?Q?ciImBvSVG4S4BSZHLE+mTIozRCGOqvMXQzkfJcrgJleTgqqpUuIJYFxjtxuK?=
 =?us-ascii?Q?/MLzh0Owy33Sh8kzlZ1+fW8sz1pdBbp+xzcn7EwbCdXzvrYdLNRK+Ty+Qtib?=
 =?us-ascii?Q?TE6yLlcLl7EUG3YkQUUUy4hZtSEkXTy0p7UnvEx131Krcw/popLOHCr/3wVO?=
 =?us-ascii?Q?fvkXWimjmVBFT3cimcbsHrHZLSvucMicxGxasdGyQWk1CiA73MvWmt4EY4IW?=
 =?us-ascii?Q?ewahQ7PT5MI4XpXkkM5N8LbsUu/khmmOWclK7Zb9rfP3Ti6lJHO+8yOIVVVM?=
 =?us-ascii?Q?QIPgQo1bfrGw3VeT0NdMg89LiuOGOr7R8L8+5nuiZKazNdPfTmiO0mrsklcu?=
 =?us-ascii?Q?n1pRk69/l/2oKvyagWMXS43Nr8TqrPhF15sarvIr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c46ee7-2772-4c37-f1ec-08dd9f346eeb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 04:42:50.6910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGnhe9/v6eHYhqho/bd1gGX4GB3+pISAuEIH6svA4o8S74ZSq9jmpglGLiWtkD7i1qXOQZ5Q5CFNoUeKuHdXtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzNyBTYWx0ZWRfX0g2PPuCpvcNm jdfkXuUnFG0uQ5EnOLrGawR0WMNa4UDtqXrIFAqzkxHvbV7yzJkuLdI4xvKc9FGk5a9+o/Aqgt1 ypF90itCzLwpjR2XYXt98K71pUy1/zkYYsCbuvdYCY7AlAZv/9WaV1umst7A4sokisZ/BzlN3G6
 Hm2gd1vrA9Ii9Ji1Gm7FLyXTtRG+fg8v4AA1sl+A7CUzk40QTcRMf03W3is/sn7B1VX+TS2O6Ff EP7CzPhVzyby85ia8nOsvV8DFM8VdJU5nk1uMHU4asMnlCec7XsFSiQ4tQHh13FDUwdVPfyoz7a UUE4vHin25KMFwz7LD2UHANde0rjlVKu2tWbuuxnKRiYn6Sp2KFxU2miQKJfqdHlhTnx2qIdKoK
 y2m1LZFw4inYBdNzrTx+WQzS1Z8Nfr7/Nv+HlN46JJ6ep91FQR3T5C1eJWmWz1ERHtwLk7N3
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6839374f cx=c_pps a=39de9MFdLn04CM8BGbcX0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=0cNpdDu4uiylx8giwlQA:9 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ttcih38oiZqBOmzcUWwEzuMvtt3VqQue
X-Proofpoint-GUID: Ttcih38oiZqBOmzcUWwEzuMvtt3VqQue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117667

From: Chen Qi <Qi.Chen@windriver.com>

This reverts commit a8995fc3f352d83b4141f0ff7bbc3f13d0f2767f.

The patches for oe-core were re-worked. But I forgot to recall
this patch.

In fact, inheriting qemu is needed because it sets a clear barriar
for people to use qemu user mode. And the QEMU_OPTIONS settings
are also in qemu.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/classes/waf-samba.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index 49d64b096f..cb78ce6b0d 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -1,7 +1,7 @@
 # waf is a build system which is used by samba related project.
 # Obtain details from https://wiki.samba.org/index.php/Waf
 #
-inherit python3native
+inherit qemu python3native
 
 DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python3"
 
@@ -77,7 +77,7 @@ do_configure() {
     echo 'Checking uname release type: "${OLDEST_KERNEL}"' >> ${CROSS_ANSWERS}
     cat ${WAF_CROSS_ANSWERS_PATH}/cross-answers-${TARGET_ARCH}.txt >> ${CROSS_ANSWERS}
 
-    qemu_binary="${@oe.qemu.qemu_target_binary(d)}"
+    qemu_binary="${@qemu_target_binary(d)}"
     if [ "${qemu_binary}" = "qemu-allarch" ]; then
         qemu_binary="qemuwrapper"
     fi
-- 
2.34.1


