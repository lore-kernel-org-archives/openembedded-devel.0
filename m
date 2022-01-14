Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC3BC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 01:39:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1700.1642124399039635283
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=o9htKKOM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80133a60ff=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E1YZdB007942
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=JrQLQVtr3v4ztyMnd3Xbd7Q0VRkTiZuvuefrL1J8wto=;
 b=o9htKKOMvmMfilsobukPaCiCrP3KucN8gwKorI/oblBdb9bXcFvsZO/5ejI26hNQsASV
 nV4jw7at7A8smncHX1A5Yvq7hPcSPurKsy5GDiGNmE5C5SWzDrzcEBPc1BLHNkI2bhL4
 0eZuIA2jofzW3Zw+16V5V8HID7452leGLTO/2clv5S9UFe76jEeRCFIupfJDYkppKaTA
 SO3A49Pmn+G4MOy6HteWErZgF4C3hJ7NxSEclRHTT2Ssa5+ccAZ/o4fUoSF6XxAvuTI4
 nujBY7Ujhx9CZC/z8bc9W75IYVchktu02dpBCk0SMhiRkhnBRnoxwUe5+Vh2rzq+qtZ8 5w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhyvth919-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA+4TvuXrI8Ikfcjc/H/DOlsMqPeYccvU4BgY3JAPF7vcZMUl1glE+ecZ1Hz4EDd8NG1/L3Q3my2RPYZR1yIp90FS3viN7fLZX9IMcIT6kwyJoi14DUHTOv9Ovfw3dVKq02D4KW7kRS+HKhuJdq0TRNd3a4DbxDEfN6yH9Tfl6xYRKo7FN7s/xZVrwXe8YHjEvTX9UwfbAPMI5dObRGBkdOCu2nAqknlMs+UWg3njP3B7O2IbxYulrXu4sFVJIer80MitJvnsQub/8QtAd4Vjg8quYfKR56qad17uvN6LXaJHLlXvfTP+k3M0UdAcGglccZmVfKRIEZWNLKJv7y/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrQLQVtr3v4ztyMnd3Xbd7Q0VRkTiZuvuefrL1J8wto=;
 b=A0ptcj4cSYxHW3Qx3o0qItVYTBR9A1iUskIVG9B19j3azllR8ehFj4a0jByOd6kqD+Q49SFeYalBKOgvHJwdakur2sxvNkpIK47eB8xA5eKaLNX/twfE8BPT2D18X57WEqnl6KDg3PzbEcGpi/9j4DKpkBbCXer4BmBEfanOROe2wWKTxJJsved3e9Ao04jMtSv6Ks8r+YDsTcthEQ7Ka2A7OoU59RvCUOe3d8/Sx+KOm5JL8diXs9kxcix6mP9FHjghMqCbnI9klW0ffRiAYxJ7EQMd6y0E6PqzjEiG2yr+byVRa9keM0VofUc/RQ26UTiTsqti2fuow285TuEubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 01:39:56 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459%5]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 01:39:56 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 5/6] tnftp: upgrade 20151004 -> 20210827
