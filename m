Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ACFC3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 15:28:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30598.1744558105205954146
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 08:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6198b31cc2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DF3FZU030798
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 15:28:24 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1h7cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 15:28:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgfGDZmLd0Ll36YeutH5BCQRtjwBdx3LWjT44300up5TZpXZHtlgHDRyg3RSgjZGPQ0eu8kyMclo+OoL3w0/Jp6xtU3fWJDvPVwYF5UFmzCRcsZXQYP4+f9c+3AOj0Bm/gEZNCqZ/xK07IZNqXIFPhEMebejxvebvZrbAMDpAwZAUuBH9dyVuw4/271aWZGfD8rjRkX1KgtB/wyX8YEjQLE7qdyoxxQhMd/G5HMrLlc0oE2sVf3FOw4oIwGNx5xf0o8Z4EN1U3C1lqfXb21S1isvuKaiIo9a9/o/eib8jT/toEvXu+X21jibrgLNoQCcM0PTq9CG0v5G4lLzGGilBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRtMde/Xm5ARZA/7mBV2xXuWHHPn8pe75Cvgb01Brrw=;
 b=oG+fyN2R4Vr6mspyn8gBHaz3Zl3gSA2QePUNQAv1d0RByg3E86PlKHKnQ3zb7YUjvDDpzJHjd9ub+4XoMxrIHamR9gRXCG9QIheIKg7BFs4+6c0q/iWtKGtRsg/hsDdHzdzTEDztvLwetwWsnJ8pyzNoQHRft/xVhOXMKmmKkdu5/eBtwhZJjobLKpa9R4ruE23BXnmHFT1TYTKs5puFj4GMEpGC+V+UaPvraqhPGJ82wNz7/OfiPD777rWUFf+D9xOsqTaaDOiTYRSVKtaSFSw8VuEiqmYf+lQmSNnwPQREzq4PvYboPORh6PGjy+JEVxxQD8+2jyBhRy8Jc6xgMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Sun, 13 Apr
 2025 15:28:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8632.030; Sun, 13 Apr 2025
 15:28:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] catch2: upgrade 3.8.0 -> 3.8.1
