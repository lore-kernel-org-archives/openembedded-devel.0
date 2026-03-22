Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF0FFC72CA
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 15:06:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32049.1774191981137380134
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 08:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qpl5mIv7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7541320468=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MEoKWZ1580173
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 15:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=gkl8f+iZI2gueqWNlqGbRGKSz0q1/zaOa0H/wjrsy70=; b=Qpl5mIv7fQXf
	psoSgAv/S9mwQUtwaDp9SeVHmpcrK6UntMpr7c5ZuKyIckT7zObUsFs1YGv0MREH
	Fa3lGNrEgMDc87clZW+ZEsCFCVihY0nSBKIZcU+HzQxk/bX1jBYkVLfmq3T+e1fC
	7jevv5tDQv50iGwDKvjITiPu0Gg+eRo8wKEPbsb/TIazNFM0lz+rOZPwwd6j1mFf
	QX/VUJOenWNDe8EjXoOI9yE69jksPcyue9cqRlBlhTQ7B1PYcq74mOkFLYnZA57S
	/6F2MA7bv1aE0rpHGcE9lILiU5b+rCuxvHYY2xZ/dDNhxlK3TNuLv9eQ8i+7oJVZ
	0ixmkF9yuA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj813a6-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 15:06:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BW40pLJ1fhwkTrsfUwKBIEOk+u8vUUl2GTcy6Ih55MHkDFY0X297Lw1nDHufDdRJRfqUdxSWn/cVkIyQb/e5fevmcg+QKjUH75F811pQ0gbWOzigm81jFBixMv/HzcnWSsNxeCLzBghrFUmhYl9TcGHa5q17vCgjK0R4NOiesHzTjnxs6zWXHKUg26BGATn4xeAivQjAHWo3Iep13duAC6rGzqnkZky6V0cLHoy1KsoEwRCZltDXo0SD7HwbeAGjV0K2RNBadeVT9e1nA0vsR43611sTZJxQYUrkcQgMz2yVoV1NKZaW6UrDJ2zACTvHPF3G+kd09rOa6zri3Gw5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkl8f+iZI2gueqWNlqGbRGKSz0q1/zaOa0H/wjrsy70=;
 b=PO8h6UWmAWV351sJziO+pJ9znielscXhFch83VfXRUfVVhvEH0AN/TdgxONvAGyRJV7K6BRNnKXmE3G+ZnUuf7mv0qFwBecCRs3/WmbUvNsy/F38f9OesM5GYkF8S6Kb0HgATy9tQNQqUNzrMG0nycH2CtLDUHC29EAxra2ilx0/9fE1Dga5miyLYrv1iH/t4FXx3sE2t6KH8OJL8J+EE08mG2SXjA8CSFAIdeTsxgT/RXQm9lmmWLnCagdowVnQcusWJf/vwTYQ96J6d34PxbuDEuofoDm7tMXxr1AsWnNWq4D4bq66NgEk6MDNXH5HN8jOocfL7J9EYpqgfyHWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ5PPF8225D2149.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Sun, 22 Mar
 2026 15:06:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9745.012; Sun, 22 Mar 2026
 15:06:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] xfsprogs: upgrade 6.6.0 -> 6.18.0
