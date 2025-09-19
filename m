Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F58CA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 03:33:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7662.1758252832738960548
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 20:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d16yZ/CJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=135793fc31=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J3O8Zc439055
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 20:33:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NakDnpsTfdXhgmy8EYO+
	ibZSCywks0sUaoJXNZlLOWk=; b=d16yZ/CJPzkFrcaRcUzFFbJ2jMiVirDrDhNh
	+qJipxYTuFZjXmXsYUHDsXv3AJwpkIM9Ug6OyFiTsPES9JIqDUO6/y1z7GrlOeIo
	9BvLTc3vzWUUO/7KBdjfAoVRNNUUZzkpVLYdWh4ZeD2883VXBr5XvgqOP6lCfEWI
	56Zgcveelg7OuQC/bvp5CtO25za8C7zyKqO8oM1gXmdYTE0QZsArg9izxRZhvp1r
	KiZnlzzSiXnXxyp62nhZckYn9fqcN9v7bGuE3h0x5v7UPxNkGhR1TCCOXdr8gZiP
	H6NcYJvTAFBf1/vn0J8V5ROzvIXo/1qKKrbRdVW40XpMbOqy5g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012021.outbound.protection.outlook.com [40.107.200.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vgr03yv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 20:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxKB8NQVftCIYRYFxNHOAOMk6mJww5oLd3RGgwk2UTz7OAnCnOihvOWXjj6T7Xsq1d83q+gRJmbtCDX71YBkyDLO9EbwMqLoruTfupa6zEQ21n+znnsyN1lkQRboQsX6Jz1mDCkkcgvteepAOfOTx1lq34EYd/1FKZhXHXpDWlQnQZqUutZHMRiqn/A9H3OE0adbICCZZlvPGdehcdaXvJgpHT3UuE29jZmjvXhMJ9xyj2mIj+TzbQW60hyJvuyOhoqpNQj4mj8dUgxTFVSXWqMXl8R0qDdtn7cIJsajjPkwRW7Zm/xWkAt9YmsEgmwjiAnVTTd9n/E/VAz440Pb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NakDnpsTfdXhgmy8EYO+ibZSCywks0sUaoJXNZlLOWk=;
 b=voocPzxZsDjn3ISEf026kVjyPVAFbA1YEJDIHJmQKXBviqAPkm1VkvVCwmmvzquu7dFxiqYqzw4x7ZkG33NlHQCgR56cWusZv4dX9w8AcpgPQZrPJM8RkOD3iPUuvt31uV8QpHPE8mgDakT65t0H7suJVqVllELb8fiUVHlQoo1D0Ig3mnc0/OFJDMol3ikvpz3IBckZ0SdszslTBHe+XSgxi6juRAWAyz/DbRrbn7nCv6o6VsuCvoTkCHrJms2HIi2xb3HOc8AOIH1pI9QEnnf1R4lE6nlVrzyMxEnlWAUBayEBCxxRpCBdHfTbXbT3pIaxggzZKSNzkZVWby+GvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 03:33:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 03:33:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] minifi-cpp: fix reproducibility issue
