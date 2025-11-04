Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C061ECCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 15:11:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20252.1762269108724004707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 07:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fTim/iuL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34034774f0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A44TAJa3347273
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Nov 2025 07:11:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=R6Us1KPYWq5uJP9evUwI
	h3UKZmp5P+77+YFFKXQPCHk=; b=fTim/iuLpdybZjPHIcR6EJZcbuBhWpCuHNKB
	cUfuHMcT26ZOpR5G+hM+TYSRO/hzH5QuAYRt4gnNMOpnL9yTtMnoJtPO8YmxWSqU
	KnO0esy54ivCjNHQ6lepHgct80Y6Whwnj2q3ap8P3n4VRKgSDcw/QsKgKAPzh+PD
	u0iNHQwA1Z8+edPijzVN7q6fklijLi6i24ERdAtck7phqfoz1WiSjZDNeZE+1SP9
	FpTIBQ3/3ug02Xwc9n/BsmVd7Y3FTYg1LH8W99C9cBVCh6UqhtTzBvMv+N005Iv7
	4xCwb3vn6pX7gXMvyY6TK0KzzrvfZCcFjKnSNDibbNOGkukONA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a5dfy343f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 07:11:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O92IySlQcmvFZi8pmk/Ok5KR8yB17TKTlkbxjLnAnnpIlUs9dh1p4oDxFoTHFSP+chONLBJY2/mCmcww1xzVnnB+96wIxjFcBSEIkurP1PYe0Sx/vi/O3uHWOtANH/tji52MJJXFy5h86pDq01QAKpsmASvAOSs24ha0Xx8aM6+M82TkUMIBqK5bVrGlhIwP8147fTq+dBWht/+LQq6dwl36cDusXmiywNh/bG73z2EO1NV2MfO5RY3D9D6XjeeP/H5pawzMgGxbx6V/eGzRV2pxDhtWkpZddsVkNMVNcurRuHN6Lzg4PMkiNl7z8H9VeX3v/jR7CArLxPYbiW0pkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6Us1KPYWq5uJP9evUwIh3UKZmp5P+77+YFFKXQPCHk=;
 b=CFtztxXrYAuZbP1bbL1gXUBUf6HPjbMUVMvYNuWagO0ePii4CT2STE7QtF+EvjnM2WQglyddpNHlOKyHHKDm3o6Lua0EKgkYuCh9W2nmTUbA37upbrt2ZMj6jrEGXQBlz/uVIeQn44n/8egCgYCAe20Sr6DqaGtrYzt4fMqtyMzzGacUSGrMBhGGFWFo5eN9nHJkRnmz8kEOFbqplmc5nuYAsP2Kv0rG6v1fBlHKwRB88fH8n+9jE38kSs9IYnojQvAt5bAzEdBIquKPuY9RrvMKGjzMhxsEjkYQvCruKDkj3VzqRsL8v0Y4f2zpn+UpneH7khsEajnNDAqF1OwxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS7PR11MB6269.namprd11.prod.outlook.com (2603:10b6:8:97::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 15:11:39 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 15:11:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] vsomeip: upgrade 3.5.3 -> 3.5.9
