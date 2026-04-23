Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465AAFAD3EE
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 01:48:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3473.1776908920922290729
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 18:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=cSPZBW4C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=857337a20d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N101rf1195472
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:48:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=/aoHdd+CJRLuSONsVYI7i1n20X4SqzfzZ+5fgulm2cw=; b=cSPZBW4Cz2Ux
	OpBfo54SV9LYOlKLYKuc9gxwJZzT0mH4+c6w3UtlPg+2Tjbjm7emVbQtHOEEIUfm
	sb1I3lsdgPMueAUuZx4vR+u8sQK+ecXHvUw6DEIojuu+XHvrWRBp/2jfVk9kuC0N
	XlxPgMe97x/P5XV0nRN1BBxYK+gXXVNaVkrxSIss4SDolfTKp/hkMBu3MZ5m1C94
	GEGF6tbHh4feX3T61D2IUGhlTrBBLW4ZryxtvTxSNMQdgdlgrPb7DTe4gBM/RlCD
	MJ3ZXfxjBV9bML1vtmeFLKNszHGXuPOznQB31wRP/LL2uZsAJITbR9cUStb1KN68
	Y/Jk9v0ffg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8rcr21r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiuZsHj7FdzT7UFyGZi1obVlscOQZnf34hxiwoXbAy2vKcyAGj4gROrI9TXxKRC/jNXjvMVmjJAbIum51XXFt7Vru4sKTzkmsRTbhw8FSxY0qcgrzJHimng2t3WVScxePLeNN82mzfWf/hUx4g+kytTDglatR7zImrD6FZt9/B1zuAA8CVtDFk4S4U7wrSxqntPpPsC8XJ0Jub58uj/hCpL7hZWaHZuxu/6hIM9Wjz8vBKZ/NQZlHh/OYlFWk2NI+OD9rjai/W/1ME9ZMja58Ydw2uGSTa8jDKgB6/T97jNEJCWCqqPRCh0YKAs/tIaNGxDs0oWSv8CyJiOrgOnWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aoHdd+CJRLuSONsVYI7i1n20X4SqzfzZ+5fgulm2cw=;
 b=g1M+ACBh85ofsAtsoQDvE/ImzUe2eNI79wo9lZo/JC17CUarP71uPDnSTbpHRYUo201k13+f2BFb7sQ9IgyxfuMZvRA5r2bkHr5meFL7V/XWLncgWP41z6pHBY3AoGG1GGOtkpBTPvl7vP3MSOvMHzt+2+SqYtg2iQvjTKophPRMMIVX3xH36v6ijBic9OqHudC0NIUPxOFM6+hOfdwhRtaIQuICCzwDE2rfqiTYQVh5PxrKD1tdMUbCizX2YWT1GKCZSgqPu/o+g4Mzjs7Jhg9i3V3GHwCxzFb7dVDGjlHeQHxVlztWM8D/OamXABBWMr2x7Pvv25ZRMjR5wMdmdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA3PR11MB9421.namprd11.prod.outlook.com (2603:10b6:208:578::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.16; Thu, 23 Apr 2026 01:48:36 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 01:48:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] frr: fix mgmtd crash on ARM32
