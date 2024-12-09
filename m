Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6D8E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:10:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.102209.1733753405562653671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 06:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=207347ff3d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B98bhbf015821
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Dec 2024 14:10:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3hex9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 14:10:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0jR6VGgpm7SMz3FML+4f7sriRQBrgH27/dRgZotJi5i0BOrpI3ZORmmEdXUl6o7vXng4Kh/RXOkL6EobwnQwDzPVgXoUl2pb/W+MEGb4TJzyx8JMAxc1Ujb5ZR9ipj1aXwkgaNQNdgWl0m8YAnMjQbFo8mOlVhE/uedAttFcaUSZHPzedJDRStAzcUBjuzF2tF2LazHkzp4VNX5csFVVgGbxFKO/c9vfTUA1EpagbhQqKnLr6V88+2Cd9RmiTK/3NwPHTp/GRaCH7wcqV9fn4g1zQ0VUxfw8QvoL8JI/GV0Vl1Jbyb/K2GxpsUScX5TCVjJTBlwv4TL6Vwy/iSz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etQyX2J/u7BMjMLgzvW3wlV0TUiN05t2hnOTlia00xQ=;
 b=Lw+SUM1eVyWZiETW4iHeC8ag9IP9fw56zDoVgiRiGggW1pA3iOlc0Fpzjuaq7DQTmvFqGdqrgrPDxp7+fs6BUZudzGANRTXpHS/kNy3cQAJVVLWM1JolDZoNztI68BclDllIytfiNJhig0z612JpZWcWFzHqp1VMYUDjEEIuO4I2hxD9l17I0SaAt59P8ZudadTBQiTjqSnl8Hq/GYXkUqxazeAi0hegNAX07LpxZwfAdd79vXspo5kDH2lV8Q7kxOP0VrEbJGX6bEt9ZPwcRU3WiMzTDoFBmL7QsVrdockQsWWukbe894Vol9LdispQ4ClyRGo9c1FqCCDR2Zuk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 9 Dec
 2024 14:10:00 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 14:09:59 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lxdm: drop debug-tweaks
