Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24465F013D5
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:39:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46072.1773650353126947988
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B/QdsY/z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753566c020=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G5ExK23148290
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:39:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=U1kG3uL1jrxpRLWCj/r7TEW61MfxJXqx5gBi2JVFLvs=; b=B/QdsY/zuoH2
	7n7FilbY4XpLattH43pD5g22p63Q+tOMg0m0V7WQYnGfX0SESK8PSvAFmip9vQ9B
	jBZDFu0nglra1W/EAtFGMnDH1ycBwzFI2+hBLaoCJhVsnG3X5h3m0ti3BlkX66jw
	HHpp0mxt00pNzp+SbCHHCQJ+05WgyU5YDaokg6Hk2gunDcx/oDab2CBKNEAMFdZr
	SASXt5KQG2r7RKa5AlQzASvj4CgZGxV4XitggOV4VybKGsMkNDbfxPhE6CQG4t1q
	yYUssfkUT9R5Qe4lucwCnoAoqKnXID59VTwli+9ZZ9M0Cqyd7788aMOQYhBqdLPq
	HQ3EtVX6rw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dsec3-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEKugI0vx9hgSXCvn8KqPBrO+taBy8U1txegfwdtHTHFKn1UkDFJHxxDCJ2zNTnHiOjciDZPwCnM0cj/LqthvMz8ZQ8cXlyj9JFT7OH1b63NxJ5XHQUPGFFJTOJviX0wu68Lw6O8GD4fL9IvrgIVPKMpyIGen5xc70Czl2RFkfnnZmG/Hw4W8YkuN6LzwQRmcCh9WaPQ+xamR5aCewIuBejrzhwzSDvbQKI9lfsZLZFKljuqOK/vZQkC5M2Bb5ocUZKEflwqzDjV+2QyruoTDLtvVGKZDcPHyqZCpD5H9DzSNYFxgZdZuLplSGKhBVMqwClAghFaVcMHMAJtCbu17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1kG3uL1jrxpRLWCj/r7TEW61MfxJXqx5gBi2JVFLvs=;
 b=Aqb1JXI2pzf0VEnD/ceip6LcEK64v1JH4WW0QI1Y5a7gYsxdFaVH1OGF3xmJKtFN26MC3LAjMf3MOwUzdluDTmJlePbI6x4rs7ly/evHC+tLkacEgemmskRza5Y+67ZNO2xFK9OD9zCVlh+96tLPVq063u/6O2QVcGLz3q+C/n+pa49GCiV8vCsmWe8mzgeXRrJAzUCqeL7KWrAW1wwvKfMTn04TCmeLGhfeqQsSNUylbooGAenlaSAoYOEIls4By6y8/obDwAxQCKV0SwsyjuYmTmSmrbNDHooRgcgibYC9S8nEU/ncqAJzqH4TUhWuNneMgZ0Rvfnykk201zp3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 08:39:10 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 08:39:10 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] glibmm-2.68: upgrade 2.80.0 to 2.86.0
