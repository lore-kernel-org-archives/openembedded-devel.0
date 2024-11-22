Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2200E65D27
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 05:15:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17567.1732252509425861780
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 21:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105629bf38=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM4c0bC024237
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 05:15:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0pjc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 05:15:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOABdvGjhE0WAxELjc4dFg5Djer4a5XiTSREkq2my9n8nB5nQ9Mj+v3clUGjuXtFUvYpH2DvKj+ii6X3YtqNpApH6CAlnkh9dXfwFUZukKIE98V/9EUOKApmyZTc9EgMqKxitMc9gb0jKTBroiw1g0avi/rOc+1za7sumjSAk/hevTpKcqlf8VJVuWejeXviLw0eZeHRu3qaH9J8F/7j9ZlBOdA5RMAu5ejwmK3fdu13lE8qCDz8sqX3fkvxXOUld0ev7XvZCIxH/7idEjUc/4AywsMorL29gZ+9B8Hf09G/+pEcI7zJtPaXyTLd/fX8vNKeyz60q825sF4cx1bMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4et2VFcTMv/82y7sBV+6H3T3UTSb5DcPk1pXKu27Mk=;
 b=zA+3L+2gjvSbJ2HLuKGSoJlgy+RdGIHqz9agMTWauf9QhP3tPH4Lkqx7e8KyTv+VHlbYFC1vmIxuJZF43FyfFTJ5VT8s0OOGq7XkoPuQ5iY3etChomLztaUgVTSOW1MRC6E4wiKVv+PfkZAif+5RPRBS0W3NuIQPENA4j5o3vxhJ+QFYTWsSAEA8QoKNgJVTT18NlfDYqs9Wbt6pDT9+4bt9fbfu/9jyQrvIyd4zCWSjFPE6gI9TwmnQ3q/4LELjq92qpkaUyXemOmkfdtIlPjzTWmRvHGZm1WEcUDD3Ly9DnC84OCPgzTdneghIt4zX5UdFiAZFSX9ywYZSUYsX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 05:15:04 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 05:15:04 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] ntfs-3g-ntfsprogs: fix CVE-2023-52890
