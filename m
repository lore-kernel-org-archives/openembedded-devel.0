Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ED1EC01D4
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15263.1774266144309869666
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=a98PFgGm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5o1iP3735900
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=uKhm2cSKhz3561ZZP7KeM+DQTx8A69WrvMO7hTyJniE=; b=a98PFgGmaQX9
	ilO18AsvX4CY6pMPxG3FFZFUVpseDe6Pti0TkeJ5lqglhXj5qqrD8m97o9RQ8Fa/
	iyXXSTQrB8ZozoNSlP1bVEqgzTq3ll4o0jtV7hD/mYVU8zNe7SfD66bgOhYzLT3s
	L2TFsToN3vD5wgbX2dQobb/dRV9MKhr3cD+Y1mOsUjeG86oDJXALtyZR30SL1c3u
	bbj0YsJxa/PkFZ4ilF15iJ4bdKs7vjgoNx66+zkr3ot0OjL7Yas9f+D3JWQS7cPE
	pHE+r9nWBcdrYF7z0gFRPmYjosy8z9SH8iW7ebCiA3aJs4dGXYoC9CSOROTL5vPR
	y6S9wiTgbw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k3g-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzzZ1fAtAD5tVYFz2egH0nK2xc4kI+NKr8VDWqzmmUfx8pTcp4pep/LT4wpaUTiKxMhRbs7pgRKEMZo2jdNTaL2oPSqZStkR3AkPUtYualpWnC+unoklevfh8vIZDDN8MVUefHhO1rKvlozfMc3y0SsQQFWPXaV8XmgG/34fFyUaDLoepIEy7JFYVAT2ZFMcCyjAl6SKTyykhIeuLWUxqsidLK2x7irpCRECEvQ8BWvZVeHLRjhdjFwpmFyKVB9SOW2EAfdD9ZpnhFbSWU3qckhZU/1XZqYSYaiv1A2RgZ9Q6uUpo0S13pDYXidf3R3zqXAXsSH7NeQm96TaCvhlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKhm2cSKhz3561ZZP7KeM+DQTx8A69WrvMO7hTyJniE=;
 b=m9ZVM2itCqApO+YOYiO5H9n8ony/4CJTxm0IKHndik13rqGdzxBLm0AJTDMhCDk1bgiLef4t5KPiSNiEUYEyPfvrJmOyRwKt3AXf7rMlOa8k7uaJ79LoEqAaI+lJTt56M8RKOle8s+P6vqv7bH2a9PxHYIm+Kl11INLk9y560D74nSF2e4eWHyTsAyNfZ0lhPKHolSvZMz7B5eJD3RDqa4vVkOjda2iLaXy986hXODGzbBle4RFpuoydO5EiT5qVaSUDY7nJmPlHMQL1flZU4T2N3EEze+4XZ/HFFAuAgt9C5JkP+HJQM/ZzWHj3FHtaY99Jl4puJkNSBNxVJDxT4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 11:42:21 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:19 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 13/15] xfwm4: backport patch to add missing libxfce4util build flags