Date: Thu, 23 Apr 2026 09:48:19 +0800
Message-Id: <20260423014819.945909-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423014819.945909-1-yi.zhao@windriver.com>
References: <20260423014819.945909-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA3PR11MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 13103f2d-41b8-49a1-8a28-08dea0da6efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	V2UJpVZ3F1jKlaGKIqoF1BXOG8uxd+6ONB+3utpz540/9xxU/FNz7EM1mcUsZrBaLXdCQ+CvhGecmJFW9iYK0p4is2SchpVla8Fe17/Xdr2+DUxoiT8ncRNHevEaC8+FLHjKq49whg29CbCH8FTB8leAMWPqUh/ogI4LccHvikzdhLyMjjQ2kw23ODlIREy6UB5G5dH+/iORvtKgfm691xoOq/bs3lucQ3D7OREMJC+N6yOf45TxQm/+rhX8+eFQLnh5OLvEMhAp79x19DhMDZX4TkTP/UB6pXVZL3FbedV2NjTHO7tau6GjDUaiJUNpXWEyq8KHHYoNbM+og0QpGuifsFHrYeEDM6Vp7TlkpkeYMUovsezF0nGefLiMg/gXP+L4nma5bznSaBriioohQNpX2S6SDR1bwhIL6YYL0AKE3/jds/inbaoi65UK84qnq5zD2fWtLfW9ueyYUocLWLSvEpLI0J6A0pMAEqmwYyF93LhtTD1CXYXu/pPd9P2Fs2DuYIbAuIZM1njIK9/oaf7rJdWt1LTsDC0QZEJ7O2jmqkyJDsL5ZHE0gONj68RfB3cMfVRHkPq9MTRrS811Q7aPkQxJGMvM67YD7LawEKT2VdCu6HY1iM9bvmgYhvTSYxMEGfgsSWebcUiaW4RJclAq4GfK2g8rkctremHiIoHwPiFvpgZiiRSBt9y67LC6Bx8jMLOX7nsN6nIrr9mJhYr2SfAtBY9niUt3oUDW+Ho1GlZUjkeCyCZaRGi8pdgH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Nml6d3EwZkZKNzZGR0U4SkZVcXdsQ2RGZ2NQWHdUNktCVGYwZk9pUkhueVEz?=
 =?utf-8?B?cTZ3VkpRUks5dlZuMVdqOXFuTU5vR2tyK0VvdW1yNmhJSkoxZ1FNSzZoYzBO?=
 =?utf-8?B?RnJpUmw2ajdGWEN2Tkl3N0FSMW9CQURPOE9ZcHhGY0NEc1RUSkFRVk1jQmRK?=
 =?utf-8?B?MDJUdGFET0M0VGFVUWxzemhEK3lpa281UnZ2cmZrRUdUaGNmaEh1YUlsYjZk?=
 =?utf-8?B?R21UWVo5K2NhTmlMSUo0L01yOUpybEk4ZmNjSjBuTStTdDg1RmFmdUxFZXVp?=
 =?utf-8?B?THdxTFFJLy8zTHludmpHVW9MNURCMHpvU1JPRnhDQSt1eklvc2Rmamt3SXh3?=
 =?utf-8?B?MVdXQ05UWmFNUWEvREZFNWU0RkRiM1ZSN3RYUFgrZzNwcWtJcVpWUE15eE9n?=
 =?utf-8?B?S3I4QXg0N1BsMjBiYjdMOXZGb0preU0zZXQ3WFdvUGx5ZjVINEFKRVlraU8r?=
 =?utf-8?B?enJ0RVc3M0htNDRnTnVua1R2Yi9HNEN4ZjVRdTBSUFBXUmFiczNlT2RZTHFZ?=
 =?utf-8?B?L1pBNEpPVTM3VzM4ZkxNUDNxZTQ3dGlzVVNjeHMyN2V6Vkp6YytyQmdCLytF?=
 =?utf-8?B?WWQ0UmJpenkzK0ppT1R1cmRXUUxMUUxJelRTNzVjNFNoME5sOU9jR1Zkbk1j?=
 =?utf-8?B?d0ZlZXBnL1FtYVNvZm9rbHFjLzFXNU9lTW5RSFM1RzQ2aWplMjdSV3pOaEFS?=
 =?utf-8?B?N2c2N2JhbHJRMHVlT0FNRU1Rd2RCSEIwYUxlZnFWbGVwMkNYNEU5OExKTC8v?=
 =?utf-8?B?YVdyTjhyL1lVZGNQZ0xVdGtlTkV3cnJNeTNvajdFQUZHaVVSc1J5bXpaSGhh?=
 =?utf-8?B?NnhBSUJlVlZXMTQxMUdpdS9ocUo5dlJPbDBDWU5rbW9XMXhyYlgrSXpMMGYy?=
 =?utf-8?B?QW5XTWlUL29DUFNFVVBlZU51ektwOHpHNi9uNyt0MkVNRFUrTkx6ajk4Rk93?=
 =?utf-8?B?Y2ZGbDRBaFRqZUtacTZwVjBKZVRQN3FHV3lQQ0JtS21Pc3pxKzR1bmFLeTZ6?=
 =?utf-8?B?MktLeDhOV2FUc0l2RG1wM2pRWWdQek5OVWNpeE4yYlphQ055bHJ0TXpLQlI0?=
 =?utf-8?B?d0k2WWtkdWVkVXRoNlFsY2FVckU5QWtQOTRGVXdjRHZtOXNmQXVxRHB6RDRi?=
 =?utf-8?B?WDM2YmtUb0l3ZjVKelNNZS9KRUUwRXF2QysrZDM3bzJYUDE5ek1rVXFDNk40?=
 =?utf-8?B?OEtlZmllUk1BVU4rUjAxZCtsRmlUbllLLzRWdU5QT3lJbWorQjlGWEcxTito?=
 =?utf-8?B?eksrdEVIR0oyUTFhZ2RkSEpGZVo0Uy9IRzdMWDcwRDgwZ2s1SDFDbENiMTN5?=
 =?utf-8?B?YTk0RjdGb2tJSGkzR0xHSWVlWDJxOVZqMEZsVmpNSlR4RGFGdmk1VlNYcUJq?=
 =?utf-8?B?R1dwTXBXYkpSaG9hR0E1c3BoZmVnaWxNVkdQUC92Y1I4Vm1aK0hpNFV1V1Jj?=
 =?utf-8?B?V3VJYnlLbVgwL0ZWcHFTMFozOVdPQUs1MzBySE1sLzRoUFpoZ0JOdlZzU2tl?=
 =?utf-8?B?SEVicTBBZTZNeWVXQndVR3ordlg3MVdCZFFpRVRycUd6eE1tZ2R0NmIyU0VL?=
 =?utf-8?B?enRhaXp2NDVEZlZHQzN1dmhJUzRraXJJMmJyWVdjN214UkZ4NXFEMlAvUTFI?=
 =?utf-8?B?L1ZPWkVWZ2F3K01KTTV3SGVxY3JJV0hjWlV5a1FLSEVLZkJiSUNMY3V5aS9l?=
 =?utf-8?B?S1o3aXkwRzRybUYwU2M3Vk5zYXlGVzBkYjVVQXNndk9Gc2NkVlpaL0RNV3JU?=
 =?utf-8?B?eUQzN2JOcWFYdXpncnRJcC9hYjR5cGdROGdXR1ZnUkorZW1EZjJNNTQ4Smp2?=
 =?utf-8?B?UGhFWENrZ1dhT1MyTERnT2N3NjRiRWp6MzlSVXQ2djhPQkhJbWtJVGRrMVZT?=
 =?utf-8?B?aEppTDBCR0lHeFJMWm5nbis2VjlvdHFXODlPdnlQR1ZPOGgwR2NFdDFhM1pt?=
 =?utf-8?B?R3FqTThzbXB5anhOTmpzUDZGa2cvUmtvTllvNGd0VVZ2ZTY3dFdXZlluWVFr?=
 =?utf-8?B?dEVQZ2RIYzhPck95TzBGYjdNN1IvQ2N2RkU0elN5eU9RaU5hWUhzZEdPcDJB?=
 =?utf-8?B?ckxQWk9mcVBmR2xMMGF0ckhwdWRlRlRUN2ZzNTUxL0lMeWVUTHlSUlhwcng5?=
 =?utf-8?B?MnNKc2FzYlV5WHJzaEpXeTlmUVRkVU9oNmhnYU5PN1FHbWlUc1NITHBGazhn?=
 =?utf-8?B?a29QaTdDamJQVkZJaGhFRjBqekhJZkVFbmJDdmR5bUlBS0I3OTBPU3VBUDNw?=
 =?utf-8?B?elVtMkppZjJGVXdBNEdWQmxqZUViVklqOGpCU2lHOWFMUWRETDdCT3k2SVd6?=
 =?utf-8?B?TFN5ZzhjS0pieDlkY1pUWU4vZnkrRFI0TFJWbEw2QjVpL0tNRjNkZz09?=