Date: Sun, 13 Apr 2025 23:28:04 +0800
Message-Id: <20250413152804.3921025-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a11e2c4-dc9a-49d6-ad28-08dd7a9fd1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D10u0G9nVBO6G8kFAhxfBwRARb0wqWzmRjioq+uCzut7pwZQMTH/8HFChVai?=
 =?us-ascii?Q?TQDWGbnebeDjXDY35dg6GAFEWNasBU9X4S8A7JG5BGWwdDrn/J9zDE1TF4qJ?=
 =?us-ascii?Q?HH2eQz3Tw6quiAw6F14c02msI+VuufC6UD7KBJK2NcEQqV17k6Y5Uy6dzjJa?=
 =?us-ascii?Q?PJwbXMuCTULt/DASZoa99r05YBmq+Dka39ey5J/beElrT9q/kXhAoOhi2f49?=
 =?us-ascii?Q?vGlSvJOdBPB3Hixy6FfU342FewfUEmKRTxICLRc5q1Vs7ez8J9qPz2ofG88z?=
 =?us-ascii?Q?fyZeylIVzaJRhVtNCpHcf6zZlAjV/Pj/2VeSCZXGX1TEkZAsj09/Ycu9Tth3?=
 =?us-ascii?Q?rWfKafKKmONbrsjjTWNDOQL+qgRT9DQb5H6ASrVzH+R2L5SJuZFHxFs6xTKI?=
 =?us-ascii?Q?lGALhhgQGMqx4L3W2grb4yGsszIJBfWmsMjge4MtrkJ6+dMmtvQh4xPhfV2b?=
 =?us-ascii?Q?hIKb+FQqzkS+1+HHv+D95TY5wdl366XRhuYGcH/YrWyOnUdZkgN0qVzaYkNS?=
 =?us-ascii?Q?u92scv3Qj78mtKr+fOamIhnUCDboK89eeQk8G/R8ZhK6fW3HhVDx2KoKNbld?=
 =?us-ascii?Q?YES9QIC0csg50PcdTSxP3HIWTecxUc5GmZUYcrh9p6k4IxLB8ODjHR2mMkKV?=
 =?us-ascii?Q?4tPpe3/v1Rasu+4g9Jj3GVoGu2ovpm719ISR5WLsWPXa+WZxtUKXgU5gQXRM?=
 =?us-ascii?Q?7QbLFT2ArHFWhyQ+1I86/QbXZPRmnMFmtFZmwU9pV7DqLwA/Ga4cpaVkei2T?=
 =?us-ascii?Q?RzGe9+BPHzDu7ws8dgz0LvihCTuaaZHeKw3hMbkw9F2L99wFvp18n+Mx4ReC?=
 =?us-ascii?Q?zqdBmwyYbeBKIUQj668cVxP/TVtXAWutZOrgei+W/UHrWUsalbWE32IzdGjj?=
 =?us-ascii?Q?DhMsKQ7W9hmEz8LpL7DcnSURnd3fHcqLZJU11WaZPcoJLJe/DQ1uxvDu0kmc?=
 =?us-ascii?Q?5BVst81W0fdvZiQfMPZKxPts3okAYyTIffgRD5ElCEl9h+QjRU3BsG1hxkSg?=
 =?us-ascii?Q?Ux3hbYvZ5qEbx9PZmGatN8ubbrXmFL9ROaLpAykBhBbFEaz0I6kbn+M5ZZW5?=
 =?us-ascii?Q?7Nc0wRCmxmwp4rWQBLtcKNXqzOLtcebhroa1UUmkK5QK2fa3BarMBOGBLSNV?=
 =?us-ascii?Q?JkYjJdXA/efal/H+euzKq/H6DZ6E/iB0YG3hRq5mFX6CG1cvwFS9SAXiZVG+?=
 =?us-ascii?Q?IUQbKbLc3y3clylHC0I1xGd1StXwstZiF7HolIfbtA65DWqwy4b7aMzoj9+w?=
 =?us-ascii?Q?6sfgoKr4ER+eKAxvutIQx5dRRyBhQCns+qow2AcX/UfE/j7Nzo0Lw/Vds4rz?=
 =?us-ascii?Q?GHhPpjuoN/uka2O+Jd0F3/E7i39PBALPGju3dTjEEYOZ3kHuO7Kwt6m3m0/9?=
 =?us-ascii?Q?wc9WkYr7XeZSftBiv5+DGPlASEtYOu2bzT+SvnPTJ+6kEs4k1Cat5lzclMb9?=
 =?us-ascii?Q?NfCSleXbwVvTHI8SmDZ0Ucnk1UOh10TJy+KOTebmWNPr/Gw3GoTcqFcZK9oq?=
 =?us-ascii?Q?Gggl6F6Ss2voVRU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OCcw9BuXTDTsslEqGwVMsrp8Z3vfwQ0HfDMxljjmyh+MPioNHVBY+9DS40+u?=
 =?us-ascii?Q?SYmkz5OOrcgHi5BZu3DTZfQUUiYSVAVQiIdnt+K8VO0nIdszxfVccTk8UJxi?=
 =?us-ascii?Q?xak8CPbu4LcF9u2F9h1dKCkhJ18SeatCRvp/LIRvj7YjPZ3nkAKmEUOZgxT3?=
 =?us-ascii?Q?EagXEkWCffe7sxuUbxVMXQQVvZwXc03cmkzABXQq/DYSitLLSwXZZo98n+8Y?=
 =?us-ascii?Q?w5cV7pvbA1x/9OCYwS64W541CAkMiAeMA1FmDtSqEe1dBhMITId993nJxVMr?=
 =?us-ascii?Q?UwduKxOvf93E/aGnaIEDLT05aYH5XDneypBdkIIwlbJ/wcEQKAU0iQ5pPfys?=
 =?us-ascii?Q?32M1ShESWPSItVHSjPvFw/IOX1sLShC+nCCaPFjRVv5i3fyWYuPxWdZhEDB+?=
 =?us-ascii?Q?Y6bFDv0DKpZwt4WfbCW850GzovG8TwsCa91nDXSyFqYdDu9y3VhkSiqoZnGV?=
 =?us-ascii?Q?qDnjG+OCcWtg8BpK7fkMlXYEYTKps4XV05c03GPL09Aw96P9tbq3ab9arjP2?=
 =?us-ascii?Q?zb/mECtEwjekG2pOtCmM6FhuE50V5c+9PNeLH8zDGhvahysu5foRJCdJ9/P9?=
 =?us-ascii?Q?g2IqwIU5xSf3DLcCyfLQ/Rn7B/E9WAfPe6y4acN4g5+u1iQkHsy9Q693iNLq?=
 =?us-ascii?Q?JpoJEKIM+WJ/XYdpgknpJBoirgYyg18QzrMfzrfm66XG1sHPkLZYAEEKHEdV?=
 =?us-ascii?Q?ikV54gUuqvybAmbVr0vkoyNBFlz3+S3rNwlMbbCZUEBoTRtyMvufimVGeVTt?=
 =?us-ascii?Q?VvIZJzAPtBmsm9g84JP/vSWxQIwg96sw2Jo6/rntlnBb/bS4iDSusrIfMoy9?=
 =?us-ascii?Q?bNUUH2kRRXhrp18dvRqH3pzZ1tI80ZeUwUmvp7JqRQLI9y36qmoGJWLDo4r+?=
 =?us-ascii?Q?WsxQ/uVWgjHcO5Kmh8dU+RgglG5w1/bq6+I4/bb1X10UiUQW7bOe2KhrCc+X?=
 =?us-ascii?Q?qhJVIVzTdB3LcO3soZgtosrr7rJpjXoPiw6xFHoqu69WS8AQFzZ66EwtgfQH?=
 =?us-ascii?Q?1Kj/ohkzBxUa9RfnOHQKxFrJHb1NJjUgiI2r+C0px9Uu9waz2H58BJqJkupI?=
 =?us-ascii?Q?QzCODUaLX0sb5KOIsba3vjgTnQ6Qw9K0pFEr6RLHz9ByMgnv4rsmqA9C2HOx?=
 =?us-ascii?Q?12I99A2PVznze2xOB49xr1XU1S3VfZYK/Y+hvFM6SicQf4C0yDKM4R8dBH3Y?=
 =?us-ascii?Q?JMXKiaMaqtlVjm9FiKtu3VdjLTsQIvFf2hgLOu0nodKGeMGKz00TKXHZSMLG?=
 =?us-ascii?Q?cxfCc/di3NLsAuUgZ4AVkSDC6z9Qommr1bpUY+W1nDquAOxMjZlU+u9+1eGd?=
 =?us-ascii?Q?2NvlsJprWtPJsIgUW5oFVOgfDkmF3HmVdpYGjqHHzT9RZx8myZX0lOlCm8T3?=
 =?us-ascii?Q?K0P03jVuQniMsayh9pp2SPs3zHL7/Dr1sNgod2vk61whzAWTOKxjpnerk1v6?=
 =?us-ascii?Q?GIo+/Ao0wS0+A9HXggd+TYwzF1YYdBq+xvjuf9RPwQMgZqHwEG5UCGm+OkAT?=
 =?us-ascii?Q?STaR3KtX4paA8BDQA81vsU/1xzMWpKG3KkfHk4HD4JMI30dTiAwevYuQrDSe?=
 =?us-ascii?Q?MLKWMeBf5zLiA34dwSpaMDphBpUqCwgNQkAY7xx2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a11e2c4-dc9a-49d6-ad28-08dd7a9fd1e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2025 15:28:20.0200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7fRY/8O/po3Cygf4A3e4jAmVOmVOTCZjjA036tDRFks4TkiDm8JS2jHAq6jiDxAWxNQAhGo8f+0fmW8vk+beg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-Proofpoint-ORIG-GUID: hV76jfg8P_JuzE3mqp86UktdFvPLcSog
X-Proofpoint-GUID: hV76jfg8P_JuzE3mqp86UktdFvPLcSog
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fbd818 cx=c_pps a=FmV7mXqD6UovpQmy5PTGeA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=5cSNewA692kHzdB3Z-oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504130118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 15:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116832

ChangeLog:
https://github.com/catchorg/Catch2/releases/tag/v3.8.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-test/catch2/{catch2_3.8.0.bb => catch2_3.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.8.0.bb => catch2_3.8.1.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.8.0.bb b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.8.0.bb
rename to meta-oe/recipes-test/catch2/catch2_3.8.1.bb
index dd7ec5469a..f106b39de4 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.8.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
-SRCREV = "914aeecfe23b1e16af6ea675a4fb5dbd5a5b8d0a"
+SRCREV = "2b60af89e23d28eefc081bc930831ee9d45ea58b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