Date: Tue,  4 Nov 2025 23:11:24 +0800
Message-Id: <20251104151124.2391-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS7PR11MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: 792316fb-bef9-48a8-51ba-08de1bb4741f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CTw3z91Gt5fBJqbsYmboHhOD2KbhXAboBrj6WNjZZF3Z3+Rpy209QMaMY1Ew?=
 =?us-ascii?Q?J0W3qdljXoURre45SfpswQlJGX16L3MmO/feE8YE/OXnNlPejIFth27ti2oJ?=
 =?us-ascii?Q?WCgUryapXJZy2HHdlYH0IG+pZ0sSWMwxHUyX7EDBJKqjfzKkK1f/lZI0x9Y/?=
 =?us-ascii?Q?lhLClZuGpH6pZwdMwDwfvqOTDCJGn5zjS4Raxws2h6GHotiazV1muWKAG4A7?=
 =?us-ascii?Q?1Cs7CmYIaAjiMmfqx0noJ4lCP3gk6vzxe96nb/kpJ3g3AlgRwbTlflRAha6p?=
 =?us-ascii?Q?IugR1W+V71+ipml9o44PNUG9TVXINbra1U/Ifygx3+oqppaZYeF8BCWoF7y0?=
 =?us-ascii?Q?sqpmR4vtILFi9EbNN+kHUY6pODO+0GCkuUVvYRcvSu5DVqIqCYON45liKSdr?=
 =?us-ascii?Q?cDN9JqYLoMZXGDWSuo+6ikfLXSbxvPy5auxPOi/ZeH0oI3UlAXIEOZbkgRBm?=
 =?us-ascii?Q?eNVO2OrfYtRyPe793DsxlYY6kOQFJ1j4GEYjzZagUcGhWph3BIc0qCTUDogm?=
 =?us-ascii?Q?VZ/R686AVe6SCQcfDgop8nc0h3tOfYC8ioHNApHUy/W4Xe3oHU5MUkTBBiL1?=
 =?us-ascii?Q?xm6BesGkKhCI5ZTMF0ugMyrcwsMbKI5q/Me5/fXtxBnY/wD+NkwZNoDIsjy3?=
 =?us-ascii?Q?7HZVMsbN0bwllqjgSIgG9GsvNhFlAQzkkJls2ZIo9Y6EEBrfGSlDILKrhvCy?=
 =?us-ascii?Q?U2iKM/hGT1zOvRGRq3BPn+5ydGqW1ygxQMPizah2oBHau84fPMpy+cDt3IOI?=
 =?us-ascii?Q?ikSiOx5xfxw3X6WlqKvJrjQCTNqsF6f/53GLPAXtCui3iQt/BP3x0fjKmFRP?=
 =?us-ascii?Q?hinjw7ijPZZK6nGKW12yie1wtxtIBh9lP/NObPTUpQf6jpm8heFonCO9x/UD?=
 =?us-ascii?Q?yxfm7S1DzVhu1qOM89WIJWN9TyrNu7uW0c+aGkefEq4IGNOE6o5LTdP6VP/H?=
 =?us-ascii?Q?EmReJy6hUVNihu4YFPayrmtX5YgRyGXdP4Q3eyEQkEdTXLfLQ+dXWyB/kgX0?=
 =?us-ascii?Q?jJqheF91DCAa5Fa1evJsq5BHTYSpUpIB+21g8moLO0p7GjrPjO3Yk8stQW3Y?=
 =?us-ascii?Q?Ug1zOl0Hbvy5cDcxIa+3/NVtZjLVJwreTM+unO0hpnLXK872i5dLEh+TdsbK?=
 =?us-ascii?Q?oqQc2/TNhJVUmD2xQCq1ZDZ1xLeJEnYI9M1u4v5zHJqnLYhAIcDvufNgBopp?=
 =?us-ascii?Q?EkntLyUPqA5LKC5opio9AEB0XsIVnndqpdy71m+suZQS64lle/HE4KB2smH+?=
 =?us-ascii?Q?ORpV0cgU1o8w3NyzHg0nrM5vpTvQ8cEX2CuPxlQfYNgFU0ZLxBzJLl14SH1X?=
 =?us-ascii?Q?GRGdpl0EgkNCg/szX8tUG17QFJC+WKu+cQnUSYen/4uFyLeOvMY4bDaZCUpI?=
 =?us-ascii?Q?i+czTIeNzfO2bJMowIWXEHdcGivMi8nkTbNcN5g5kr89/si1SvFduswmh1ws?=
 =?us-ascii?Q?tfiW71ZYCm3vaAS2zapQ5j2fdJtniJYxruPqaOIjonI9h45ZohOUdJxBUeez?=
 =?us-ascii?Q?Obi4UvVlnZTnv59aZBgZi3F7lKjgq/guYfYHEPKdcsM89j8iw9tF9DyMQw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gnMPl2iXqo6Zq+msq4DZRLE1CKUvSHsbKRcUksp0xxpnaCPBYgRJ9yqAKj6R?=
 =?us-ascii?Q?R48Cm5iH44D2hl/838shGNV+M8UbEpcpeqphYPfR2NSscGoJxZ6qnhsVhKrA?=
 =?us-ascii?Q?TXZTMei1OTfjrNmwW3ku6d6sCpQxqQ4optqPrcoTVdVkWI6zvLkHB8tSHuQQ?=
 =?us-ascii?Q?QxW/FltH7dNH8qZ/bhaJfr3jWd9J9amsN81KQ4H4V6T/2+Cr1Zs36r7TNL3i?=
 =?us-ascii?Q?zQSA/jZwybgrIbxsVBm7o/BtAC8u8+yzqLmd8SgC7SAwTDHe4uIyaPZ1uGz7?=
 =?us-ascii?Q?+vIGxzi9iYTw2qHMnGXL1YKWW1IJBINFOCT0+TYf42DOCwBXaiLOhlwJciFv?=
 =?us-ascii?Q?f28CwmbW93vPMqy2FtYDbP+vceieoiuvjpTaSiJ3233HwsD7CVjG5i+PVx72?=
 =?us-ascii?Q?HPRysonQmAF0PDA86H/Bqwm/T7ZdBwJSmslmlyRIrDLAEo3A0CXGWmDzvS4R?=
 =?us-ascii?Q?ZkIp0U8zxASinNtsiCAE2tTVMXfgX03rNddPBmAu6FHYbNZeyzQquEJTuN8G?=
 =?us-ascii?Q?+rxFrOjrMNvDz/r5kI3d/DBgJXCrAR6dBDT3TYmOfQHhNPLKjE9XfI1NGSjH?=
 =?us-ascii?Q?PI6YIORvIuYyhwN/H0g/v9WDVPu4qtpsBgdGdtj8d2TraYonjqDyXUYHlrAX?=
 =?us-ascii?Q?uvTJYT8JeXc4Bpb3kQ7gSsz24C/APBk+tPQIt5p4VEvNGgSg9YUdffFPOzma?=
 =?us-ascii?Q?yUpVStcBI88UvUdksZKfSVucKs4oYKfWn2Rtp54hLRsBla/ieQb4p36glEy/?=
 =?us-ascii?Q?62HZV7fjPL1L+Fy5I3Pw0sUOTKx8hxehriTEiBoC8ow2xgpDGDWj74LKM9RI?=
 =?us-ascii?Q?rStVEP0a1VmmroNvdZoeJKbNWDKLgk9zC0F37PKpfHmpMDfEQ1Jqf6fbyFqs?=
 =?us-ascii?Q?HN2miR1C70pzETcPH4sQgCCXlhgDMHc+aEbxDxJ+UIpAw9eqexbW835yNRau?=
 =?us-ascii?Q?JgLEdXHQQzUmr2+uh+vGjM9tQ4jBLx/rZjdljbGI98XwvuSdEX5oiKjXGWRN?=
 =?us-ascii?Q?Fgy6R4uEk1LoDj/ch2Z8oaifQHaA/zvBMjgmy5WDn6H3DLThGjgea8SZ1vMk?=
 =?us-ascii?Q?+HDHcbk55bxqF9qEZodjUNhy6wXcem/YOJfuk+EeALiaLf88u5mzyrbBbSWW?=
 =?us-ascii?Q?fUFKBlI/jVjuOiPkKaETtG7TcQpH1/2/R9TqgaTKhFo9qk5aFIY4e8+0J6vv?=
 =?us-ascii?Q?nIjGwh+Ov237ik3SUcqvI7Roz1NpDc5haGmroOo4Slb7JE6KUACcuxYMs0XB?=
 =?us-ascii?Q?kRrAOWkOBRB4RlWBunsgJHSEsYNAvONwBBoL9UTaq6z/VxH/RIPYGYc3Ij8r?=
 =?us-ascii?Q?p0Wvw1TPF1G0yTCDaHEYnSIsa41AeMb/5t0bTKdbeGnBYeFdGk22DbYl5/QT?=
 =?us-ascii?Q?T3caFSbAk39G/gcr3plx3K0xXsDtsZoDRnf+uWSJFLPhzEyY8KphycbEAqNL?=
 =?us-ascii?Q?fW8x6akOSC/YWwhw0GdWHwvILkbgSvUK6ygC2S8qcn4YDpQ/4QomFoVoYNAk?=
 =?us-ascii?Q?b4uAppfqxOGnLi991CXg68Xl9QaG7vyPRSI8Rfa0QsjKKLQGJZcRifbboyoX?=
 =?us-ascii?Q?Vxr6sImNKr1NB6BN+1YVrP4D0eIFMt0P5U9JCov6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792316fb-bef9-48a8-51ba-08de1bb4741f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:11:39.3445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FBdNWPzlx7+4FF6uz5rTx5v8vJrOmLF91291b5/UUySSDa5AOYkMmX5lod0uN3L393ap6VhhJRApi4Jadq4sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6269
