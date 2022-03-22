Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E57C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 04:47:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6097.1647924458551115738
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZIzN6zkq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00800cfd2b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22M4Uhx2015198
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:47:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=gYu06v+oO4vgK3KU7nfO+91XPr/Dimaq5q+7xHNUUN4=;
 b=ZIzN6zkqGIOLgOFmjhZondCf+K8aEY9E/fjXEAHmNuBvJTvLDln0zQWFo5q4wmVUsyJn
 p1Om8BOKnz9x4/P1fyVhAfd2kd5j6lfe1RylxW/Ot4xFiz2Prx9E0RWTKuVqELtYroba
 CNAYHjwp3eZhoAasFN6USXIp/a9RLvdSI8KS52ZxXL0zhQZHry8Z5UxpHBJrtBjsrTVu
 /Z6Ptd9r2CYQojcyklMXUY+8uBZjs39gZmh8nvsIGSdc5g9E+TBz9Sk2by3LbLBQr+bE
 aYJO6n1ALpGt6BypPLptHlQGu1nAvL7mA9R7un4VTZ/dOxY/7XKFtAsweE/2Ox2+fKcn YA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2047.outbound.protection.outlook.com [104.47.51.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3t1qw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:47:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7rfYz12kh7+53PFu900gnai3EyEeulOsUA/sIojiD3rWkzB9RBNkC061gHoxZBnYKuKMVzs6bM1yAl2M5sm8vg2dXHRYI/kOeE0qzYHvl2speAymQk1KljXP1I3wDJcOsxNTthSxCZKORm4oS/Q5cSFQWQsfOOwPWlkZ9kEyeUksGFJDYFyOw7Y5yC/+yReI/x7McUlfGeVPmLM43LMP0DrkUSxWgZblqNc/HMWVKPjajFPyZiCc8r7MzpsQTOnHOi6oYDLtai7k+BfPm7IYE3EHFmltHmU6h3Y2mVNLFyoNcEDNtlx6Grx8WlvS0Xx4TySspfeT+ONHJ8WnXejLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYu06v+oO4vgK3KU7nfO+91XPr/Dimaq5q+7xHNUUN4=;
 b=m9aTAR8rvz+Ud+ru/APMKsANcnVLRqCvhMZOgHwr/TR3O5XIN/1vB4DMhlRPVYOErLwJn4stC2O/1wirwxcSRZoRFjBT7/qS8BNdLJarEGJ76ihDVxZ59WQnVClXqXZ9/kcpdix4DQSyqeEjQnTnliXEUVZGCMBj8jGYNiDbRKciCCpPYIo4VuQhCcuRO7oFv9DvZkw75B8EOXlgkyRuBtQbo/xfdGzT1hEO73TytrBMYc8UYCGwyAy2ehkIHRh094IfEwGjNHtc0VfHgk7BYyA+1itmU2X1IeFif+0N+8NiUhcY8+si/AOOby6x150MNM6qdqX2CMuf3Z+4dl/tjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Tue, 22 Mar
 2022 04:47:34 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 04:47:34 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/4] dhcp-relay: upgrade 4.4.2p1 -> 4.4.3