Date: Mon, 23 Mar 2026 19:41:50 +0800
Message-Id: <20260323114152.4178269-14-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: f3aae081-c005-4519-a346-08de88d13dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xLkKDVueGVytc5gEb4+n/vWNWJE4q1uaRd6RTpj2+Vc51FOHSGR75D0HxqENhqqK5clV6TowiYruyIk5dhyLPTvXjKuaSlxsZAbb4644zPv4xdFC4eCR8W4z+Ot6BtSFXmv9PpuNpl9czN+zyBe75EVbJUARjsnnBsXOxRHShB+Oxkrtc5+ylwnvnIKbgrGixPBNqV1nhZVFGoqPm75uOufHYMs7ijdWeLSHumCT1g/1y5TWhVdo2BPu8EiVYWG1S7JkOm0ZtA5DftWNuy2oInpiDnr5pG5oOodfWwmOMzWZjUuZR876IVU1aX++EOEycBcLc67Z1i9rAPNQUrKl+irEoVrJ9Yq+Wigs5pbhR2cloUU1ajT6+pVmE5iC2ZNjTTJWXLF+7fATqo0YLQcYHDW6VcybNDqssAqxV9tYeejlcQeiKz/zlP+fcpt9oS003pyDJNQubGcVGQTWoauz2ynruNJozvupiXNEJicliQR1GHTNzqLilosKD/8aqQ4DQLksWOufVAv5CpUGFAeolyRusYswkH9GdojwkpmyBAQQQTiYIgubklEDpMeAmDeiH95LBkI+7gAPkWMgC91HL27Na+voBhAb4PIMgNz6NgmdA/EWhupmrwiDH5Y9EaarPKFIHWPnSc4oXwmvfxYwbzS2dz+3FodcK5eFAFfQ8fa1OtzHymJgWXrtNBP3OMgnMWPGHIUb0f2kXr08tDlz33tRl9UToZ0MPwjcD/e21I13i3xYJLU+afmjZc49IMOjyrS51Q48EI1NAuyInCHxntw9ZdgQzvBLA8S8YDG58Xw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SW1RNEkrTFdHc212Y2tUTXllb0M2dnRubkVIQ3N3Z3VVajdtL2QxczA3bnNq?=
 =?utf-8?B?MG9RbHVna2p3K3RGL1JXUitvWE5ySk1UWko4WTFYdm9lMVhzcnVPUWlSVXVX?=
 =?utf-8?B?YU10c0pCTHNLVGUxMTlTc0E3UVRHYldCZHJEWGszZVR3QTVRV1NMSkhWMkow?=
 =?utf-8?B?Y2ZhTVJGNGZOckZtc21LaXBWd28zc2lOWE8yRTk3VFZwNkYyak5mc2F3Tlgw?=
 =?utf-8?B?SU5HeldxTWhMV0JiMWEyUXFwTlZGN1lvMCszb1V1Q0txdVlZNndMNG5idS84?=
 =?utf-8?B?ZEdycEdXdzlCL1hNUDMyNFpOdGdhOGtnRTZCTjZZQk1mTWZhOVVRWUhValdN?=
 =?utf-8?B?SjBTWjB6VFVkZmdFMUthM0Jqa2M0QWFVc0FNaks4bkVzS3U0TFNNUzcvMjhn?=
 =?utf-8?B?K1k1S3FHQVpBK3pBdDd1MFM5VFp5TS9IL2JLOWc0S3BUcWhEMDhzYUlhWnRU?=
 =?utf-8?B?UkJUdDlGU0wxcXZqSEpIa0s0cmxWbW9yTWIzNmVYR2tOVVRHV2xPZ0J2amVL?=
 =?utf-8?B?eGNUUENqRUpSR0ZtRDk3Y2tQemJhck85MlBBMEtJeUV1c1pKbE5RN1RkdVZF?=
 =?utf-8?B?b1U3U1FJZHRUdDVYZm9ITFZ2U1RZbWpnYnBZZ0JHNGEwc2Jta3FZZWw5Vzdn?=
 =?utf-8?B?elN5WHlEV1craDZpOHpzcFYzK0dadkppbXIyS1JUREVSem9VTEl0d2d2dnQx?=
 =?utf-8?B?TFE1QjZ1OTEyOVp3SW5qeVF2Smt6S1IzZWRZaDlGaWdidTdsT3psVkYzQ2sy?=
 =?utf-8?B?UFFLem45QzBXb1BlWnhDM2g1ZEt2UGtHR0ZZUytnWGYvZDh4OHFYVmE1R0xp?=
 =?utf-8?B?Z0tZd0JZd1ZTd01sazFENUNkRnVwc1AwbGRmT1Z4VGsyTE9LazU4QzlwNFgz?=
 =?utf-8?B?dFE4bjU4QXVoWWRpQXdBendlT3E3by8yRmhRRDkxS2JZMTUrbjE4Q1hna0Ft?=
 =?utf-8?B?SU5DU1JCbmRGRVY1Z0E0UEt6MnVPT0lmaUtHTEhnNU5MckZqaFI5T0VKUWNG?=
 =?utf-8?B?YTNTQmI2YVZyT1poNWtLYXIyU1pQMFNMaUV1MS9odDZnUkdYRzloRGYzelZy?=
 =?utf-8?B?ZEhxL2ZZYy9XYm9RckptTnVDTllBVGF2azlxV3huNU9STVk4Y3U3T3g5anl5?=
 =?utf-8?B?MDJSVWg0bnZVWldwYUdXRnZNTWxpK1lqWDZsVGRCcENaM1RLVTUraFRJalhz?=
 =?utf-8?B?b0RxK0pVcjJHOVJuRFFadXowQit3eldXOHJlZ0hydUMycjh1WEpGQUpSbDBH?=
 =?utf-8?B?ejJqb2ZGMWxhUUZMMCt4emlHMzdITnJZM00zbmFaQjZ4VFA0dEU1WEpBWGIr?=
 =?utf-8?B?NzlwTzVNRjI0SHVURmlTa052YnQrdjVXZ0VUdDVBeThmYkdVU0V0OXIwU2J5?=
 =?utf-8?B?UzliUGk4NmtXN3lRZFVxMnVOVVVtL0JMQjBaSWtqbU1TZ05UK1hxWG5tWEZu?=
 =?utf-8?B?UDF1Y2J2SXNRQzlCc2c3ZzFsWStFdjlad1ZLYnRpTmZxeGttRlJ4Qk15a3lU?=
 =?utf-8?B?d1g4ZWFCK0N0UkVYdS91SDFzY2lmbkNqaFpoNUtzVE5Wblptb2RMblNzdG5C?=
 =?utf-8?B?Nld5cDVOSTFyd2h4SGtCdFZhb1N3cDBQakw3MFN6NGV2Y2N3K1dwZFVvRERx?=
 =?utf-8?B?dE5vNm94ckJBQzdaSEZuWUcvVFBNdXFwaDJIM0ZuYVNjN2lJRUd6UkFXKzE4?=
 =?utf-8?B?V3BHK0RLa3loQitDWEM1dnlwc3FvUjZtcVRoYmVHRXFEc0Z0Vk52MDJkUWhV?=
 =?utf-8?B?c2toSUx6SWd1RmpOVDNNaXRja3RFK0xibU9Oang5UFp2QnIrMmVOclRUL0VE?=
 =?utf-8?B?Wjl6YUt5WGJkZFM1WTF3cy9KamVZVzU5UStVUHEreDNBNHlRWmx4UDU2KzRo?=
 =?utf-8?B?STdVczl0UW1mZlhzcmhqN1BiTHdLUWNZWVJnaWhNb0lZNUZDNmxkV1RVeFly?=
 =?utf-8?B?R2RLNW5KTVYvc2lnZDVnWFpreExFT1ZjRDJYaVRKVm5aN28xbHZKSnFXMjRE?=
 =?utf-8?B?TlR6TnVJRkhHSVFXSkNIMmJLVE9PdStVV3hBZ3pNQUVXNitocGlkTkVkKzZu?=
 =?utf-8?B?SnA4ZDVLRlhIaUVPYThXaEpFSXdGMGE1YzJOaVVMN1huRG5Qai8wOHVPRTMw?=
 =?utf-8?B?d1VFRHU2cXdQR2pCYzBGYURjZ0psdzVGV3JLODFhVzhsb291Z0F2UWRORzFE?=
 =?utf-8?B?VWRIUDI5T0lJU2theWl1MnJ2RnBPRFg4MytaZTVId2RVb0NmdFc2dzlUU3kx?=
 =?utf-8?B?NFZmdmI3Y1p5TFNZS3V5MXdkVTVrWDlacmFwam1kUEVBdkdpYzdWQmlmdWtX?=
 =?utf-8?B?NCtIK0VMeXBkVHBFclo5aHN1ODFXNGllc3gxYkJIcTdkcnVpbFhkdXRYU3Bh?=
 =?utf-8?Q?ggVtwcTCyfgGDGD0=3D?=
