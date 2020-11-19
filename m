Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web09.5993.1605771716036161714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 23:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TuCxkqB6;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQBBk+/M2XjoztrG3jUJ85moKw9xT+8WsORTwOFm+FWIdMaHsbCKhHz7663ciLVg3LPYSt99npE0L54WVpCgc4R8z68Zd+TAQSEArmF4FWxsXcyp3cmWftV8iE8IfJlfD4KPIjSoG194bvOagGWWsfHK1fdG6BF/M46CfV/4N+BbSS0J8YtihsJXblOlE3KLpHPV//cqxXGZlp5h4beLEE5xKVw4iVCtwjYx/pt5sbPYZfrqs8sc/PGCOnGJvFSxB1jWKKFy4n1xS1+vo8khWYWWrxAOfuB9cC2qsz+mNpFkuQ0B9erawQX+yDE4OI17D1VDoRgueuD9v92CEENNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJxkw44eSSLhuunzcAo7FlZSt0Q7LGZK9IdsY8TSCmI=;
 b=HOWy/7ys3qU31RXoWn2jCSldOWvrn8ZdRx/hf9pqLsY6WD04R0lOVm+nr9K/6eCOsQJJg2KZ/CvOyQpbncwxnYX8/I6vq0OH//YVkVO29VXd679Vslh3sSDffrpfRRH/5xOdB3bj934IW8q97ah+hQZb3PaeMdqju3CFligxY3EQPWsNQJX1wg4/sMuNEBgnNOVERRKl2HDVQ4DFKnH4ky2elnJbiQD/bpQae1KZb2vF5qVOdJdKx6aGiFCcI71M27kikdxc1INCNAkVafRTpGsz8QcJARq5hIvGSPmDaPAShGJ932A6QZ7Dwy0ofvBiRrhewi0bbP6+Xz6iLBL82Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJxkw44eSSLhuunzcAo7FlZSt0Q7LGZK9IdsY8TSCmI=;
 b=TuCxkqB6MX5SWmYQ87JJeGH8uEIfRSDtsL8bWalhVKz/zsoN5oQgan2hGZKdAAJwOjoNncBkjnt8yth+HHcAb8of9mP6Bvja0iLgpP5FCwtu8dKyayyd/qDD5jpEanpry5BI1UNHMCqJ81XQSIAxuWLW7hDLDduvZYvpJQRtngs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 07:41:54 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 07:41:54 +0000