Date: Mon, 16 Mar 2026 16:38:25 +0800
Message-Id: <20260316083826.1550599-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316083826.1550599-1-changqing.li@windriver.com>
References: <20260316083826.1550599-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f185c2d-5176-4313-b95d-08de83377e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	7KLRFmAvjN/H7eLCnBqr9NbPQlA6zIvnOTUnKyxC0BdiNAII0MCGWRWJXS7n9wbAxJ2cI46qXNQYR9sKRXe5wP9NjCvy3d6Gf4tZEvvCt+X2kr70rbIq0zaWLEBHIT/0C9BLOzIikzVFrg0Hy9CXYo188cS/bfWJEtSyjMxgUl+evWjvnMAtCp6wGDXLAAr0eAoQkPTHg8z+SWezfq0C7xUT/VS5kvVJQOTWR7IpjDtEeoxUSiKWueoFIQMFZeEuRbYwB7qxTZQB/WOzD59unSohKXkAALA7I06DU8JfkN6shXvCDsi8H70FB6iI3LyMVFvpBayMHe2oqKEAssd+vpo2fYmzwCrzma0/X345+Wfs+W8k2MbFE9m6Tj/FzkDR0mhJLQMkRaK2ulUVINxugAR5TWdQCQfkuSd73xGlyvqrFTxdpxnjW3soUNZiwsvJjMZO7ps5NL1c2GcDNSmQTYZjQRMn9eS8yvlOfIVQ08EkRx2Y1UKaUB17uRTVjnQMHn8FiYE5oZsoldmaxP1IAZuuUuw/8vvIH4AY4m/rx4FLyo6oo6vumsgi8zS+mN4lJC5KnNarkC96pX2ks/s9w0Rif1BU+5njj8+bbCd5ee6zc1gawtNSiWdeeX4odhHjImEWsHxSqBgMs1aNVOqBu72U4bKET5Hzsxu8g+jJNbfT9Irnm/xVrCJHiFPUTeEUmJS91wkiV+4zU00eCjzpVDMjUMsAfYkk2vo+EyWreTC4/fiPQTmEUjwe3Oe6sUrxNWoVvQtFnsCmG52NzuvVtXX+eIKztVDQWDfuMZsAxGZISrpak70hLQROImRf0iDv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wk3rWCMjzcTMM+FbKtVQ4Xbwt74onFDephSnaspUJ/WcYgRxnEhLSph5vkEZ?=
 =?us-ascii?Q?YILNkUniH/R7l0x86ZiGQBIW01q9fXq9be9hr69YwrGjw+i3IvbEn/PsxAGy?=
 =?us-ascii?Q?bRuoZr66Er/MfFthlAjKs3VYeQ6IbyvSXid2nt9OFQYsNKySEI8+dbay/jZ9?=
 =?us-ascii?Q?iayGdwvUKbFfFBynveFNilQ77+sxM2EK/oqIoLHaoa4YxL09aSeoLsvSeh8l?=
 =?us-ascii?Q?I/nOrQ2AL6OYXBmcwETq4g0NFnftZbepfWx5jjvFe57+duchOe9rOx2KBqjC?=
 =?us-ascii?Q?DjWTcsKBdpzV7HvKHQskn7ZZNiFPRMzy7DOsfQn2YqCOHKMHS/I0yWgKJtZD?=
 =?us-ascii?Q?SZz38BWDk2sJ59HKGTMp55nrDyk49zne2Sqo/3PyfqRgDIeDOHwEQsRb3nud?=
 =?us-ascii?Q?OzrRttW1D8ZwPLri8jGyF9WZNP7h8dOHOra9j+fNd8j3hkAvCriyOCATUvZA?=
 =?us-ascii?Q?9wyhZ63YuMwv2byeEmF11gerU6kTGj0E7aeR5CsJccRhGafe9cS63W8K7kVa?=
 =?us-ascii?Q?tafogWB8ec306LcVmZUpE6te6xAs0gwu7gdtqSKp+Xbq3US/+PIgoFnPBwvo?=
 =?us-ascii?Q?8zqLFYv7nJj9DIB5zLxcSTCyIyI7pKW/1h1ZD5XgSNVMkJPhq9lysjS3AGKE?=
 =?us-ascii?Q?XJoaWJNtNWsLBzyCBbmab3lTV8oIu24b8Rydoo0mfwIA9A4m/eMA+ORa6cOx?=
 =?us-ascii?Q?7uy9k2ItrYRkLFXEsOMpgi5dXzvGG6aCjo1ogYiTOU2HThO5bzYn8PJuHKXl?=
 =?us-ascii?Q?eOfk+zG64gU/b2bfMlhFkHqvDkj4EEnSF2tWQm/Q+2C/VGmoUa9lUkBOMHxt?=
 =?us-ascii?Q?aRfYSMgkvuShgNfc32kwjhit0R6bKhZstdleyeMtJrQ2JJf4l1Nh8/ShWXPq?=
 =?us-ascii?Q?E32kRhQbcccghhNdN4mGueuUQNMba7pZ9RRKS7y61sa1gxfWt2J1s19jcUjl?=
 =?us-ascii?Q?TYClcPRY4FreVX+RdAffL0CXLSiutz3htfi3P+ayxmFkUsOk0cqHHi89fYfZ?=
 =?us-ascii?Q?SWOfRqHqdT6Muj03v/n4QerdugAR57dvDgUeTcX+vmtvfM1KWDE3Bb5H2EVc?=
 =?us-ascii?Q?UrdmNpxcbw3xC6gtIU+1+1nZWgI6OkRlf5x2h0J7aOc4Eak5qtHKGuRiHooZ?=
 =?us-ascii?Q?L7GBp/GZU3rfvk/utZQlWGBrcAq1rTF+9YDCA0EFvHQ54OaTeS9IcvSBB/qb?=
 =?us-ascii?Q?i2sUuZy6JXo75kdsl1sztyl63Artm0Wn1ngkwCaKFiyiUKzmyou7uZPYdY05?=
 =?us-ascii?Q?AJhtZbwal1mZ+J/yKP3qpKgxFH+15oEPy6cHEehYReWdheebjS4JLJib8VlP?=
 =?us-ascii?Q?O/C/272enMbrUGZr3RZt7zEdUKJnWkuX9WXx60L+63sWx1d5rfN+49P1y+Nw?=
 =?us-ascii?Q?Huz+CDmoWC98QhYNADYdG1yLGrZsURWMeK+zjZkxohKWl0FW0zm+OeCps8bx?=
 =?us-ascii?Q?Rnp8fm8Dxg7TsZpivcikJ9f5yAtCHUGVEIdwoiX1yWIab2WNIh9QndGOGoyv?=
 =?us-ascii?Q?gQIj0PHkrffG/7oY/QAm6Ie7KL9mrlYmdWRuY5Lwv26z7+2wpuP37RNzEekf?=
 =?us-ascii?Q?Ld9RsyfYDV1nrURiMV+5bQQDZluR4EPyx32KRaefGe0COXttHVJ0KTP/oKX4?=
 =?us-ascii?Q?BB9YO1U04vLJZ9fAO17COdZ0isdN8HH6CIohSt5wZoQHC6H9H8EZoHRM3jQS?=
 =?us-ascii?Q?L7tWvrzfEamsNEnXTP1hBL1LZ9/ZZbtB6br5n2QiHTVHrVq5mEz3cGYSkyVA?=
 =?us-ascii?Q?Qgipwb1rZC7IrZ1QohfjB8KAGfN9aX0=3D?=