Date: Fri, 19 Sep 2025 11:33:35 +0800
Message-Id: <20250919033335.2338952-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 988a45b7-f6a3-42c8-be33-08ddf72d593b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nyqhWFShFo1hBr2w3+unfx9EK8Kz1tc7JcBL4Ujv/9aMlFYgchrAJlctXvMb?=
 =?us-ascii?Q?4PUxpBykuYs2ZuCWrDzlgDNnr/MLbh3IeI2GuKl5Awuctd+MsTiCxn0H4Kl+?=
 =?us-ascii?Q?s6xBb50OsIKt5YfqmQN2ritRjRSY6IPr6gv+UoqufV7VblICmG1RfES/UqX0?=
 =?us-ascii?Q?zztp6JZLiKJIcHC8OIzQVDhhtz6h3hg4yKMORmmZcTdSqtm0s216pNSqMFy1?=
 =?us-ascii?Q?iRUdJ2y8ZkzcD7R6kWQSF7airYToYkIjkXqjmDEk6OHdFTRb0kp5SZf1XPMH?=
 =?us-ascii?Q?BS3d3hbTOmgjy1/y3mokPuWjnGNPYILxbA7xNKeVCDBCktZbDNhK1yDVtEOs?=
 =?us-ascii?Q?3rAygO/xRk+ZqwZoURC/bhsOFQEgNSjh5C+4mbd9JvE+mSJP5/1GjPDRpkNy?=
 =?us-ascii?Q?VV9MDb+YVjjwEcVpO58XDsmg6W7PcwMU2oMz/CQiRMwAEp1fSowKDEnzNrcj?=
 =?us-ascii?Q?Qid0KLWAeMCXTMopirpzJsz1BEzMxR1836ynCVZn26CbaDP8CH4rQT3w4xg5?=
 =?us-ascii?Q?yIEzlx2uLNTWgE+vBWzj578Ehr1lu/HI9+GUk9RvDDwH9TGRhxOClzza09Qy?=
 =?us-ascii?Q?3akoYSxFSPyHgrToum3cYg3DN9Pvnk4wiDQMRpdBusUqpTI+5rUy7EUXPmQl?=
 =?us-ascii?Q?cHUKfzoMeEXLRZVV/fpjFhbI3pcpz1cbI9goMOHxyrRQckvYFeiofkIRQK0N?=
 =?us-ascii?Q?ZAK9V0kpvxuUKdlAWwv2McdctfzLdRU9rfAAESec9iad2kyt2pV1PNCv8yZZ?=
 =?us-ascii?Q?thgYQ+SjW6WR4ZByZELlKqQ+PnJnq9iZSk3C+siKYsONGIMvTIWl4mmhS2Xm?=
 =?us-ascii?Q?BqSaz3fweZy5yBkt6pWyTBUgbGJmFIkrl76M3PtR+bjvkrMtQNoIwNO10ppS?=
 =?us-ascii?Q?93jYARL3iLsEzOCbsB5nHu58B3APzAh5rbYJpZBVI3JtMjUC44DjtXQ0adIr?=
 =?us-ascii?Q?IIc2utghXC10jVJ71blVZZAuawpkW0sPgyk/XP6SXdSteqPt55qFDdTBTnCz?=
 =?us-ascii?Q?1tU/sPLV/A4v9JqZWLclkvqXmRgd3jq7LkhcSc6CCLd3nxUmP8uuPeU36S5S?=
 =?us-ascii?Q?gtRnry3bLcsn+je9PdomS3sGYwLL+NpckEX/CbwiuU1kqlRm04Mr35/lUMQg?=
 =?us-ascii?Q?7RfHdqGlLf47ChhiI65CKjGNnPJVcSjYoE/KQQd2xDRdEVd4f1p2vWCPRp4g?=
 =?us-ascii?Q?u/pH4F4xW/wESMlji0IaWuHln4tv4kfA+tPBorhd3ycsCpfD2K434ZmmNDtX?=
 =?us-ascii?Q?55o/MsKha6VROcLAgSZ31490rvQR3L6K1uF1SokEidhp3yTQJU0uuzmK9HpL?=
 =?us-ascii?Q?Nvuyc3lsbnEoy9JFqngsFUKwyMsqPUVHr0pTApKAdXjpHBx1Ge727CWTCKXv?=
 =?us-ascii?Q?oKGymIysqAzQLeMApP5RBQVvIoDaSwjan3l7tgRzOarHZBNZ4uz/mibn26wv?=
 =?us-ascii?Q?NZWzD+et8uNQWo+jmBfM6qgOS4MiupvkZhgPyWyI2jfiO9oTIs7nyA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RNNkR2lJdaTcBQaRqNk9kS42HjUnSYCheWamlFKPecsz1Qz5ZxqntJEMbf/a?=
 =?us-ascii?Q?G8FzAm+fWzcHrqKnwpXlkra4/F73+y88W5tBKP+fWCA3dR9wZbcoVY/CFHHV?=
 =?us-ascii?Q?OotQlx7n/sCgtE2ajhlAp2ZD+6MYBjWUwY0rybtAutWnv0x6bw4zA5R55Bxe?=
 =?us-ascii?Q?9fLfjSRG98F6xl0W0AAFTrnMuh7Ec7YEUyJGIF6Hd6JIAme7UgLWubefrkAP?=
 =?us-ascii?Q?M3iuBM9NTG4RT5+3L41z+6Bw+AP97vtZQLawZWYfBIBQB3Hw6bXcSkP8pZK2?=
 =?us-ascii?Q?8U4LxZmXyfVnTyD46rUXfsYTbAQr2fRUdwVL7bqDUuNLsLQsc5cxuaXnkU5a?=
 =?us-ascii?Q?7cfxPmk4plTLRXPHEe53PMjAqY5jrao/ZuF15BaCh3FD709frLEOo69ZbQUr?=
 =?us-ascii?Q?7zZPOVz01Ta9S1K8VQD81PnJ4ZecUy+GlarIcI8q/vSb3UymdjAPTpIO76Dn?=
 =?us-ascii?Q?vB/N1ND2JeKztn23vQoRu8IMup16CvmXUtA2wtm49yX+9BdBYlUfwNnpnknD?=
 =?us-ascii?Q?r7cLSkmGzRdio1NoVDMlI9xVve3bbvriuA0D+D0peHtKBHeLOEKyKtWrXMB2?=
 =?us-ascii?Q?ajT/iM/S2dxKPZhc3ONpBOUhcis7Ilt28GxxfvrqnbOFhEJsdv68AXLH2pez?=
 =?us-ascii?Q?hvSc5SfUw2BPqvayfzI2PJmeBuUU/q82lR0mdzQ1rFsE1XBb24ZmqwN477KB?=
 =?us-ascii?Q?v/+4AbD8Pk0OUkwZbOo4cAX5cVpHvldZGGhnf/gJ78+VH7MHUh1C8D02KECW?=
 =?us-ascii?Q?ZxKyXdpWh+wl7KPEG9dNGiN5C0M9VyXUaLlS3H1B9WxMmx8taMaHe3ywtDs+?=
 =?us-ascii?Q?bb85cvr/ZdM1wkGq9YBEeofazxS4nsw8RyX4w3te0a02yrsu7POSB+FXtWai?=
 =?us-ascii?Q?yxkF12MDzLTv2arJ7kRRTX2hKDMljreKvOc1YmoJlMzb/m6MYTvI1NGqOP3m?=
 =?us-ascii?Q?FbHUgeaKBxshIhNRQ6FoL8aMOi1egAVkNTc2AQNE60tL7s5xXR+/0/k3RzG+?=
 =?us-ascii?Q?xeMasgCe8qQrY/GVdrFoy8GCH6/xbu0wCo5MoF2wCXattoJFfhzcx/Mbaw6K?=
 =?us-ascii?Q?U72oU3Hnjc/fkak2g+09bE3a4pn9Lc5+TBU1oj2yAm1SfM9cHZVoOSgy0yXw?=
 =?us-ascii?Q?snyeNvH53IwEroTl8KvPu3Nj/QjKBsd1HDVqNIEUw2bXp14Kf8ZjPsjGhwCL?=
 =?us-ascii?Q?K+gpovBNlyL/KDbO0RPFtu0/BJaIZI4/ZeI1X+lmQbRejZ5tvxABC9iLFWoI?=
 =?us-ascii?Q?9ILQIMY4DmeZi6vfjfaPIWYFB4FIe9lsAReGkWJyGJhtPX7NLOryO03FvLwK?=
 =?us-ascii?Q?mVipJYKdI7OKmXPFsR/sDEcQaWLk8DcnzYIi6uwUgRxq76nmf1GORkSqeImz?=
 =?us-ascii?Q?mURq807eP7CXGQoIv4sMf4gn9rWP+zulwc0dbaxdJMy+YcmrwPF3AODwlV8u?=
 =?us-ascii?Q?W823CJs2gZ0Xj675cRBFAFYfQMk8Gfkv76fN9WJyQuBFnWrMkuEcMzx5VRPF?=
 =?us-ascii?Q?b5oodRlc4sUwu2opk++tl5aAgf6SZEfTIhDNGbAkw6U6pF746x42zPttPAu6?=
 =?us-ascii?Q?sM4jmPMfioWX+XryHGRMVSQX0LQeC9eI/K4R8kdj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 988a45b7-f6a3-42c8-be33-08ddf72d593b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 03:33:50.1059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/GOxyh07sMIpyj4a1jFWH/qAsCzYGljsRM7CWU74HlLLRuMjJUAdC3gXZC+zsia4BcFGAvVWoX16vaOwTgk6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