X-Exchange-RoutingPolicyChecked: 
	KmCfMpCuSaItG2tVT5w/uj6pu2ijm1KknRWtGAkwbZmHBCPcbKSVJI2E9ukOHLoizCPfpDRXlS3CNpyse6OQ44lCpQyXJdLAWM0q4DpkEbNZGDq/GTY3MpfvPwGjGVM+2GTagt8QlHdU2r5XyqMaR0qoYDneXE4ehz4OHmC0BSgx0zUbVx1eAlaYEWo/dGev0YMldghz8+XPeYn4xOESOV1VtQcyEZSqwMbRTkngolhoSgRd3RfKc13t6fn+QgHbyl2y3C0lq05b1WrEMIIK1XtzUC0AFQySH08M/0/9+Uc+GYvEc+rSYPpyFFXRUSmF+I8P//OfybGJkc2IqIgcMg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3aae081-c005-4519-a346-08de88d13dac
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:19.8381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4BvGcRLzsuF/F0oLadnHRPEpCXx/5IH5vTqoV0pa47moSqDbSQyIdbt9Ij87esPuOzsWQK3GiUpaOqTGqpie7yc0lj9HH33lBHogO2cpOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX3FTONM+uDhuP
 Iof7toilLqz3ULxlI/PmVtRVZjOT4wSC8ZvAt6h1yoyN+LvjadG2MmcO2iaN3YrxfTUhDvU+7LZ
 FTt9hZvvil3AgScK0+7lpnKfBy+KGaLkdKk9o9QOe9Rw+mmHJWdLptkWf0esNS7T8mpwmOZQP/z
 eym3XO9Ko6p7RXh+fazCf7WkDHs9LUiN+UafkkQmkqiost0eqFUHUfQJK2NYYw6QXCZbG472pMk
 PY2iAWT49ClcDyR9+Z09LMg4xb5n7zpsOoKOqvbtqXK4fhmgGfNVtWduibmSYxJj7pe2aUNR/VC
 7MgQrSHuTHiuewpy7PCP5cA0h6X3Bwucr0BmBeYaoXbDRYgqmeb4RI5wfHvj8P7BVIE3m8+fBRS
 wCyDF8/ck5cDdmOXj0Jlc9PiAJeVoycWCxb6PHK9iX+oGSdlvkoO7wogtLjnlN+gARZhhhRXy9W
 wbavFRPzav/O0vV2mQw==