Date: Sun, 22 Mar 2026 23:05:53 +0800
Message-Id: <20260322150553.2261687-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260322150553.2261687-1-yi.zhao@windriver.com>
References: <20260322150553.2261687-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0140.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ5PPF8225D2149:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d0bf59-ea9d-4b6a-5e23-08de8824914e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	AfikFbU/bmUy6zs5XZcNRr2LRG4aK3TWHbe89vm+XQXPMEC5VJS3Zd48J1aPOUbkkvsW7U3mCbnm1bbvMMEzOslMu0y38TMusOPhcism33dTssaoSCpjdNCSjiGNHtGY5zyYotmW1GRvMjiWG4CX7GNDYNAjPcz9Ckg1qdQ7f1Xik+eDClMdsHS6yvybyqML3SWkpg8/mBy0v4HTzDo3Ml62WJzDiAzKa7d5W8t6FhL6Pw5AuC3gUE7qVRdpa5JGLaRPZZcloFvvFJO/8RhYzPzbIKBeRQp1CtPz6BdavJ05xkPvbi7BiH5s9qKHtTf9YoZu/ooO2dKXTSLE+MRWh8/32Id7QPhFVhRThId8WD7ImWDQ7hglDpk0sAG2YFCDwteRoYpX/HMYCAZF4z6rp6XNp8+V86uuBkcgGuhOXQFL18Ss+YwRROMGFLY2NrYlGEdAhOZXdB4sNc5O8Gx6fvxz5f7BPXrDxIL4n+C53KTdxdlgD+wEQw8EisR2DzvqASZiRm6govQNdXqPLt4W99zL8WoTGBg06MhenDxr72Npi+tkeUD6rj61gnknAx/sek+vLRzKwjIKK7pquHI6DfrJSv/uPCvsni4c6/wYeALOXLscYUUrTQ4vIbrqTztQklJog0cUVF4FdYVx4GnAQOWbvF7SAqJP5qlf1k/U3YG4lMh9q93ZOAh5mzCN2tNDdtVZWNrzVY1AkGgFOOM2c5Ppi+WFZ++rmMC6p4qQSzyDh8NJOGA1Ws0Jls02cPdK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Ky4fGYUBfErFvFEZL9YFx4wKtJwXfHq4AuQEQwAh5e5mZ02nOzK7VLWiG2n?=
 =?us-ascii?Q?lP+fh6DHshbLhC4NF3o2cGL4lCWr98bG/p0Iu1BG+EMBQWpwx5JRchEj2rrl?=
 =?us-ascii?Q?x8UvKebVrworeUXkGg3hpV3GWAMjDf4A/cuIsluP0DRCTzOZlC4xyGpBw09Y?=
 =?us-ascii?Q?DeWeDu1MbLh0oLzkCokPDyMONVDl7S6nQAcgJWAyjwTcSJiHFmc1aNYziDiA?=
 =?us-ascii?Q?DYa5671aJ8TtB1fX39+awWPoFdz1krxsaqTZpSE2qMPmHPBGOq03u07sz2+d?=
 =?us-ascii?Q?TBfMUSwDBc30k8r4DmAKltDBGR+HXTPDJpyKX9cjrE5Sk+3DskpcVdjNCUsU?=
 =?us-ascii?Q?dSj78gdOit8k32mZvitfMbKhtk0GxZaeYa9MS2BweY/Qvv6k0nxj3vTpDdEP?=
 =?us-ascii?Q?7Az/3U37EWCSMS6D7RVC0noqb1IKVzBSthU6WcDg1nDIe3EogWczCanAD1JO?=
 =?us-ascii?Q?V5zJNxjAtljjUtLIqIWdXMxSvf3HfxB1imXAuuNPDJFkCjffgSy65emerCwR?=
 =?us-ascii?Q?+lWQmJplNHDVPGF+2Oaq7Mu4zhO6ELJfskbaG0abV8knGmH2UMAsSc8O+7TJ?=
 =?us-ascii?Q?yyACHVr+1Bq0SwqsWwfS+p7QVCLHXDgk2BDIHy2SQZnxL7s4CgzkR9Lwv/0M?=
 =?us-ascii?Q?vZm+XlSpevfBH6JvEovpOKV2xBwVgmjVSVHfsXCxwAwD7v5SxFQF5fSYr+j1?=
 =?us-ascii?Q?VLaVjIDUuV48XOjIFF3xK9SIqyjlAXZWIF08w7yBrElXVLCrRhluqEcs4f7i?=
 =?us-ascii?Q?hUPPe+6kHJV48TUGL4A1b8Q/rON+qtD3uX8Pdd9Al1Z5gD733h+N0Ndj3HDS?=
 =?us-ascii?Q?VkJrK4pnai6PIcgJteTQapYWP8rVA1uRcvGGwfTpjXxi5AhmJZXqB7Vyi3uA?=
 =?us-ascii?Q?IFdq5J5BI31U2WocTg4gwHCrH8mxiNsnUbs5Co2xFS59sU+CBuVYNL+LzgVe?=
 =?us-ascii?Q?J5I4tRJmUY1TDT/p64EgO7uXH1HlKrNKsXuTyPvMwavpl9LOA54menZlXikS?=
 =?us-ascii?Q?NIRFyvfEX5lxvhk+UnN4Rw8cXzt+i/L7JHl7Hu06Ag2bbUJMg4zbYf4SlFx5?=
 =?us-ascii?Q?Nd1uod7O8g/EMELv+L6lCsHjbk4WF9OzwLmK9zzFGCBzmB7tdG2CRWmzOSYg?=
 =?us-ascii?Q?ybgHHAriNy/y3LQWxqBjsxa7i31h2s4tjMG0+FWQitQV9tbIEdXO7afFqD62?=
 =?us-ascii?Q?XY8/qWZjppESq654AUyQpSEz1+nAjGoqwX6ok/7TyUtEFOB4EupbV5YyUkNC?=
 =?us-ascii?Q?992XpT11JQqSDxT7hENl9kj4AJlUxUgk8MoHbRUFO0Zaim9fsBY1SgwC6cAp?=
 =?us-ascii?Q?1VVlyqVJCuJmIclmWPxebGLFTq+AoRu2R3wAevqj89olP975TFRlaEv+M4dF?=
 =?us-ascii?Q?PZApeyTBem/CUkuUOSViUu5782bJLnRM4GF7cTnmUNN9cyfxKUymJgTesXoJ?=
 =?us-ascii?Q?Iv6cMvGiVG3q8zIJHoQlt7gtqkDa+s35fZXb723FSPRyyTWEIzID8MEVHdHp?=
 =?us-ascii?Q?jK1oolVuN2cx5zDicQMGQT5R/xdvpoUstgk78IaFYQbD3p/oaotb5lwzRRPI?=
 =?us-ascii?Q?xcDI6movaoDLw8iNwWLADmVGjam6x7G08qH28flHyj2DP+0QCx+/Bob6RRlW?=
 =?us-ascii?Q?cCAn+8/YNzevJOfHMgysWzhPVLwHmiWB9K9aMNrvCCiYshRYUBKlAoKEz84R?=
 =?us-ascii?Q?PIyOBvulcoAEYupZTqcqItz5kxRV1qMIfcFhd9sE6mnsPZsc1QcrT//djGct?=
 =?us-ascii?Q?TC6EqJ+jYw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	O17ZcEmZkXuwohDgrm1DsYVSC8CvBPEerXoAg1p0YLFi/pWFdogD8IuZijrC5Q+oTRIPzOnwW8K7LtUhbUogCuCaIHNOGwIKUuDBsaH6cHwbJiOWbZQQS4BFFptS7AAn7XFwl4UtK1qdvufO6wH6nFOnEHrEW73hqr1WUHjvbBDG+B9QBgvyynrPwsLS7uHuv3bt9kOyc/A/u3Lv+DYUAykArHY8HNuFmUIzlQmSyYNlkNLEqWd77LCa1RrhUDHaHMQxj623gZUCJJ5/q6X0sTttltxdau9iLc5U5yq44ZEmsgQKBcgFRAgpV2PZW0NNgmDM2ZtxYnXN+DBWTmCtGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d0bf59-ea9d-4b6a-5e23-08de8824914e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 15:06:17.3833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT+n2rPeL8ezqkLUBqqmFe0rFWAf1itiX2m1dZ01M8mS2JO13UiN9f/T2yfd3y8rCXv3O5xeHf8KJfcdeTcstQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8225D2149
X-Proofpoint-ORIG-GUID: WGNGqH4zYzPU4i2HetkbfO_j5R5V1y-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDEzMSBTYWx0ZWRfX2dd4MspTn/o5
 ixkxIXKdXTnmdYdHqG1Gh7MRLp5c3eGldDLkJwpDD1pkmOBtUm56DEiV+DF1sb+8Z93T/9e0dF9
 EFeWcBcQTbYMp/Zyyl0POwMpWQz8UGXFEp7tMRCO/oRu+sU7UmyuXZ1BiVOVdXmpQetPlxHbd6Z
 bc68nYEG4ggdC8TJ8BKzXsAVUwWNBXOBrvdLN1TfTXFhfZhoTUqH2t7OEGo9l1z2Y6RcFTsIqcY
 SjwnbHDJ4p1TpoEFtPG3IP94YmOOgO+etAFPAonH3G3GGRgSPw+4awvu3AyW4h4lwGfQSP/Zvtd
 OrQ6hAPGgfTVMgJkx2lwXsNKvinKQxAHzM/YReHqY23ns1aiQOT+DSksmRVEka5Fqpg1FGGniQk
 jsu6w/MJbaa7tUixFSzgxo2iImd6gMB3QJK6Tq25Ri2HcLqGDKtgEUdXWYgFx/FqKaS0hc2oB95
 5udu1qp2zh2S/reXwYw==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c0056c cx=c_pps
 a=6NHOJSrb2DrgGhcKreW8mw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=zlKiLguyca0xfZfZzk0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WGNGqH4zYzPU4i2HetkbfO_j5R5V1y-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 15:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125485