From: "kai" <kai.kang@windriver.com>
To: schnitzeltony@gmail.com
CC: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 1/4] xfce4-cpufreq-plugin: 1.2.1 -> 1.2.2
Date: Thu, 19 Nov 2020 15:41:31 +0800
Message-ID: <20201119074134.6963-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119074134.6963-1-kai.kang@windriver.com>
References: <20201119074134.6963-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:c9::18) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0031.apcprd03.prod.outlook.com (2603:1096:203:c9::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.11 via Frontend Transport; Thu, 19 Nov 2020 07:41:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a24aa70-573e-4840-9f3b-08d88c5e9596
X-MS-TrafficTypeDiagnostic: SN6PR11MB3055:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB305502DDE5038B5E3A997D9895E00@SN6PR11MB3055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TJmkBen+rlLL+b9YlJ5R+s4HqncqHpmJZCSqJIEjJ3Azv7y8GjubaNzcb8iT+sJALWfrkatlbnRj1ssPPHV/mkWKBlFcwe3oh21aj46aueTNBbcM7BHrxVknD28p4Lh9CNICI8cfkRXhszafdomz2KpFdIn54c34QjmrGLjngJPBQRxqQVRRLMwtl8Qy73ElGLzEPxYU/+2biod/MLqUmbOsn4ac+bpEa4LYKKaaBPcaGSPmCCku6iKN+SmM3x61v/0jXniGuCdxK79QdTNAx3+vn9sz25xBge5DhnNra/BfUNNYrHYZ4I62kHEIK++pb3c8ZXAEcnkDN9eJHege+8FpcDz7ipdpkshZuQ66VOUz6MEIIWoGv99upvgUabVhXeL0MH86GpJ731rlOnan2g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39850400004)(396003)(9686003)(6666004)(8676002)(2616005)(6916009)(6512007)(956004)(6506007)(6486002)(316002)(1076003)(478600001)(8936002)(83380400001)(5660300002)(16526019)(52116002)(186003)(4326008)(66946007)(26005)(66556008)(2906002)(86362001)(36756003)(966005)(66574015)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/IhciWKaEpQNLVaGghQ3LuCF656oPik/zTxBe0gNhblNPHBta9Szc5fD2FJkcjHoDLyWFwkBB5bhA9jXzl078tbBmvujpqAFBdV3MW5M/91lO9N/t/ezVVCd7aBhxQ2cb9orOHWpMhJcAudsp2ZngrY2hXVBARV6cpfH8TfFM0Zt8zyaYoE2hkErabMN5ujbideoV1+4rh7hUNjkyq+0fsle2dxU31bZsiwohGm+yobJbI0O/8yx6Bip6bXqCKK9i5wRJUhDPnU7DZzkGqRFpUkamJ4w7jBGVyVgpoHH2qgekmfDQp3Y1F/PrHnqvdvhQmIW53eWUT6cbBQBlnK4dFXk+hFtTJCQ6+Ge+T6msRlcxTCZK5yOW4GcBFcX3nfFeBrJGFVetQTvBtBbaQ5jmGCx6lo/AgrGT4cIznLpQE1ptivDYP69Q2iluVvPh33Rh2L8ZsClC9czzwHveR+ChvPdMgKoxDgTAQBH1JNo5WSyQsg7yRAdGVgf8IEXiV9ka6NiBIfzd9Nq1EA/8n6mykh+oxw04fICzh96hNT/a1vA+xcf1nrp8F58qTN+Qix1dZPxAAFUxDuMjU+CCXYRmUkgGtCjOeW0G7uOWKyO8o3nqt5cEizwUdRkAf92JYDrQ82qjsDLq/tYsXliZVibcA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a24aa70-573e-4840-9f3b-08d88c5e9596
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 07:41:54.1513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09Flc+lI6DZa7R61AIZspMA2zL0xOFHd7jTt8M+631oqWZiSkqqUEkAT0FwUD4ypmNmDgY2v0gY34B5hkO/vtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3055
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Kai Kang <kai.kang@windriver.com>

1.2.2

