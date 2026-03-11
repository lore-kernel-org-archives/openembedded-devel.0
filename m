Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D496BFD88FF
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:07:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13750.1773205619757889657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qh0Qsj1H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B1p92Y2435337
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 22:06:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=kRQfksSoK
	IzdFA4ImDwqdvJKXpvXFhafTzolvK4xf7Y=; b=qh0Qsj1HLHRisfApgcKXugxyu
	hROVv25yt08qRHz+HeM6UXAihod/BcbEzhBryFgvIwmyGMKsYpGF8n7nc1RT2skx
	p9oiK1eguJgxZr2RLxerv3b8k1c4L+NJ8zf/rDJzLdpTqEQ7MT/p+uDvp5D8Fzjm
	sMUIx0m4mAyzyfRI/KzKA+01FcP4/GhGDLotLlBX3Xp/U0WB8dF5Fu8EFg3BU1tL
	KEVjEW52Fn/pvOBy1WAHHJdZHYVcLLk0mEcmeG8VJ5Ss5MldpyThx3x2XCyrKBc9
	hNg7ljZwqGOTUmqJGdyZjxGT4uFtiUyplzsIvjM0hKzJOElB82ZnecBm5v9Ug==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty3j04u5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 22:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fcs7qFAWbYgJK+eQAtaFHmeirv19liIl61Bmt/Rg1QHSl7CmeM31RC6ocqPi5k4/ivfNHhDLCA1CSfzT5OtwFRlF1Kx9CBtynh4HRRV16u2yZv11r7pf4/+I+qoxaJ+SokQY6L06sDiTv+EYmqRFHGG8pOWO9j9nR+Q/0+cjXbitMfZNIx6Rss4BGPLecXncaOWg60MnkCpTMngNrJuKp++0SM3nDVrmy57C676wXGjh4biShGGYbPQEZ9lcyhE7YFAQ6IhFBphvf8DV+3lFue+hqKLhqdYskD0BLl4p+ErvunHeAl2Ga5iIFEk7zO0LgNxdGAe34sJIu8okhzCOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRQfksSoKIzdFA4ImDwqdvJKXpvXFhafTzolvK4xf7Y=;
 b=dxC5ZdDB/7a8ajoIpOy7k4u4Ly2sfFm7aztqn/ETfEVR6gSKldYSVsU0d4IDvUjwHQOtJqqE8g25kHC3IE0aSyrtGV5SDJkUy2TI5PzKy8X0lDHuTeA+RuguYkHsQBy+x80Za4lF6K/Cd73/UTCgjO4OtkGIScOJnUllNeuCh3IsUp4uVYf7WqUMdRKJzvAyFUZEzpX3Nif5x631KMsY+ESBzY+J1PTD13GqBaEi6wLjRuaxMFR9wlmUU6QJfLwhExBZiJ39ovqatI46Jg4Z0o+tf2VOvp3YgwSPmFeqma9ctReBBDjqD8mhBu9+2G4vBwxB/3nL0T3mytDRb24bTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 05:06:56 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:06:56 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-gnome][PATCH 1/8] libwnck3: add x11 to REQUIRED_DISTRO_FEATURES