Date: Fri, 14 Jan 2022 09:39:40 +0800
Message-Id: <20220114013941.229837-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114013941.229837-1-yi.zhao@windriver.com>
References: <20220114013941.229837-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To SJ0PR11MB4878.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8351c45-e1f0-4c5a-f38f-08d9d6fec51a
X-MS-TrafficTypeDiagnostic: MW3PR11MB4746:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB47467DDD62B28906D85FA878F9549@MW3PR11MB4746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OeweqmO8idoV5J6kxADZLCTo3DLA8x6Fl5BJfeUTAaMFJVJlrUFe5JWTb/01ljaIVl9ozegGP75Yv3sc8M7dV94G9UptZ2QrkOl1auZMM++DUo8R7IsGIQtkXvsjmL8RaKy99sFaLkQSpDJCQQXneiX9ua2kCMXPZapgk7yxOzDNkY97NiTlrMyTDJX2/J41Rjm9vBbAw6tL9JsArrTpOJJ7Ws3In4V8h4UvmbSjiKrR0iFYZw4o8W4nqhW0P1vbksSZ4JO7y1XKSqSGZLKZed/ghpfnFSsvi2vNXv87ls2yC48/UaBZTN8IqXJ4oTZN+r4NBS9+cpxoSrBQ+qEHxBhXRChnzGZ9OUca8d/bJ1fyL4dyrPCP7WV5dDrJ1FDKselpxAnZ+Dlg8tzIg8w/wM+h9zOg7/GRR48gbsmDXFuf+u8KFin4BngZMWyY7v09eOrSBEkn0JBTKmMDXhAp77ei5hvctCXsW57C8mmb19zD1uun09Y5HZojNHmPwg/2GGeEaUrgtj4JRpjaxhI783BVDRdnrosGxon21qe9L+Dxv+mrYRsMXs6rE2viT1Lel4HdjzOwcS4FH6TrSYWytPBlqHuVkMNDi7uPuaBoYaYvpH+Jc1+6/2QvROyfCFx4FXtyDU/VdHCw9s6e7v+frsoNrc9FYrhlw3TyhB/A/H9uCzobHZP5xGy6VdpUNhTdibnITvhzOUovSyw3nECANYb1L8TpF77fjygs2EKIBQIpx5/8Hc3FKOvieDv2M7seEpc3/yKlLzo5d0J3zUKAzHqqt2qhQmong2EFL96vwZc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6916009)(6506007)(186003)(5660300002)(26005)(86362001)(316002)(8676002)(52116002)(1076003)(36756003)(6512007)(38350700002)(6666004)(44832011)(2616005)(66556008)(2906002)(508600001)(8936002)(6486002)(66476007)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z7DynKm23Tbnm0httG8HUkuBbMBRUSe46S4TBG7IVWF1moD8OwZUYxacPkaI?=
 =?us-ascii?Q?uuhdizHLJNpzplh07M/I3moj4B+4hgrTjyIyA18UKiMCiSVy6EiwZnup3Vgx?=
 =?us-ascii?Q?TBM8FKt0AikzMBhA7K26jLitfHHbtrn1NlaP9guuZ77rdIO9zlSsMLpgApc7?=
 =?us-ascii?Q?vnT2v0Wur9ANyu6I5i+EPxeQglu0wtFIhnYJG6Bpc3DJTtJct/W8fWxmOtqe?=
 =?us-ascii?Q?3pDkbR0uYSM755eIGUWORRmUs40iTge+JGBp/6OkRt9F0YuJapyz0KNnK72V?=
 =?us-ascii?Q?RK2pkcmDoZq3iPN8+GJInRg5SZJsdrUkQRjaaFZfnDOvHe9kj6PAR7bMkiqj?=
 =?us-ascii?Q?MleLzeesJWOyD03+jqD0Oure+pDsv/I/m4PVlARCTL9ZgLRyqS9zfhXzx5mg?=
 =?us-ascii?Q?4AntydvNZhTw268HykiWtboAfgP5xFQ6WTpShx243+ANzlXitppfyI9Te9J+?=
 =?us-ascii?Q?yegQH+CyGtjNW4JfQdz7PaoBFEceqYjKOJP/Bi4m0Guy50uuA0kCUVgT6u62?=
 =?us-ascii?Q?Hwn/LuRH2PmvwbIfCII0mAyH0rvJfO3Dii74ztgEp2kSYFWLCDfewtSHfk1s?=
 =?us-ascii?Q?6pIBDYtbnt4qoCPNrKlgX9+kK7ABZ5YC6dOj8kBm8zvXm2ms2Nq5sC1kJbul?=
 =?us-ascii?Q?wu4eMZfoP34C8ykdYmUrL4UXeoYE+0MoVxrDXS5+HJPwjeW2mRZlDX9snR2z?=
 =?us-ascii?Q?+cOE9i0RTooL281g7b5B20FF8hlcuZkaWu02TZRMvFl8LCyj84B4rrdA4nUP?=
 =?us-ascii?Q?vxsLf6hIiZsZP6per7EyEX9rWGwO3doUsLxAWVc831FSKst8HjqydAzhQnqU?=
 =?us-ascii?Q?Sl+MEVYEHYuvHy88fOjCKPkxxERicV/+nIzzjY2DAoZo0xKOIbcgEky8XSiA?=
 =?us-ascii?Q?HSXakMP3KKRh8oLAzMp+FvoWmEhPxr0zw3W9ZOMulMEWzWWp/q32JPKu0CH1?=
 =?us-ascii?Q?ffS3GMkfWTy2mMvCI3iMyu9DSOosOkwud+R1GMpqSZcgUK95E1SJNGb8D9+O?=
 =?us-ascii?Q?R64PIqg99OTFPboznzB5gsctVjI7G8t7ccdzIe2NdMNcChJHakkcz0WNmoZF?=
 =?us-ascii?Q?dp9nDq9fjmP0iPiHybIKWR9qlUa/rFkIPxQeIzsf2jhkDQ40cMb7yYkdCvGo?=
 =?us-ascii?Q?y46hQnfOJy7lZQUbEd4pnO3OOPuqi8dvDtiKZ6q777NgoPBGBX0hquokfp7I?=
 =?us-ascii?Q?238ucRnZwxpTfvWoxMeDkOC/JnJGuPM3THINUz9N8PZcpSJPPRHW52tanPOI?=
 =?us-ascii?Q?//lkZLhIu4BVv81mrsThdpkn2JGVgptVdIr3VnPG0jxTsinJT0ZpPP8U1TDq?=
 =?us-ascii?Q?8Wq6KDAgJ9bKjqkPoQy4Am8vVsBNk3U6JbNMAp4b/4f6TSD40N2xF6SNF0Jd?=
 =?us-ascii?Q?NQgSBFJ1nO9+y/ZNzYStDhBNjyujzSfHrgds478uB6+48wDrSC2FL4U8tr0w?=
 =?us-ascii?Q?owFgEpir2kwzZCizKgu6eUHrIwDVEim7AyNrM91xFlhmnuR2N1cTkrL8wgRB?=
 =?us-ascii?Q?/BEjwzyvBdfZdCfyimHLFvFfz0Wc6ZBaQ4b30kvfgp+helLaE5w3YOOm2aQL?=
 =?us-ascii?Q?a06Ge/1kcCfkU3wYMT0F3mbFOfJvvN3XoDG0//dlbTMkTjA5I8Rlx24s9f+k?=
 =?us-ascii?Q?MRS+WiF7/Y/lWVpoIeyElbY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8351c45-e1f0-4c5a-f38f-08d9d6fec51a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 01:39:56.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M4yYhmtG68ntuJyjWIDFpJ6seI+Cx+KFVm8Xv4ca9i/otfLygjyMHtVYT7OME+S1rlBa83F7i4eydeyAcjiuLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
