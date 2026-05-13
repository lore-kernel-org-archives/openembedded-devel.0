Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83D0CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:23:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2097.1778657001832329134
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 00:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VVTnSDj3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95937b9412=li.zhou@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D3P27J153860
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 00:23:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=nQEDiKK5h
	hrqED9yivTlI4UEixcCt5tmiHgxz1qGqvM=; b=VVTnSDj3dX1gsmtfqkEf1pzHL
	o+wP6rg/NbuU0Mz2GbWb1uSvkmOfXE/T+0vlU7C0HuDIT+UQKlIbmAuSlcs4NECx
	SOl1KiD+DYY1wRDWBRhDhaIStmHOt9p4oqCPfSWJrQJIejneQp+MjBrpZTCUBm3H
	jxNi8jNLcDo2s1FpZXhnRvrUQLnL5G8GHcbcwgmQxY9BJtKvrQ8Kcu+wI3HR5tF+
	3+P677IWxc+AK8rKaxy7bZLmSjRCW/SxV35fX2mEcbIZQEEb3GgudE13Nqos7blz
	o3NOdBJ5IVQ7iqTZGGNGA5FOl0aS0K8jp6UPWvjOmOggQG4XdTpbL7o3PhFJA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g8a7q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 00:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By/LaR4VFHau1FFc5b9BsyKkCDBmmr6+/fj8neifbQWl0famKzgpv6ywNy7ocd8T0sdBu/nJayQYubYdVTqcZyfz0zN+n2E6Uw4nC8N3V1SS0SugYGg8xKMD8tRNod392tnQgkoKbISgqXCOzsQs1jBPaYoInMuhRyZ1Wjqt/XJlcOwAn0GzCdd66Pa4/FN3srglTTTV+rqFaUr1zyuwyOKTRRdEZWcn9wvx+ZPlFBXFmx5MHhtHGgfrzqne3xs8k/nogjAs5OrB+xseySmAMMInoItnTR2S5KYsAZ6VOnYAwVns0uJT7q1tD+/WHu8oEyg1PEg7g/m/L/od2QkSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQEDiKK5hhrqED9yivTlI4UEixcCt5tmiHgxz1qGqvM=;
 b=TpLu/FvibJa2Y6NMBA+yXuKZbfoLbdn/iI+7tJQ1/XWBL/O54efMt1ABV4jsLkgW9y2aaE31qs1T1xaG4LZ5a1wE7HCW+VD3rYWrcPVhQA2JZIdDbdOseKHw53E4ohium/5nTWyfq/KfBzQj8qb3K+ttrM6qb34PC8UEdDWNjHS9tt6+AKIOvDqqzDnhKPbjLKx8AReFI3Oo3z+jf70IG+gm7PQlRMp+RATKeI6BOVET1Q7TKsshdiJX5FzOWP8Q5Cg/stemESXxypWLVeTM2m7DkNM4hipM0inIVu0nY/pmzp5aLyRtINchjJr0cKFSL/0FtzKHmSzhOepCmh4Yqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 07:23:18 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 07:23:18 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Li Zhou <li.zhou@windriver.com>