Date: Mon,  9 Dec 2024 22:09:44 +0800
Message-Id: <20241209140944.3500802-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ccbdd9c-cad2-42e2-1eee-08dd185b2adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b7607UWMx6Zmj+5JhoLYnmBbmSaraPcFIu9UotiCTc0eQXjs1r/aFp9I3Z8F?=
 =?us-ascii?Q?v9rDcln8EjlgTt34bRZa52ccLWNmRTUGjUR+dvE5pMpReoNKoMNmj0ezuZ7T?=
 =?us-ascii?Q?iNJdfBhzAlzY0HhHvVZvwZnPTRbSaoowpHOJPjnTSqyIJ/eTUXRPwvN2sasF?=
 =?us-ascii?Q?HYeAA7LGthJwMoHEPxRnaceZ1SQiDsJlKqJvoKVh9vlXc3z8O0Etw5ygmJx1?=
 =?us-ascii?Q?umptNu+E/QjfFiMmCsouOrQz71LcPhsZSY4n7JJNkIq8aPVHXX6W9rXv5bsF?=
 =?us-ascii?Q?YoEtVDuVcY1XrCuz34FzGrNBUBUPTE25zpGiSY1SwrbBXGXypAp6Z8EerCY1?=
 =?us-ascii?Q?ef3rdy16KrYf7moAutFXPXeawF6ZxgLh+mvlXgS3W9os/wpTCYoSMPax5Uv1?=
 =?us-ascii?Q?CbUaBhvgdx8KjyBl4ibWe+rOY32ZjsMpysafyVQeiVv4645mg4Yr5FAXmN7h?=
 =?us-ascii?Q?HRFzdWXFCCMHei8A3KQPPbg+3952doYXKbHAolzsnOgRH7UVLQG6dTBu2Mki?=
 =?us-ascii?Q?On6/4ak6MH/f/4OYq7Zbb9ksW14JBVI/TMi53kKzHu2gfr+j8K4zKF9+5tuh?=
 =?us-ascii?Q?fWr/s7QjEmqOtXGKy06Ct2TRizhw32B+r9KqwGzGLRTk1Btczd7A6RmPvidm?=
 =?us-ascii?Q?StiJq/E8W1KOUIc5KGUzHOdnVLjN7taX1mX82SymsuMP0tlVPrflnHbuOR33?=
 =?us-ascii?Q?bG8d+V4K14nfgVTUiF++ifk6yR5frDYiIrnbG8a+//hXQx6tDuFNdm6vAxZv?=
 =?us-ascii?Q?wgq+vXEATlh2xrDvMoxfM8aNuX3gQTplwEOTgu8edaaXw2yr/0k22wzHzTIw?=
 =?us-ascii?Q?aB/ajvnjYCZVTu6KtsbckqQHhHPEdeQEkwWB/GuGfUCdObyB586u4DtNrWSn?=
 =?us-ascii?Q?27CaZ/irdO4iVwu9frSuesqyhVu4e7EfyYdFRbtg3nD46MMbZP23B/oG8py4?=
 =?us-ascii?Q?psu+c8i7IQyVqrmzcoGC9fadTysDPXi+9aGS3KFEYueKOeSTPUjV0au0EKLu?=
 =?us-ascii?Q?wv0cAb2ySV79qowznRVrRxhdVw+sNFG8ENIZ3mmXDpViypsBDOnucAFw3w2e?=
 =?us-ascii?Q?w+OqQPTc8mUmCtG6vG8Sc6UwiEwHOSKk7A/ac/NZ4sN5Iy/fyxnA5gpmf3w6?=
 =?us-ascii?Q?tAf37Eq3VdJ7kOeVdKlRnRR+uum5dzNeioJ6e0Z+ErtZaQlp95E9ya/9bBcq?=
 =?us-ascii?Q?hc6B2YpFBJ0ydX5g5eSh0JrwOcAOxoReftkBDK8gDQFbelb7ligLo6n4DDcE?=
 =?us-ascii?Q?bN4pu+Lg3rNO17LNJ/F9Kgw6qA+dERN6aIJqAmuvsvdrNM0Z2cyb8hyOI3zt?=
 =?us-ascii?Q?ng5V6FaSqxrv5CzI+PuOdQkrAe3rI7cVz/dgjfD8w392h/J2h1UyjSE3wLpu?=
 =?us-ascii?Q?rWRj5TFJwOn2t/POLQrldyFoSxBP8p9kN0Ee5fa4mF956qmWFQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sDPXYJRnDcNH3COyyLtjAn+iMzo/r/24dSRLlmjqzCyBdxW7xIVJj88FQLWM?=
 =?us-ascii?Q?WLk5mamccRSOfXEXgT2XgVChaNTtqn4Ax8a6KBvvH+C+6/DW9QhbZ9k5cUZk?=
 =?us-ascii?Q?wQwW2ibNkgj3zP20WHIn0Ev84vqXfnPpoiOMwZAxJ+PBjLkonK8+p4Uh6lM5?=
 =?us-ascii?Q?IoCStXiLGS9LlVTZqr1t7wNAcbM+yc7HpGp2g2PpRcVKYIBsvWjHSDr0ai08?=
 =?us-ascii?Q?GMSbvglvZ55jcf94ceCCr8tNk1KeqNsseOWInn3pT3V74MwFIyrAfNHR6Vb8?=
 =?us-ascii?Q?8JsLc1c1PGLRvqPAyZ6tDxq+/x0/40FjdwWnc8GndWBAJa11C4N4+eaE1cuP?=
 =?us-ascii?Q?PY6PXBm/6xfe5N1NC6BLzXuffyAT01bWFl2U3Fc2BvX++Ey7ao2ThMVUNfoK?=
 =?us-ascii?Q?DzOIN5BjRCZM/uV2SB3LhjcnTRZa4eS0t++Uo2IyLwurB+7bI0vT1AZ2j6av?=
 =?us-ascii?Q?BnL1t0/0OTa25Eu2Kz+puVJ3hy8KzPSTTuf12QRDrGDl4dXUJXloGHWvqAzl?=
 =?us-ascii?Q?0cgy68sZRacAypGck8Hw+Y0E9t78XwPK9BjxUGw87sDZuD/MRyGwJIWvrJB+?=
 =?us-ascii?Q?5D2Ziu8sZ3uiXgEGUmNR1prS2ULPuthbES2q5/JyyN2g61yQ+nUZuTCC1rhF?=
 =?us-ascii?Q?lRDxWUAuTrfmZgkTPXrMnbiNJXGCif9jad4ACKuG8HGe3km47Kip8zK529xa?=
 =?us-ascii?Q?lpP60hborUukrlGzhLsdCEYopM4chWPu7LiwtITkAbIF++EaFUvJWeOzfLyx?=
 =?us-ascii?Q?pHeOqErcc7O1mMOM2Gr3cvxhZynBRkUpBZNiBF6eG+MTx8ibDvlQvJxHmfNh?=
 =?us-ascii?Q?ao5wNmlsENBYvAGL5Pqg0JYMvStfjSXo3BV2dseN/G9jEOdlmxjr9N1qjlDn?=
 =?us-ascii?Q?FwrhL6KuKlLu7MK1vNtTe7/K1A6WJEYzcI5b300SsiMZAopQGPPYWF2WvKsk?=
 =?us-ascii?Q?GMIVhnQllnCdnueyShe6Z2YhdAZrKEEwc6w7zCqrcygx5M9/TjZuLuxE+YQh?=
 =?us-ascii?Q?mM1L3cyKpZlok9Wsd67V7JQrOgtVKcuIQIxle5C93yjVVKLMZCWc73FxD362?=
 =?us-ascii?Q?p/Vu1w9Mmybg4FGttvycmSRlC+P8YnEZgNAl5syB43jY5PFtCSv8E6T4BdOV?=
 =?us-ascii?Q?2+5EenfRtL3juqsPe6ry89Lxh5R9M7RtwSl8zYDwslXGF4CWmwDDpIBM54Fu?=
 =?us-ascii?Q?OYwtWvZPxTqmDOJpsMsPR74ozjiljF7q8+rm+5VlLfmr0zQ6os+6pmbbXjaP?=
 =?us-ascii?Q?lkCYwttfc4Aiaiqr2bhX97P97EjuTBl9XMHEcGhHmjotYFeX9Du06PS6QYH5?=
 =?us-ascii?Q?mGINzYZCuoHQt7GiaxYxkVRT4kc5QMr361tJQBsM37l/slEy6txFKcdklhHu?=
 =?us-ascii?Q?gPcLBM1BK70WWN9xchrJDPwn3RJHbzeJb1EhDop571F1BFzGRbXo+YdSyDVh?=
 =?us-ascii?Q?pRF2yzWag73zrstC+YnOM01qCuStikok3LxNjHGi03is+N+rznQ2/e2CHLMw?=
 =?us-ascii?Q?B2bbEardeCnpQzv6ee90H8w9jXFRa9CgVVu99MYfLU4SkCu+lR0IOj00g6jB?=
 =?us-ascii?Q?H2h4IDq5L8yTBHBeucOwgC6sSnKOIdCigTm9yqn8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccbdd9c-cad2-42e2-1eee-08dd185b2adc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 14:09:59.8922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuGmvn40lyqc/Xl7p2HToy6oLh1Le/cuwMtC10nm5Wqi146eUJwj1UsEDC/4T7/M0hu8ZmnGKNJj2mM7XI1JJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
