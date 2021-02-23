Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.55])
 by mx.groups.io with SMTP id smtpd.web12.7710.1614073757817071553
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 01:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mz5T43iJ;
 spf=pass (domain: windriver.com, ip: 40.107.223.55, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyCpSisS2/aEDnk7WApjOdgO19YkQhnD8s1u51GGOd7KOGv1tmT3i3lGEpv8JbshoXwElWTJ01o5ONlpnwargG1S7Cu2C+wLCD4WeMX50mLFklfnvTdHMZvfM16TzxIPIivecCFQYPj7f0rQtD+oPWbccQgzm28kejNSkRUwEM8BNztLFiMXnBPMVyWCRrHcsS//1sLvP0sF3yeIxqjeNRFYUoE42IEayI40DQfW/v/rNhWaQMU9ojC8xnmuAvYWv9uIIuPSGqCEqW4zqKEwvVZTOrMurp0ihDQUsTUQN3+KfwsDt3ihoR10ANjb4BkAHO6Pvb5mpNZYYlWMD1AwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rolDL9hv3b9/5bAv37CYTtXF5iR2JMA26rEkLyzDKTg=;
 b=RtLAoWz+xs7tiWHnfovGNydkIgbLKVeQJDelA5OYq2l4VQX2woSsCSgJzmww/3nZWal7eRoNlfl+BXGPYw4i3Etot/7OKDzClZY01I2tx7/n3N8IsSiKQooVwaCinpv6FlEQ53mWgScS6FFgPbY1gUYowFfpHk30CucA2vdmSqQEaV0oIKBdGqyga5NmFkW8/owT+PO4khqYeFTod8zWne7V57v/TCzk48YJ+bdCaLK5dUs96dcFkoefChZ/VoCu9n+XKF9WMjOO9r9pj7wiLqyTPpSqy1R4T32+1BfjAqE7ZnccZNhjLZNRXPsdZv/O7CyXUvOmUb0hTbprT8V7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rolDL9hv3b9/5bAv37CYTtXF5iR2JMA26rEkLyzDKTg=;
 b=mz5T43iJzOgUuc0u1cSKOlzMqnJ7WGsv/blfXlEriDUGJ+JJicp94rMLFMWowXp9L8wyy50dM74wkMdXKoXjgBjovwSzJQLj+eGikj2Ed4WdF2LUrue8IuRqbhB0e5UNFpHspj6YrQSVgQZYqySttBc2rDoev3443M0+SM2A49w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 09:49:14 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3868.032; Tue, 23 Feb 2021
 09:49:14 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gtkmm3: use relative path
Date: Tue, 23 Feb 2021 17:48:57 +0800
Message-ID: <20210223094857.23069-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR01CA0069.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 09:49:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8118c13b-4320-4977-b34a-08d8d7e04767
X-MS-TrafficTypeDiagnostic: MW3PR11MB4698:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB46981E628548B231D20FAB93F1809@MW3PR11MB4698.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FK+13ae+1+qw62t4SJLQL1LPbwbxK2xKmXAAvhAcus5HTnqfvXvTKnsHQacTg1zmD3Xfx1C0oI8oce5hACanlIrpA/Q2bWWbfFnu5oTftsL9VbpC2BvkYeqVvc63rvIvakXVlFsgWPkn8Hn3NehdJHCd1lC8w7TT1BsrPa44DjRB+iRj9fxdldoJrS0GrXftgyqSPUIdpwlj75YtVncL9oC9BJadBIB1aRNpHtN/9nU0XNrFumcrVT1OyCTMyzote7X/YzAWp6zN7Oh5zlkxZb2Ky13fBhlyXML3EgJIua4jGjtHVv4OULtGr9+nXO5M4hH835+hh1R2V4tG0MfSzx0LVpWsa8m70tqrbZkDOvOVRLdWOHocMuPnX2J7na/7dH/jrhgIn+RqbPopbZcTg40VdPWFzvpVctzc/7QX3HOsqAjxMjN4pox7eXTzUSNLGDwYYWc2mbxqEdFhuaifawzzQHnwILqtGF3nz3pwFkJBrYzxgwGD2cM+m33IOGOuC/uEJqt6/T8el54aqUjmN2Deru6yZcmWhKybM9YmuBxuALbiOVlQET62C/dxyua7Uz7gdWJu1Tv0CQKrYsvXfXWirN8O8Exomv89R4i95hc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(366004)(136003)(396003)(8936002)(16526019)(2616005)(956004)(478600001)(26005)(52116002)(8676002)(6666004)(83380400001)(66946007)(66476007)(6916009)(186003)(36756003)(316002)(66556008)(6506007)(1076003)(9686003)(6486002)(2906002)(5660300002)(86362001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZXzlOI4BV3LVHdvH7MqhUWSE+XNGjPUZYQ/HkMs8qzTlgy4uzkyVGKgsh3xs?=
 =?us-ascii?Q?4KLyRbIH8wdMDheczWWBulRFT+1pZKGAVHRJR8WDhyEK4BbvOj+JWqOGI5XS?=
 =?us-ascii?Q?JCPESIcPKEq94j/7zgGNRAhzq9nt0jaPuiesdO2Pslbx6GVgCNYnw118MFoz?=
 =?us-ascii?Q?0DljeYdSfyO266+UfGzR0xtbaKuzH5wmRJFj+nwjt6bxIYWIX+MjV9GTgPFp?=
 =?us-ascii?Q?EqnUPdicjcRKkP5eNPLOn5VujUu+4JzNNlC2aBTlocjO33iKtFYf5cBhrAS0?=
 =?us-ascii?Q?MtSMFnT93xtJ7ol2YQnWfp5VZ4pJnvKYr786f8R5jmOM3rIem45Eu7BW4e8A?=
 =?us-ascii?Q?1XRAwx8EWXHFITN/dT0VITmzeRO4bglFjikCaPGUldMVFMena2lfDAB6ZWdj?=
 =?us-ascii?Q?77t6qzo0qEaXMKbUVj5wtFXC9b/YYPeQuiMxfqfk2WAGACvmqRxPj1ZEn7ns?=
 =?us-ascii?Q?3TyQHbnN3OdXev4DeUFilh8x9qBaAr4lnKMyiP4JTTNIZsNC9KKzvnY5o3rZ?=
 =?us-ascii?Q?EqtPmtjMGHQYvmnbbDdk8TB5+hCFDhZLriJWYvOnLumJKQXXSEHJQPEfPo3e?=
 =?us-ascii?Q?tqOtidPB7CuUscsy6iS+GFA/QBT6zv7BjtJgr/7UB+t3QhWrUxn1tbIwhsyF?=
 =?us-ascii?Q?QL9hs3DvRQoEGbrjGeJrzdrCt+XY5hU6Nb5vBsRlUcvI2Gokh/TViLW2wm+z?=
 =?us-ascii?Q?KMXGkI49/R43DZh4z/6wCQ3hZ1H6TgSynY6QS4zKBG5QK/Cfaw+8qrjWYpMp?=
 =?us-ascii?Q?0Fug8l8UB8aCeGBZefRCQlxiOqCoqBZiA8JZB1fhKoJ/tO4pQapUCnpU+vRc?=
 =?us-ascii?Q?oxaGTk4TL+6XjQ1QNwqBFLibogC0bYJuTFGPq5qs3MLRZ3WbCcb3X9UEWiOh?=
 =?us-ascii?Q?kjt3vWsqwhNs5Qd+iAwu4x39F6Zmv64KJgtROU86ZVcGXsGGBNAirmddhLYk?=
 =?us-ascii?Q?AnbVA932GwAkXPfOyYeOVOcPl7rwX0L6SzeM5sGG0n/YlHXEC+M9vgE4ZZzD?=
 =?us-ascii?Q?R9ImAxELG2tP+AGhen01XWi/z4wGWu+MTG5jLCOr+i5bcslaU5J2VTFXeDE7?=
 =?us-ascii?Q?aYuVQotfKWc7nrOxJFwqi4WFm2Wv48vhk02lnH/hwGeE395hn9685aLUzEe7?=
 =?us-ascii?Q?swhqsGSLcL4NItHlV1yc8fbILclHITAjTJtXqPagHf/gQEBYw5t9QQgSS9l3?=
 =?us-ascii?Q?UVB1qMuAYvM79NQUzduJ5tKPPHhH/T/7RTEM5QQyrFjb0muVDMXd5wfLt7JQ?=
 =?us-ascii?Q?iWVsxsbgLLiKd2mcZeNBcFC6rWKkx2a0UfnkLvCU4Rv1Cw8qgTsf2FUd/aX9?=
 =?us-ascii?Q?YnJEx0X3Ewry01M/0hZyk9vD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8118c13b-4320-4977-b34a-08d8d7e04767
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 09:49:14.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOcnE1bg4+BKwD4WuBSoILQypq9vuj29ODTxmvi6UBA4Ae1EoS+YdNs8BXT1SbNrmKdNDvL80cWnRMrsR83CAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
Fatal error: can't create
gdk/gdkmm/libgdkmm-3.0.so.1.1.0.p/_buildarea1_master-wr_build_Userspace_aut=
o-usrmerge_standalone_usrmerge_next_210222_lxbuilds_Har12345_platform_up_in=
tel-x86-64-standard-glibc-std_wrlinux_build_tmp-glibc_work_corei7-64-wrs-li=
nux_gtkmm3_3.24.3-r0_gtkmm-3.24.3_untracked_gdk_gdkmm_timecoord.cc.o: File =
name too long

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-meson.build-use-relative-path.patch  | 52 +++++++++++++++++++
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb   |  3 ++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-r=
elative-path.patch

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative=
-path.patch b/meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relativ=
e-path.patch
new file mode 100644
index 000000000..46a691643
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative-path.p=
atch
@@ -0,0 +1,52 @@
+From 152d295a28567ac87b0e6db2e62c0d914b1d7ef9 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 23 Feb 2021 08:47:54 +0000
+Subject: [PATCH] meson.build: use relative path
+
+Fixes:
+Fatal error: can't create
+gdk/gdkmm/libgdkmm-3.0.so.1.1.0.p/_buildarea1_master-wr_build_Userspace_au=
to-usrmerge_standalone_usrmerge_next_210222_lxbuilds_Har12345_platform_up_i=
ntel-x86-64-standard-glibc-std_wrlinux_build_tmp-glibc_work_corei7-64-wrs-l=
inux_gtkmm3_3.24.3-r0_gtkmm-3.24.3_untracked_gdk_gdkmm_timecoord.cc.o: File=
 name too long
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtkmm/-/merge_r=
equests/61]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ gdk/gdkmm/meson.build | 4 ++--
+ gtk/gtkmm/meson.build | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gdk/gdkmm/meson.build b/gdk/gdkmm/meson.build
+index afccaea..240ce4d 100644
+--- a/gdk/gdkmm/meson.build
++++ b/gdk/gdkmm/meson.build
+@@ -200,9 +200,9 @@ else # not maintainer_mode
+     gdkmm_hg_ccg_basenames,
+   )
+=20
+-  built_cc_files =3D [ src_untracked_gdkmm / 'wrap_init.cc' ]
++  built_cc_files =3D [ '../..' / untracked_gdkmm / 'wrap_init.cc' ]
+   foreach file : gdkmm_used_hg_ccg_basenames
+-    built_cc_files +=3D src_untracked_gdkmm / file + '.cc'
++    built_cc_files +=3D '../..' / untracked_gdkmm / file + '.cc'
+   endforeach
+=20
+   gdk_gen_sources =3D built_cc_files
+diff --git a/gtk/gtkmm/meson.build b/gtk/gtkmm/meson.build
+index ab96a22..cc0c050 100644
+--- a/gtk/gtkmm/meson.build
++++ b/gtk/gtkmm/meson.build
+@@ -464,9 +464,9 @@ else # not maintainer_mode
+     gtkmm_hg_ccg_basenames,
+   )
+=20
+-  built_cc_files =3D [ src_untracked_gtkmm / 'wrap_init.cc' ]
++  built_cc_files =3D [ '../..' / untracked_gtkmm / 'wrap_init.cc' ]
+   foreach file : gtkmm_used_hg_ccg_basenames
+-    built_cc_files +=3D src_untracked_gtkmm / file + '.cc'
++    built_cc_files +=3D '../..' / untracked_gtkmm / file + '.cc'
+   endforeach
+=20
+   gtk_gen_sources =3D built_cc_files
+--=20
+2.29.2
+
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb b/meta-oe/recipes-=
gnome/gtk+/gtkmm3_3.24.3.bb
index f9ca7fd4b..1648e37fa 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
@@ -16,6 +16,9 @@ inherit gnomebase features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
+SRC_URI +=3D "file://0001-meson.build-use-relative-path.patch \
+"
+
 SRC_URI[archive.sha256sum] =3D "60497c4f7f354c3bd2557485f0254f8b7b4cf4bebc=
9fee0be26a77744eacd435"
=20
 EXTRA_OEMESON =3D "-Dbuild-demos=3Dfalse"
--=20
2.29.2