Date: Tue, 22 Mar 2022 12:46:15 +0800
Message-Id: <20220322044616.867009-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322044616.867009-1-yi.zhao@windriver.com>
References: <20220322044616.867009-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d26b7be-aa45-45c5-3193-08da0bbf14cc
X-MS-TrafficTypeDiagnostic: SA2PR11MB5098:EE_
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB50986F8E71C582FF19AF98CCF9179@SA2PR11MB5098.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	39LNQ0v7XvEzmm6tPEq3qJoSEmEQr/KZogJ2CQhv15itxc7As8RxcqqC0Gg+tWOU7fTW8DjQlNcyMKqO4qvwjE4FT5iIM6AQY4EfEy3qnozMtktb9C+op0Tw5UI2SAa/hbNr4tFuZ5SUBUB6JTDVc7Eep85GqtJDso3AZm1A8zoDRjhRQVhRjltbjRCnNegoxGdnP4+eYJLXmDsNCR3dg2WXVixJOe1uxu7sZmER6g55LIilMSLpdZLtZHJgMkXfWt1aF8Yx1OVKlQ1RzWDhYZ4a5PznmaN5i/XgBaWA3UNcGg9PuiFhdtIxnZlYVsPgtGsavmOwEa1fHxO2d1IESsi+EXcoQMXxdZHe2r2y5alNYd4o/lAkWic2S3ou2nSUXAjAr0Rrp+FcYOxWaOhAlj9M2s4BfBzQRRWWDlJCgcftAvs8jRPM7JYLX2cloWIXxMuX3Cc7l65zMRVVz6D1EzsDQxzZukpM6pNfEWOG9H3zKEPh2iSeThK0qPTWSugDH4TzYO4h2JvvxjpBWgNzsWp3Fj8BNEYw1vs+P3Q1aYnuoXyvlvFJ3AtZOin7W/voJML2+aFfGvjtACHk4vdBprND00HQN6FUdrGRz2+ff55XCAI3jV1VGcxbyPmbssyQnMAap8j5OUL34XIX7kAqd20vxX+1JC8Mw5NGOk0Fi1xbhyJEsBFOAkpjEGiQ9ohauPaDjdkoliPeMjR7Zv3DXOzp5HTR0t4q+tFwyiFFR5FkJXGExPL8/M10WW2jRyNOH1eUYu/T2uB1DrJQyDio3Hgaw+BNPCJh7vjroMUKUSg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(8936002)(5660300002)(1076003)(26005)(186003)(53546011)(6512007)(52116002)(2906002)(6506007)(44832011)(6666004)(30864003)(38100700002)(83380400001)(966005)(66574015)(86362001)(66946007)(66476007)(66556008)(36756003)(8676002)(316002)(6486002)(508600001)(6916009)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tDqyDuYGyPoC+QEQ0c88a3uiAGUQsfw4AFoluiZViUQxpm/xeSo1nsb1o5wS?=
 =?us-ascii?Q?7QapHvRm6pzus3HAyx7n6ysbZRXw68N6cK0ZCFdbzGU8CmTwdvo6abb6UckY?=
 =?us-ascii?Q?BRE/nQAC3eqGskvj2/Ws2sPMCgb92MrI1OKFXGqX3IQ3USBD0wk3Rw2D03dv?=
 =?us-ascii?Q?JFtM3t6+ToXuAqjkJieKJzVvLyGpxgmDAQmcvuGbw/AsBvkkS+em7nEH/18h?=
 =?us-ascii?Q?e+F1pH9hOR16m0uuYSvHhNldHMyn48QrtioQn2PB3aw25I4pgaap6UvecSr8?=
 =?us-ascii?Q?S69WFHTHi8Mm8Ktbwqi+YpY2ECU6N/+Xnz3MmYPeJu4Qk9/xZkqEHa8rv9Ny?=
 =?us-ascii?Q?aufvyKmtS7DWE0g8VXy/VZVe1UyNBdjxPcubtIxd7tpnbnX1azvEfsgEo3bn?=
 =?us-ascii?Q?0DSBQjUpkWmYC4eEcXY34OgMLWdbvZ14sXexrUE6LK3JzuO9l5kAJ+3bN44x?=
 =?us-ascii?Q?XRCvkwFXXDLG6YSL1TaE9kTj7OmORyWv+Qv/D1SGjDqzHCfYb3wbT0rlc1J+?=
 =?us-ascii?Q?tS+WD0hmBoPHUrHM6YFxUk6dVAwWi+G8FF8w+kCW4jBMHo9dDOVPpVGx0jHo?=
 =?us-ascii?Q?Nnv9i2pzdE+GKFX5t2aLqT8UH8SQ+gKT9O5DI3b8azdQ+4Evq76sEW8FNT27?=
 =?us-ascii?Q?7YljxNwP/fnmtkqThkv3DNJPaoGQCD9OVGayyZSYSdP+jHT4fHPb5CRDuEyr?=
 =?us-ascii?Q?W/SflcC1tbyfgTBApU6m655d+YA+sZvApm9umy6UOozGr6+IQuEkV6L9WMbs?=
 =?us-ascii?Q?t6bcKdS24oXSWXdPDm3aXJnefjnKk31qv1S+QEvA1Te+tCvC90rBhWi/UCPl?=
 =?us-ascii?Q?2v9Qvu0xjjYZVtA/ERql0VQttUaXsrOGQY03B3e6xyStof1pFsjkOtvzxu87?=
 =?us-ascii?Q?RcGB2urr3039SCl4A7RB4/3551gFM6vxk+lK+5YwV44J4C3bHMYKQa/5sQhK?=
 =?us-ascii?Q?JtUbtMpSXTWUhltbhy2mkaOjrBPHPAHbNeReB1fb2giRAgEZ+j23ZecgVq4U?=
 =?us-ascii?Q?rzSLtoZLy7HmQpP4a2AmxjzbJemBehca/sVpvRX1X4J6dKDxD6ylhdimc5aI?=
 =?us-ascii?Q?gOXhGa4mY371TWofqcD4+9PhWI/1ygMQGTgMsW8Z12thR/Os5GCFRo4QFtbq?=
 =?us-ascii?Q?i6oJan5P2NTekbN6x8b1jLXmPuu0jn4959A5WFvU4gFCTtrGTl4hxFC572Iv?=
 =?us-ascii?Q?nsFayl/7zh/GfnOjl8Y84MC3Xo0+mHWHWuBbBGVgWruv0zettlLER8oY0CDW?=
 =?us-ascii?Q?jkIGHtBrAuB1KB3LCKULHdc4pMGVNlQ5GnVmZlirji/9KUfb/YlnzQ2qE6RW?=
 =?us-ascii?Q?mNAACrbovbh+VTDA+c7JHOjnjitr4zJ5jdOm6ITpVMdvNFpnoB37P/wFnFsl?=
 =?us-ascii?Q?Fglf9MQN0RQcw2bkdEwd7fPpX6BhcmgGyf/5vd16LclBhrZ5i3ngmVpPhyLz?=
 =?us-ascii?Q?9t0OacVehbdKyOx1lQE4iyyHMjNVIcIF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d26b7be-aa45-45c5-3193-08da0bbf14cc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 04:47:34.4275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u44VTjzNHY5axYNqTa+GsmWMenUsQ8+vZyskLvTaIZ6Xm0XSmGi7sjd4jpeiDjHmkVUwexd7Q1HmeVb0Y4Dngw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-Proofpoint-ORIG-GUID: vZBNhjXkJytMadmHsiulO-OXvP8cIep4
