Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D82D277EB
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 13:38:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8554.1768052308848081907
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 05:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m3aP8MsM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54702d1050=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ADK7MK1074946
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 05:38:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=rOhhmIiu4xyErryP0c5H+MXbushflXzlPJ92YvJDHlA=; b=m3aP8MsM09XG
	W03PBSayx14SSCKMv7TQ3WLTfd8ScArY4NOA+4lDK0JrBU6cK+Lm9YprDNAlJJiX
	LpXEWteR/Q+7jWCdP+szx3npIsQbi2FNv+TaCE7AkTpwNaoHiA4WMnmdHgr/MUHo
	ERuFtL6g7oj9ZFQCtklKMLtVezLmVpEdOzligXgMVuL5gpsLv8NvJNqiQ2qLZb3g
	55ncmMAuyu8zHozcDNhkYWlRcNfBijtG+k/6LSFwF1Pj7Q6Q9+hNLi+jHUtIFCiT
	BEzuExl9aJmPj3T0j2sFnP3WbHET1UeIeJv8nr4QDk8f9FkaRvMQDMkCM7HAFxot
	TuBbIrGc/w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0r50j-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 05:38:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4PNS1ZkxmEQxj1s9dm41KjlNVXTi0ApaAItHWJrEmJOlnC/O9vqZRvySh2yjaZ8xcEep0b+MJS3LQq65bE5omKZXEvFcJbEuUYeiXLsZ3rRbF6mvq18HxGFhniaZUnL4eVl1RZd/nKaiL7TDuWT4LaNg2+ALxxMlLNjeFU4bxkCk/Qmou+JahcLe6qkzGhfpktP7GRcAK+Cvyo5fBh90YDaxSSubN7rDavDhbcls14plMU1YcnOkmLklgkjfsbs13Mat4USrCNv8IaG6iW4oTJ5VFJTSjXkp/+K+5cep6qS+wN4UPlfmdz7vj4H84KSojZrY7YYtcQiir4PN+5tjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOhhmIiu4xyErryP0c5H+MXbushflXzlPJ92YvJDHlA=;
 b=Ogv7YGTb0/EomypB/QKY+Ab/tgpiE7W1HckrVz2y/hHEKYFrq1kig5hDBdwba9XHa7s6/nJ24Sjdv6e/9FxwuLr485Yr9kCg+bwDUJEa/J/wvac/HWKi4z9aKQFWkSFJ0vIArMGH1bw0inOOoyCe476LfT0RXaU1ic0joqZDTlrtYC1UBLyLDaRyZg0batbiSVn/aLMOssgBL3VLaL9x6LKEdFAljnGFL53mgnylY4H0tt794ZZq9Yqwn90/Y0S/jfqhqGl7/73MK2K8/dFYUeYhCGcYdS0pYZsapJVufaihhVipukUXWhLoNKgq65TXq4l2wgv+Vwj/GW0brxgmBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.6; Sat, 10 Jan 2026 13:38:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 13:38:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/4] nanomsg: add ptest