ChangeLog:
https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v6.18.0

* Drop PACKAGECONFIG[blkid] as libblkid is now a hard requirement.
* Refresh local patches.
* Remove usrmerge workaround.
* Remove the following patches as the issues have been fixed upstream:
  0001-support-usrmerge.patch
  0005-Replace-off64_t-stat64-with-off_t-stat.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...nclude-xfs-linux.h-after-sys-mman.h.patch} |   4 +-
 .../files/0001-support-usrmerge.patch         |  40 -
 ...se-AC_SYS_LARGERFILE-autoconf-macro.patch} |   6 +-
 ...doc-man-support-reproducible-builds.patch} |   9 +-
 ...place-off64_t-stat64-with-off_t-stat.patch | 724 ------------------
 .../files/remove_flags_from_build_flags.patch |  14 +-
 .../{xfsprogs_6.6.0.bb => xfsprogs_6.18.0.bb} |  45 +-
 7 files changed, 32 insertions(+), 810 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/files/{0002-include-include-xfs-linux.h-after-sys-mman.h.patch => 0001-include-include-xfs-linux.h-after-sys-mman.h.patch} (88%)
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0001-support-usrmerge.patch
 rename meta-filesystems/recipes-utils/xfsprogs/files/{0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch => 0002-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch} (83%)
 rename meta-filesystems/recipes-utils/xfsprogs/files/{0001-doc-man-support-reproducible-builds.patch => 0003-doc-man-support-reproducible-builds.patch} (91%)
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_6.6.0.bb => xfsprogs_6.18.0.bb} (54%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-include-include-xfs-linux.h-after-sys-mman.h.patch
similarity index 88%
rename from meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch
rename to meta-filesystems/recipes-utils/xfsprogs/files/0001-include-include-xfs-linux.h-after-sys-mman.h.patch
index f924cd1a16..d9aa309607 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-include-include-xfs-linux.h-after-sys-mman.h.patch
@@ -1,4 +1,4 @@
-From 11a42df394de3dc520e72a016296dcc6dea02a7a Mon Sep 17 00:00:00 2001
+From 04a4272a36f6b2a1ad30a10fcf36a4a1c68a5449 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 23 Aug 2018 05:33:57 +0000
 Subject: [PATCH] include include/xfs/linux.h after <sys/mman.h>
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/io/mmap.c b/io/mmap.c
-index dbfcca5..ca00df1 100644
+index 4c03e3d..3763551 100644
 --- a/io/mmap.c
 +++ b/io/mmap.c
 @@ -4,10 +4,11 @@
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-support-usrmerge.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-support-usrmerge.patch
deleted file mode 100644
index 84f4f88e5f..0000000000
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0001-support-usrmerge.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e81633a276dd6a9f919e5e5c15481ac50a8e485d Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 30 Aug 2019 14:59:06 +0800
-Subject: [PATCH] support usrmerge
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- configure.ac | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4b7e4c8..f1afbd6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -110,8 +110,7 @@ AC_ARG_ENABLE(libicu,
- # If the user specified a libdir ending in lib64 do not append another
- # 64 to the library names.
- #
--base_libdir=`basename "$libdir"`
--case $base_libdir in
-+case `basename "$libdir"` in
- lib64)
-   enable_lib64=no
- esac
-@@ -125,8 +124,8 @@ esac
- #
- case $exec_prefix:$prefix in
- NONE:NONE | NONE:/usr | /usr:*)
--  root_sbindir='/sbin'
--  root_libdir="/${base_libdir}"
-+  root_sbindir="${base_sbindir}"
-+  root_libdir="${base_libdir}"
-   ;;
- *)
-   root_sbindir="${sbindir}"
--- 
-2.7.4
-
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0002-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch
similarity index 83%
rename from meta-filesystems/recipes-utils/xfsprogs/files/0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch
rename to meta-filesystems/recipes-utils/xfsprogs/files/0002-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch
index 60be8bfa34..d62ad022c3 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0002-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch
@@ -1,4 +1,4 @@
-From f62d3e5cc1d4e416b97778059f0b3c20d777a4c2 Mon Sep 17 00:00:00 2001
+From 471bbf39f6b9104d39f0b9c8d4a64328dd5ae58e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 21 Dec 2022 17:40:11 -0800
 Subject: [PATCH] configure: Use AC_SYS_LARGERFILE autoconf macro
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 5a6bf185..a6f556ec 100644
+index a8b8f7d..f8caa73 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -10,6 +10,9 @@ AC_PROG_INSTALL
+@@ -18,6 +18,9 @@ AC_PROG_INSTALL
  LT_INIT
  
  AC_PROG_CC
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-doc-man-support-reproducible-builds.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0003-doc-man-support-reproducible-builds.patch
similarity index 91%
rename from meta-filesystems/recipes-utils/xfsprogs/files/0001-doc-man-support-reproducible-builds.patch
rename to meta-filesystems/recipes-utils/xfsprogs/files/0003-doc-man-support-reproducible-builds.patch
index 182d45e4e2..fed3f3451a 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0001-doc-man-support-reproducible-builds.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0003-doc-man-support-reproducible-builds.patch
@@ -1,4 +1,4 @@
-From c98d9022377e88f8cc2d557a4ffd321e6f2dd320 Mon Sep 17 00:00:00 2001
+From a2d78f6716157d6e1e94d9864e351887d74d0b30 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@eng.windriver.com>
 Date: Tue, 18 Nov 2025 01:04:27 -0800
 Subject: [PATCH] doc/man: support reproducible builds
@@ -16,7 +16,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/doc/Makefile b/doc/Makefile
-index 83dfa38b..17b63c85 100644
+index 83dfa38..17b63c8 100644
 --- a/doc/Makefile
 +++ b/doc/Makefile
 @@ -14,7 +14,7 @@ include $(BUILDRULES)
@@ -29,7 +29,7 @@ index 83dfa38b..17b63c85 100644
  install: default
  	$(INSTALL) -m 755 -d $(PKG_DOC_DIR)
 diff --git a/include/buildmacros b/include/buildmacros
