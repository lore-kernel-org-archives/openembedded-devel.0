Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C853DD29DF9
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:47:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55650.1768297654381131195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 01:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=puzqA26/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5473072fb8=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D9L2tG3609415
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 01:47:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Ode9hldRreD+EAoxyu/0aMHePvDiNW0k2eC+u1xFy2A=; b=puzqA26/o09i
	BHXw2L1M4OXgEKbo0hbMBsXJKxmuHnK7adRCEwFfpxhtUAPHEb7EQWescU4eR1CS
	E4/bIx83wJDVZm95Yf44y02alx2/DfqRqvYsNYTNEQ43q1FDfxxMO2+MKRyVNuVN
	Q7/6fD43NHQHJnTecV+dvt5f1F1aHjghEWURflqzNSQXgV8b4NBbHFJKvOoRCtgO
	OjaCFH4jSKzAdW5CMn/fhxNIfinpphnUVhdSwzhFwqrVu1qMr1F25PYrp9wLf6SV
	QQvEBZdc6CqGeciVJsdjadFW6JcPraUFWJT5/x8KM796/lPkW7LIJqiPIhbMM8Kh
	Y4LJXwiamg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013057.outbound.protection.outlook.com [40.93.196.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0tqw2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 01:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aX5E429VVk9N3xikr3Dir64KF668Qhk9KQC0DQF7/pvGYvV63vh/euG3VdVjuKlsU/eBUAzZ0vINYmlFCZvaYSoOshVdicupJDIc6wGp4D84/Acudb6I+ekKbjoJG/za5anV4nyalW9Hdu59sYsaXvkfMpN4ox77K/No4sk/Ik8ojHtPXmj/hdSB7xN3EoouvCpaSekuvNycnPgivpPXJMIjllXD6Gz3a30wmowNfNjW+5xsQ7xyEp4GoHqHMtIcT5RhWsMsGADNrBJUhH9GkwhMbWRCdc+r3FU0tBNPH9RT473BzCUIytE8bUZuuILyovBvLrN85jfv/gRI3XG/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ode9hldRreD+EAoxyu/0aMHePvDiNW0k2eC+u1xFy2A=;
 b=cVzK9f+3tmLcqNvxqBNqW0niRNylpXUiIL5N39by+kfOQ9DHY4UAFPq0CwMtZLDw5/OjAmOvOVxfnzfR2xsX6g3ZqAUdQt+aS6TxDPevjBZfvIDWV2P7uweRx5+fPvpSJvShJl5isIpb7HU6AUkMpUh3tp7pFmu0dWT78e9ULtJTqKkcrV1zhKqheesV6e9K3pGiCUUomN8HQSdoCznf7wuf4Oky3NEvOKGETs5FRR8Kju/Zxre7ZeGWpiMbS+rYMMCW7N7jsOKr/d+iLEub4141e31johfOELccq7rsp4WANdMxMXFkwSpKoecSWUT/RXy0maRUN4zBRo2V3Cf8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM4PR11MB6336.namprd11.prod.outlook.com (2603:10b6:8:b9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 09:47:32 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:47:32 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][krikstone][PATCH 2/2] python3-django: Fix missing JSONField in django.db.models
Date: Tue, 13 Jan 2026 17:47:04 +0800
Message-Id: <20260113094704.1489156-2-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113094704.1489156-1-haixiao.yan.cn@windriver.com>
References: <20260113094704.1489156-1-haixiao.yan.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM4PR11MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: e773f954-73ae-4901-5af4-08de5288c590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WKcConXeA3EpOlxlkNxzcNWs7rX1H+sVIkFH65FyZqF//Xfd0MjxlgFb/XV3?=
 =?us-ascii?Q?z+FS4owYAEH8Jc5OOQ1u2mTHK9UfxKerD+e0pUU3/0eUpMURbIl7u3neW1mH?=
 =?us-ascii?Q?sgX7CMo3NYqlcOxommBJbR1QQLOs2mR0i1e3Ptf3ZJY59xh5baRh5WYvIkrY?=
 =?us-ascii?Q?m6wFKlHWabAseUPor0aAYFrFIpf+5Dy0rPqPqvu1ry3kvNBDAbKeSI4Hs07R?=
 =?us-ascii?Q?7Qgs/am3msylBIK0H03s7gnjbhVUlPt5Xk5EXuSCxvVIMmSYa/Gv/XoivNDQ?=
 =?us-ascii?Q?ryjoJNMpYSJzKv5D7sjb9kzn59SoiMAZ7O2X3BV0qUj1SHyz6Cia7K2i5bw5?=
 =?us-ascii?Q?WVW/1P66j+0duuMJqJdS8WuL87kRtPf6MO4WxRztbm7lPw2rHp6Vm23CxjZR?=
 =?us-ascii?Q?THvYhNGiSM7kPd8ZwZG+s0H5B84nPAHVDTT3YbueLOUtpIqb774mFrnShC2M?=
 =?us-ascii?Q?M7kJdkYq6/Lt2onA9yT6wVeSgRQfO8UD6eCOrCnh+DJMDrzkNfvCRG/gsaKh?=
 =?us-ascii?Q?CGRNo1W9xNqIn00QxuJWqD11cpmI1BuOHgNQ+PKQgpS3/oBW5mghHyMF9x7D?=
 =?us-ascii?Q?LLXcvEHb5qigH/5OiQIpx/PddUtWsYIYYZ9it9GL/rMVs4bDvXXAFnri1WKq?=
 =?us-ascii?Q?GeUjaHLezNwGd9WdrM3tMkMZXwNVVWWZncRKIAKTcjSsfJGAlj4gAK9qUfyV?=
 =?us-ascii?Q?XiPPSS2QAqcpUxfprY/QGEDkqPVcq9ivv4GbcDjJtgXl7yRwa54ksEzgohvr?=
 =?us-ascii?Q?/3Z4aAchzaPmdLkpIpLxrUu46IC8meRvJNxoJ/o7/YM7iDdFYyhdad3DSxjt?=
 =?us-ascii?Q?rsbltXExeQgYdX3KW50HLxoCy0ABCHKmgg2VIxPSMKPYASnNpViO3ti+7Rhk?=
 =?us-ascii?Q?kvRS0PjsxgoSHjO+bDSCpyBBQ6Dz0wdWS/sqFJDCKSRUjQE/GN/IZv+FT7/Y?=
 =?us-ascii?Q?/DHQQMSleFoCSrp3qYAVKEtyWBBXh5fygQnK8t/Cz28OIOqYt+5v/MNZ1lpg?=
 =?us-ascii?Q?jvjePv04PuO6YWPiZHdLA2XCrLO/EKXVv3nP20ZqNp3/Td1MnGbhGRzAK6Ki?=
 =?us-ascii?Q?B7bd2gJI4EYiY7Xhgu0QQOUTWucdGSsQcze1A8uVmSYj5joMsQO25RjZBrmx?=
 =?us-ascii?Q?Ro7ETSC/B8cIEAukfygnIcgIcudn1EqF4M1rb7JlBcyKYJoXpGVJDAE+ZqVY?=
 =?us-ascii?Q?hZORyLFMjIqVlOYY6y8kVfPLjZMW5BddwjdDPVtB8he81ydbBan20zRovKvy?=
 =?us-ascii?Q?f5bvSO+Z5aa2ZiPDAfjElEMQq233zAYSHtS3QQoTXo45tt6rxoUGcxm5tbam?=
 =?us-ascii?Q?vchn8a2sdvpMpg7TkmU2Vde1uXmz6vI8bf1SIG1W1ZTtzWfGSWOURwRF6JG9?=
 =?us-ascii?Q?jACJ40mtO32xSvP9gFan7BJRxcFGf3jc5B0kvgyHZJ3ocPzgi3fg6f6XwC2o?=
 =?us-ascii?Q?OK5hMCtQ0iX6GxgJJS1qVZm8Lyp8amuw8ty7WEv7CIzUPwtJ9lKpDu5gh1RB?=
 =?us-ascii?Q?8KcDSRhzNAmw47iHkb4qps+Uq0ZW43XkWdav?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ukZEyRdx02HJZ9sPwXwIMieCIILSbh7l5SWB1SvLhdiG4lqYuWm8dd4zLK49?=
 =?us-ascii?Q?sbjnfIy5T/uEaf9wvJKXw2Heb6nCQP7iGlETZ8ujmYXdpur+tcehbjrqQAJm?=
 =?us-ascii?Q?sRb5LVKGMcTUraB1i5tTK3XA18kweFejhoDgG1X/NKdoAPq6uc6AN2+Je5bf?=
 =?us-ascii?Q?zagJuMWgHfRMiUUPIaniM6jReeMtf4/l22ZSrG0LTnypqLUS7xZjPJnG3+MZ?=
 =?us-ascii?Q?FI1dAa8LGd8KuMDllN3pZqvpFTSdG7gri9EsrFYf4+uRlfgo5oYNydXa76R1?=
 =?us-ascii?Q?pYnuOnRZkz+winGpVnZsU1vvbKzJK/arTDTRl/NwYzfnG+c3sVygxYw0p0iy?=
 =?us-ascii?Q?KYA+mDzWuuZPcdMCOzoZAD6dIIR46jOhLpZy92iEcjfNAmLBn3qqirGagVCO?=
 =?us-ascii?Q?jQBT+Pz4szkYXT/NxgzVmAC2lW9Q/OLQZZjEQW/3JWdtJ9UGPuXL14L98oy1?=
 =?us-ascii?Q?RcTQR0uFuR1rpg+IZsP0q4Ik7nJqVLqByJBJA5G7B4n7ZTTirDZITES00mv3?=
 =?us-ascii?Q?hnbslQPBHeTzBGuwXQ7vPjO1qrIeTglpSyVfC9GTcV3SwqsoPzzrH4JEbdXd?=
 =?us-ascii?Q?DCvwdjKqLcRnjviA3qq2CTtIaO7oZM8LCjhHF50hsLasaQXRXf1CmBFBMh/I?=
 =?us-ascii?Q?0btl3y9lMDMmkXIzesri2SdUnDpA9FOu2XJzfvJ/R2R/mrijqoI5bf0wVGS/?=
 =?us-ascii?Q?IT/hZkFE7/nx5Uca4PbSndCCMIOMJwHFYQ8hyEDySdgd6yTN6weAOL6r0GYq?=
 =?us-ascii?Q?RE8zG4eu7SAzDbJkrpUPaLw74RMROrtUwBgX3kZmFeHdJTi7YF4fBqMDz9Zt?=
 =?us-ascii?Q?w5S2/p3mF1VA5xA6Bnfd3J+HQJnR36p50TSdbJjq0y6+VxDHrg9C5oi8IbEY?=
 =?us-ascii?Q?/jmpinw/oNSfEix8UwxVmrJebN3RN+Qr1yz65zTo2+YHhbvcsLGeifRg1v4Y?=
 =?us-ascii?Q?0thgg4D489NBJ0wIX+0zbG21x0Pf6uPyLL3XTjmMYK7Z7YFzkSnuVtDX1J4N?=
 =?us-ascii?Q?yQj05xUpL0X0XYpPodcU54vSlJePLMp5Vjyr/f0mzdWHKCWWGamOnKCcmP5s?=
 =?us-ascii?Q?lIou0MZqi1xQEU3dge+eO0RfOtmTqDgzAfY6/8y4tcxw5Yq+B8JywxYUv8E6?=
 =?us-ascii?Q?GxtGKHxWz4ZKRjGwNfv62yGy9KT/HP2Txzha8OfXuleO4uBHt3NwOnXnAEE7?=
 =?us-ascii?Q?e1IvIAFBsVi06YHwbdkydzAJJdwSaa0IdhKP2hvDnKsGOPnubpAqjQbnN3dB?=
 =?us-ascii?Q?YqlH3ghmgwn4DBF8e7dh75+45WVJF5FW0pYx2QENO53p2Ir9IprmdWDSaW6T?=
 =?us-ascii?Q?K8t1TMT9uqT643UGIWvtyJj1hNNmtQzoxoTHSqmy7WpGzVm8S7oLTmEwswsn?=
 =?us-ascii?Q?/524vFz2L+fZNMXyF6Od5uuLosQp9VSGhkfJFfkHAcK3Ry72jr5z5E1DOAsC?=
 =?us-ascii?Q?bPx9Jtu+xeGtWZuNt9ut5aWWe7sisqNY4NTmL+pl/eNLuSLZigQBgfcJ9xND?=
 =?us-ascii?Q?foCx9KnUkGxX04DnQJIONShs7NSc42+OhnB49MzeU/LjTGpVsJP/8MlgBhCe?=
 =?us-ascii?Q?7B/tNlGJ4R08AnXien4iSzxVvc3ElRSsJV9evEeIVCazMsZ5z12mlCxqMy/k?=
 =?us-ascii?Q?W8345BlixR73EzPOcBZGBKjOSDbPV/QBXGY/RTqpQxOhahBKq9x8J7rR7Cns?=
 =?us-ascii?Q?F0r5h/EkddEBGk4faZpjyNE6vtVsI4A8h20l9yrmLddRAW88KI5q3uCoDLYW?=
 =?us-ascii?Q?MA/ULewuTVg/HXvMBiIIM5M8CDn9w9k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e773f954-73ae-4901-5af4-08de5288c590
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:47:32.2708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 578WeN0mzKtGcUL3rlFaWovImTMFqiVGqK1ok3pBTa1YMq63Tdyec9TonKnpE4QJCP+PdVc5aJiC+PWdsN7vT8osHp4GaqZnGxcgHD6WIZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6336
X-Proofpoint-GUID: T9toLLbumINOU08HwwUy_q8Tacx-3cjS
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=696614b5 cx=c_pps
 a=u5eD0AXnJOl2BG6obV1kTA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=vh6ZLsrIWgAaeWovB90A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4MSBTYWx0ZWRfXweBKqS3CGBfA
 MXbHsjBWfS6EyOzHE+AttETFZSJy63nAaGAx648oojiz5Ny05A2HwqODm9PZzvhWlriE3Lza7II
 GksxQb0B9uAeGXXa4hz1TsK7VIgkNufZcHQB0LV3OYgsOhASqS3F3lruxYfj2bOqgbI8apjyb90
 h8dCSxnlkkCog6Ypa94H78N68X/44MyQzVR7lgLEfWTJ6VpkS7RHAS45thBKZeP64irb+CHfvIJ
 fp9r/bDgExlF11jWNB9KrF0q0yK0JUQUCDrkvuesydoU3yAl0diTWkTQD+8BtiqVap0dyieMO2/
 Y6fgFGTeB7mTaFOZhm/1DYSyTcVUVW/3Wppf7drh1GF0NfKpkTyljPT7CxcL0lmwPxAYLyq8yXo
 b8aMOi6RrXosNflvU5+Yua2fxFGMArITGLJ52flmsJXekXYASYXk7fQHzjjiNgyIf97HKxHyYWy
 hBGXuKhrHBx7uTgnPrg==
X-Proofpoint-ORIG-GUID: T9toLLbumINOU08HwwUy_q8Tacx-3cjS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123406

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix the following error introduced by CVE-2024-42005.patch:

AttributeError: module 'django.db.models' has no attribute 'JSONField'

The patch assumes JSONField is available from django.db.models, which
is not the case for this Django version.

Revert the changes in the following files to restore compatibility:
tests/expressions/models.py
tests/expressions/test_queryset_values.py

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...ix-missing-JSONField-in-django.db.mo.patch | 77 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-in-django.db.mo.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-in-django.db.mo.patch b/meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-in-django.db.mo.patch
new file mode 100644
index 000000000000..3d53f0486680
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-in-django.db.mo.patch
@@ -0,0 +1,77 @@
+From ee83be562ac22c293b7bb55b2ed1aa868a9735c7 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Tue, 13 Jan 2026 14:44:32 +0800
+Subject: [PATCH] python3-django: Fix missing JSONField in django.db.models
+
+Fix the following error introduced by CVE-2024-42005.patch:
+
+AttributeError: module 'django.db.models' has no attribute 'JSONField'
+
+The patch assumes JSONField is available from django.db.models, which
+is not the case for this Django version.
+
+Revert the changes in the following files to restore compatibility:
+tests/expressions/models.py
+tests/expressions/test_queryset_values.py
+
+Upstream-Status: Pending
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ tests/expressions/models.py               |  7 -------
+ tests/expressions/test_queryset_values.py | 17 ++---------------
+ 2 files changed, 2 insertions(+), 22 deletions(-)
+
+diff --git a/tests/expressions/models.py b/tests/expressions/models.py
+index fb8093849cba..33f7850ac16e 100644
+--- a/tests/expressions/models.py
++++ b/tests/expressions/models.py
+@@ -97,10 +97,3 @@ class UUID(models.Model):
+ 
+     def __str__(self):
+         return "%s" % self.uuid
+-
+-
+-class JSONFieldModel(models.Model):
+-    data = models.JSONField(null=True)
+-
+-    class Meta:
+-        required_db_features = {"supports_json_field"}
+diff --git a/tests/expressions/test_queryset_values.py b/tests/expressions/test_queryset_values.py
+index bd52b8efc194..0804531869d9 100644
+--- a/tests/expressions/test_queryset_values.py
++++ b/tests/expressions/test_queryset_values.py
+@@ -1,8 +1,8 @@
+ from django.db.models.aggregates import Sum
+ from django.db.models.expressions import F
+-from django.test import TestCase, skipUnlessDBFeature
++from django.test import TestCase
+ 
+-from .models import Company, Employee, JSONFieldModel
++from .models import Company, Employee
+ 
+ 
+ class ValuesExpressionsTests(TestCase):
+@@ -36,19 +36,6 @@ class ValuesExpressionsTests(TestCase):
+         with self.assertRaisesMessage(ValueError, msg):
+             Company.objects.values(**{crafted_alias: F("ceo__salary")})
+ 
+-    @skipUnlessDBFeature("supports_json_field")
+-    def test_values_expression_alias_sql_injection_json_field(self):
+-        crafted_alias = """injected_name" from "expressions_company"; --"""
+-        msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
+-        )
+-        with self.assertRaisesMessage(ValueError, msg):
+-            JSONFieldModel.objects.values(f"data__{crafted_alias}")
+-
+-        with self.assertRaisesMessage(ValueError, msg):
+-            JSONFieldModel.objects.values_list(f"data__{crafted_alias}")
+-
+     def test_values_expression_group_by(self):
+         # values() applies annotate() first, so values selected are grouped by
+         # id, not firstname.
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index f2bb1de4f247..8e826b9b619b 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2025-32873.patch \
             file://CVE-2025-64459.patch \
             file://Fix-undefined-_lazy_re_compile.patch \
+            file://Fix-missing-JSONField-in-django.db.mo.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.34.1


