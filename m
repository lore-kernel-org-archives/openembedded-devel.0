Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.55])
 by mx.groups.io with SMTP id smtpd.web10.5560.1614318140945198506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Feb 2021 21:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YAfiGqh+;
 spf=pass (domain: windriver.com, ip: 40.107.92.55, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTHIvTKpT+4EXXo0yjbouIyIcpvpx67pPl7R1sDkJ4FsdKJiFJCQsPaO48Ibj5KspBTFRDS0UWbJ877mEToqu6wKRdQtJu36AQ5DcVI12fga/srEm4BFZetCmD3FLr36VWDevFOCj+bM+pMCephhcVYfpJtnL9/j3iZXIUM8ryInVKk48pREWcQ5lMb2mrTKh/S/xYT8r7lny+9lpmeymGcocpbZTbKLSde/RIWQntPu7tZBlKRGxp7Nj7+BvqLPEv9gh7/pqy1EW+U932AIwrH95cxy7WNu0RV0X1e+wYm5sNkvRqtWQrJz/3RgXWXzXv9+9nSzvC9g/SiVahJH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2i1lSmdlOh/L+bIMvechui+VfDvqoSzMvZ+6R3baXk=;
 b=jQ3CXGr+TNpbc7qgwxI/KGoHgL2bszMdrFA0WkpkqNJVNxyM9P5oYPh/lMKG2U4wO2ZIMMazBxvsONrzd1O0RhQJR81Rwg7cMIx3D5TabLqVfbgogExys4aKC48OZPNi+TTY0nKWHdFNzjI81RiDSjl8gre7TateHZx473FChidD57nPfew2zpEoOe/p2IeaiEKgoy+lcI1BMjbju20b/L+eUrCf8iEV9+Fsx88ESKWDf2rcUD51x4W7PPSG+CeEH/S/88KE9qDQRkMyIjCN/GJtJPH4x/CqgUpWRHGfLYpTNCoRYXiHJheVIkriNNAGWrjPsE7igkY62bwKsY+s0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2i1lSmdlOh/L+bIMvechui+VfDvqoSzMvZ+6R3baXk=;
 b=YAfiGqh+5oLYR243ceJDViq4TCFesAwIXg0JdkrBqB47l7h8EBx/VmwJeRUF0afjYXe5gILSosDjPcU2ddISqo8imN43k/6u6F7VB7BW9G/a6QP/Isi5k/DP8VHUoIe63OVE5WA9t/YnQkCjw0DjEgrcCDDYJEBzxH9HmelKgnk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 05:42:19 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3890.022; Fri, 26 Feb 2021
 05:42:19 +0000
Subject: Re: [oe] [meta-oe][PATCH] gtkmm3: use relative path
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <1666578821C37A0A.6890@lists.openembedded.org>
Message-ID: <0ea1a639-a706-9c92-6031-961ae387323f@windriver.com>
Date: Fri, 26 Feb 2021 13:40:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1666578821C37A0A.6890@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR02CA0148.apcprd02.prod.outlook.com (2603:1096:202:16::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 05:42:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d59cf1d8-6cd2-45e7-e183-08d8da1947fa
X-MS-TrafficTypeDiagnostic: MW3PR11MB4602:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4602D3FCFAE886804EB59D2FF19D9@MW3PR11MB4602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QcJDEZ1GmJwe0STRMcRM8QCHTkfmd8nJb1MueBJNdlTcRJziVaVnlVZrA2EoofEher52rhMuebDZmvcyzYHX+uLZV6HCmyEtY1RoLOO5OJ0QH1fS9l6iUrrXLJbNkwcinbAA63flGx5ihfk5tr89ReJrpA4DaIFfBmR3UL8nLncUfEIPvPdgp1fOSwtMqwdTzaZE/jrU6DdY1iNXm778SPYrwNYOQ+W9CNF5yguWw/ldTT/r3XPlfS9nsqJLchS78/4IcKbFl7k1kAheBbMU+0k6DM3M8j4ampukHD9nKqI90j10vEErQ6Nx7sczRMsLSIaiGUWSP44GRkxWQe2wKIYRGO8SNWWYATr02XMxwkYThgaQ5LcOwAB7ujjmCze4YoHUVUVrVhHYc3P1oyb5oxNPNBfqDHwAkzZtT0LB7O7Q6vIadJ97cYU5ELiiGCVugtfFIs7GJ41Nzb/2zjIsutKlU+e5Ua7V+7NHymCDKtLJ3gpjGiy8e5hMMw8TwvVUlHJut/fbXof0OG9MGmq6W4/YD7Csk0qZ1JE2JQZ6g/j8hG6lJpBDUkHe5E96m8OVy84z7jO7NYYzlbruwQGDDsNPF23neyOPfQkU+2lMZSEBaB2vLzhO4vcOL0KozE8MUlM1eH960yzZpCZzEqNs85AD8P9X74IzPm97LqyC1/dpleKsajbli+g0v35lc3rA1c/XfAM/V7Y+A6btWKsgnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(366004)(136003)(31686004)(8936002)(16576012)(478600001)(6706004)(6666004)(53546011)(83380400001)(8676002)(6916009)(52116002)(316002)(86362001)(36756003)(66476007)(2906002)(66946007)(2616005)(5660300002)(66556008)(956004)(26005)(31696002)(966005)(186003)(6486002)(16526019)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?V3k2OENsMkpNTDMzZGxPMGNOWVIvbkxKY1JDWXJQY090ckNGc2FKcGE2VzJl?=
 =?utf-8?B?c1NqZnpXTjBGb0xaN1hxTVpwcEVpektIZUNVRmEyUzhLbW16cE5ZeVlvMDk3?=
 =?utf-8?B?Z1p4TUZwbnR3Q2M4MlFaM1dIL3I0Tk5DV01wYTZDMEVUQ3ZrZERWOEFpOUNI?=
 =?utf-8?B?Nk1mMkp5S3dKSXp5cEgxTlpvc2JKbU02S04zc1VDdE5vVUxuY0g3SVUydWZz?=
 =?utf-8?B?SGQzRnVicUZFZlM5T1k2T2JOMVNHckdFV0NxZTA4YjNWbktYUGhRVmFZU2NE?=
 =?utf-8?B?TldtNC9tNTlsQ3JjRUNTV2J4bHpNbk9MYndUSWhENWhOcGVROU1MdGcxREhh?=
 =?utf-8?B?SFoyWktVTWVNU25wWnlraS9DWWFLTHA3eDBGTjc2TTF3SFdSQXZYRFZQL0Vo?=
 =?utf-8?B?dmswc3ZKRkhkTkpMYnEzeGEycWFlaEwzMnQrN0dvdzJwNkI3TElHUGcyd3J4?=
 =?utf-8?B?dHliUGxJaXFJbEJVa2lqQWJ0SWxkdjdnUTVWbzhHbU1XUEdDSUFUZ2dsU3Jz?=
 =?utf-8?B?dGU5cFA5by9VODJmNllMcWxna05SSS94T3VIVDUxMVdYeWpRZjdKeCt0b3Z6?=
 =?utf-8?B?a0tzMEFuR1Q0T1MvK0dnOXhsdDNNbVB1OHhQa1NiVEZnOXBIbzRSNUNHSStI?=
 =?utf-8?B?bWJnZzh1L24zaFAzZ1BrYWVsWFNwSjhEMGlPNkM0SmM1SkViYzNrVDN4MU91?=
 =?utf-8?B?bGVqK1FVL3lZUytuWTZZSTVzWEREWGgrbHBRWXZIcWMrb24rNHFsOGN2aHFo?=
 =?utf-8?B?Vllodm1hVlNhQ2pCSUxuU2FvN0hYSHRTZWpxS0EzQmlJM2diTDFWS2lWZnNq?=
 =?utf-8?B?L05SWUR2L3pFcWM3LzB0cEhHWjFsNiswZjZNQ21jRWNlemVLUmI2S2NScmhQ?=
 =?utf-8?B?WFEyZnpBRVZ0MUQ2bS9ZaVJXVGRQc05tSE9UalBreTZLTk8rcldGbFhiTk0x?=
 =?utf-8?B?d2YwZ2MwVEg4MndPcjUrVUR3ZnZaNitVKzRNNThPcFN4MThiS2toeU1PT0Zl?=
 =?utf-8?B?YlV4cGVpYWFQVVlJclFzTW1sbmowNnU3amZ5NjQwMnpwUGt4MnltZHphc1Q2?=
 =?utf-8?B?ZkJ0UURNb09HWVEvc0RnUytGS05ZTWdJcXJmRGR6YXU1RnFDY2w1cUJyci8y?=
 =?utf-8?B?ZU9vVzBzL3puejM5b0hsN3BNbUp4elJnNU1EUkRPK3Z3R2hydVJON05pUVcw?=
 =?utf-8?B?S2xDTFRobHlaVFJNTzNkZU1ySG1kd2prOUx1aFpFeHYxM3ZOK01lS2lDMVZq?=
 =?utf-8?B?YnFaSTlWUEY4YlpyNDRsd3RNbjc0SVFvZmViLysvdzUzeFU0c050RmRpNllj?=
 =?utf-8?B?N0ltOW16LzJXbHZuVjEvRzh4QmZET3lHbDdXQU90WGZSQlI0N2RjbmZBQ3VW?=
 =?utf-8?B?TytxNGJqYWxnWTEzZ05tc2prUWVpZzR3Kzg5ZlNPRVdJMmlJSUFLZFRQRC9R?=
 =?utf-8?B?WFZqQmdnNzhSbFA2L1lrZlc2VlBqcUhrNFIxY21lbTdrNEVKeGIyWXRFMUNs?=
 =?utf-8?B?QTdIcXF2dlF1MkhxTXhmVzh2ZnpXT09EQVRpU3pxSTNDSjh3eThKMFZuNm9C?=
 =?utf-8?B?MXQrTmVOcGtFTTN1dm9hNnpvVFBoUE9Dbk52UmRmcXVUSnlmbzgzMU5wdXpH?=
 =?utf-8?B?QnB0dFdjelhKT0drMlVCd29xd2g2UldQTmk3UTJoQktwYlYrWFdtbzBuTlFm?=
 =?utf-8?B?SDNMNUdEbm1uVFJxTHEvaFhzMW9vRTM2OFE4R2J3ZEpDWFhKSXNqeGRwOHl6?=
 =?utf-8?Q?EPFRS2XelRVjE52RN0jqddKGgRauClrv9S7RMLN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59cf1d8-6cd2-45e7-e183-08d8da1947fa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 05:42:19.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zF1tCCyGBfAyrhok0PXr/fBwJ3p1pKsGH/eILR/aXpAK8/sltvXmeuxXez70EXNc+o0b+T/6LYnH6zu9FbR+/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 2/23/21 5:48 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fixes:
> Fatal error: can't create
> gdk/gdkmm/libgdkmm-3.0.so.1.1.0.p/_buildarea1_master-wr_build_Userspace_auto-usrmerge_standalone_usrmerge_next_210222_lxbuilds_Har12345_platform_up_intel-x86-64-standard-glibc-std_wrlinux_build_tmp-glibc_work_corei7-64-wrs-linux_gtkmm3_3.24.3-r0_gtkmm-3.24.3_untracked_gdk_gdkmm_timecoord.cc.o: File name too long
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../0001-meson.build-use-relative-path.patch  | 52 +++++++++++++++++++
>   meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb   |  3 ++
>   2 files changed, 55 insertions(+)
>   create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative-path.patch
> 
> diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative-path.patch b/meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative-path.patch
> new file mode 100644
> index 000000000..46a691643
> --- /dev/null
> +++ b/meta-oe/recipes-gnome/gtk+/gtkmm/0001-meson.build-use-relative-path.patch
> @@ -0,0 +1,52 @@
> +From 152d295a28567ac87b0e6db2e62c0d914b1d7ef9 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Tue, 23 Feb 2021 08:47:54 +0000
> +Subject: [PATCH] meson.build: use relative path
> +
> +Fixes:
> +Fatal error: can't create
> +gdk/gdkmm/libgdkmm-3.0.so.1.1.0.p/_buildarea1_master-wr_build_Userspace_auto-usrmerge_standalone_usrmerge_next_210222_lxbuilds_Har12345_platform_up_intel-x86-64-standard-glibc-std_wrlinux_build_tmp-glibc_work_corei7-64-wrs-linux_gtkmm3_3.24.3-r0_gtkmm-3.24.3_untracked_gdk_gdkmm_timecoord.cc.o: File name too long
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtkmm/-/merge_requests/61]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + gdk/gdkmm/meson.build | 4 ++--
> + gtk/gtkmm/meson.build | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/gdk/gdkmm/meson.build b/gdk/gdkmm/meson.build
> +index afccaea..240ce4d 100644
> +--- a/gdk/gdkmm/meson.build
> ++++ b/gdk/gdkmm/meson.build
> +@@ -200,9 +200,9 @@ else # not maintainer_mode
> +     gdkmm_hg_ccg_basenames,
> +   )
> +
> +-  built_cc_files = [ src_untracked_gdkmm / 'wrap_init.cc' ]
> ++  built_cc_files = [ '../..' / untracked_gdkmm / 'wrap_init.cc' ]
> +   foreach file : gdkmm_used_hg_ccg_basenames
> +-    built_cc_files += src_untracked_gdkmm / file + '.cc'
> ++    built_cc_files += '../..' / untracked_gdkmm / file + '.cc'
> +   endforeach
> +
> +   gdk_gen_sources = built_cc_files
> +diff --git a/gtk/gtkmm/meson.build b/gtk/gtkmm/meson.build
> +index ab96a22..cc0c050 100644
> +--- a/gtk/gtkmm/meson.build
> ++++ b/gtk/gtkmm/meson.build
> +@@ -464,9 +464,9 @@ else # not maintainer_mode
> +     gtkmm_hg_ccg_basenames,
> +   )
> +
> +-  built_cc_files = [ src_untracked_gtkmm / 'wrap_init.cc' ]
> ++  built_cc_files = [ '../..' / untracked_gtkmm / 'wrap_init.cc' ]
> +   foreach file : gtkmm_used_hg_ccg_basenames
> +-    built_cc_files += src_untracked_gtkmm / file + '.cc'
> ++    built_cc_files += '../..' / untracked_gtkmm / file + '.cc'
> +   endforeach
> +
> +   gtk_gen_sources = built_cc_files
> +--
> +2.29.2
> +
> diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
> index f9ca7fd4b..1648e37fa 100644
> --- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
> +++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.3.bb
> @@ -16,6 +16,9 @@ inherit gnomebase features_check
>   
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
> +SRC_URI += "file://0001-meson.build-use-relative-path.patch \
> +"
> +
>   SRC_URI[archive.sha256sum] = "60497c4f7f354c3bd2557485f0254f8b7b4cf4bebc9fee0be26a77744eacd435"
>   
>   EXTRA_OEMESON = "-Dbuild-demos=false"
> 
> 
> 
> 
> 