Date: Fri, 22 Nov 2024 13:14:50 +0800
Message-Id: <20241122051450.3834917-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA0PR11MB4622:EE_
X-MS-Office365-Filtering-Correlation-Id: b367da87-f762-43d1-8aa9-08dd0ab49f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lWJxFRvzBa6cIm+KxZSPL6/8T9lXhCPZoIKXLpr59BFz2FoM/3dHAwl8X6un?=
 =?us-ascii?Q?/egCar9bY8xDuUzjj+OJNACwy/o9Wo4DfvzExRvN39Q0fUQbfukOSREa2Tl/?=
 =?us-ascii?Q?h8IBDyYpXip8rORThDyNGeSoIdp/sTv8KuRmQahpVIfh+28VtVcnw6L92lSe?=
 =?us-ascii?Q?upKvrErO/UqZ3L9SjPdDkMmVgJjRlSFYFXw6aIRUBfs1K2BBiZ05U6z0C0I7?=
 =?us-ascii?Q?pZNnVFDapcRglKIYiwVeRRjGoyXpgx4uqglnVDY9GjA7UmuVoXmLne9te437?=
 =?us-ascii?Q?/VofxodaJ/Ir+fNDE4yfZ5fc1RuJVjKIWspUfUTfP9LYLMRPT5AE+6/Dedm4?=
 =?us-ascii?Q?F0bw7xQc0nTQm8yM+u1TGCOcKfPhH4aGhfmI/69xQyiE3oIcCGi7cxpQKCNe?=
 =?us-ascii?Q?D87kxj9+w9qDTO1xao4gH2ZdRax7rtw0MZrnQC5IjdM8KLIJ8n67RaIVSA/f?=
 =?us-ascii?Q?Q8skb7rIuuGAvA3YDsJGrWXvbR/Zc5a8OXkof4dAIAuhxkWHDoTE/uHFbf1F?=
 =?us-ascii?Q?LLJ7kwi4quCylqbB5qVzumCmFm9+BJ0o+XREEyN8vYOysCPcC9cK72fOmH78?=
 =?us-ascii?Q?XrdKeWMgIH2bgLZoGkpTGZqaj0V6iZCitpG7HZzBn7mWFoQvdN/rDyy/G80l?=
 =?us-ascii?Q?xe7nK/G6Svi0W1jVV6GP9kiwqy2dOC6ifQ8bR2EBPgrtledAVC/qOOETkiZl?=
 =?us-ascii?Q?AFaHeJT1xa9g7sXkGTeEhyr+FO3x5K3X9eMq3AQYHde9UnvK3qnC8nbWH04v?=
 =?us-ascii?Q?W82TAmiE8fgPYWq/T2rs8ttlZ2edoZCBxopOZtc2WxP6SAo7NY/TSmHmG7rg?=
 =?us-ascii?Q?ciqsP7u+LFrJJpygZrKLEAydbyzPHiDdRLmvAcDRpDy4Yc+ANNh2R1ggmHc9?=
 =?us-ascii?Q?0TBEXeqBh5WecDYAnGd/HjYcUmTGJbzCcq+3SAVcUbR6VMquuge7fkFiZ4ZS?=
 =?us-ascii?Q?ZRkplIXrskcmRWb6/WCra4XDWqMqeAtc/Ve5YV07MFrDq3Ks7ppQL8BfJ4vp?=
 =?us-ascii?Q?pxWEiLXURFk9n7MHTGXwPDgeDaEv3fp5/fGk3beERfO22Sqf61E983p/wUeb?=
 =?us-ascii?Q?/Rje1MRv7g1YYzzpa6Fy6h5cEia6AraDReNtVkUKEy72v0r85+Ag+oZFB3O9?=
 =?us-ascii?Q?5V0KGJpItrGNrUnrqPvlz0CcJT/GXa4ptbOg1mj53S+6Zc9VRFS0PalOCGBa?=
 =?us-ascii?Q?PwredvlS6u69qKRpQo9b4KgcW8Rtiq6/d63voiHO2m94FiisQRyXkKh63hJo?=
 =?us-ascii?Q?hMV42GucJbi/cJbaFjrFXfJXL8akAPPMGk+FDeHiUodC2yoABAWxTJBvt3kQ?=
 =?us-ascii?Q?Jz9U2KH/7Fn1TrZjW3M/GUr52QzxQ6upMmj3bTjGIwsWyw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nvTh91stTgPaKXTYfv1wEjNI50Hijn85ZqkSY37mRPhjXFKBDMfDIS8RhbUK?=
 =?us-ascii?Q?MqiLPn56pE7+gQnJ1AqL3PHbyNc+eUyiJHp3/n4CBrycDeboUgMn0C2nwOTN?=
 =?us-ascii?Q?wNrdc5MJPQEFG/046spoqXQS+sfllKdAqe4lN6HZPYrB4IKy91HlK5/sR56A?=
 =?us-ascii?Q?CBwfYS9G0qMaPjghK0Q0+nV38o2xDVyfaLQ+oWxYAreRqCR+TwzsXvqyim/q?=
 =?us-ascii?Q?+HKfeWIMTmFe+njUA8mZD9pYqQ+ZdvLGFiQo99fMZsx3wzWoeFVMw3aKtVUT?=
 =?us-ascii?Q?wBfKlyEPxk+uE1cARoVH0LGIPd8S+szZ9BgiuNy25dyXGjLcff3BKAwmn/xt?=
 =?us-ascii?Q?Z1mVQHEcauqU5t9fdjrlq7F5ECD0Cwrt+9piT/Z0x9OE6HKn5kcYrlsWUE70?=
 =?us-ascii?Q?tEYhM8xO/w1muA8EHXXRBGGmoW9cX02Q7KyK7gMBu0CCZCt5470cCIyTUmoZ?=
 =?us-ascii?Q?XOYb/vIa5rDrzVWkyyEWDg4cWFREUY2J5AHG95ToygqGZcTkH1HpzHDVfemW?=
 =?us-ascii?Q?t5mZSIbD3lvFnrmELe7lETElh+vAO+gDsA5o6+T8Cl5G1/AmfLXrD8zDuA+S?=
 =?us-ascii?Q?oc/iNhop8bd756gyuBqV6Pffd1tUIkA4SY9HD/ZFj5y88GIiKwlmYYe0Xd9l?=
 =?us-ascii?Q?A3QRdc5O8fFy44ezSENPryup1WUC5/oVtI72BHbHueNh7TXxQ2UzIx6OPUPU?=
 =?us-ascii?Q?ePJHY0zRux1bpI5+nSYXPkfypwoPUL8O4XNcPS8ESSYTQMzxx2nYSIi7RWsQ?=
 =?us-ascii?Q?9JLEYf78hyqqgL/tF7sPvj3C3UrLf3EXOKZ7wCKfzNXhfweJwc+WiPJDjcXQ?=
 =?us-ascii?Q?sgVwHlBbTOfe9Ywu3Qt+4ASLLxXs2quWiOtbU+2m1zckthacbd/VwO9K0Oxa?=
 =?us-ascii?Q?z9alBTqAvHzxM6hPNXABHfo1mf6EDPhDCc7QxaHgiOrd7LR0t3lgpYLrKMnt?=
 =?us-ascii?Q?/LFZnduiI18FqhXsLgdxxsl9ntNkk5mXBWiu4qaSgaUiiE6wUVluC7Eolj83?=
 =?us-ascii?Q?r+HyulpBwL3jwsjulkLM0hHh2g0kkF33tOCzE6nDM5Xi7C49j4cRZe0ymTZu?=
 =?us-ascii?Q?b68EVGGN/zFVdiPT5ocH5Lo880naaCNZLbm6ToWeKd8HEIO0I86/eklaOCdf?=
 =?us-ascii?Q?rYAJQWUHbTFZ53Mwy9Qxb8GNupNiBC7eq2C+/mO0zeMVSUuwZvg8ZtvDpmCB?=
 =?us-ascii?Q?GzsAFDOoyiynXu6GPMP9tbmI6QmBp0IkpU27M3ONhgl6brfbwPnsYs7XsKea?=
 =?us-ascii?Q?Gd1M4VnK64gegkNJTP0lpCCcCdHqsz4t43+UOP8amecjMQ/aqrHSvkZYMRJX?=
 =?us-ascii?Q?NNLTOH3CMK5Eazm2VvdqO8OGUHhzzSbwBs+sk6TwS1XoIuTyTVErppD+i/4B?=
 =?us-ascii?Q?tUcwnAcsiFmYuP7mi/d9UVgYTEgFqW1rsQ5yWFmkOrpzK/3DZZ2XpoJw1Pb6?=
 =?us-ascii?Q?rjqPZK0euuCHKjEM5ELgzKrO65evvDDTyTxPi/q3X4T87gwRpmIO5lUsWRfp?=
 =?us-ascii?Q?G1QAsnexcwkqr+43Mp257sEE+r8z1wP1Tk/gyrj/DX0Vtink1gWhhkKvxliE?=
 =?us-ascii?Q?gdfbQBVC3x4AvIszYwJ7kd0hCSR3IjSyp+AMLjDr4yS+6ZZmaNdRrFcSVRFA?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b367da87-f762-43d1-8aa9-08dd0ab49f3e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 05:15:04.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKhhDeULwVXCyUPENh5ZesU/+rULnjaFuBvm73vzY0rZGV4ywQTzNPsMBhgksTGAWShaQqFR+M2SZb0Mr6PkAEMWEZKWEv+spHPWiYOxhqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