X-Authority-Analysis: v=2.4 cv=G5QR0tk5 c=1 sm=1 tr=0 ts=690a17b4 cx=c_pps
 a=Szpykk5hBk3mC7HHiWFpbQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=dFu0OlvtOV4Acba5pQwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hTxmpHZ_i_KFxxIdrtaPw3HW3_qCpk_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEyNiBTYWx0ZWRfX19DK345EvA+h
 JBpb07wzhaN4Owc8v2UlRi3YMboabGlvetrFt8vYZDNZSR2PlnfuUt+tcoVFt8ngrPpickmxnjn
 qOtJir4DUTno4vus8rvf27WORb2Wigiiht534KzwlwHwvxQAaoWC7eVl6wHUPRiq2Y4t3Yl9t71
 Z3DSNAG/7I7YemcLgv2x8voO93i3y5amJIKgguK/AO+45T/eIUzpEdV72ckeH5YVBXFd75SIMMu
 fW1/+t+DEcpH0q0i5RREqv1nTr56CpLByukM4yyBmXY+duSBJcuu6QlK69WfxKiz0CbwFilkiFj
 ySktwEzAFbzCsnTgGFGD70PcdPeMzzdjFvcjtN0jTZPvsqBbYHps/OQuMk5zXpcHxOO+APqsX4n
 Y8/Nkj2oLtTP10a+JeDszi/mNywEuw==