Date: Wed, 11 Mar 2026 13:05:49 +0800
Message-Id: <20260311050556.2079418-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0144.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db63204-c59a-4844-9a5d-08de7f2c042a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	nG0og6ahjFY9eFVnOKuNbK/vV4S6sFeiCVJrPxV8oMUI7vPrtXP8S7SefMPXY2Exz2VNyXSWdbLh3SCL+wAjVA9RVkfX6YVUItw3Geivq3/lIr3OKy16raV3Nf2Eic6VMf8XcHq83eJFa11mqpLdQnfvZxyxUTwiGkHbxJ3zshKNjK4Et9eelHULuKlnJY3bK5mgvqGxf/W3ip2rJxHuchT3yV5K3Nl5Mffveq1yhuBsQc3EpVn1I/eO1le1nh4kOKeF2qMID2FI91oFccHFVCfp4kzEKTFnrC+kSItBXj/gRar2nHluLparl5UgBp65Or8nIQbMIthBq5GG+jK8MUJWkVz9FIRdg2yXucWmY2wap6ky2oNR1L7d5q8GnkoHqDOHXPqb+jmEf2JqL4NkeaPqVe//DlfxDczrHzRBqvdg2iFStnpsutAhd9hb9rdVbRXJVae6o/3rM6AtFUrrmH+HfaCkNAhT4lZHYzTqGeRbtVfB7iYfogCnz/nL84vg6WRcLRgT8GHmlWdFaD8m00m8a4G6Cyf+FuLEJC+txrjnpPuojmakXtIZu/z5QIa69DbKmAHQQbsG9dQchnSPryCb/OtCAm117wYqcWIHlWB5fWKEWWltrISsDMZWbuksVx69S3LU4Pudo1EAmtXNbs61tyDPhSP18zvWRApys7XdY6jJWpMQHvNQcmw/T/6zXVd9xERmBp50wRf60PlbjUtzLHoJwnnrRH5Jk3X84WvIVi053vLwctYLNURQSY8gPyu9hGyofQmrpHHjLfJwO+nf1gJbT5Xe5SwzGkLYN3E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LuerxPL+uQsQN/w0yTzuDHCd7ianaYUJTrfnE4Mvqrf384PUdXB5WCr6swE5?=
 =?us-ascii?Q?aNiXnhWfE0Og4/f/IckDD1q/lN+bD00yEwe20k02gSH7l37jy/Inl5qq9JO6?=
 =?us-ascii?Q?kqtZOcGsTqyUEEkGt1TofaqkrGuyznTVBHzLz2ptmaHN3+WVMYflvkMgoQ4Z?=
 =?us-ascii?Q?H4IWG4VAVZAnhhTMz+5IvXuAK11ewDjpyn/ZYvFoYxKHtBMDBfzMXX3T0u/Y?=
 =?us-ascii?Q?m9+g5uTLco4mctneepGnsQgXFuVlV+WmgbLFIILio+/MUjA2hmEornI9M3MS?=
 =?us-ascii?Q?XXtxXaSzPLrHOpzbr9ZjUTfZrmbXAK1Cis8gErRnkmS9veNtqACN87fTJqUs?=
 =?us-ascii?Q?g20pZgyaSOypUqEiao6RU2TIQKjMKs+RghPowePE9Ji/gaCq/tEIcTB4gfvi?=
 =?us-ascii?Q?hAoNtwX2rBnrVPQ/VbTBx0XHPGQzsKdX4ydjSxqdKtzXkgS8+m2dufJK0NPb?=
 =?us-ascii?Q?S00Ea5/bb2V9xaH7NCNxPSouU7sBe9T2bOf602WTPWn0wVZqGLMlgLatyXhD?=
 =?us-ascii?Q?EMdg4xe3fHWfbghUgt5hCRRXLcx71vkponJ7tPRzOjbtOynq9si5yT5zT9/t?=
 =?us-ascii?Q?dRfQJVVCVcduYhL6cPX3pfqIlBYzw7YqYS3pool29+FuBoaD27IFOhg5Ezea?=
 =?us-ascii?Q?/hRTl7UEZT361zQgfc9GZN+ZlUkiOcS2fMl3Ozt8lBlaoxj6RGVsfZ0c1dym?=
 =?us-ascii?Q?FerJJnOJEvItC7Dd5tWfbgHoeJoFnLmHE8q4MLOpgJam5SlMO3hUDV2FA34J?=
 =?us-ascii?Q?apReLdTnT1aoBxeKiuh2a96Ym0Rq96s3cpJ2MeBKL533zYkWdmuc5iK1fdEc?=
 =?us-ascii?Q?RY0GD2P7cGzv5bvSN1CevqkErwaTZaZKoapeU3gtnSwGKQVWDOCZGy6ZRcl8?=
 =?us-ascii?Q?dHr1lA6aPtA++X1j0M4XbLZZ1Tadv2+1/LcEWMQ5WYkD3k2aqaKcmFMCqu6t?=
 =?us-ascii?Q?mmY/oRLqROrRVhJ5y3dNGQu79hexByY1lWBEWkEmA8/wbgUpN93s3QdoWHlA?=
 =?us-ascii?Q?Op17UQgngHC2Zz3mKXKGv8X7htbkeG4Q0jI51OmV6PsoIMt4b4Me6BLbtj9p?=
 =?us-ascii?Q?NgKChugwH39GVD0QJBsQVt2x/TOi20KeFAc+lEKwgzdguIE829gpsSQCd1sq?=
 =?us-ascii?Q?cvRvzzBneXDqGeq7/VvkL2HipAHkUgiO0DX5mNfSo3vnx82Esi6317LvEK1v?=
 =?us-ascii?Q?y4V1bGeOWckLzaVmLi+2MKrvoqDp3J6lB9jOA0rkZEX6ricXwY8+uQcPyg9t?=
 =?us-ascii?Q?InmEg2Vqc+pAt7oKXmuM4MazCxrPuocT3Desbhvs/v8vk/JpZ7GHYVcbQeO/?=
 =?us-ascii?Q?0RXZuiS4f7shsJBY034nkFdfy7kJ3oo5MTlsJluQY/srVPtM0LCAmZTdcM8s?=
 =?us-ascii?Q?BmIg92+DZeneEw2DZW30pvMRX+oL9hgeESLPNNJRuWN2WIy0tTzdmNAACZqG?=
 =?us-ascii?Q?HYGD0s/tegU4Oj6xAIgr5GXywJn1xCyL5PCQ8HQ+3lRtA7snLkHhbWVol0bF?=
 =?us-ascii?Q?91Hs2QR23/aRdM9wmaDwG0TWkn2x0QXif6AS7gAE63pOvBa+UjtFFyC+F92q?=
 =?us-ascii?Q?KCx26/g0IjyEQ5KQZxIJoxtoThrXiBuDF6JMOM7l+r2H1U8LTn9QZKV5D0wV?=
 =?us-ascii?Q?mo41TyFEFaFj9IsAUZvSytD53/VjC8QilFLdnpUCXPsPnHBwJahf1LfTc5RC?=
 =?us-ascii?Q?gfnCTNLbHtqnys7AgNx7ozLBDcbkuXqxEigGV4CTQM9qEmpVKXXOzA8yKHtn?=
 =?us-ascii?Q?yyTIgOrYqhehGm2KExf/VWVRVeGkyc4=3D?=