X-Exchange-RoutingPolicyChecked: 
	KLDLOuSPlYLwHodWXuEMms9f+/F8h1aDGjrRyqAyOa4C0BwZvpXgcSOjWI8woQnAnCNa8tIqd1EduF9wUN0AKg0g9i5OlvLrMAFeojcxPeWg//q09dZupDXisWPSnhtBFYmaXshO+QTRnmyhAgUNgR8/d5dwZmB/LV9m/zBGxJMj9pFBNf8fqrMzYoQdQxYWy+W8HtktDK/FX5FXvK8OFs0ds2Y2wIXcdZIWdPgkqKgpdPy9xd0IDwTdPGLJyViop/GxzXncb50I0EVmlXXqLRYXSQ7xf91tj/IhO7+ULu6lsJ0WXGOQA2cGlJfiPrlmbVBR9A6ifNqwx2Yw3BFRDw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13103f2d-41b8-49a1-8a28-08dea0da6efc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 01:48:36.2371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRnawqPym050etR4fHZ05iV99RG/GkS6/ZOJoXjOStsR3O2clzocnehRgeywoIligGK5XeRvPLlQLSclols0dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9421
X-Proofpoint-ORIG-GUID: Vi2uA3gTS7AE7DJx3mPW8aBWgMOHcT6R
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69e97a78 cx=c_pps
 a=GI5TgwD/LrSAXmlNZGMSjA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=nZ40scU-AAAA:20 a=t7CeM3EgAAAA:8 a=wU2YTnxGAAAA:8
 a=u9XiZHwLAAAA:8 a=P-IC7800AAAA:8 a=ZPpYJ6LdIiJ9JR2BXO4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=Yz9wTY_ffGCQnEDHKrcv:22
 a=_dVK9oMV_cxv_JnhfDLr:22 a=d3PnA9EDa4IxuAV0gXij:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: Vi2uA3gTS7AE7DJx3mPW8aBWgMOHcT6R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAxNSBTYWx0ZWRfX1ZHZk1dGkn/C
 FjhogI/d+aWmrSN3xIE6hT+MlniKYcPO6sSru31FeG/1eh1U8She3gPCL+PFDRE5DvdGL8aRPjC
 RSpr5hJ4WMODARMVUZ9pF639gZvn6Kp1LHsifnD9tBazOqq1smy9LBWodQqlOvXPbKmnn1Pjgcb
 ZCuwVBBknttQ0SFhmCda33zh1EGcOz/Tfq7Ud3JUL2V/v97kn7NN3mntSQtqzLoCwBDCgXaZuMO
 6/IY/lAtXkHdA4E6OL97LHlq54P7Dai4R1dMwSfjI0wQzKs8/I/s8yW/TJe3KRpns6uagSpLpdk
 Koy2Jd85QMjb8A0vVfMVLifkgHrim/sYkvPoislIirbieB/pIBKlB6t5fuacsoQKw+kbOllGlZi
 5FnaF3LsJBaoIL9u6ONOKbEs6XA5UpdtWT0ZpNqGyAkzcmg6sTHSw/VZzanqFchoQwQ+U+JMBJs
 +LC9rnRwC1hO9/dlg3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230015
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63N101rf1195472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 01:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126565