X-Exchange-RoutingPolicyChecked: 
	MGRzn+MLp1YFJzoEn2Bzq40AoyL3t4nagudugPpdk8Nsrih7lL/YyaRSX+k3zhha3pYGYUvGQ+O5jmPO+8d5ftu32YIsKnwv1CWiAgdXGJah2YivVrBoEw53ua27pUlPHHPCba9jn40E9xuWTKp+l0Jt9+E/1D4hMjxonbhaX89QGZoG+xCH9yOULRwrxG1YwNpxDTHhf9YhQWAzad7f54l4uL15gMKg+o0qyZjj/1IV4kNxlNwKwe2lTxMLQnVy2mbW/RkwhAkpkZZ08kcpmkMK0AMihevMWdhO/VVL98zX4FG/x2NzBPfbcQSGbFhz4+amwwXeJadFJpbi/XrIHw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f185c2d-5176-4313-b95d-08de83377e67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:39:10.3450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YC6xIdOKYf4YrdwLBzw4CkzIc5Q8PhFX/BgySkQIJHQyIOvxvOp///horjBYs4g+H1Td7QREoh5i8c1IZlhBD+YT5uoVxH7eUuyAdA8NZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b7c1b0 cx=c_pps
 a=xBk5Uq5DOFf1FlsSGvIvFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=GHR8O2WEAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=mzt9fpq59fl3mWknDioA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NSBTYWx0ZWRfX/wEPj+Msyte2
 E2nYTzP7tN0Ex6JJGojnHvOA6G6dNoWCJl+Yao1ND/wVjXTmNpFP39JVXpdj+VZR62nr9Uaf2NV
 Yx6msuAW7lX9Mm7nNyHcshK+eK7z3ARlRWfsH91aTJemA7YiItvYAK5jNiAxACwTBNBWDvqDJkP
 +uTZm52NgqMfOfu4qthdY9hAlcJv+Gy+s7CwRbtAm9UA+MXyIoNRQZ4gLrwO3amiHSKitgqwkw8
 UkKs79s1nWpYMaWTl2AabBesmGZdlTNhpHs44TLwWAb1nytDHjQkqDxhHOcNWQTU9ayj5QbsBnE
 vUWqCDzYy01ywCfZJ4rNzI45LVBecnwrX1MLwZTqGVWHly+A2cncWX/Zgx/23QDuNu/zoHpCiEB
 qXO1DS2l6zYZTK+yGkTY8FcWSXwTMDd1x1nfm54zbrZHQ2bn8bzEj+kZ69gP5ht3Kkk5Fcl3BqN
 9ABcF+dTDaGAsfrGCWw==
X-Proofpoint-ORIG-GUID: 6wWAyje4TbkF5us5hMisTVnn-cu7kTHZ
X-Proofpoint-GUID: 6wWAyje4TbkF5us5hMisTVnn-cu7kTHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125262

License-Update: Remove obsolete FSF address

NEWS:
https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.86.0/NEWS

[1] https://github.com/GNOME/glibmm/commit/727b086bc5bc29fbbfb3fb90198499364cc65dac

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../glib-2.0/{glibmm-2.68_2.80.0.bb => glibmm-2.68_2.86.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.80.0.bb => glibmm-2.68_2.86.0.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
index 48a1a2a624..621a85456d 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "539b0a29e15a96676c4f0594541250566c5ca44da5d4d87a3732fa2d07909e4a"
+SRC_URI[archive.sha256sum] = "39c0e9f6da046d679390774efdb9ad564436236736dc2f7825e614b2d4087826"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.34.1