X-Proofpoint-GUID: hTxmpHZ_i_KFxxIdrtaPw3HW3_qCpk_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040126
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 15:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121298

ChangeLog:
https://github.com/COVESA/vsomeip/releases/tag/3.5.4
https://github.com/COVESA/vsomeip/releases/tag/3.5.5
https://github.com/COVESA/vsomeip/releases/tag/3.5.6
https://github.com/COVESA/vsomeip/releases/tag/3.5.7
https://github.com/COVESA/vsomeip/releases/tag/3.5.8
https://github.com/COVESA/vsomeip/releases/tag/3.5.9

* Fix build with boost 1.89
* Fix build on 32-bit host

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-Fix-pkgconfig-dir-for-multilib.patch |   8 +-
 ...e-configuration-files-to-etc-vsomeip.patch |   8 +-
 ...-Do-not-specify-PIE-flag-explicitly.patch} |  21 +--
 .../0004-Fix-build-with-boost-1.89.patch      |  42 ++++++
 ...ddress-from_string-with-make_address.patch |  47 +++++++
 ...eLists.txt-add-missing-link-with-dlt.patch |  41 ------
 ...06-Fix-scanning-64-bit-integer-types.patch | 128 ++++++++++++++++++
 .../{vsomeip_3.5.3.bb => vsomeip_3.5.9.bb}    |  31 +++--
 8 files changed, 257 insertions(+), 69 deletions(-)
 rename meta-networking/recipes-protocols/vsomeip/vsomeip/{0004-Do-not-specify-PIE-flag-explicitly.patch => 0003-Do-not-specify-PIE-flag-explicitly.patch} (82%)
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
 delete mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch
 rename meta-networking/recipes-protocols/vsomeip/{vsomeip_3.5.3.bb => vsomeip_3.5.9.bb} (67%)

diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
index 0ddcb642bc..9595241c41 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
@@ -1,4 +1,4 @@
-From 2f931baf290477b586309189445bf87e3bc5d5ba Mon Sep 17 00:00:00 2001
+From 73773d45230a3c9d73ed3c1aa26f0d5c87d29037 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 2 Mar 2022 14:51:13 +0800
 Subject: [PATCH] Fix pkgconfig dir for multilib
@@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ab399a69..beae6eaf 100644
+index 899f54f0..7f38ecd0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -637,7 +637,7 @@ endif()
+@@ -661,7 +661,7 @@ endif()
  # create pkg-config file
  if(NOT WIN32)
          configure_file(${VSOMEIP_NAME}.pc.in ${PROJECT_BINARY_DIR}/${VSOMEIP_NAME}.pc @ONLY)