Backport fix[1] for MGMT crash on first start on ARM32 platforms[2].

[1] https://github.com/FRRouting/frr/pull/21651
[2] https://github.com/FRRouting/frr/issues/20087

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ..._msg-recv-to-deal-with-mis-alignment.patch | 352 ++++++++++++++++++
 .../recipes-protocols/frr/frr_10.6.1.bb       |   1 +
 2 files changed, 353 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-lib-fi=
x-mgmt_msg-recv-to-deal-with-mis-alignment.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-lib-fix-mgmt_=
msg-recv-to-deal-with-mis-alignment.patch b/meta-networking/recipes-proto=
cols/frr/frr/0001-lib-fix-mgmt_msg-recv-to-deal-with-mis-alignment.patch
new file mode 100644
index 0000000000..22cc10cf31
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-lib-fix-mgmt_msg-rec=
v-to-deal-with-mis-alignment.patch
@@ -0,0 +1,352 @@
+From 5959a3d0cbc73b0c41134bf0d9944a6bd40ba510 Mon Sep 17 00:00:00 2001
+From: Christian Hopps <chopps@labn.net>
+Date: Sat, 18 Apr 2026 03:01:46 +0000
+Subject: [PATCH] lib: fix mgmt_msg recv to deal with mis-alignment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+We need our messages to start on 64 bit boundaries as the message buffer
+is accessed directly as structured data. In particular on ARM32 arch
+using the data this way lead to unaligned access and SIGBUS.
+
+The minor optimization of reading multiple messages into a single stream
+buffer complicated this. Instead we KISS and switch to one message per
+stream buffer.
+
+Fixes #20087.
+
+Signed-off-by: Christian Hopps <chopps@labn.net>
+Co-developed-by: Samir MOUHOUNE <samir.mouhoune@nav-timing.safrangroup.c=
om>
+Co-developed-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
+
+See also PR #20985
+
+This issue was identified and another solution was provided by Samir
+MOUHOUNE with the following commit message comments:
+
+On ARM32 systems, mgmtd crashes at startup on an alignment fault:
+
+```
+  frrinit.sh[158]: Starting watchfrr with command: '  /usr/sbin/watchfrr=
  -d   mgmtd zebra staticd'
+  watchfrr[168]: [T83RR-8SM5G] watchfrr 10.5.2 starting: vty@0
+  watchfrr[168]: [ZCJ3S-SPH5S] mgmtd state -> down : initial connection =
attempt failed
+  watchfrr[168]: [ZCJ3S-SPH5S] zebra state -> down : initial connection =
attempt failed
+  watchfrr[168]: [ZCJ3S-SPH5S] staticd state -> down : initial connectio=
n attempt failed
+  watchfrr[168]: [YFT0P-5Q5YX] Forked background command [pid 169]: /usr=
/sbin/watchfrr.sh restart all
+  frrinit.sh[180]: 2026/02/27 09:14:13 ZEBRA: [KGY44-D47GD][EC 404330911=
1] Disabling MPLS support (no kernel support)
+  watchfrr[168]: [QDG3Y-BY5TN] zebra state -> up : connect succeeded
+  kernel: Alignment trap: not handling instruction edc30b02 at [<004c3c1=
c>]
+  kernel: 8<--- cut here ---
+  kernel: Unhandled fault: alignment exception (0x801) at 0x008879f6
+  kernel: [008879f6] *pgd=3D9baf6831
+  watchfrr[168]: [YFT0P-5Q5YX] Forked background command [pid 189]: /usr=
/sbin/watchfrr.sh restart mgmtd
+  frrinit.sh[189]: Cannot stop mgmtd: pid 179 not running
+  watchfrr.sh[196]: Cannot stop mgmtd: pid 179 not running
+  frrinit.sh[202]: [202|zebra] sending configuration
+  frrinit.sh[202]: [202|zebra] done
+  frrinit.sh[216]: [216|watchfrr] sending configuration
+  frrinit.sh[218]: [218|staticd] sending configuration
+  watchfrr[168]: [VTVCM-Y2NW3] Configuration Read in Took: 00:00:00
+  frrinit.sh[199]: Waiting for children to finish applying config...
+  frrinit.sh[216]: [216|watchfrr] done
+```
+
+When checking crashlogs in /var/tmp/frr, mgmt gives the following:
+
+```
+  MGMTD: Received signal 7 at 1772183653 (si_addr 0x8879f6); aborting...
+  MGMTD: /lib/libfrr.so.0(zlog_backtrace_sigsafe+0x5c) [0xb6e89c90]
+  MGMTD: /lib/libfrr.so.0(zlog_signal+0xe0) [0xb6e89e80]
+  MGMTD: /lib/libfrr.so.0(+0xd4374) [0xb6ed3374]
+  MGMTD: /lib/libc.so.6(__default_rt_sa_restorer+0) [0xb6ab4d90]
+  MGMTD: /usr/sbin/mgmtd(mgmt_fe_adapter_send_notify+0x6b8) [0x4c3c20]
+  MGMTD: /lib/libfrr.so.0(mgmt_msg_procbufs+0x124) [0xb6e976b8]
+  MGMTD: /lib/libfrr.so.0(+0x98798) [0xb6e97798]
+  MGMTD: /lib/libfrr.so.0(event_call+0xa8) [0xb6ee739c]
+  MGMTD: /lib/libfrr.so.0(frr_run+0xd4) [0xb6e80fc8]
+  MGMTD: /usr/sbin/mgmtd(main+0x188) [0x4bd7ec]
+  MGMTD: /lib/libc.so.6(+0x236b0) [0xb6a9f6b0]
+  MGMTD: /lib/libc.so.6(__libc_start_main+0x98) [0xb6a9f790]
+  MGMTD: in thread msg_conn_proc_msgs scheduled from lib/mgmt_msg.c:543 =
msg_conn_sched_proc_msgs()
+```
+
+The issue is that messages are queued for sending/receive back-to-back
+with no padding. This means that when mgmt creates a pointer back to the
+data waiting in queue and tries to access fields inside the dereferenced
+message, those accesses are not performed with the alignment constraints
+required by some architectures. For example, ARM ABI AAPCS32 ([1])
+states that structures alignment should be the same as the "most
+aligned" member; so a struct mgmt_msg_header, which contains some
+uint64_t fields (which are 8-bytes alignes), should be 8-bytes aligned
+as well.
+
+On x86, this goes unnoticed because the CPU handles unaligned access
+transparently. On ARM 32-bit with NEON/VFP, the compiler generates
+64-bit store instructions that trap on unaligned addresses. The kernel
+cannot emulate these instructions and kills the process with SIGBUS.
+
+[1] https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst=
#data-types-and-alignment
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/5959a=
3d0cbc73b0c41134bf0d9944a6bd40ba510]
+
+Signed-off-by: Christian Hopps <chopps@labn.net>
+(cherry picked from commit ae7d79f8ff25d5750e5796567ff6317030900d40)
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/mgmt_be_client.h |   3 +-
+ lib/mgmt_fe_client.h |   3 +-
+ lib/mgmt_msg.c       | 157 ++++++++++++++++++-------------------------
+ 3 files changed, 68 insertions(+), 95 deletions(-)
+
+diff --git a/lib/mgmt_be_client.h b/lib/mgmt_be_client.h
+index f5627e3c4e..2f412a6fbd 100644
+--- a/lib/mgmt_be_client.h
++++ b/lib/mgmt_be_client.h
+@@ -21,7 +21,8 @@ extern "C" {
+=20
+ #define MGMTD_BE_MAX_NUM_MSG_PROC  500
+ #define MGMTD_BE_MAX_NUM_MSG_WRITE 1000
+-#define MGMTD_BE_MAX_MSG_LEN	   (64 * 1024)
++/* Messages can be any size, this is just the preallocated buffer size =
*/
++#define MGMTD_BE_MAX_MSG_LEN (4 * 1024)
+=20
+ #define MGMTD_BE_CONTAINER_NODE_VAL "<<container>>"
+=20
+diff --git a/lib/mgmt_fe_client.h b/lib/mgmt_fe_client.h
+index 8ff08b566a..3005c5dd01 100644
+--- a/lib/mgmt_fe_client.h
++++ b/lib/mgmt_fe_client.h
+@@ -29,7 +29,8 @@ extern "C" {
+=20
+ #define MGMTD_FE_MAX_NUM_MSG_PROC  500
+ #define MGMTD_FE_MAX_NUM_MSG_WRITE 100
+-#define MGMTD_FE_MAX_MSG_LEN	   (64 * 1024)
++/* Messages can be any size, this is just the preallocated buffer size =
*/
++#define MGMTD_FE_MAX_MSG_LEN (4 * 1024)
+=20
+ /***************************************************************
+  * Data-structures
+diff --git a/lib/mgmt_msg.c b/lib/mgmt_msg.c
+index f299b52873..fb56f58ab5 100644
+--- a/lib/mgmt_msg.c
++++ b/lib/mgmt_msg.c
+@@ -13,6 +13,7 @@
+ #include "network.h"
+ #include "sockopt.h"
+ #include "stream.h"
++#include "zlog.h"
+ #include "frrevent.h"
+ #include "mgmt_msg.h"
+ #include "mgmt_msg_native.h"
+@@ -39,8 +40,8 @@ static bool trace;
+ DEFINE_MTYPE(LIB, MSG_CONN, "msg connection state");
+=20
+ /**
+- * Read data from a socket into streams containing 1 or more full msgs =
headed by
+- * mgmt_msg_hdr which contain API messages (currently protobuf).
++ * Read data from a socket into a stream containing 1 full msg headed b=
y
++ * mgmt_msg_hdr.
+  *
+  * Args:
+  *	ms: mgmt_msg_state for this process.
+@@ -57,96 +58,80 @@ enum mgmt_msg_rsched mgmt_msg_read(struct mgmt_msg_s=
tate *ms, int fd,
+ 				   bool debug)
+ {
+ 	const char *dbgtag =3D debug ? ms->idtag : NULL;
+-	size_t avail =3D STREAM_WRITEABLE(ms->ins);
+ 	struct mgmt_msg_hdr *mhdr =3D NULL;
+-	size_t total =3D 0;
+-	size_t mcount =3D 0;
+-	ssize_t n, left;
++	struct stream *news;
++	size_t nread;
++	ssize_t n;
+=20
+ 	assert(ms && fd !=3D -1);
+-	MGMT_MSG_TRACE(dbgtag, "enter with %zu bytes available to read on fd %=
d", avail, fd);
++	MGMT_MSG_TRACE(dbgtag, "enter to read from fd %d", fd);
++
++	assert(stream_get_getp(ms->ins) =3D=3D 0);
++	nread =3D stream_get_endp(ms->ins);
+=20
+ 	/*
+-	 * Read as much as we can into the stream.
++	 * Get header, validate, and resize the stream, if needed, to fit inco=
ming message.
+ 	 */
+-	while (avail > sizeof(struct mgmt_msg_hdr)) {
+-		n =3D stream_read_try(ms->ins, fd, avail);
+-
+-		/* -2 is normal nothing read, and to retry */
+-		if (n =3D=3D -2) {
+-			MGMT_MSG_TRACE(dbgtag, "nothing more to read on fd %d", fd);
+-			break;
+-		}
+-		if (n <=3D 0) {
+-			if (n =3D=3D 0)
+-				MGMT_MSG_ERR(ms, "got EOF/disconnect on fd %d", fd);
+-			else
+-				MGMT_MSG_ERR(ms, "got error while reading on fd %d: '%s'", fd,
+-					     safe_strerror(errno));
+-			return MSR_DISCONNECT;
++	if (nread < sizeof(struct mgmt_msg_hdr)) {
++		while (nread < sizeof(struct mgmt_msg_hdr)) {
++			n =3D stream_read_try(ms->ins, fd, sizeof(struct mgmt_msg_hdr) - nre=
ad);
++			if (n <=3D 0)
++				goto not_done;
++			nread +=3D n;
++			ms->nrxb +=3D n;
+ 		}
+-		MGMT_MSG_TRACE(dbgtag, "read %zd bytes on fd %d", n, fd);
+-		ms->nrxb +=3D n;
+-		avail -=3D n;
+-	}
+=20
+-	/*
+-	 * Check if we have read a complete messages or not.
+-	 */
+-	assert(stream_get_getp(ms->ins) =3D=3D 0);
+-	left =3D stream_get_endp(ms->ins);
+-	while (left > (ssize_t)sizeof(struct mgmt_msg_hdr)) {
+-		mhdr =3D (struct mgmt_msg_hdr *)(STREAM_DATA(ms->ins) + total);
++		/* Validate the header is sane */
++		mhdr =3D (struct mgmt_msg_hdr *)STREAM_DATA(ms->ins);
+ 		if (!MGMT_MSG_IS_MARKER(mhdr->marker)) {
+ 			MGMT_MSG_DBG(dbgtag, "recv corrupt buffer on fd %d, disconnect", fd)=
;
+ 			return MSR_DISCONNECT;
++		} else if (mhdr->len <=3D sizeof(struct mgmt_msg_hdr)) {
++			MGMT_MSG_DBG(dbgtag, "recv invalid message length %u on fd %d, disco=
nnect",
++				     mhdr->len, fd);
++			return MSR_DISCONNECT;
+ 		}
+-		if ((ssize_t)mhdr->len > left)
+-			break;
+-
+-		MGMT_MSG_TRACE(dbgtag, "read full message on fd %d len %u", fd, mhdr-=
>len);
+-		total +=3D mhdr->len;
+-		left -=3D mhdr->len;
+-		mcount++;
+-	}
+=20
+-	if (!mcount) {
+-		/* Didn't manage to read a full message */
+-		if (mhdr && avail =3D=3D 0) {
+-			struct stream *news;
+-			/*
+-			 * Message was longer than what was left and we have no
+-			 * available space to read more in. B/c mcount =3D=3D 0 the
+-			 * message starts at the beginning of the stream so
+-			 * therefor the stream is too small to fit the message..
+-			 * Resize the stream to fit.
+-			 */
++		/* See if message will fit in the stream, realloc if not */
++		if (mhdr->len > ms->ins->size) {
++			MGMT_MSG_DBG(dbgtag,
++				     "message length %u is greater than available %zu on fd %d",
++				     mhdr->len, ms->ins->size, fd);
+ 			news =3D stream_new(mhdr->len);
+-			stream_put(news, mhdr, left);
+-			stream_set_endp(news, left);
++			stream_put(news, mhdr, sizeof(struct mgmt_msg_hdr));
+ 			stream_free(ms->ins);
+ 			ms->ins =3D news;
+ 		}
+-		return MSR_SCHED_STREAM;
+ 	}
+=20
+-	/*
+-	 * We have read at least one message into the stream, queue it up.
+-	 */
+-	mhdr =3D (struct mgmt_msg_hdr *)(STREAM_DATA(ms->ins) + total);
+-	stream_set_endp(ms->ins, total);
+-	stream_fifo_push(&ms->inq, ms->ins);
+-	if (left < (ssize_t)sizeof(struct mgmt_msg_hdr))
+-		ms->ins =3D stream_new(ms->max_msg_sz);
+-	else
+-		/* handle case where message is greater than max */
+-		ms->ins =3D stream_new(MAX(ms->max_msg_sz, mhdr->len));
+-	if (left) {
+-		stream_put(ms->ins, mhdr, left);
+-		stream_set_endp(ms->ins, left);
++	/* Read the rest of the message. */
++	mhdr =3D (struct mgmt_msg_hdr *)STREAM_DATA(ms->ins);
++	while (nread < mhdr->len) {
++		n =3D stream_read_try(ms->ins, fd, mhdr->len - nread);
++		if (n <=3D 0)
++			goto not_done;
++		nread +=3D n;
++		ms->nrxb +=3D n;
++		MGMT_MSG_TRACE(dbgtag, "read %zd from fd %d (%zu of %u)", n, fd, nrea=
d, mhdr->len);
+ 	}
+=20
++	/* We've got a full message, push it onto the FIFO and setup for the n=
ext message. */
++	MGMT_MSG_TRACE(dbgtag, "read full msg %zu/%u from fd %d", nread, mhdr-=
>len, fd);
++	stream_fifo_push(&ms->inq, ms->ins);
++	ms->ins =3D stream_new(ms->max_msg_sz);
+ 	return MSR_SCHED_BOTH;
++
++not_done:
++	if (n =3D=3D -2) {
++		MGMT_MSG_TRACE(dbgtag, "nothing more to read on fd %d", fd);
++		return MSR_SCHED_STREAM;
++	}
++	if (n =3D=3D 0)
++		MGMT_MSG_ERR(ms, "got EOF/disconnect on fd %d", fd);
++	else
++		MGMT_MSG_ERR(ms, "got error while reading on fd %d: '%s'", fd,
++			     safe_strerror(errno));
++	return MSR_DISCONNECT;
+ }
+=20
+ /**
+@@ -171,7 +156,6 @@ bool mgmt_msg_procbufs(struct mgmt_msg_state *ms,
+ 	const char *dbgtag =3D debug ? ms->idtag : NULL;
+ 	struct mgmt_msg_hdr *mhdr;
+ 	struct stream *work;
+-	uint8_t *data;
+ 	size_t left, nproc;
+=20
+ 	MGMT_MSG_TRACE(dbgtag, "Have %zu streams to process", ms->inq.count);
+@@ -182,30 +166,17 @@ bool mgmt_msg_procbufs(struct mgmt_msg_state *ms,
+ 		if (!work)
+ 			break;
+=20
+-		data =3D STREAM_DATA(work);
+ 		left =3D stream_get_endp(work);
+ 		MGMT_MSG_TRACE(dbgtag, "Processing stream of len %zu", left);
+-
+-		for (; left > sizeof(struct mgmt_msg_hdr);
+-		     left -=3D mhdr->len, data +=3D mhdr->len) {
+-			mhdr =3D (struct mgmt_msg_hdr *)data;
+-
+-			assert(MGMT_MSG_IS_MARKER(mhdr->marker));
+-			assert(left >=3D mhdr->len);
+-
+-			/*
+-			 * Q: if the handler disconnects should stop/flush?
+-			 */
+-			handle_msg(MGMT_MSG_MARKER_VERSION(mhdr->marker), (uint8_t *)(mhdr +=
 1),
+-				   mhdr->len - sizeof(struct mgmt_msg_hdr), user);
+-			ms->nrxm++;
+-			nproc++;
+-		}
+-
+-		if (work !=3D ms->ins)
+-			stream_free(work); /* Free it up */
+-		else
+-			stream_reset(work); /* Reset stream for next read */
++		/*
++		 * Q: if the handler disconnects should we stop/flush?
++		 */
++		mhdr =3D (struct mgmt_msg_hdr *)STREAM_DATA(work);
++		handle_msg(MGMT_MSG_MARKER_VERSION(mhdr->marker), (uint8_t *)(mhdr + =
1),
++			   mhdr->len - sizeof(struct mgmt_msg_hdr), user);
++		ms->nrxm++;
++		nproc++;
++		stream_free(work); /* Free it up */
+ 	}
+=20
+ 	/* return true if should reschedule b/c more to process. */
+--=20
+2.43.0
+
diff --git a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb b/meta-n=
etworking/recipes-protocols/frr/frr_10.6.1.bb
index e86e0f3153..1cd102f0da 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://doc/licenses/GPL-2.0;md5=3D=
b234ee4d69f5fce4486a80fdaf4a
=20
 SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=3D=
stable/10.6;tag=3Dfrr-${PV} \
            file://frr.pam \
+           file://0001-lib-fix-mgmt_msg-recv-to-deal-with-mis-alignment.=
patch \
            "
 SRCREV =3D "71da51baee6fb2a02b24262defc46591c86e8a81"
=20
--=20
2.34.1