X-Proofpoint-ORIG-GUID: Sdw3YXlOxsd9xDf1Ynpx5-RdDZmfvvfX
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c1271f cx=c_pps
 a=3NFNipLq04N0pvkhkOyhzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=yTkn3-2k8kfTEQFiIg0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=SYBONWESK5muIIdMMRMZ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Sdw3YXlOxsd9xDf1Ynpx5-RdDZmfvvfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62N5o1iP3735900
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125516

From: Zhang Peng <peng.zhang1.cn@windriver.com>

When libxfce4ui is upgrade to 4.21.x, pkgconfig sets private flags by
default and no longer exposes libxfce4util flags. This causes build
failures in xfwm4 settings-dialogs due to missing CFLAGS and LIBS.

Backport upstream fix to add LIBXFCE4UTIL_CFLAGS and
LIBXFCE4UTIL_LIBS to settings-dialogs/Makefile.am.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...build-Add-missing-libxfce4util-flags.patch | 57 +++++++++++++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb  |  5 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-mis=
sing-libxfce4util-flags.patch

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-missing-li=
bxfce4util-flags.patch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Ad=
d-missing-libxfce4util-flags.patch
new file mode 100644
index 0000000000..e5995e09e0
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-missing-libxfce4u=
til-flags.patch
@@ -0,0 +1,57 @@
+From 6468f80ee9283c03fc18f67361b20c6efdf3df50 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Ga=3DC3=3DABl=3D20Bonithon?=3D <gael@xfce.org>
+Date: Mon, 3 Feb 2025 11:09:59 +0100
+Subject: [PATCH] build: Add missing libxfce4util flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This will be necessary when xfwm4 is built against a meson release of
+libxfce4ui, which sets private flags by default in pkgconfig (and
+therefore no longer exposes libxfce4util flags).
+
+Signed-off-by: Ga=C3=ABl Bonithon <gael@xfce.org>
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfwm4/-/commit/6=
468f80ee9283c03fc18f67361b20c6efdf3df50]
+---
+ settings-dialogs/Makefile.am | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/settings-dialogs/Makefile.am b/settings-dialogs/Makefile.am
+index 3a1d2a510..86c6ab9be 100644
+--- a/settings-dialogs/Makefile.am
++++ b/settings-dialogs/Makefile.am
+@@ -44,6 +44,7 @@ xfwm4_settings_CFLAGS =3D \
+	$(GLIB_CFLAGS) \
+	$(DBUS_GLIB_CFLAGS) \
+	$(LIBXFCE4UI_CFLAGS) \
++	$(LIBXFCE4UTIL_CFLAGS) \
+	$(LIBXFCE4KBD_PRIVATE_CFLAGS) \
+	$(LIBXFCONF_CFLAGS) \
+	-DDATADIR=3D\"$(datadir)\" \
+@@ -56,6 +57,7 @@ xfwm4_settings_LDADD =3D \
+	$(GLIB_LIBS) \
+	$(DBUS_GLIB_LIBS) \
+	$(LIBXFCE4UI_LIBS) \
++	$(LIBXFCE4UTIL_LIBS) \
+	$(LIBXFCE4KBD_PRIVATE_LIBS) \
+	$(LIBXFCONF_LIBS)
+
+@@ -70,6 +72,7 @@ xfwm4_tweaks_settings_CFLAGS =3D \
+	$(GLIB_CFLAGS) \
+	$(DBUS_GLIB_CFLAGS) \
+	$(LIBXFCE4UI_CFLAGS) \
++	$(LIBXFCE4UTIL_CFLAGS) \
+	$(LIBXFCONF_CFLAGS) \
+	-DDATADIR=3D\"$(datadir)\" \
+	-DSRCDIR=3D\"$(top_srcdir)\" \
+@@ -81,6 +84,7 @@ xfwm4_tweaks_settings_LDADD =3D \
+	$(GLIB_LIBS) \
+	$(DBUS_GLIB_LIBS) \
+	$(LIBXFCE4UI_LIBS) \
++	$(LIBXFCE4UTIL_LIBS) \
+	$(LIBXFCONF_LIBS)
+
+ AM_CPPFLAGS =3D \
+--
+2.50.0
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb b/meta-xfce/rec=
ipes-xfce/xfwm4/xfwm4_4.20.0.bb
index ef5a682b77..2c0ac1d39c 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb
@@ -9,7 +9,10 @@ inherit xfce update-alternatives features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI +=3D "file://xfwm4-fix-incompatible-pointer-type-error.patch"
+SRC_URI +=3D " \
+            file://xfwm4-fix-incompatible-pointer-type-error.patch \
+            file://0001-build-Add-missing-libxfce4util-flags.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "a58b63e49397aa0d8d1dcf0636be93c8bb5926779aef5165=
e0852890190dcf06"
=20
--=20
2.34.1