@@ -24,5 +24,5 @@ index ab399a69..beae6eaf 100644
  
  ##############################################################################
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
index bdaf343606..b1146783d9 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
@@ -1,4 +1,4 @@
-From ebaa3206ee125741314272cddafa04fa71bd2d1e Mon Sep 17 00:00:00 2001
+From b79c6368d29746fd8c1917ea9c9a36aaf58bb352 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 9 Mar 2022 11:48:44 +0800
 Subject: [PATCH] Install example configuration files to /etc/vsomeip
@@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index beae6eaf..d791c12e 100644
+index 7f38ecd0..28919e09 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -536,7 +536,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTINATION lib/pkgconfig)
+@@ -578,7 +578,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTINATION lib/pkgconfig)
  endif ()
  
  install (
@@ -24,5 +24,5 @@ index beae6eaf..d791c12e 100644
  
  # Add all targets to the build-tree export set
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
similarity index 82%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
rename to meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
index 2d789627a3..824ac99b24 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From ec2d36466c9050ee282ea1c3bb1b5f1f61c96ecb Mon Sep 17 00:00:00 2001
+From 1b6f73f7b36e38dd29d867ef6601df54b64ca85d Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Mon, 17 Jul 2023 14:33:32 +0800
 Subject: [PATCH] Do not specify PIE flag explicitly
@@ -23,9 +23,11 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 28919e09..1c192fc5 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -70,7 +70,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux"
+@@ -73,7 +73,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      # This is only relevant for GCC and causes warnings on Clang
      set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
@@ -34,12 +36,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  endif()
  
      set(NO_DEPRECATED "")
-@@ -78,7 +78,7 @@ endif()
-   if(NOT DEFINED _FORTIFY_SOURCE)
-       set(_FORTIFY_SOURCE 2)
-   endif()
--    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -fPIE")
-+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic")
+@@ -82,7 +82,7 @@ endif()
+     if(NOT DEFINED _FORTIFY_SOURCE)
+         set(_FORTIFY_SOURCE 2)
+     endif()
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -fPIE -Wno-inconsistent-missing-override")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
  
      # force all use of std::mutex and std::recursive_mutex to use runtime init
      # instead of static initialization so mutexes can be hooked to enable PI as needed
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch
new file mode 100644
index 0000000000..b3caded33c
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch
@@ -0,0 +1,42 @@
+From 22af350ba78b5d2f8c6537ff867c3dd5eba05850 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 3 Nov 2025 23:06:35 +0800
+Subject: [PATCH] Fix build with boost 1.89
+
+The Boost.System stub library has been removed in Boost 1.89.0[1], which
+causes a CMake error:
+
+CMake Error at Boost-1.89.0/BoostConfig.cmake:141 (find_package):
+  Could not find a package configuration file provided by "boost_system"
+  (requested version 1.89.0) with any of the following names:
+    boost_systemConfig.cmake
+    boost_system-config.cmake
+
+Drop 'system' from the COMPONENTS in find_package to fix this issue[2].
+
+[1] https://github.com/boostorg/system/commit/7a495bb46d7ccd808e4be2a6589260839b0fd3a3
+[2] https://github.com/boostorg/system/issues/132
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1c192fc5..e6b54bc5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -189,7 +189,7 @@ add_definitions(-DVSOMEIP_INTERNAL_SUPPRESS_DEPRECATED)
+ find_package(Threads REQUIRED)
+ 
+ # Boost
+-find_package( Boost 1.66 COMPONENTS system thread filesystem REQUIRED )
++find_package( Boost 1.66 COMPONENTS thread filesystem REQUIRED )
+ if(${CMAKE_SYSTEM_NAME} MATCHES "QNX")
+     include_directories(${Boost_INCLUDE_DIR} )
+ else()
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
new file mode 100644
index 0000000000..0e8ff6e2ca
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
@@ -0,0 +1,47 @@
+From 83fdae064c4bd5d38f23679fc8793e44e563c046 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 4 Nov 2025 22:10:33 +0800
+Subject: [PATCH] Replace address::from_string with make_address
+
+boost::asio::ip::address::from_string is deprecated since boost 1.87[1].
+Replace it with make_address.
+
+Fix:
+implementation/routing/src/routing_manager_impl.cpp:1406:98: error: 'from_string' is not a member of 'boost::asio::ip::address_v4'
+ 1406 |  _remote_address.is_v4() ?  _remote_address.to_v4() : boost::asio::ip::address_v4::from_string("6.6.6.6");
+      |                                                                                    ^~~~~~~~~~~
+
+[1] https://github.com/boostorg/asio/commit/c0d1cfce7767599c4cf00df36f8017a1073339ae
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ implementation/routing/src/routing_manager_impl.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/implementation/routing/src/routing_manager_impl.cpp b/implementation/routing/src/routing_manager_impl.cpp
+index ad587c5e..73aeb334 100644
+--- a/implementation/routing/src/routing_manager_impl.cpp
++++ b/implementation/routing/src/routing_manager_impl.cpp
+@@ -1403,7 +1403,7 @@ void routing_manager_impl::on_message(const byte_t* _data, length_t _size, endpo
+     if (is_forwarded) {
+         trace::header its_header;
+         const boost::asio::ip::address_v4 its_remote_address =
+-                _remote_address.is_v4() ? _remote_address.to_v4() : boost::asio::ip::address_v4::from_string("6.6.6.6");
++                _remote_address.is_v4() ? _remote_address.to_v4() : boost::asio::ip::make_address_v4("6.6.6.6");
+         trace::protocol_e its_protocol = _receiver->is_local() ? trace::protocol_e::local
+                 : _receiver->is_reliable()                     ? trace::protocol_e::tcp
+                                                                : trace::protocol_e::udp;
+@@ -1441,7 +1441,7 @@ bool routing_manager_impl::on_message(service_t _service, instance_t _instance,
+         std::shared_ptr<endpoint> _receiver = its_info->get_endpoint(_reliable);
+         if (_receiver && _receiver.get()) {
+             if(!is_acl_message_allowed(_receiver.get(), _service, _instance,
+-                    boost::asio::ip::address_v4::from_string("127.0.0.1"))) {
++                    boost::asio::ip::make_address_v4("127.0.0.1"))) {
+                 return false;
+             }
+         }
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
deleted file mode 100644
index 25d66514f8..0000000000
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8676ef287bb25b49668be4336387bdf83a0cae5c Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Mon, 1 Jan 2024 17:02:41 +0800
-Subject: [PATCH] test/common/CMakeLists.txt: add missing link with dlt
-
-The libvsomeip_utilities library uses functions e.g.
-dlt_check_library_version/dlt_register_app/dlt_unregister_app which are
-provided by dlt therefore add it to linker flags.
-
-Fixes:
-x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: dlt_check_library_version
->>> referenced by test/common/libvsomeip_utilities.so
-
-x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: dlt_register_app
->>> referenced by test/common/libvsomeip_utilities.so
-
-x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: dlt_unregister_app
->>> referenced by test/common/libvsomeip_utilities.so
-
-Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/602]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- test/common/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/test/common/CMakeLists.txt b/test/common/CMakeLists.txt
-index d4d14534..afc8c2d6 100644
---- a/test/common/CMakeLists.txt
-+++ b/test/common/CMakeLists.txt
-@@ -27,6 +27,7 @@ TARGET_LINK_LIBRARIES (
-         ${Boost_LIBRARIES}
-         ${DL_LIBRARY}
-         ${TEST_LINK_LIBRARIES}
-+        ${DLT_LIBRARIES}
- )
- 
- # ----------------------------------------------------------------------------
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch
new file mode 100644
index 0000000000..f7aca8333d
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch
@@ -0,0 +1,128 @@
+From 2cdb9e4d2fc7ac11a886b7b524b6b9b5173b5667 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 4 Nov 2025 12:50:51 +0800
+Subject: [PATCH] Fix scanning 64-bit integer types
+
+Fix build error on 32-bit host:
+test/network_tests/cpu_load_tests/cpu_load_measurer.cpp:89:24: error: format '%lu' expects argument of type 'long unsigned int*',
+but argument 3 has type 'uint64_t*' {aka 'long long unsigned int*'} [-Werror=format=]
+   89 |   "%lu %lu %ld %ld", // utime, stime, cutime, cstime
+      |    ~~^
+      |      |
+      |      long unsigned int*
+      |    %llu
+   90 |   &utime, &stime, &cutime, &cstime)
+      |   ~~~~~~
+      |   |
+      |   uint64_t* {aka long long unsigned int*}
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ implementation/routing/src/routing_manager_impl.cpp     | 4 +++-
+ test/network_tests/cpu_load_tests/cpu_load_measurer.cpp | 6 ++++--
+ test/network_tests/memory_tests/memory_test_client.cpp  | 4 +++-
+ test/network_tests/memory_tests/memory_test_service.cpp | 4 +++-
+ 4 files changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/implementation/routing/src/routing_manager_impl.cpp b/implementation/routing/src/routing_manager_impl.cpp
+index 73aeb334..0d729714 100644
+--- a/implementation/routing/src/routing_manager_impl.cpp
++++ b/implementation/routing/src/routing_manager_impl.cpp
+@@ -9,6 +9,7 @@
+ #include <sstream>
+ #include <forward_list>
+ #include <thread>
++#include <cinttypes>
+ 
+ #if defined(__linux__) || defined(__QNX__)
+ #include <unistd.h>
+@@ -3828,7 +3829,8 @@ void routing_manager_impl::memory_log_timer_cbk(boost::system::error_code const&
+     std::uint64_t its_dirtypages(0);
+ 
+     if (EOF
+-        == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib, &its_data,
++        == std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
++                    &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib, &its_data,
+                     &its_dirtypages)) {
+         VSOMEIP_ERROR << "memory_log_timer_cbk: error reading: errno " << errno;
+     }
+diff --git a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp b/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
+index aaf91174..dfe27e8c 100644
+--- a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
++++ b/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
+@@ -12,6 +12,7 @@
+ #include <vector>
+ #include <stdexcept>
+ #include <cstdio>
++#include <cinttypes>
+ 
+ #include <sys/types.h>
+ #include <unistd.h>
+@@ -86,7 +87,7 @@ std::uint64_t cpu_load_measurer::read_proc_pid_stat() {
+     std::int64_t cstime(0);
+     if (std::fscanf(f,
+                     "%*d %*s %*c %*d %*d %*d %*d %*d %*u %*u %*u %*u %*u "
+-                    "%lu %lu %ld %ld", // utime, stime, cutime, cstime
++                    "%" SCNu64 " %" SCNu64 " %" SCNi64 " %" SCNi64, // utime, stime, cutime, cstime
+                     &utime, &stime, &cutime, &cstime)
+         == EOF) {
+         std::cerr << "Failed to read " + path << std::endl;
+@@ -116,7 +117,8 @@ std::uint64_t cpu_load_measurer::read_proc_stat(std::uint64_t* _idle) {
+     std::uint64_t steal(0);
+     std::uint64_t guest(0);
+     std::uint64_t guest_nice(0);
+-    if (std::fscanf(f, "%*s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu", &user, &nice, &system, &idle, &iowait, &irq, &softirq, &steal, &guest,
++    if (std::fscanf(f, "%*s %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
++                    &user, &nice, &system, &idle, &iowait, &irq, &softirq, &steal, &guest,
+                     &guest_nice)
+         == EOF) {
+         std::cerr << "Failed to read /proc/stat" << std::endl;
+diff --git a/test/network_tests/memory_tests/memory_test_client.cpp b/test/network_tests/memory_tests/memory_test_client.cpp
+index 102c8218..d922ad81 100644
+--- a/test/network_tests/memory_tests/memory_test_client.cpp
++++ b/test/network_tests/memory_tests/memory_test_client.cpp
+@@ -6,6 +6,7 @@
+ #include <chrono>
+ #include <iomanip>
+ #include <cstring>
++#include <cinttypes>
+ 
+ #include <vsomeip/internal/logger.hpp>
+ #include "memory_test_client.hpp"
+@@ -30,7 +31,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
+         std::uint64_t its_dirtypages(0);
+ 
+         if (EOF
+-            == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
++            == std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
++                           &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
+                            &its_data, &its_dirtypages)) {
+             VSOMEIP_ERROR << "check_memory: error reading: errno " << errno;
+         }
+diff --git a/test/network_tests/memory_tests/memory_test_service.cpp b/test/network_tests/memory_tests/memory_test_service.cpp
+index a8547395..751c6f9e 100644
+--- a/test/network_tests/memory_tests/memory_test_service.cpp
++++ b/test/network_tests/memory_tests/memory_test_service.cpp
+@@ -5,6 +5,7 @@
+ 
+ #include <vsomeip/internal/logger.hpp>
+ #include <cstring>
++#include <cinttypes>
+ 
+ #include "memory_test_service.hpp"
+ 
+@@ -28,7 +29,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
+         std::uint64_t its_dirtypages(0);
+ 
+         if (EOF
+-            == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
++            == std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
++                           &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
+                            &its_data, &its_dirtypages)) {
+             VSOMEIP_ERROR << "check_memory: error reading: errno " << errno;
+         }
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.9.bb
similarity index 67%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
rename to meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.9.bb
index f854078004..2ef1682daa 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.9.bb
@@ -7,25 +7,26 @@ SECTION = "net"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
 
-GTEST_VER = "1.15.2"
+GTEST_VER = "1.17.0"
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;branch=master;protocol=https;name=vsomeip \
            https://github.com/google/googletest/releases/download/v${GTEST_VER}/googletest-${GTEST_VER}.tar.gz;name=gtest;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/ \
            file://0001-Fix-pkgconfig-dir-for-multilib.patch \
            file://0002-Install-example-configuration-files-to-etc-vsomeip.patch \
-           file://0004-Do-not-specify-PIE-flag-explicitly.patch \
-           file://0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch \
+           file://0003-Do-not-specify-PIE-flag-explicitly.patch \
+           file://0004-Fix-build-with-boost-1.89.patch \
+           file://0005-Replace-address-from_string-with-make_address.patch \
+           file://0006-Fix-scanning-64-bit-integer-types.patch \
           "
 
-SRCREV = "6461369b3874c844642c9adaac9d1b7406794ab8"
-SRC_URI[gtest.sha256sum] = "7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926"
+SRCREV = "bb35c97194d6a5f228d68d2b7dabbce67b28af1e"
+SRC_URI[gtest.sha256sum] = "65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c"
 
 COMPATIBLE_HOST:mips = "null"
 COMPATIBLE_HOST:mips64 = "null"
 COMPATIBLE_HOST:powerpc = "null"
 COMPATIBLE_HOST:libc-musl = 'null'
 
-DEPENDS = "boost dlt-daemon googletest"
-
+DEPENDS = "boost dlt-daemon"
 
 inherit cmake pkgconfig
 
@@ -43,9 +44,10 @@ EXTRA_OECMAKE += "-DTEST_IP_MASTER=10.0.3.1 \
 
 RDEPENDS:${PN}-test = "bash lsof"
 
-do_compile:append() {
-    cmake_runcmake_build --target examples
-    cmake_runcmake_build --target build_tests
+OECMAKE_TARGET_COMPILE += "vsomeip_ctrl examples build_tests"
+
+do_compile:prepend() {
+    sed -i -e 's#${S}/build#/opt/${PN}-test#g' ${S}/test/unit_tests/security_policy_manager_impl_tests/policy_manager_impl_unit_test_macro.hpp
 }
 
 do_install:append() {
@@ -58,13 +60,17 @@ do_install:append() {
     install -d ${D}/opt/${PN}-test/test/test/common
     cp -rf ${S}/test/common/examples_policies \
         ${D}/opt/${PN}-test/test/test/common/
+
+    install -d ${D}/opt/${PN}-test/test/common
     install -m 0755 ${B}/test/common/libvsomeip_utilities.so \
-        ${D}/opt/${PN}-test/test/test/common/
+        ${D}/opt/${PN}-test/test/common/
 
     for d in unit_tests network_tests; do
         install -d ${D}/opt/${PN}-test/test/$d
         cp -rf ${B}/test/$d/*_tests ${D}/opt/${PN}-test/test/$d
+        find ${D}/opt/${PN}-test/test/$d -maxdepth 2 \( -name "*.cmake" -o -name "CMakeFiles" \) -exec rm -rf {} \;
     done
+    sed -i -e 's#../..${B}#/opt/${PN}-test#g' ${D}/opt/${PN}-test/test/network_tests/lazy_load_tests/vsomeip/vsomeip_policy_extensions.json
 }
 
 PACKAGES += "${PN}-test"
@@ -75,4 +81,5 @@ FILES:${PN}-dbg += " \
 FILES:${PN}-test = " \
    /opt/${PN}-test \
    "
-SKIP_RECIPE[vsomeip] ?= "Does not work with boost >= 1.87"
+
+INSANE_SKIP += "32bit-time"
-- 
2.34.1