Subject: [oe][meta-oe][PATCH V2] haveged: upgrade 1.9.19 -> 1.9.20
Date: Wed, 13 May 2026 15:23:00 +0800
Message-Id: <20260513072300.1620413-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb2af36-5843-40f9-639c-08deb0c080f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	oYlzkwjZwFHI4jW+FUesE0bEU8Nxahe74Jc7uf/E5i1zKZW9z0aj8jBflf2Rpco692F12X+cIvnhLWYx/HDFq6+fod3jfTCz6hs9MnQeLGP7F1us9L0lg31UsNsS8U8Hn9FHr1miL8T8ObHAwXJ6PII44O4nU3sZ6kQK/ZhYDeCa+zwUHu/Za5LnUTB5OGzW+Qka73WZ6ZMFKZsX83LxhhmgeLsqDu/0f1i/KFbIQXdrvYLyLszHClC7oWD1eFTUNHZD8tYd8+ogCcq/rrJvlmnub/beSE+kRwUwLDYdYRzGGzqletIkWl+Jmf7XPQ2J+JveE/SF1+/jp0OQuA0YYSxVJNetGpISb3GCs9bDUrcOvHQHePCl39MnHFaR75dPcXb1XfbpndZ8esbGguF60exu3I7vNxxfmYTkYKgV5vrjtqglQqnjv7SJZu+F6vXPSsD+RzjD/9bPDubSOIWXF/PppyB0bBRml1sctmtDaLc34IG2k3+wuh3CBw2UGI6d9MMvavRsDJoIZ27ykcquk3cJKxf1/ImJlDlevvebajWgOsRTpN/AVA38JftopO/MZgubs4pjeQCvVYmv4UstguhhTLSKxDw7vHoEjHu8KSPCxCaD9DmKAeJllvWOhNf+vmpC5C1j/b39q6gIAUxoZUtJ/MEzPynhc/1GA31OBwlqIC6DwtXYkFR0NdqjBqAR5Vg2FS4DYmYGwvDV+SFsNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AO8/sCq+ldhHQ54CgN8a2gwfT9MLU4VyvObYKxVFgUh0CFioJqhX+7nt+sGZ?=
 =?us-ascii?Q?PjReFTf3NbgvC7Sj7Lm23CWX5tO1h5U4YS8S7a6QHan2KoApdJkIzuREzG+m?=
 =?us-ascii?Q?VF1e60vAwUfwlWIlACBrx288lgXNV2tw0Fvfe1BIXItjokzN1/hbmtJxKbja?=
 =?us-ascii?Q?XLKMxbnZ1PxWN4gAz1UtIagfkmhboGTov5yoHSmVbI2x2IH9ilTUfG4k6HjL?=
 =?us-ascii?Q?VX7wYgQXVdBuI91RVt8ohFISY5PIqdHk8dQetL1oGH2SN5Xkwx9mPcWH1B/2?=
 =?us-ascii?Q?MfUuyAheNLdo/t6Xfhllymrc6P1MA4b1WnaAHx02bK3QgcehqLMLTLxgZyoY?=
 =?us-ascii?Q?aE0Ng1N5pgMApUte4NZq/6kZfjanTITsYNvbrSSZsYhwpsufLYmdIqkvlPxD?=
 =?us-ascii?Q?zGT/icnC5eTmIPo6KncnjekXCtY7mBjantkVvJQXkysIS8pV2DtquHBPSyTF?=
 =?us-ascii?Q?ZWhhQFbL9n/J9WYKNhg2Lk1iyIC5iMsC71ZTzN2qUls0cw+dvSgWxP0EM/EC?=
 =?us-ascii?Q?+eZYYtbZEu2Tocemwt/U/kQlXBupt20e+LjG78YdP8dFdFeFOHEkPRVxRqHT?=
 =?us-ascii?Q?T0H0YwJ+AMXpu+lV6dTtSkgqVoAj6rWEuuVlyKVy5TTPg4cJAqUKCwK1m1vR?=
 =?us-ascii?Q?HgJfqivRVkwwauQEX/biSf6yOPUft6geKw3YuDFiDcYpxIblAwy3hINNyTXq?=
 =?us-ascii?Q?IhKz8CSXXZNasotJFfm4G5faUH/IVK9S4bmvPypWE7PckNPL1l3iNLFMAhp1?=
 =?us-ascii?Q?r6qQoHxXkkn/3B7mhWChHUkXeIjh8si4s7eDBL4Ivsrh1cg0baiQZ0HUm6TI?=
 =?us-ascii?Q?VfMFLIgvBqI5lX4OldrG6pXLeIP0EYuOzlqcR85gyduWIh60bINV3rnuFTIH?=
 =?us-ascii?Q?ez0JLRykeWoP/Nn6D75RPSjwc+guT23MvNS5WKmhbTNjMtfsVQ6ttaCEnChC?=
 =?us-ascii?Q?w1GYUQQRDXTUUJFV2pMWHhZ7i16v+wOwdvWwbeCe/9lQliNT34LBOyLt8qlK?=
 =?us-ascii?Q?/5xtwHpgeNh2fdpBoStUIpWAE0xS9/36i2JX8Pn1S/i2XNf6H3e+NEklHo0z?=
 =?us-ascii?Q?ex4QTS1RBm4zw7JVyBKaewfX9rqs2tbtWfr9wwZpwpYjYTi6rT6QO7g/0ckO?=
 =?us-ascii?Q?wwJJzZJc2Eg/5W+LJqFw3NBv+clohLhzZx8x7BErAU6QzAeJBmdA0/OwR5Yx?=
 =?us-ascii?Q?SH3hwDh4PJy/vHVQ+iKEJ8HBGAB8yqwFJBXaAARI7gsZzOdDkZmUfs2iBJZ/?=
 =?us-ascii?Q?rvLNe0NX3VJClJNBBg0B0Yy5zH1UImw6m2UPMKH59/TC97B3BdnULu636+kv?=
 =?us-ascii?Q?pfem0Rah1RSI/8Hx/wr/OsetktBbDRGarm+a4GjCCVejnvPhru2gUcYfS4TE?=
 =?us-ascii?Q?PXyTmmQDO7zQ8PWU4WagKDHyVOLMspHhGpSxYTKkH1wHU2fcVWtALlQqQVeF?=
 =?us-ascii?Q?nnnu2+CXAN6rf5ymo+6ugb2nLJQxLAaLVIZIvvSpLay6zOmfdEeYGBiF2RoP?=
 =?us-ascii?Q?LAXH1sALylWfyNE5a7sbmJyT6URSAeknUCQYMflN48CHQhzZRPb64FU4tMS3?=
 =?us-ascii?Q?NN1Ry+ZBu+0iJUoDLazeX8smG+IcRWC6KqVwpLqIf4pBq4GTQsjLATqoAFeH?=
 =?us-ascii?Q?MCclfprKg9eui7R7Jwm8UyV7L8rg6lunW3ItRp8Iv0Z4xeNkav89vlZKnA0q?=
 =?us-ascii?Q?50K/nrrghVSuDkdXmykvQFpqQgLRCLjcrfaVHBhgjyVCOMWE/5ds4o2O9+EB?=
 =?us-ascii?Q?WBzyX8D6TQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	cv5xnmyrJSw5ocCYpBTHG+tdX/s3Jh7aa4b5nh/0JLtnetsLActd8dirokdVXVZvhJGrFjwXWCtdDHkr07LoDAv755vECgKTj6rqhlQmlRKMuwdOD8tXsgIoxUvuCSUNL75Wk1PoQLbWxt2wmeseNyq4oD4B88OWgRsXZNHy8k3c623M04Rd6scafblAtPyS9GXBEhz5q7n7wJXnHYPwWla3485PiSTk+krOzQ+qgEre8iQ1XCJvOqp+x4H5FeQJJVMClE6WUl9VwwxJFSo02/IYEd0M9Lnez97YAa8j5E8uQK6MXt+wTtMqza6OweWp0+E4hzs3Q7b7StxRayGzlA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb2af36-5843-40f9-639c-08deb0c080f8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:23:18.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STPoyH0XhlPhd4gZi/6L1xNMcCbkYlNexxY0qcXZnQgmpGMVDbrKhkIO7FVTn2ktHVpnSrEKbVnhtDIzN+gXCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NCBTYWx0ZWRfXzjdSRLs694tH
 gSXBBFDQ7ggz3kW4RAiTDdfrIpb85nhlfbt+gwR7T3kxF9pIi+IGc+VsvvTSJrDvN0tB6QEWHET
 2zDTlFg5GRMdHWaCP8QY7jvOw8S/Dje//qmA1+hfaajeShR95LrgeoNm4p4CQfNh3+BrM6hFLam
 wS/0vSlM+R0UfVBTnNkxJ+1ydi4fNWX8lsukY95hdKOtLZSSPmQobTpl9oSFj8NVPHcZ/IK2nX0
 VBKvNPeGwCKdQLRif8SUKhWodMe1ixsA9DBFS31cSAnooXqJO7JONLBTYgawJGt8QqjIFSE6uEf
 uu6m6ExX4ZY6fK3tzA4toMYGb+f6Tt8vZPG9D+PPVWd5ARAW14QyyDo7mn6DtM1UAHzQwsZuTa7
 DexyfSDH+HycWUg7gTmtOgX1vcUCvr/bsZAbdLhaR5NID4rKjnPHJHAtKHotXkEVGqFywlARFvb
 fdEcbxs72YT6nIVRA2g==
X-Proofpoint-ORIG-GUID: 9lEHKqM6yxX_QPbsuzYFUALOZwS9FKQH
X-Proofpoint-GUID: 9lEHKqM6yxX_QPbsuzYFUALOZwS9FKQH
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a0426e9 cx=c_pps
 a=9MZ2ugitVzia3XLGoiWL/g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=8nEx1NFfAAAA:20
 a=kh0PQnTzAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=Wju0kPImnSGmx7RAKAoA:9
 a=4Y7iCZ2k6v-lWCGmfGXo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 07:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126954

ChangeLog:
https://github.com/jirka-h/haveged/releases/tag/v1.9.20

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../haveged/{haveged_1.9.19.bb => haveged_1.9.20.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.19.bb => haveged_1.9.20.bb} (91%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
similarity index 91%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
index 69de5628c4..f055cc2430 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d"
-SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
+SRCREV = "e2d96806273caa9ce7457e2f8669a3c40517ca27"
+SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https;tag=v${PV} \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/jirka-h/haveged/releases"
-- 
2.34.1