X-Proofpoint-ORIG-GUID: TfdYCkjonUPTeUE4tVskBKug7vLMJ5gD
X-Proofpoint-GUID: TfdYCkjonUPTeUE4tVskBKug7vLMJ5gD
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=6740135c cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=3DfWnJiXAAAA:8 a=t7CeM3EgAAAA:8 a=AG2HToKGovS5UrDgRsIA:9 a=fbZbCd7XTi_oNd1tYRxB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_17,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411220042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 05:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113989

Backport fix from upstream

  https://github.com/tuxera/ntfs-3g/commit/75dcdc2cf37478fad6c0e3427403d198b554951d

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...use-after-free-in-ntfs_uppercase_mbs.patch | 42 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
new file mode 100644
index 000000000..3160f5688
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
@@ -0,0 +1,42 @@
+From 7b6210c5be46e5120b42c09f910e8f104bf3edf1 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Tue, 13 Jun 2023 17:47:15 +0300
+Subject: [PATCH] unistr.c: Fix use-after-free in 'ntfs_uppercase_mbs'.
+
+If 'utf8_to_unicode' throws an error due to an invalid UTF-8 sequence,
+then 'n' will be less than 0 and the loop will terminate without storing
+anything in '*t'. After the loop the uppercase string's allocation is
+freed, however after it is freed it is unconditionally accessed through
+'*t', which points into the freed allocation, for the purpose of NULL-
+terminating the string. This leads to a use-after-free.
+Fixed by only NULL-terminating the string when no error has been thrown.
+
+Thanks for Jeffrey Bencteux for reporting this issue:
+https://github.com/tuxera/ntfs-3g/issues/84
+
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/75dcdc2cf37478fad6c0e3427403d198b554951d]
+CVE: CVE-2023-52890
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ libntfs-3g/unistr.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libntfs-3g/unistr.c b/libntfs-3g/unistr.c
+index 5854b3b..db8ddf4 100644
+--- a/libntfs-3g/unistr.c
++++ b/libntfs-3g/unistr.c
+@@ -1189,8 +1189,9 @@ char *ntfs_uppercase_mbs(const char *low,
+ 			free(upp);
+ 			upp = (char*)NULL;
+ 			errno = EILSEQ;
++		} else {
++			*t = 0;
+ 		}
+-		*t = 0;
+ 	}
+ 	return (upp);
+ }
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 37a8106bb..be2a5245c 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
+           file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.27.0