Date: Sat, 10 Jan 2026 21:38:08 +0800
Message-Id: <20260110133810.515672-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260110133810.515672-1-yi.zhao@windriver.com>
References: <20260110133810.515672-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ac4699-0403-4a7f-239e-08de504d88e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|7142099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ivgm3pEWw8yywEevq1rbNuO4SqR/p9nUFUaKwAydUyP4lY/9s8LTnsNxxyaN?=
 =?us-ascii?Q?IDYvzeOAbob5VOaIgr6B4uVKMDL4fkhjBq0L92tSFmDE8kOqfHFBAUnhdRWf?=
 =?us-ascii?Q?IGePo17bCk193d4HjSKHRRiI26521Y7EHT5Ga2d+UOcc1CeY6OJBq8QY0WYX?=
 =?us-ascii?Q?zg2zg45LUILi+KPMhX+OYRkxogJdNJPs4byYagc1T4iPbCL6uJv2VnrKTsZ0?=
 =?us-ascii?Q?P4lx7aJecTcJ++lNKQDxYVelovqAblCJlRUKnSOEXxZH3HTFym//W7PdsAsM?=
 =?us-ascii?Q?UZ1S+8O2rSfpS0HTqnpBWHFZrvhKfUNJYLOvjUVyYs8zkLHIit299gysZzFQ?=
 =?us-ascii?Q?plpEMU9j/vy0U6JuOLWcscrTHLy/Rp3l99rtzuFng1iBXyyqmW6xioemXNc2?=
 =?us-ascii?Q?DOSqK1atc3SG34xlcYLvVksPK9r2UwR0zipY1zIhntuDGsbU26Ch0BTh+l4x?=
 =?us-ascii?Q?D9MvQdDJ79IAH7g/g5m+owcWo3zjqHD6rKbchoZMeBw1okuIXbct10DcZDvy?=
 =?us-ascii?Q?IkhG/2YKcJXUMjN03FF4+2YNLzzH3wADGuxlnA+o8sJmRLNPy1lidhhVAZfM?=
 =?us-ascii?Q?+g1zvkPtn/JM/T61YCea4q5qME7i0d1fA6eU8yjNenGBFxcKnP1ToP7Jgyy1?=
 =?us-ascii?Q?wnKyAYxXK0q4ZD9ZjehTZjq9SqpvQ20Vkf50g98nbsFbA4ZhCbGw33b3pAsx?=
 =?us-ascii?Q?sAQc76XrQggtFdx9mmx2HcCOtcjSVBT+vkjouXRJST63jRsvQIdlPGS6A7eW?=
 =?us-ascii?Q?rh3NUV+AVTDZRJJ5wTizhwCQYsa6/KyKP4mgrYrUgGi146T5Y72DpeNq6oYA?=
 =?us-ascii?Q?bb0IQx0Zd5ombJa68PtkIVZwv2YHt6D3Tq8s1FASiAskAdRlIF+n79F7gmTb?=
 =?us-ascii?Q?xcjjgrrQdw8trfegeRdjjaLOxq5GI9rUjNT4y6IfqRYqZgSr/XoAjEhf4XQf?=
 =?us-ascii?Q?zHdBW+jnQK6sokHYVdgqiYHlOSdTTyWkg11NyL2f0if6p+ess5rzcqY3hkHx?=
 =?us-ascii?Q?wSBVUq0VSmSj13VRsdllZD2RoS61qLxW7JEMuSPmjLooCnz946DUJD3NsKv1?=
 =?us-ascii?Q?HUmeg0x7dVtEdTqvrBitdlsOw8xo3VXund/o7ffuoaQuekusTkcv1+7l8IHX?=
 =?us-ascii?Q?Ojunp2rQWPGxBppDM1Vl1wXXP+Seh/tMg3qATnpBcptJOgsOyq5kK1zp+oPl?=
 =?us-ascii?Q?Iyy4APcPExyf/toJrOxGSISYq3hROF6pjWbPl76R5CDiICpm6SCBvA2AuNHr?=
 =?us-ascii?Q?AwqJMM87BhrKJrvJiIoC/f4rvU4V/zWK0cAF1NwTA0BdF5PbEC7rn26mTLtw?=
 =?us-ascii?Q?Kf/AaoYH/LMzgrYCM8SBIcRDllyyyv93Wm5ED3h6ub4o+utC6fpRg05XAgLC?=
 =?us-ascii?Q?pSxmNLyZpyIAKcM1G/G2Oj5Ekpt4jCU8A3KEeFdQa9Zx7kiazzBa2VqyiEwg?=
 =?us-ascii?Q?/b0zWLnSUTYh5f7mDCyYABzldAhdtsVg6ZI7Xt0gCL6a7nCButztwT+ePV1a?=
 =?us-ascii?Q?NwBMGQhQGIPPLqTnueh7RPviA0zNgAcdtZ85?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(7142099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7kuilXdJmto4TTDSBWYCDrHzLv5DyAQsxjwujxMH1C2OxXxrgrBbWJLDlt0U?=
 =?us-ascii?Q?VjB5HJkHaCdM0i3ZVwz4MoyYM7Of6m9Ute/UhvkMJ/BkqDjYCnW7V29Tg3PL?=
 =?us-ascii?Q?qkUqfQSuwarjKJTas7+DCfpWfaf4+Ug3IpbWEiwBOfYZZdV4fGzMyb4ZOwZH?=
 =?us-ascii?Q?PfKUSePNipmYaa2yW7HyPIIZlCSZJvuc86q78I/qdIIUMwqalVyspaMfydrr?=
 =?us-ascii?Q?1fCBlOBWPPPLfAtxgRYQXNYrFQ8+30S3MTty/xFSrbdDDMkYMXMdzi4pQx08?=
 =?us-ascii?Q?DeHJIYK+UYHog4zhzkWZ+oIUrjF47TqCy/brGHYzZuboQVKM/iDfj0NE0rO2?=
 =?us-ascii?Q?67czOzqy1L6tfGBYbx2TEzhd5ksnHoCHwkGnW0dsnSle9stpnphoN6XRYW0N?=
 =?us-ascii?Q?Dd8BzrMvVgytVzP6n9SdJPl1D/ygBPImSRXHnlyGC5zap9rplq/5f+5msRva?=
 =?us-ascii?Q?k0yG3LUXHkwsjiOOwoyN3o7OegGYl/fIf++ZaMCU5JC2eC3ORzNyXMAFikt6?=
 =?us-ascii?Q?UB2z6OMxdrU+gOPfLnH75ctUxqBW4ocpHuSlLotORL+RC6KTJlP86E3nEeG7?=
 =?us-ascii?Q?IBd8o3aiOolmCM2fb2k0ThfJosMqkm5w9R9+MzQ4klxhpNLnjQq1YIijffV6?=
 =?us-ascii?Q?AV0gFVDjm8B5v1YTkhIp3MyIWVNCYyEod9bufjEtL/g1+iklXAw0spcSJml5?=
 =?us-ascii?Q?PEF4kJKFtj7CZg5XflcrlqDgc0i2BRe7AqedX1iqM6QnaFzygwDcpBimHr4g?=
 =?us-ascii?Q?WxoEgxz245ieH+AG78bz3KSsjn7CxbRSxWhEYYLL4uWIhDKO5bajyXMC/fOd?=
 =?us-ascii?Q?8UjtbSX6zLk1b7k5vUpfmyuizI70w6sjoRFC9db+OL4MrFHleqrdE09aSCGH?=
 =?us-ascii?Q?sHjzAVa9S8N6hphYSEWkqZLG4akJdgyJIW5NMnrFIrUU3AQTqiRTo29PLKS8?=
 =?us-ascii?Q?pZ7y9jenXOZAlqMaiAeCZVW5ecSQut0nFTN1pgwcVLPfZ0hyTyZ2woaCDEIO?=
 =?us-ascii?Q?DYcjYDMV/eSKhpug3IlPqinxTr8ecR7cQBviVm3iUv7dPJMmoe79jBzs2A1r?=
 =?us-ascii?Q?CPyjF55KiDMorWh6JlvSvZeSlFT/sRcBjHLSXSDaNa9a5WHIRS8nchpRNKOC?=
 =?us-ascii?Q?vCCNY7L5g/oeSY24cBOLmxuJHlnOAWO8JuwG6XRiXrK9XHmvQCsi97tyHlKS?=
 =?us-ascii?Q?GQTLGvZIFOsVqGUxpz2TKqk6MkdRNkPXU0l0X89Vs+sumlY/vKVzGJKxhnhP?=
 =?us-ascii?Q?JpQ+B9q45NwDUuBQQ4xNkmLv5iLXlnup3Ou6v3CDm+ktbFvqgdP19mJWOLgl?=
 =?us-ascii?Q?R/YvCM2d8XGIU/mcTbd9AL3OfRZ2oG/oJ2M2PrqUnzy9ZPdZgl3GCmrYvRz5?=
 =?us-ascii?Q?gPcar5/7oU7zNUdEFGq8LV0FFieVqNC8hktv6J+lSm2w5NHkIXfzEsL1WzBR?=
 =?us-ascii?Q?0nwRQby0b2j6zMhaXJYJKSD7Kh6MI2cuxKjJNfqqQ76hwsWYcFBSfMtPH9Db?=
 =?us-ascii?Q?6P/SHdHSqcLEqKcm5mVWuGpd95VouC5Qtx+r3fXDatKQGyjUSIt7urLD2Y1q?=
 =?us-ascii?Q?YrgT3zWJDjgrCQ08bIztglTQP0bPNI7gd4LO4McFUtr4fT8BeWOgL8ZFt7xE?=
 =?us-ascii?Q?NVybiB6rbh+/lAUwy9+5zzyZG45ybIIMNoQ+1AFD+H989mkG0wEK+33fawYU?=
 =?us-ascii?Q?r6XHFp1Bv0JW6BKry9KZoTcd/zd7wJwfO8Q5eOmV+xVveLp46SKxSxzDbfoO?=
 =?us-ascii?Q?+ZkP+R3uIw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ac4699-0403-4a7f-239e-08de504d88e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 13:38:27.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ay6Oyto+5E0IvA7iLh96JhktrtfUszhqVcvrFx/Pvjw/7ySLuzxEMJYNdDpNHgJpvLb7ZicHsAp0vihj+DkcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
X-Proofpoint-GUID: PViwmcYXh267ao5nwelchyM9OnRfOpMG
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=69625654 cx=c_pps
 a=5eE4sFn3BonZCz/fQf+K5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=7GTQWQsI4RsqNBmjVrQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDExOCBTYWx0ZWRfX9102geMm2VMR
 sdMJhZrLrWoZCB9uWvvv+J/9176mkm74Yc/U4eofjQwD2kBHlX3oa2uaYXA7bQUFFWZzpRO8u/p
 VCfw437v04s/VIB5M9abKrX9E+kOTHRy2IoUNFh+bdjrx8/ET5L+rxQMfaSdCpKuhyt0oY6N1gM
 7PA9GDToZuSfvbRkKNS2SstT520gpynltDW0Igy4nIOIectbbZuNX0ZhcluE3EeLSeTt5ky1CeJ
 P1/V8tYdR7X1fgXyiyknTtlwHomKYQxiY209ReqXZFSUsVLKZ/2N6klXRSc3MKyfHy5MYOkCf5f
 7dI7nMPnd9sms33ehHnKtBkmzV41dpBQ+eoGWf1XTlipu9djoYYiwPQDPYc88gMt0AOgf0bVcfG
 bD7UyKTrMQ5Qb2BGXB671vAEt1Nkps36ByQSF4Sw660yn+x1o/wy7j/7DrLuDq2mAMK77rz4Ddw
 s/dYJa3MkyUuTMadE5Q==
X-Proofpoint-ORIG-GUID: PViwmcYXh267ao5nwelchyM9OnRfOpMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 13:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123327

Ptest results:

$ run-ptest
PASS: async_shutdown
PASS: block
PASS: bug328
PASS: bug777
PASS: bus
PASS: cmsg
PASS: device
PASS: device4
PASS: device5
PASS: device6
PASS: device7
PASS: domain
PASS: emfile
PASS: hash
PASS: inproc
PASS: inproc_shutdown
PASS: iovec
PASS: ipc
PASS: ipc_shutdown
PASS: ipc_stress
PASS: list
PASS: msg
PASS: pair
PASS: pipeline
PASS: poll
PASS: prio
PASS: pubsub
PASS: reqrep
PASS: reqttl
PASS: separation
PASS: shutdown
PASS: stats
PASS: survey
PASS: surveyttl
PASS: symbol
PASS: tcp
PASS: tcp_shutdown
PASS: term
PASS: timeo
PASS: trie
PASS: ws
PASS: ws_async_shutdown
PASS: zerocopy

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../nanomsg/nanomsg/run-ptest                   | 16 ++++++++++++++++
 .../nanomsg/nanomsg_1.2.2.bb                    | 17 +++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/nanomsg/nanomsg/run-ptest

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg/run-ptest b/meta-networking/recipes-connectivity/nanomsg/nanomsg/run-ptest
new file mode 100644
index 0000000000..447867aedb
--- /dev/null
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+RET=0
+cd tests
+
+for t in $(ls *); do
+    ./$t
+    if [ $? -eq 0 ]; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+
+exit $RET
diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
index 10ae7a61d7..f291326c80 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
@@ -10,19 +10,32 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 SECTION = "libs/networking"
 
 SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master \
+           file://run-ptest \
           "
 
 SRCREV = "ccd7f20c1b756f7041598383baffcdc326246db7"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest
 
 # nanomsg documentation generation requires asciidoctor,
 # not asciidoc, and currently there's no asciidoctor-native
 # recipe anywhere in openembedded-core or meta-openembedded
-EXTRA_OECMAKE = " -DNN_ENABLE_DOC=OFF "
+EXTRA_OECMAKE = " -DNN_ENABLE_DOC=OFF \
+                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-DNN_TESTS=ON', '', d)} \
+                "
 
 # we don't want nanomsg-tools to be renamed to libnanomsg-tools
 DEBIAN_NOAUTONAME:${PN}-tools = "1"
 
+do_install_ptest(){
+    install -d ${D}/${PTEST_PATH}/tests
+    find ${B} -maxdepth 1 -type f -executable \
+        ! -name "*_lat" \
+        ! -name "*_thr" \
+        ! -name "nanocat" \
+        ! -name "libnanomsg.so*" \
+        -exec install {} ${D}${PTEST_PATH}/tests/ \;
+}
+
 PACKAGES =+ "${PN}-tools"
 FILES:${PN}-tools = "${bindir}/*"
-- 
2.34.1