X-Proofpoint-ORIG-GUID: s-5MtlV4whxMLR9vTqlUAm6OsLXyaGBc
X-Proofpoint-GUID: s-5MtlV4whxMLR9vTqlUAm6OsLXyaGBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_10,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=917 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201140007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 01:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94818

* License-Update: Update copyright years
* Drop tnftp-autotools.patch as the issue had been fixed upstream

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tnftp/tnftp/tnftp-autotools.patch         | 42 -------------------
 .../{tnftp_20151004.bb => tnftp_20210827.bb}  |  7 ++--
 2 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
 rename meta-networking/recipes-support/tnftp/{tnftp_20151004.bb => tnftp_20210827.bb} (83%)

diff --git a/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch b/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
deleted file mode 100644
index 1bda576bc..000000000
--- a/meta-networking/recipes-support/tnftp/tnftp/tnftp-autotools.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-[PATCH] Update configure.ac and Makefile.am to resolve warnings/errors
-
-Upstream-Status: Pending
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- configure.ac          |    2 ++
- libnetbsd/Makefile.am |    2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a96d2ab..b3b3069 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,9 +71,11 @@ AH_TEMPLATE([WITH_SSL],
- #
- # Checks for programs.
- #
-+AM_PROG_AR()
- AC_PROG_CC()
- AC_PROG_AWK()
- AC_PROG_LIBTOOL()
-+AM_PROG_CC_C_O()
- 
- #
- # Checks for tool features.
-diff --git a/libnetbsd/Makefile.am b/libnetbsd/Makefile.am
-index 3e5c3ce..39bb12d 100644
---- a/libnetbsd/Makefile.am
-+++ b/libnetbsd/Makefile.am
-@@ -5,7 +5,7 @@ noinst_LTLIBRARIES = libnetbsd.la
- libnetbsd_la_SOURCES =
- 
- 
--CPPFLAGS = \
-+AM_CPPFLAGS = \
- 	-I$(srcdir) \
- 	-I$(top_srcdir) \
- 	-I$(top_builddir)
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-support/tnftp/tnftp_20151004.bb b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
similarity index 83%
rename from meta-networking/recipes-support/tnftp/tnftp_20151004.bb
rename to meta-networking/recipes-support/tnftp/tnftp_20210827.bb
index 8e03f1bdb..111a63d29 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20151004.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
@@ -15,7 +15,6 @@ LICENSE = "BSD-4-Clause"
 DEPENDS = "ncurses"
 
 SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
-    file://tnftp-autotools.patch \
 "
 
 inherit autotools update-alternatives pkgconfig
@@ -28,9 +27,9 @@ ALTERNATIVE_TARGET_${PN}  = "${bindir}/tnftp"
 
 FILES:${PN} = "${bindir}/tnftp"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=6d6796cb166a9bb050958241dad9479e"
-SRC_URI[md5sum] = "a49fbe752318d5a7893f900046ea00d5"
-SRC_URI[sha256sum] = "c94a8a49d3f4aec1965feea831d4d5bf6f90c65fd8381ee0863d11a5029a43a0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b4248c6fb8ecff27f256ba97b25f1a21"
+SRC_URI[md5sum] = "fdb6dd1b53dca79148c395b77c6dba5a"
+SRC_URI[sha256sum] = "101901e90b656c223ec8106370dd0d783fb63d26aa6f0b2a75f40e86a9f06ea2"
 
 PACKAGECONFIG ?= "openssl \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.25.1