X-Proofpoint-GUID: uhGpUTrs6BcILItMGU3wri5ndW7xS8MO
X-Proofpoint-ORIG-GUID: uhGpUTrs6BcILItMGU3wri5ndW7xS8MO
X-Authority-Analysis: v=2.4 cv=D7O9KuRj c=1 sm=1 tr=0 ts=6756fa3c cx=c_pps a=gaH0ZU3udx4N2M5FeSqnRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=aGUB1GBrzgaG-0qA1tMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-09_10,2024-12-09_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412090111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 14:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114248

Remove deprecated DISTRO_TYPE as the debug-tweaks IMAGE_FEATURE has
been removed in oe-core. Use allow-root-login, empty-root-password and
allow-empty-password instead.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index 4fc916f4b..a7d79a916 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.xz \
            file://lxdm.conf \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://lxdm-pam file://lxdm-pam-debug', '', d)} \
-           ${@bb.utils.contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
+           ${@bb.utils.contains("IMAGE_FEATURES", "allow-root-login", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
            file://0002-let-autotools-create-lxdm.conf.patch \
            file://0003-check-for-libexecinfo-providing-backtrace-APIs.patch \
            file://0004-fix-css-under-gtk-3.20.patch \
@@ -29,9 +29,6 @@ DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+3
 DEPENDS += "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
 DEPENDS:append:libc-musl = " libexecinfo"
 
-# combine oe-core way with angstrom DISTRO_TYPE
-DISTRO_TYPE ?= "${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
-
 inherit autotools pkgconfig gettext systemd features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -65,7 +62,8 @@ do_install:append() {
         # ArchLinux version of pam config has the following advantages:
         # * simple setup of passwordless login
         # * in XFCE powerdown/restart enabled in logoff dialog
-        install -m 644 ${UNPACKDIR}/${@bb.utils.contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)} ${D}${sysconfdir}/pam.d/lxdm
+        install -m 644 ${UNPACKDIR}/${@bb.utils.contains_any("IMAGE_FEATURES", [ "allow-empty-password", "empty-root-password" ], "lxdm-pam-debug", "lxdm-pam",d)} \
+            ${D}${sysconfdir}/pam.d/lxdm
     fi
 }
 
-- 
2.25.1