- Update URLs and copyright year
- Add basic GitLab pipeline
- Fix compilation with gcc-10
- Update URLs from goodies.x.o to docs.x.o (Bug #16156)
- s/http/https
- Fix build with panel 4.15
- Replace GtkStock buttons
- Rename applet to plugin (Bug #15582)
- Post release tag bump
- Translation Updates

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ry-leak-and-reduce-cpu-load-slightly.patch |  6 ++---
 ...e4-cpufreq-plugin-1.2.1-gcc10-common.patch | 26 ++++++++++++-------
 ...1.2.1.bb =3D> xfce4-cpufreq-plugin_1.2.2.bb} |  4 +--
 3 files changed, 22 insertions(+), 14 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.2.1=
.bb =3D> xfce4-cpufreq-plugin_1.2.2.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0=
001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch b/meta-xfce/recipes-=
panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-=
cpu-load-slightly.patch
index 92a6e8384..ae8bc5279 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix=
-memory-leak-and-reduce-cpu-load-slightly.patch
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix=
-memory-leak-and-reduce-cpu-load-slightly.patch
@@ -18,6 +18,7 @@ Upstream-Status: Submitted [1]
 [1] https://bugzilla.xfce.org/attachment.cgi?id=3D8492
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
+
 ---
  panel-plugin/xfce4-cpufreq-configure.c |  4 ++++
  panel-plugin/xfce4-cpufreq-plugin.c    | 13 +++++++++++--
@@ -109,13 +110,12 @@ index a6895e4..6338698 100644
 +++ b/panel-plugin/xfce4-cpufreq-plugin.h
 @@ -95,6 +95,8 @@ typedef struct
 =20
- CpuFreqPlugin *cpuFreq;
+ extern CpuFreqPlugin *cpuFreq;
 =20
 +GtkCssProvider *currentProvider;
 +
  G_BEGIN_DECLS
 =20
  void
---=20
+---
 2.20.1
-
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/x=
fce4-cpufreq-plugin-1.2.1-gcc10-common.patch b/meta-xfce/recipes-panel-plug=
ins/cpufreq/xfce4-cpufreq-plugin/xfce4-cpufreq-plugin-1.2.1-gcc10-common.pa=
tch
index d5238d00f..95605f83a 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/xfce4-cp=
ufreq-plugin-1.2.1-gcc10-common.patch
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/xfce4-cp=
ufreq-plugin-1.2.1-gcc10-common.patch
@@ -5,26 +5,34 @@ Part of Patch from https://src.fedoraproject.org/rpms/xfc=
e4-cpufreq-plugin/raw/m
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
=20
+Refresh for xfce4-cpufreq-plugin 1.2.2.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ panel-plugin/xfce4-cpufreq-plugin.c | 1 +
+ panel-plugin/xfce4-cpufreq-plugin.h | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/panel-plugin/xfce4-cpufreq-plugin.c b/panel-plugin/xfce4-cpuf=
req-plugin.c
+index 1e33492..ce9e302 100644
 --- a/panel-plugin/xfce4-cpufreq-plugin.c
 +++ b/panel-plugin/xfce4-cpufreq-plugin.c
-@@ -37,7 +37,8 @@
- #include "xfce4-cpufreq-linux.h"
+@@ -38,6 +38,7 @@
  #endif /* __linux__ */
 =20
--
-+CpuFreqPlugin *cpuFreq;
+ CpuFreqPlugin *cpuFreq;
 +GtkCssProvider *currentProvider;
 =20
  void
  cpufreq_label_set_font (void)
+diff --git a/panel-plugin/xfce4-cpufreq-plugin.h b/panel-plugin/xfce4-cpuf=
req-plugin.h
+index 8cd0d33..7dbccef 100644
 --- a/panel-plugin/xfce4-cpufreq-plugin.h
 +++ b/panel-plugin/xfce4-cpufreq-plugin.h
-@@ -93,9 +93,9 @@ typedef struct
-   gint timeoutHandle;
- } CpuFreqPlugin;
+@@ -95,7 +95,7 @@ typedef struct
 =20
--CpuFreqPlugin *cpuFreq;
-+extern CpuFreqPlugin *cpuFreq;
+ extern CpuFreqPlugin *cpuFreq;
 =20
 -GtkCssProvider *currentProvider;
 +extern GtkCssProvider *currentProvider;
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1=
.2.1.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.=
2.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.=
2.1.bb
rename to meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.=
2.bb
index 5dce51b92..3b7b9ec5d 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.1.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1f6f1c0be32491a0=
c8d2915607a28f36"
=20
 inherit xfce-panel-plugin
=20
-SRC_URI[md5sum] =3D "ccd8f0f7aef51bc4caf1049986d9614f"
-SRC_URI[sha256sum] =3D "c5e044c0dc401d2066f208a3df82a588b3e51ff01425f155d0=
a1d0f8fce8f5b5"
+SRC_URI[sha256sum] =3D "500f04b8d857c96da8c8c7a4eecba30a903d0fce6e35a05e67=
4529e43b47e498"
+
 SRC_URI +=3D "file://0001-Fix-memory-leak-and-reduce-cpu-load-slightly.pat=
ch \
             file://xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch \
            "
--=20
2.17.1