X-Proofpoint-GUID: vZBNhjXkJytMadmHsiulO-OXvP8cIep4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_10,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 04:47:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96129

License-Update: The ISC DHCP is licensed under the Mozilla Public
License, MPL 2.0 rather than ISC License now[1][2].

[1] https://www.isc.org/licenses/
[2] https://downloads.isc.org/isc/dhcp/4.4.3/dhcp-4.4.3-RELNOTES

The bundled BIND has been updated to 9.11.36. We don't need to download
it from external anymore.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcp/dhcp-relay_4.4.2p1.bb                | 83 -------------------
 .../dhcp/dhcp-relay_4.4.3.bb                  | 62 ++++++++++++++
 ...0001-Makefile.am-only-build-dhcrelay.patch |  4 +-
 ...-bind-Makefile.in-disable-backtrace.patch} |  6 +-
 ...ind-version-update-to-latest-version.patch | 30 -------
 ...ind-Makefile.in-regenerate-configure.patch | 30 +++++++
 6 files changed, 97 insertions(+), 118 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
 rename meta-networking/recipes-connectivity/dhcp/files/{0003-bind-Makefile.in-disable-backtrace.patch => 0002-bind-Makefile.in-disable-backtrace.patch} (89%)
 delete mode 100644 meta-networking/recipes-connectivity/dhcp/files/0002-bind-version-update-to-latest-version.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-regenerate-configure.patch

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
deleted file mode 100644
index 8d4be95cf..000000000
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
+++ /dev/null
@@ -1,83 +0,0 @@
-SECTION = "console/network"
-SUMMARY = "Internet Software Consortium DHCP Relay Agent"
-DESCRIPTION = "A DHCP relay agent passes DHCP requests from one \
-LAN to another, so that a DHCP server is not needed on every LAN."
-
-HOMEPAGE = "http://www.isc.org/"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
-
-DEPENDS = "openssl libcap zlib chrpath-replacement-native"
-EXTRANATIVEPATH += "chrpath-native"
-
-SRC_URI = "https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz \
-           https://ftp.isc.org/isc/bind9/9.11.32/bind-9.11.32.tar.gz;name=bind;unpack=0 \
-           file://default-relay \
-           file://init-relay \
-           file://dhcrelay.service \
-           file://0001-Makefile.am-only-build-dhcrelay.patch \
-           file://0002-bind-version-update-to-latest-version.patch \
-           file://0003-bind-Makefile.in-disable-backtrace.patch \
-           "
-
-SRC_URI[md5sum] = "3089a1ebd20a802ec0870ae337d43907"
-SRC_URI[sha256sum] = "b05e04337539545a8faa0d6ac518defc61a07e5aec66a857f455e7f218c85a1a"
-SRC_URI[bind.md5sum] = "0d029dd06ca60c6739c3189c999ef757"
-SRC_URI[bind.sha256sum] = "cbf8cb4b74dd1452d97c3a2a8c625ea346df8516b4b3508ef07443121a591342"
-
-UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
-
-S = "${WORKDIR}/dhcp-4.4.2-P1"
-
-inherit autotools-brokensep systemd
-
-SYSTEMD_SERVICE:${PN} = "dhcrelay.service"
-SYSTEMD_AUTO_ENABLE:${PN} = "disable"
-
-CFLAGS += "-D_GNU_SOURCE -fcommon"
-LDFLAGS:append = " -pthread"
-
-EXTRA_OECONF = "--enable-paranoia \
-                --disable-static \
-                --enable-libtool \
-                --with-randomdev=/dev/random \
-               "
-
-# Enable shared libs per dhcp README
-do_configure:prepend () {
-    cp configure.ac+lt configure.ac
-    cp ${WORKDIR}/bind-9.11.32.tar.gz ${S}/bind/bind.tar.gz
-}
-
-do_compile:prepend() {
-    # Need to unpack this now instead of earlier as do_configure will delete the configure script
-    rm -rf ${S}/bind/bind-9.11.32/
-    tar xf ${S}/bind/bind.tar.gz -C ${S}/bind
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/bind/bind-9.11.32/
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/bind/bind-9.11.32/
-    cp -fpR ${S}/m4/*.m4 ${S}/bind/bind-9.11.32/libtool.m4/
-    rm -rf ${S}/bind/bind-9.11.32/libtool
-    install -m 0755 ${S}/libtool ${S}/bind/bind-9.11.32/
-}
-
-do_install:append () {
-    install -Dm 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
-    install -Dm 0755 ${B}/bind/bind-9.11.32/lib/isccfg/.libs/libisccfg.so.163 ${D}${libdir}/libisccfg.so.163
-    install -Dm 0755 ${B}/bind/bind-9.11.32/lib/dns/.libs/libdns.so.1115 ${D}${libdir}/libdns.so.1115
-    chrpath --delete ${D}${libdir}/libisccfg.so.163
-    chrpath --delete ${D}${libdir}/libdns.so.1115
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
-        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
-        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
-    else
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
-    fi
-}
-
-PARALLEL_MAKE = ""
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
new file mode 100644
index 000000000..92c648708
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
@@ -0,0 +1,62 @@
+SECTION = "console/network"
+SUMMARY = "Internet Software Consortium DHCP Relay Agent"
+DESCRIPTION = "A DHCP relay agent passes DHCP requests from one \
+LAN to another, so that a DHCP server is not needed on every LAN."
+
+HOMEPAGE = "http://www.isc.org/"
+
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c463f4afde26d9eb60f14f50aeb85f8f"
+
+DEPENDS = "openssl libcap zlib"
+
+SRC_URI = "https://downloads.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
+           file://default-relay \
+           file://init-relay \
+           file://dhcrelay.service \
+           file://0001-Makefile.am-only-build-dhcrelay.patch \
+           file://0002-bind-Makefile.in-disable-backtrace.patch \
+           file://0003-bind-Makefile.in-regenerate-configure.patch \
+           "
+
+SRC_URI[sha256sum] = "0e3ec6b4c2a05ec0148874bcd999a66d05518378d77421f607fb0bc9d0135818"
+
+UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
+
+S = "${WORKDIR}/dhcp-${PV}"
+
+inherit autotools-brokensep systemd pkgconfig
+
+SYSTEMD_SERVICE:${PN} = "dhcrelay.service"
+SYSTEMD_AUTO_ENABLE:${PN} = "disable"
+
+CFLAGS += "-D_GNU_SOURCE -fcommon"
+LDFLAGS:append = " -pthread"
+
+EXTRA_OECONF = "--enable-paranoia \
+                --disable-static \
+                --enable-libtool \
+                --with-randomdev=/dev/random \
+               "
+
+# Enable shared libs per dhcp README
+do_configure:prepend () {
+    cp configure.ac+lt configure.ac
+}
+
+do_install:append () {
+    install -Dm 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
+    else
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
+    fi
+}
+
+PARALLEL_MAKE = ""
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
index fed85d2a8..5320d7c9e 100644
--- a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
+++ b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
@@ -1,4 +1,4 @@
-From 17cc080e58894644dd18664ac6f3451096d5f065 Mon Sep 17 00:00:00 2001
+From 4fd67b6adb7c1d8524ba17d1a0b3894f901555a9 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Thu, 13 May 2021 15:23:16 +0800
 Subject: [PATCH] Makefile.am: only build dhcrelay
@@ -26,5 +26,5 @@ index ed692a5..34f9772 100644
  DIST_SUBDIRS = $(SUBDIRS) keama
  
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-disable-backtrace.patch b/meta-networking/recipes-connectivity/dhcp/files/0002-bind-Makefile.in-disable-backtrace.patch
similarity index 89%
rename from meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-disable-backtrace.patch
rename to meta-networking/recipes-connectivity/dhcp/files/0002-bind-Makefile.in-disable-backtrace.patch
index 51520bc62..631a640ec 100644
--- a/meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-disable-backtrace.patch
+++ b/meta-networking/recipes-connectivity/dhcp/files/0002-bind-Makefile.in-disable-backtrace.patch
@@ -1,4 +1,4 @@
-From bc9c5d64ad4829c7830ef70fcaff94470974247c Mon Sep 17 00:00:00 2001
+From 6c6bbfe6b33e5c7e46a4260d656593dbe610fd8a Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Tue, 8 Jun 2021 10:13:57 +0800
 Subject: [PATCH] bind/Makefile.in: disable backtrace
@@ -14,7 +14,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/bind/Makefile.in b/bind/Makefile.in
-index 8fe8883..1058160 100644
+index 2e60091..533d55c 100644
 --- a/bind/Makefile.in
 +++ b/bind/Makefile.in
 @@ -22,7 +22,7 @@ prefix = @prefix@
@@ -27,5 +27,5 @@ index 8fe8883..1058160 100644
  	@BINDLT@ @BINDIOMUX@ @BINDCONFIG@ --enable-full-report
  
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0002-bind-version-update-to-latest-version.patch b/meta-networking/recipes-connectivity/dhcp/files/0002-bind-version-update-to-latest-version.patch
deleted file mode 100644
index 5c7a5f058..000000000
--- a/meta-networking/recipes-connectivity/dhcp/files/0002-bind-version-update-to-latest-version.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From edb68972f8dc636e6208e78f02dec6f9805e4c0b Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 26 May 2021 11:39:00 +0800
-Subject: [PATCH] bind/version: update to latest version
-
-Update the bundled bind from 9.11.14 to 9.11.32.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- bind/version.tmp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bind/version.tmp b/bind/version.tmp
-index cf52f1b..4cc538e 100644
---- a/bind/version.tmp
-+++ b/bind/version.tmp
-@@ -5,7 +5,7 @@ PRODUCT=BIND
- DESCRIPTION="(Extended Support Version)"
- MAJORVER=9
- MINORVER=11
--PATCHVER=14
-+PATCHVER=32
- RELEASETYPE=
- RELEASEVER=
- EXTENSIONS=
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-regenerate-configure.patch b/meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-regenerate-configure.patch
new file mode 100644
index 000000000..71be0276a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-regenerate-configure.patch
@@ -0,0 +1,30 @@
+From 6ca1b224032355521b35471d222d0b09c08369a0 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 27 May 2021 11:38:36 +0800
+Subject: [PATCH] bind/Makefile.in: regenerate configure
+
+Run autogen.sh to regenerate configure.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bind/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bind/Makefile.in b/bind/Makefile.in
+index 533d55c..fdffe15 100644
+--- a/bind/Makefile.in
++++ b/bind/Makefile.in
+@@ -55,7 +55,7 @@ bind1:
+ 	else                                                            \
+ 		echo Configuring BIND libraries for DHCP. ;             \
+ 		rm -rf ${cleandirs} ${cleanfiles} ;                     \
+-		(cd ${bindsrcdir} &&                                    \
++		(cd ${bindsrcdir} && ./autogen.sh &&                    \
+                  ./configure ${bindconfig} > ${binddir}/configure.log); \
+ 	fi
+ 
+-- 
+2.25.1
+
-- 
2.25.1