-index 9183e5bc..6ba0d515 100644
+index 9183e5b..6ba0d51 100644
 --- a/include/buildmacros
 +++ b/include/buildmacros
 @@ -105,7 +105,7 @@ INSTALL_MAN = \
@@ -49,6 +49,3 @@ index 9183e5bc..6ba0d515 100644
 +			$(ZIP) -n --best -c < $$f > $$f.gz; \
  		fi; \
  	done
--- 
-2.49.0
-
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch
deleted file mode 100644
index 940d63c010..0000000000
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0005-Replace-off64_t-stat64-with-off_t-stat.patch
+++ /dev/null
@@ -1,724 +0,0 @@
-From f260099fc45f0653aa4758d1d581e07f5b9c6a54 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 21 Dec 2022 17:43:07 -0800
-Subject: [PATCH] Replace off64_t/stat64 with off_t/stat
-
-When using AC_SYS_LARGEFILE, it will automatically add
--D_FILE_OFFSET_BITS=64 to enable 64bit off_t and all lfs64 support
-
-helps compile on musl where off_t was always 64bit and lfs64 were never
-needed
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-xfs/20221222015327.939932-1-raj.khem@gmail.com/T/#t]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- copy/xfs_copy.c           |  2 +-
- fsr/xfs_fsr.c             |  2 +-
- io/bmap.c                 |  6 +++---
- io/copy_file_range.c      |  4 ++--
- io/cowextsize.c           |  6 +++---
- io/fadvise.c              |  2 +-
- io/fiemap.c               |  6 +++---
- io/fsmap.c                |  6 +++---
- io/io.h                   | 10 +++++-----
- io/madvise.c              |  2 +-
- io/mincore.c              |  2 +-
- io/mmap.c                 | 12 ++++++------
- io/pread.c                | 22 +++++++++++-----------
- io/pwrite.c               | 20 ++++++++++----------
- io/reflink.c              |  4 ++--
- io/seek.c                 |  6 +++---
- io/sendfile.c             |  6 +++---
- io/stat.c                 |  2 +-
- io/sync_file_range.c      |  2 +-
- io/truncate.c             |  2 +-
- libxfs/rdwr.c             |  8 ++++----
- mdrestore/xfs_mdrestore.c |  2 +-
- repair/prefetch.c         |  2 +-
- scrub/spacemap.c          |  6 +++---
- spaceman/freesp.c         |  4 ++--
- spaceman/trim.c           |  2 +-
- 26 files changed, 74 insertions(+), 74 deletions(-)
-
-diff --git a/copy/xfs_copy.c b/copy/xfs_copy.c
-index 0420649..98a578a 100644
---- a/copy/xfs_copy.c
-+++ b/copy/xfs_copy.c
-@@ -881,7 +881,7 @@ main(int argc, char **argv)
- 			}
- 		} else  {
- 			char	*lb = memalign(wbuf_align, XFS_MAX_SECTORSIZE);
--			off64_t	off;
-+			off_t	off;
- 			ssize_t	len;
- 
- 			/* ensure device files are sufficiently large */
-diff --git a/fsr/xfs_fsr.c b/fsr/xfs_fsr.c
-index ba02506..12fffbd 100644
---- a/fsr/xfs_fsr.c
-+++ b/fsr/xfs_fsr.c
-@@ -1148,7 +1148,7 @@ packfile(char *fname, char *tname, int fd,
- 	struct dioattr	dio;
- 	static xfs_swapext_t   sx;
- 	struct xfs_flock64  space;
--	off64_t 	cnt, pos;
-+	off_t 	cnt, pos;
- 	void 		*fbuf = NULL;
- 	int 		ct, wc, wc_b4;
- 	char		ffname[SMBUFSZ];
-diff --git a/io/bmap.c b/io/bmap.c
-index 722a389..6182e1c 100644
---- a/io/bmap.c
-+++ b/io/bmap.c
-@@ -257,7 +257,7 @@ bmap_f(
- #define	FLG_BSW		0000010	/* Not on begin of stripe width */
- #define	FLG_ESW		0000001	/* Not on end   of stripe width */
- 		int	agno;
--		off64_t agoff, bbperag;
-+		off_t agoff, bbperag;
- 		int	foff_w, boff_w, aoff_w, tot_w, agno_w;
- 		char	rbuf[32], bbuf[32], abuf[32];
- 		int	sunit, swidth;
-@@ -267,8 +267,8 @@ bmap_f(
- 		if (is_rt)
- 			sunit = swidth = bbperag = 0;
- 		else {
--			bbperag = (off64_t)fsgeo.agblocks *
--				  (off64_t)fsgeo.blocksize / BBSIZE;
-+			bbperag = (off_t)fsgeo.agblocks *
-+				  (off_t)fsgeo.blocksize / BBSIZE;
- 			sunit = (fsgeo.sunit * fsgeo.blocksize) / BBSIZE;
- 			swidth = (fsgeo.swidth * fsgeo.blocksize) / BBSIZE;
- 		}
-diff --git a/io/copy_file_range.c b/io/copy_file_range.c
-index d154fa7..422e691 100644
---- a/io/copy_file_range.c
-+++ b/io/copy_file_range.c
-@@ -54,7 +54,7 @@ copy_file_range_cmd(int fd, long long *src_off, long long *dst_off, size_t len)
- 	return 0;
- }
- 
--static off64_t
-+static off_t
- copy_src_filesize(int fd)
- {
- 	struct stat st;
-@@ -154,7 +154,7 @@ copy_range_f(int argc, char **argv)
- 	}
- 
- 	if (!len_specified) {
--		off64_t	sz;
-+		off_t	sz;
- 
- 		sz = copy_src_filesize(fd);
- 		if (sz < 0 || (unsigned long long)sz > SIZE_MAX) {
-diff --git a/io/cowextsize.c b/io/cowextsize.c
-index f6b134d..00e40c6 100644
---- a/io/cowextsize.c
-+++ b/io/cowextsize.c
-@@ -50,10 +50,10 @@ static int
- set_cowextsize(const char *path, int fd, long extsz)
- {
- 	struct fsxattr	fsx;
--	struct stat64	stat;
-+	struct stat	stat;
- 
--	if (fstat64(fd, &stat) < 0) {
--		perror("fstat64");
-+	if (fstat(fd, &stat) < 0) {
-+		perror("fstat");
- 		exitcode = 1;
- 		return 0;
- 	}
-diff --git a/io/fadvise.c b/io/fadvise.c
-index 60cc0f0..0966c41 100644
---- a/io/fadvise.c
-+++ b/io/fadvise.c
-@@ -39,7 +39,7 @@ fadvise_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset = 0, length = 0;
-+	off_t		offset = 0, length = 0;
- 	int		c, range = 0, advise = POSIX_FADV_NORMAL;
- 
- 	while ((c = getopt(argc, argv, "dnrsw")) != EOF) {
-diff --git a/io/fiemap.c b/io/fiemap.c
-index f0c74df..b41f71b 100644
---- a/io/fiemap.c
-+++ b/io/fiemap.c
-@@ -234,9 +234,9 @@ fiemap_f(
- 	int		tot_w = 5;	/* 5 since its just one number */
- 	int		flg_w = 5;
- 	__u64		last_logical = 0;	/* last extent offset handled */
--	off64_t		start_offset = 0;	/* mapping start */
--	off64_t		length = -1LL;		/* mapping length */
--	off64_t		range_end = -1LL;	/* mapping end*/
-+	off_t		start_offset = 0;	/* mapping start */
-+	off_t		length = -1LL;		/* mapping length */
-+	off_t		range_end = -1LL;	/* mapping end*/
- 	size_t		fsblocksize, fssectsize;
- 	struct stat	st;
- 
-diff --git a/io/fsmap.c b/io/fsmap.c
-index 7db5184..bf11963 100644
---- a/io/fsmap.c
-+++ b/io/fsmap.c
-@@ -170,7 +170,7 @@ dump_map_verbose(
- 	unsigned long long	i;
- 	struct fsmap		*p;
- 	int			agno;
--	off64_t			agoff, bperag;
-+	off_t			agoff, bperag;
- 	int			foff_w, boff_w, aoff_w, tot_w, agno_w, own_w;
- 	int			nr_w, dev_w;
- 	char			rbuf[40], bbuf[40], abuf[40], obuf[40];
-@@ -183,8 +183,8 @@ dump_map_verbose(
- 	dev_w = 3;
- 	nr_w = 4;
- 	tot_w = MINTOT_WIDTH;
--	bperag = (off64_t)fsgeo->agblocks *
--		  (off64_t)fsgeo->blocksize;
-+	bperag = (off_t)fsgeo->agblocks *
-+		  (off_t)fsgeo->blocksize;
- 	sunit = (fsgeo->sunit * fsgeo->blocksize);
- 	swidth = (fsgeo->swidth * fsgeo->blocksize);
- 
-diff --git a/io/io.h b/io/io.h
-index fe474fa..68e5e48 100644
---- a/io/io.h
-+++ b/io/io.h
-@@ -53,7 +53,7 @@ extern int stat_f(int argc, char **argv);
- typedef struct mmap_region {
- 	void		*addr;		/* address of start of mapping */
- 	size_t		length;		/* length of mapping */
--	off64_t		offset;		/* start offset into backing file */
-+	off_t		offset;		/* start offset into backing file */
- 	int		prot;		/* protection mode of the mapping */
- 	int		flags;		/* MAP_* flags passed to mmap() */
- 	char		*name;		/* name of backing file */
-@@ -63,13 +63,13 @@ extern mmap_region_t	*maptable;	/* mmap'd region array */
- extern int		mapcount;	/* #entries in the mapping table */
- extern mmap_region_t	*mapping;	/* active mapping table entry */
- extern int maplist_f(void);
--extern void *check_mapping_range(mmap_region_t *, off64_t, size_t, int);
-+extern void *check_mapping_range(mmap_region_t *, off_t, size_t, int);
- 
- /*
-  * Various xfs_io helper routines/globals
-  */
- 
--extern off64_t		filesize(void);
-+extern off_t		filesize(void);
- extern int		openfile(char *, struct xfs_fsop_geom *, int, mode_t,
- 				 struct fs_path *);
- extern int		addfile(char *, int , struct xfs_fsop_geom *, int,
-@@ -84,9 +84,9 @@ extern size_t		io_buffersize;
- extern int		vectors;
- extern struct iovec	*iov;
- extern int		alloc_buffer(size_t, int, unsigned int);
--extern int		read_buffer(int, off64_t, long long, long long *,
-+extern int		read_buffer(int, off_t, long long, long long *,
- 					int, int);
--extern void		dump_buffer(off64_t, ssize_t);
-+extern void		dump_buffer(off_t, ssize_t);
- 
- extern void		attr_init(void);
- extern void		bmap_init(void);
-diff --git a/io/madvise.c b/io/madvise.c
-index bde3153..6e9c5b1 100644
---- a/io/madvise.c
-+++ b/io/madvise.c
-@@ -39,7 +39,7 @@ madvise_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset, llength;
-+	off_t		offset, llength;
- 	size_t		length;
- 	void		*start;
- 	int		advise = MADV_NORMAL, c;
-diff --git a/io/mincore.c b/io/mincore.c
-index 67f1d6c..24147ac 100644
---- a/io/mincore.c
-+++ b/io/mincore.c
-@@ -17,7 +17,7 @@ mincore_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset, llength;
-+	off_t		offset, llength;
- 	size_t		length;
- 	size_t		blocksize, sectsize;
- 	void		*start;
-diff --git a/io/mmap.c b/io/mmap.c
-index 7114404..128a2c0 100644
---- a/io/mmap.c
-+++ b/io/mmap.c
-@@ -64,11 +64,11 @@ print_mapping(
- void *
- check_mapping_range(
- 	mmap_region_t	*map,
--	off64_t		offset,
-+	off_t		offset,
- 	size_t		length,
- 	int		pagealign)
- {
--	off64_t		relative;
-+	off_t		relative;
- 
- 	if (offset < mapping->offset) {
- 		printf(_("offset (%lld) is before start of mapping (%lld)\n"),
-@@ -156,7 +156,7 @@ mmap_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset;
-+	off_t		offset;
- 	ssize_t		length = 0, length2 = 0;
- 	void		*address = NULL;
- 	char		*filename;
-@@ -309,7 +309,7 @@ msync_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset;
-+	off_t		offset;
- 	ssize_t		length;
- 	void		*start;
- 	int		c, flags = 0;
-@@ -402,7 +402,7 @@ mread_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset, tmp, dumpoffset, printoffset;
-+	off_t		offset, tmp, dumpoffset, printoffset;
- 	ssize_t		length;
- 	size_t		dumplen, cnt = 0;
- 	char		*bp;
-@@ -567,7 +567,7 @@ mwrite_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset, tmp;
-+	off_t		offset, tmp;
- 	ssize_t		length;
- 	void		*start;
- 	char		*sp;
-diff --git a/io/pread.c b/io/pread.c
-index 0f1d8b9..79990c6 100644
---- a/io/pread.c
-+++ b/io/pread.c
-@@ -116,7 +116,7 @@ alloc_buffer(
- static void
- __dump_buffer(
- 	void		*buf,
--	off64_t		offset,
-+	off_t		offset,
- 	ssize_t		len)
- {
- 	int		i, j;
-@@ -141,7 +141,7 @@ __dump_buffer(
- 
- void
- dump_buffer(
--	off64_t		offset,
-+	off_t		offset,
- 	ssize_t		len)
- {
- 	int		i, l;
-@@ -164,7 +164,7 @@ dump_buffer(
- static ssize_t
- do_preadv(
- 	int		fd,
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count)
- {
- 	int		vecs = 0;
-@@ -199,7 +199,7 @@ do_preadv(
- static ssize_t
- do_pread(
- 	int		fd,
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count,
- 	size_t		buffer_size)
- {
-@@ -212,13 +212,13 @@ do_pread(
- static int
- read_random(
- 	int		fd,
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count,
- 	long long	*total,
- 	unsigned int	seed,
- 	int		eof)
- {
--	off64_t		end, off, range;
-+	off_t		end, off, range;
- 	ssize_t		bytes;
- 	int		ops = 0;
- 
-@@ -259,12 +259,12 @@ read_random(
- static int
- read_backward(
- 	int		fd,
--	off64_t		*offset,
-+	off_t		*offset,
- 	long long	*count,
- 	long long	*total,
- 	int		eof)
- {
--	off64_t		end, off = *offset;
-+	off_t		end, off = *offset;
- 	ssize_t		bytes = 0, bytes_requested;
- 	long long	cnt = *count;
- 	int		ops = 0;
-@@ -319,7 +319,7 @@ read_backward(
- static int
- read_forward(
- 	int		fd,
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count,
- 	long long	*total,
- 	int		verbose,
-@@ -353,7 +353,7 @@ read_forward(
- int
- read_buffer(
- 	int		fd,
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count,
- 	long long	*total,
- 	int		verbose,
-@@ -368,7 +368,7 @@ pread_f(
- 	char		**argv)
- {
- 	size_t		bsize;
--	off64_t		offset;
-+	off_t		offset;
- 	unsigned int	zeed = 0;
- 	long long	count, total, tmp;
- 	size_t		fsblocksize, fssectsize;
-diff --git a/io/pwrite.c b/io/pwrite.c
-index 467bfa9..8d134c5 100644
---- a/io/pwrite.c
-+++ b/io/pwrite.c
-@@ -54,7 +54,7 @@ pwrite_help(void)
- static ssize_t
- do_pwritev(
- 	int		fd,
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count,
- 	int		pwritev2_flags)
- {
-@@ -97,7 +97,7 @@ do_pwritev(
- static ssize_t
- do_pwrite(
- 	int		fd,
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count,
- 	size_t		buffer_size,
- 	int		pwritev2_flags)
-@@ -110,13 +110,13 @@ do_pwrite(
- 
- static int
- write_random(
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count,
- 	unsigned int	seed,
- 	long long	*total,
- 	int 		pwritev2_flags)
- {
--	off64_t		off, range;
-+	off_t		off, range;
- 	ssize_t		bytes;
- 	int		ops = 0;
- 
-@@ -155,12 +155,12 @@ write_random(
- 
- static int
- write_backward(
--	off64_t		offset,
-+	off_t		offset,
- 	long long	*count,
- 	long long	*total,
- 	int		pwritev2_flags)
- {
--	off64_t		end, off = offset;
-+	off_t		end, off = offset;
- 	ssize_t		bytes = 0, bytes_requested;
- 	long long	cnt = *count;
- 	int		ops = 0;
-@@ -214,11 +214,11 @@ write_backward(
- 
- static int
- write_buffer(
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count,
- 	size_t		bs,
- 	int		fd,
--	off64_t		skip,
-+	off_t		skip,
- 	long long	*total,
- 	int		pwritev2_flags)
- {
-@@ -253,7 +253,7 @@ write_buffer(
- 
- static int
- write_once(
--	off64_t		offset,
-+	off_t		offset,
- 	long long	count,
- 	long long	*total,
- 	int		pwritev2_flags)
-@@ -275,7 +275,7 @@ pwrite_f(
- 	char		**argv)
- {
- 	size_t		bsize;
--	off64_t		offset, skip = 0;
-+	off_t		offset, skip = 0;
- 	long long	count, total, tmp;
- 	unsigned int	zeed = 0, seed = 0xcdcdcdcd;
- 	size_t		fsblocksize, fssectsize;
-diff --git a/io/reflink.c b/io/reflink.c
-index 8e4f389..b6a3c05 100644
---- a/io/reflink.c
-+++ b/io/reflink.c
-@@ -98,7 +98,7 @@ dedupe_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		soffset, doffset;
-+	off_t		soffset, doffset;
- 	long long	count, total;
- 	char		*infile;
- 	int		condensed, quiet_flag;
-@@ -226,7 +226,7 @@ reflink_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		soffset, doffset;
-+	off_t		soffset, doffset;
- 	long long	count = 0, total;
- 	char		*infile = NULL;
- 	int		condensed, quiet_flag;
-diff --git a/io/seek.c b/io/seek.c
-index 6734ecb..ffe7439 100644
---- a/io/seek.c
-+++ b/io/seek.c
-@@ -63,8 +63,8 @@ static void
- seek_output(
- 	int	startflag,
- 	char	*type,
--	off64_t	start,
--	off64_t	offset)
-+	off_t	start,
-+	off_t	offset)
- {
- 	if (offset == -1) {
- 		if (errno == ENXIO) {
-@@ -92,7 +92,7 @@ seek_f(
- 	int	argc,
- 	char	**argv)
- {
--	off64_t		offset, start;
-+	off_t		offset, start;
- 	size_t		fsblocksize, fssectsize;
- 	int		c;
- 	int		current;	/* specify data or hole */
-diff --git a/io/sendfile.c b/io/sendfile.c
-index a003bb5..2ce569c 100644
---- a/io/sendfile.c
-+++ b/io/sendfile.c
-@@ -34,12 +34,12 @@ sendfile_help(void)
- 
- static int
- send_buffer(
--	off64_t		offset,
-+	off_t		offset,
- 	size_t		count,
- 	int		fd,
- 	long long	*total)
- {
--	off64_t		off = offset;
-+	off_t		off = offset;
- 	ssize_t		bytes, bytes_remaining = count;
- 	int		ops = 0;
- 
-@@ -66,7 +66,7 @@ sendfile_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset = 0;
-+	off_t		offset = 0;
- 	long long	count, total;
- 	size_t		blocksize, sectsize;
- 	struct timeval	t1, t2;
-diff --git a/io/stat.c b/io/stat.c
-index b57f9ee..e8f68dc 100644
---- a/io/stat.c
-+++ b/io/stat.c
-@@ -21,7 +21,7 @@ static cmdinfo_t stat_cmd;
- static cmdinfo_t statfs_cmd;
- static cmdinfo_t statx_cmd;
- 
--off64_t
-+off_t
- filesize(void)
- {
- 	struct stat	st;
-diff --git a/io/sync_file_range.c b/io/sync_file_range.c
-index 94285c2..2375a06 100644
---- a/io/sync_file_range.c
-+++ b/io/sync_file_range.c
-@@ -30,7 +30,7 @@ sync_range_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset = 0, length = 0;
-+	off_t		offset = 0, length = 0;
- 	int		c, sync_mode = 0;
- 	size_t		blocksize, sectsize;
- 
-diff --git a/io/truncate.c b/io/truncate.c
-index 1d04919..a74b613 100644
---- a/io/truncate.c
-+++ b/io/truncate.c
-@@ -16,7 +16,7 @@ truncate_f(
- 	int		argc,
- 	char		**argv)
- {
--	off64_t		offset;
-+	off_t		offset;
- 	size_t		blocksize, sectsize;
- 
- 	init_cvtnum(&blocksize, &sectsize);
-diff --git a/libxfs/rdwr.c b/libxfs/rdwr.c
-index 0e33211..153007d 100644
---- a/libxfs/rdwr.c
-+++ b/libxfs/rdwr.c
-@@ -576,7 +576,7 @@ libxfs_balloc(
- 
- 
- static int
--__read_buf(int fd, void *buf, int len, off64_t offset, int flags)
-+__read_buf(int fd, void *buf, int len, off_t offset, int flags)
- {
- 	int	sts;
- 
-@@ -638,7 +638,7 @@ libxfs_readbufr_map(struct xfs_buftarg *btp, struct xfs_buf *bp, int flags)
- 
- 	buf = bp->b_addr;
- 	for (i = 0; i < bp->b_nmaps; i++) {
--		off64_t	offset = LIBXFS_BBTOOFF64(bp->b_maps[i].bm_bn);
-+		off_t	offset = LIBXFS_BBTOOFF64(bp->b_maps[i].bm_bn);
- 		int len = BBTOB(bp->b_maps[i].bm_len);
- 
- 		error = __read_buf(fd, buf, len, offset, flags);
-@@ -797,7 +797,7 @@ err:
- }
- 
- static int
--__write_buf(int fd, void *buf, int len, off64_t offset, int flags)
-+__write_buf(int fd, void *buf, int len, off_t offset, int flags)
- {
- 	int	sts;
- 
-@@ -863,7 +863,7 @@ libxfs_bwrite(
- 		void	*buf = bp->b_addr;
- 
- 		for (i = 0; i < bp->b_nmaps; i++) {
--			off64_t	offset = LIBXFS_BBTOOFF64(bp->b_maps[i].bm_bn);
-+			off_t	offset = LIBXFS_BBTOOFF64(bp->b_maps[i].bm_bn);
- 			int len = BBTOB(bp->b_maps[i].bm_len);
- 
- 			bp->b_error = __write_buf(fd, buf, len, offset,
-diff --git a/mdrestore/xfs_mdrestore.c b/mdrestore/xfs_mdrestore.c
-index 8e3998d..334bdd2 100644
---- a/mdrestore/xfs_mdrestore.c
-+++ b/mdrestore/xfs_mdrestore.c
-@@ -160,7 +160,7 @@ verify_device_size(
- 	} else {
- 		/* ensure device is sufficiently large enough */
- 		char		lb[XFS_MAX_SECTORSIZE] = { 0 };
--		off64_t		off;
-+		off_t		off;
- 
- 		off = nr_blocks * blocksize - sizeof(lb);
- 		if (pwrite(dev_fd, lb, sizeof(lb), off) < 0)
-diff --git a/repair/prefetch.c b/repair/prefetch.c
-index 78c1e39..b0dd197 100644
---- a/repair/prefetch.c
-+++ b/repair/prefetch.c
-@@ -475,7 +475,7 @@ pf_batch_read(
- {
- 	struct xfs_buf		*bplist[MAX_BUFS];
- 	unsigned int		num;
--	off64_t			first_off, last_off, next_off;
-+	off_t			first_off, last_off, next_off;
- 	int			len, size;
- 	int			i;
- 	int			inode_bufs;
-diff --git a/scrub/spacemap.c b/scrub/spacemap.c
-index b6fd411..9cefe07 100644
---- a/scrub/spacemap.c
-+++ b/scrub/spacemap.c
-@@ -97,11 +97,11 @@ scan_ag_rmaps(
- 	struct scrub_ctx	*ctx = (struct scrub_ctx *)wq->wq_ctx;
- 	struct scan_blocks	*sbx = arg;
- 	struct fsmap		keys[2];
--	off64_t			bperag;
-+	off_t			bperag;
- 	int			ret;
- 
--	bperag = (off64_t)ctx->mnt.fsgeom.agblocks *
--		 (off64_t)ctx->mnt.fsgeom.blocksize;
-+	bperag = (off_t)ctx->mnt.fsgeom.agblocks *
-+		 (off_t)ctx->mnt.fsgeom.blocksize;
- 
- 	memset(keys, 0, sizeof(struct fsmap) * 2);
- 	keys->fmr_device = ctx->fsinfo.fs_datadev;
-diff --git a/spaceman/freesp.c b/spaceman/freesp.c
-index 70dcdb5..f5177cb 100644
---- a/spaceman/freesp.c
-+++ b/spaceman/freesp.c
-@@ -62,7 +62,7 @@ static void
- addtohist(
- 	xfs_agnumber_t	agno,
- 	xfs_agblock_t	agbno,
--	off64_t		len)
-+	off_t		len)
- {
- 	long		i;
- 
-@@ -152,7 +152,7 @@ scan_ag(
- 	struct fsmap		*l, *h;
- 	struct fsmap		*p;
- 	struct xfs_fd		*xfd = &file->xfd;
--	off64_t			aglen;
-+	off_t			aglen;
- 	xfs_agblock_t		agbno;
- 	unsigned long long	freeblks = 0;
- 	unsigned long long	freeexts = 0;
-diff --git a/spaceman/trim.c b/spaceman/trim.c
-index e9ed47e..727dd81 100644
---- a/spaceman/trim.c
-+++ b/spaceman/trim.c
-@@ -26,7 +26,7 @@ trim_f(
- 	struct xfs_fd		*xfd = &file->xfd;
- 	struct xfs_fsop_geom	*fsgeom = &xfd->fsgeom;
- 	xfs_agnumber_t		agno = 0;
--	off64_t			offset = 0;
-+	off_t			offset = 0;
- 	ssize_t			length = 0;
- 	ssize_t			minlen = 0;
- 	int			aflag = 0;
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch b/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
index 5bab162c85..9ea2a4f188 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
@@ -1,15 +1,15 @@
 Upstream-Status: Pending
 
-Index: xfsprogs-4.14.0/include/builddefs.in
+Index: xfsprogs-6.18.0/include/builddefs.in
 ===================================================================
---- xfsprogs-4.14.0.orig/include/builddefs.in
-+++ xfsprogs-4.14.0/include/builddefs.in
-@@ -168,7 +168,7 @@ ifeq ($(ENABLE_GETTEXT),yes)
- GCFLAGS += -DENABLE_GETTEXT
- endif
+--- xfsprogs-6.18.0.orig/include/builddefs.in
++++ xfsprogs-6.18.0/include/builddefs.in
+@@ -180,7 +180,7 @@ SANITIZER_CXXFLAGS = $(SANITIZER_CFLAGS)
+ GCXXFLAGS = $(GCFLAGS)
+ PCXXFLAGS = $(PCFLAGS)
  
 -BUILD_CFLAGS += $(GCFLAGS) $(PCFLAGS)
 +BUILD_CFLAGS += $(GCFLAGS)
  # First, Sanitizer, Global, Platform, Local CFLAGS
  CFLAGS += $(FCFLAGS) $(SANITIZER_CFLAGS) $(OPTIMIZER) $(GCFLAGS) $(PCFLAGS) $(LCFLAGS)
- 
+ CXXFLAGS += $(FCXXFLAGS) $(SANITIZER_CXXFLAGS) $(OPTIMIZER) $(GCXXFLAGS) $(PCXXFLAGS) $(LCXXFLAGS)
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.18.0.bb
similarity index 54%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.18.0.bb
index 80bce6f939..33847a86d7 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.18.0.bb
@@ -5,29 +5,29 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LICENSE:libhandle = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
-DEPENDS = "util-linux util-linux-native"
+
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://remove_flags_from_build_flags.patch \
-           file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
-           file://0001-support-usrmerge.patch \
-           file://0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch \
-           file://0005-Replace-off64_t-stat64-with-off_t-stat.patch \
-           file://0001-doc-man-support-reproducible-builds.patch \
+           file://0001-include-include-xfs-linux.h-after-sys-mman.h.patch \
+           file://0002-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch \
+           file://0003-doc-man-support-reproducible-builds.patch \
            "
-SRC_URI[sha256sum] = "50ca2f4676df8fab4cb4c3ef3dd512d5551e6844d40a65a31d5b8e03593d22df"
+
+SRC_URI[sha256sum] = "3a6dc7b1245ce9bccd197bab00691f1b190bd3694d3ccc301d21b83afc133199"
+
 inherit autotools-brokensep pkgconfig
 
-PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
+DEPENDS = "util-linux util-linux-native libinih liburcu"
 
-DEPENDS += "util-linux libinih liburcu"
+PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
 
-RDEPENDS:${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
+RDEPENDS:${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair python3-core bash"
 
-FILES:${PN}-fsck = "${base_sbindir}/fsck.xfs"
-FILES:${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
-FILES:${PN}-repair = "${base_sbindir}/xfs_repair"
+FILES:${PN}-fsck = "${sbindir}/fsck.xfs"
+FILES:${PN}-mkfs = "${sbindir}/mkfs.xfs"
+FILES:${PN}-repair = "${sbindir}/xfs_repair"
 
-FILES:libhandle = "${base_libdir}/libhandle${SOLIBS}"
+FILES:libhandle = "${libdir}/libhandle${SOLIBS}"
 
 EXTRA_OECONF = "--enable-gettext=no \
                 --enable-scrub=no \
@@ -41,21 +41,17 @@ EXTRA_OECONF = "--enable-gettext=no \
 DISABLE_STATIC = ""
 EXTRA_AUTORECONF += "-I ${S}/m4 --exclude=autoheader"
 
-PACKAGECONFIG ??= "blkid"
-
-PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
-
 export DEBUG = "-DNDEBUG"
 export BUILD_VERBOSE = "1"
 export tagname = "CC"
 
 EXTRA_OEMAKE = "DIST_ROOT='${D}'"
 
-do_configure () {
+do_configure() {
     export BUILD_CC="${BUILD_CC} ${BUILD_CFLAGS}"
     # Prevent Makefile from calling configure without arguments,
     # when do_configure gets called for a second time.
-    rm -f ${B}/include/builddefs ${B}/include/platform_defs.h ${B}/configure
+    rm -f ${B}/include/builddefs ${B}/configure
     # Recreate configure script.
     oe_runmake configure
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
@@ -64,12 +60,5 @@ do_configure () {
 }
 
 do_install:append() {
-        oe_runmake 'DESTDIR=${D}' install-dev
-        rm ${D}${libdir}/*.la
-        rmdir --ignore-fail-on-non-empty ${D}${libdir}
-
-        if [ ${libdir} != ${base_libdir} ];then
-            ln -sf -r ${D}${libdir}/libhandle.a ${D}${base_libdir}/libhandle.a
-            ln -sf -r ${D}${base_libdir}/libhandle.so ${D}${libdir}/libhandle.so
-        fi
+    oe_runmake 'DESTDIR=${D}' install-dev
 }
-- 
2.34.1