X-Authority-Analysis: v=2.4 cv=Z+LsHGRA c=1 sm=1 tr=0 ts=68cccf20 cx=c_pps
 a=qCFiEXCgs887QpJba4awmw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=_wfnCASbxOgzFoOVXKsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XhtGKWMI5GbBErOYkZNH2NrAs0Tw05qs
X-Proofpoint-ORIG-GUID: XhtGKWMI5GbBErOYkZNH2NrAs0Tw05qs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDAzMiBTYWx0ZWRfXxZ7l0QyprnIz
 TyHmaQTPoXDM75qI2czuU5Wh65Mnze3QvqqBWoeXQZL4CZXsvoXMKwl3Vzvlu2aSvTC/hNVZtyt
 ymJOkbfPPqVPtirzF5Xr3q2pEfxi/iremLd1ZVQZurkAalslcyG0C2h7eqPDA0QsKZM3qeGDllf
 XxH6o3dMDURPYoCWDflcukf17rbb3EceL6sKuNAlMd5DxNWmDF5eh+qakNozEWhRUsUaw4B3MHl
 mFut6V4IqLQFm4EE3pBvEwp0EZUwcUJjpFdpcdLUcbAV5puCVIKm+IznE2Ys8hmUeUPw2d0DuIp
 jsF2jq+j4QwV9qOC9HoT6FueNiHoIIK/5BpI09nWKZTqkH4d+a9TD1FLOTinvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 03:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119585