X-Exchange-RoutingPolicyChecked: 
	baPwCY9qtFG/mgy1fwcpzfagIXyTEyeFY2f/a7fDDyAV1+QgEpBsDeroRPSqNN7XwjCsPud9amKweE1X/QENn1nYyeMIsw3vCbAT/QmWisHoGzOg16I7NsyCAiLUlfZvv4EJukdIm/nu0ddn/esjkt+vLQifGqZeUb9i5MxvvjK4eexpT18/q2seifsXUcgpw6dvcmHcKJwhwyaOsBwYrW4lSCcYKtX92xlgNE2NMPWtLqx7WgImeqgtydMJ9YK+Oadhpe+4bf4h5XWYy3bl4HsO97WM0Ulb3kaIgB3sxLOUrlDDFZH1fLiSOPMsfwV25HE3Skh9odw/+ACcgf1W4A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db63204-c59a-4844-9a5d-08de7f2c042a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:06:56.0713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKSfxXs+eQgmitbmF+DJ4KAoh0m2x6SQrvTNoWaTfjck66Qnoaz4VS5/ThP/3k4Zah3ArQQQMn1qVj/62vg6tzacit7LaJAwV+6ErXrwygk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: wEkfY3JMYPdXbB8Njvz4u_oLzXHno27y
X-Proofpoint-ORIG-GUID: ISKfOoHi6ooQchvJjH7WVNR052LLra5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfXyIZIawFtxgoC
 DX9bSAP3DlDNjohcGuJ3prP7r96AiDiur9YUQdQGpyfKjq9BaHqcvh4VQl2+8RnS0Cuidsay7aJ
 /dBD8nvWE+nZhhyU1SZ6LDHeZQo91EaX8wDhFgyuQk9VRNLis3RTmFIS8sjcAo1vtsndNKlu1zs
 z3FIdOiDeA2JswsMADIECRDbMn59HpUj+Hk3fmgDxyN6Ju8FoCjHUPVxdYaa1EqqiI2VX248dw2
 qXa0OCcJU524mMqCUF14EAYoyBblIpHFV8yiPuPDF5oAOcxRVcmNsqj3pr3SCoFO10jZc5usGPw
 HRD2+calz24QSHnbvQzuObSH4nYot0S3UL85Mw3lx8JKFGVB451w9VtYmV0KhDSdXOLjcKUKT0I
 F4kuxsH5NV1OJUKuYQJD7D9YMpLVqrZv3oL8CqiifPxZAKbc6c1sOFI8kdRdWXKJkXmYi2Q9LQQ
 mXWmzHI+mL2WsTNbpbw==
X-Authority-Analysis: v=2.4 cv=Qr1THFyd c=1 sm=1 tr=0 ts=69b0f873 cx=c_pps
 a=7sXfYZKWL/+VDStniiEWIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=6VkjH54F1Yo8vJXnF-MA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125051

Refer [1], but when DISTRO_FEATURES only container wayland, but not x11,
do_configure will failed with error:
| ../sources/libwnck-43.2/meson.build:55:8: ERROR: Dependency "x11" not found, tried pkgconfig
| ERROR: meson setup failed
Besides, refer the following source code, seems libwnck3 only support x11.
libwnck/util.c:248:      g_warning ("libwnck is designed to work in X11 only, no valid display found");

[1] https://git.openembedded.org/meta-openembedded/commit/?id=abdb05b6b4b31ff40c4219336b7096db014284f1

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
index 4342325f11..ba139cf5cc 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
@@ -23,6 +23,4 @@ SRC_URI += "file://ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch;patch=1 \
             file://0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch;patch=1"
 SRC_URI[archive.sha256sum] = "55a7444ec1fbb95c086d40967388f231b5c0bbc8cffaa086bf9290ae449e51d5"
 
-# gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
-# cairo would at least needed to be built with xlib.
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.34.1