Minifi-cpp will add a build identifier to the binary. If not specified,
a random build identifier will be generated for each build. This breaks
reproducibility. Set BUILD_IDENTIFIER to ${PV} to ensure the identifier
remains constant across builds.

Additionally, set BUILD_DATE to SOURCE_DATE_EPOCH to use reproducible
timestamp.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch | 34 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.99.1.bb           |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch
new file mode 100644
index 0000000000..a61873e21a
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch
@@ -0,0 +1,34 @@
+From ee9722731b3f9cfc3d8e338ab09bc0ad409a6941 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 18 Sep 2025 14:43:11 +0000
+Subject: [PATCH] generateVersion.sh: set BUILD_DATE to SOURCE_DATE_EPOCH
+
+Use SOURCE_DATE_EPOCH to set BUILD_DATE to improve reproducibility.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ generateVersion.sh | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/generateVersion.sh b/generateVersion.sh
+index 0b50a16..96cc3ae 100755
+--- a/generateVersion.sh
++++ b/generateVersion.sh
+@@ -25,7 +25,11 @@ flags=$6
+ extensions=$7
+ buildident=$8
+ 
+-date=$(date +%s)
++if [ -n "${SOURCE_DATE_EPOCH}" ]; then
++  date=$(date -u -d "@${SOURCE_DATE_EPOCH}" +%s)
++else
++  date=$(date +%s)
++fi
+ 
+ if [ -d "${src_dir}"/.git ]; then
+   buildrev=$(git -C "${src_dir}" log -1 --pretty=format:"%H")
+-- 
+2.48.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index 0d9a503793..f4d206c154 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch \
            file://0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch \
            file://0001-Add-missing-include-for-malloc-free.patch;patchdir=thirdparty/fmt-src \
+           file://0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
           "
@@ -114,6 +115,7 @@ EXTRA_OECMAKE = " \
                  -DFETCHCONTENT_SOURCE_DIR_FMT=${S}/thirdparty/fmt-src \
                  -DFETCHCONTENT_SOURCE_DIR_SPDLOG=${S}/thirdparty/spdlog-src \
                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DENABLE_SYSTEMD=ON', '-DENABLE_SYSTEMD=OFF', d)} \
+                 -DBUILD_IDENTIFIER=${PV} \
                 "
 
 PACKAGECONFIG ??= "libarchive expression-language"
-- 
2.34.1


