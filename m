Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.63])
 by mx.groups.io with SMTP id smtpd.web12.9541.1618384470677211556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 00:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Co9Cp/3k;
 spf=pass (domain: windriver.com, ip: 40.107.236.63, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xk/xdxC/5WouBGmzgZRqmcTFDOad1KdwnAWm6cUcirezuNoE2LBtIs52vnZQe1eB7EaKy/ePRPVZP0KeV4lCVmb/g+qBN9t8RQmi+IzKUHE1RXWH3OIB48vJQkCffgLBsi1D/IXl8jTvVnSWqffDp5XbNpAvoGSRg2o4xCC1uf+4OhDtjrrrlzG4zTS0EmdICfNtBw0rq1o7c0tsicjxpaY/wMWJcR9KNpIQ/oub5WvWp5tRUU0i5hIBMZPV9wluL6/HNl/sD/8VjRf5HhgixHcw69kPeSPMfL/hQbPeTJ3E3g9uu07lV7og812jg2zWGxzBe8Fv83PZXIAATUZUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcJzhNnqczaE3gn6vYJBxOKzC8/F/u+FhdGxaFaBFqs=;
 b=ncyUcSRQraAbm4Eb9QipXBl53Lk0MX0K/0sePfH3gU71HBGQf+qJhHFNOCflACMzl98MxXLW2kAzlTlbWfeXytc59f1d/T1qzcfSvCI09+YsTrMoG1SPlzxazdZMgeCExGfdnGqkFZceAmx4l9mZdRDmwUp0bhf2wYD19dDlXsAHMl5XkzdXEb/YowoFM4n7pusLfMOj+XgrxR8kcHzCAKaprCCj/FSAyNwhBDZp48Tz+D86zJ6OvgHHiJ2YOAGsJm30ro+9UmyJp8YJHbsrryUByPorsRG2rWgQOsH0yc6PbekXakAqlzEOFQTOPoy8Fwft4lwH0t+UQJSgqnD99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcJzhNnqczaE3gn6vYJBxOKzC8/F/u+FhdGxaFaBFqs=;
 b=Co9Cp/3kdhnLzOGJ4e2eiF3r2vuetnnmHUfip7o5iD0YOU0v6x1tnf3CERKS0XNPKd8MpWNfiOxP2UV50vxt6bja1+I+yNCHnKiul/7O82f8AHNtgj8U++O7+3fcg0vvVwVZ4c2zcvMevvU03FpZrR9b3TRXccSiGTi5bvgV/l0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB3915.namprd11.prod.outlook.com (2603:10b6:5:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 07:14:27 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::1ab:d368:441c:ba35]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::1ab:d368:441c:ba35%4]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 07:14:27 +0000
Subject: Re: [oe] [meta-oe][PATCH V2] debootstrap: 1.0.67 -> 1.0.123
From: "hongxu" <hongxu.jia@windriver.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <1673D172AFE69FE8.16683@lists.openembedded.org>
Message-ID: <d5254673-4080-8609-afc1-e5657a06dba2@windriver.com>
Date: Wed, 14 Apr 2021 15:14:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <1673D172AFE69FE8.16683@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::19) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.131] (60.247.85.82) by HK2P15301CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.1 via Frontend Transport; Wed, 14 Apr 2021 07:14:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 549755df-eb69-4a9d-038e-08d8ff14ef94
X-MS-TrafficTypeDiagnostic: DM6PR11MB3915:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB39158406513511F7C09F8B0C944E9@DM6PR11MB3915.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:56;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wjGJfRL5uNRN/Sr50MieH5mnfW4jexg/3PD2xwGkNeKxA7taudSdpk3WRoxnduMktzgCNG/vlWDJRq71B6dzmKXU4W7iH3owbblk3bkqttopizeffSjTKMiyeL3X4+mpCt2wLMroafw4AzSWbvV1orVWel+2BPbcGnplr/Zkn/TsY7F9lCkLVLZ5Jr98zi9A1PxMrv1/aE+fi4Rm4Msw9qYsr8Phxa86fRsz1QQpjeC8tNfppl/XYr3rXgDuUQnf76MG+WuHIYOBsY+aL80s7Zt7dwxEtYH+OOv5ZhWqw+NmsDd8vJmT69hWCbJ1cfGPlmd9JoYC26zrpdoGpEGvRf4lfVtS/qEHu8+aWeUSilFv1UbnyBeTeyjucDN8o5UKvW7ug+p3h15VlzDDScVicbiTmt/Za7n2Ooly2u7lfraypHJ09u+ekBZKvzT3VV8Q8WzyOVgstVr1lsyln3f1FlEUo9baRVpjJCKsjOdjIRam3pCX9XktuNdD+Iw5G5ukF8ludYlmuV1D78U8KB8ARGwnLF+hZLzlwWwuIWyolxp6cAl/hST46nMb0l3kHAIlfqMNWOLYQinpPGFTrbCVgkXsc7D3yF/gv+mdYqCjgTpRkQ5RcvfrQkr4wx8sLFu2LVBOpAu6eUdjyNKSV6+tZ3t/4mM3pvvhvMB3uKem+xBgesMkwMoSrZjPXnDTMgONqbfNYIDhA0ZHTwKy23IuanU2vzFnFXL+Hwbg6K7zSVD4GplHJxfkUd2tEjCyYlhL4yrCksnLat8HLvuBEPnvQkrCTcpJ67WR2SqdLfdNEhirLldtfGD8y9A5nhMSqVu1Jya+SgtEkquJ7O20NjJXJzDncLViVcX/cmKiSffLThY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(346002)(376002)(2616005)(956004)(6706004)(6916009)(2906002)(8676002)(30864003)(316002)(8936002)(4326008)(52116002)(16576012)(38350700002)(38100700002)(44832011)(33964004)(186003)(6486002)(31686004)(478600001)(16526019)(6666004)(166002)(53546011)(36756003)(83380400001)(26005)(966005)(5660300002)(31696002)(86362001)(66946007)(66476007)(66556008)(1910800001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	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
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549755df-eb69-4a9d-038e-08d8ff14ef94
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 07:14:27.2099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAwhrkGInIf6SiYgcft5dVGv/KKxyU6Gwag9ba/7TNRNsYsij2271ZQagt+43eFe9rN1f5KmFmcSpRN4QbFG4Z6+s8HqnuGDjNngXH/kqQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3915
Content-Type: multipart/alternative;
 boundary="------------ED16FF7FFFD85BC6F924A64A"
Content-Language: en-US

--------------ED16FF7FFFD85BC6F924A64A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping

//Hongxu
On 4/8/21 3:29 PM, hongxu wrote:
> - Excise all devices.tar.gz code
>
> - Use yocto vars to override hardcoded dir to support native and nativesdk
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...t-to-override-usr-sbin-and-usr-share.patch |  41 +++++++++++++++
>   ...upport-to-override-usr-bin-arch-test.patch |  47 ++++++++++++++++++
>   .../debootstrap/debootstrap/devices.tar.gz    | Bin 767 -> 0 bytes
>   .../debootstrap/debootstrap_1.0.123.bb        |  23 +++++++++
>   .../debootstrap/debootstrap_1.0.67.bb         |  35 -------------
>   5 files changed, 111 insertions(+), 35 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
>   create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
>   delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
>   create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
>   delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
>
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
> new file mode 100644
> index 000000000..12dd23810
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
> @@ -0,0 +1,41 @@
> +From 87d0174e8d56e7458dc94f05f82ab7a67a5cf7d0 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 8 Apr 2021 14:06:05 +0800
> +Subject: [PATCH 1/2] support to override /usr/sbin and /usr/share
> +
> +Upstream-Status: Submitted [https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Makefile | 12 +++++++-----
> + 1 file changed, 7 insertions(+), 5 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 8516803..a2d8c00 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -5,14 +5,16 @@ all:
> +
> + clean:
> +
> +-DSDIR=$(DESTDIR)/usr/share/debootstrap
> ++datadir ?= "/usr/share"
> ++sbindir ?= "/usr/sbin"
> ++DSDIR=$(DESTDIR)${datadir}/debootstrap
> + install:
> + 	mkdir -p $(DSDIR)/scripts
> +-	mkdir -p $(DESTDIR)/usr/sbin
> ++	mkdir -p $(DESTDIR)$(sbindir)
> +
> + 	cp -a scripts/* $(DSDIR)/scripts/
> + 	install -o root -g root -m 0644 functions $(DSDIR)/
> +
> +-	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)/usr/sbin/debootstrap
> +-	chown root:root $(DESTDIR)/usr/sbin/debootstrap
> +-	chmod 0755 $(DESTDIR)/usr/sbin/debootstrap
> ++	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)$(sbindir)/debootstrap
> ++	chown root:root $(DESTDIR)$(sbindir)/debootstrap
> ++	chmod 0755 $(DESTDIR)$(sbindir)/debootstrap
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
> new file mode 100644
> index 000000000..69329df4e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
> @@ -0,0 +1,47 @@
> +From f0420b201f2fb5286ccf5657faa6b38cd2680e10 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 8 Apr 2021 14:08:06 +0800
> +Subject: [PATCH 2/2] support to override /usr/bin/arch-test
> +
> +Upstream-Status: Submitted [https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + debootstrap | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/debootstrap b/debootstrap
> +index 9b9e58d..a3cf3af 100755
> +--- a/debootstrap
> ++++ b/debootstrap
> +@@ -51,6 +51,10 @@ INRELEASE_PATH=""
> + DEF_MIRROR="http://deb.debian.org/debian"
> + DEF_HTTPS_MIRROR="https://deb.debian.org/debian"
> +
> ++if [ -z "$ARCH_TEST" ]; then
> ++	ARCH_TEST="/usr/bin/arch-test"
> ++fi
> ++
> + # set $CONTAINER
> + detect_container
> +
> +@@ -645,12 +649,12 @@ fi
> +
> + ###########################################################################
> +
> +-if [ -x /usr/bin/arch-test ] && am_doing_phase second_stage; then
> ++if [ -x ${ARCH_TEST} ] && am_doing_phase second_stage; then
> + 	if doing_variant fakechroot; then
> +-		ret=0; arch-test "$ARCH" || ret=$?
> ++		ret=0; ${ARCH_TEST} "$ARCH" || ret=$?
> + 	# Avoid failure with old arch-test package
> +-	elif arch-test --version > /dev/null 2>&1; then
> +-		ret=0; arch-test -c "$TARGET" "$ARCH" || ret=$?
> ++	elif ${ARCH_TEST} --version > /dev/null 2>&1; then
> ++		ret=0; ${ARCH_TEST} -c "$TARGET" "$ARCH" || ret=$?
> + 	else
> + 		ret=3
> + 	fi
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz b/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
> deleted file mode 100644
> index 20eaba3ad22b1e47f6037dea2a0db73eb262ab25..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 767
> zcmZwCeNfAB0LSqWmeAtza1IGwl2gu8?#%BF38A~LD<bo7h$gz-O%L*wNtiRbQnsk`
> z(3pqn#&sTlp0iDMQABENY{##e)U{2&eLs%Bz5jXr{SHz33;x#M&souaLK7WS=$o3O
> zXx$>ZsnQ25NgZhQuh6w=YnJPhSA_*FtCl6pGAj<PKe_LvYWpB{Z(CFF=|<g|kc_w7
> z?`-GPXd&0V`I^2X#r|-cu)U#Y?zq5hM`kwW@BS8ZS^bh#b}cRRrnE%5cOGWy!e#!&
> zo_Q|Y)^Blk6aQ|-GQOyuUOn~9A`}`d;uOb8k0lZJ7vOs#WB%p%Fz((I8j)YVl@8sB
> z)oNd!Qi@SVS~kOpjVKXKZewGuBvbwZTy89NwU^*c*W9OXvZQxqw`I*dTI=(3`b1G5
> z)5IAF_1DAnm>tjwtw&-whEU0bhh3G^$714fW_S;+>2E{qdMet5KqIYj-)Lh{ukV$_
> zD-qv-6PR!mNf>EIju8bM+wUlXaeX>{w5fqC(vwYIM%YP3Nz{E|{P|jsdH%sk4P>d6
> z99tZDjmGg>x;G+se=71kWJV?;eQaSbjz6~ywz=xO7g~sNLygAH)b_DMpIhQ>F2C92
> z@^5pwT0UmVSF%J!UAN~K2h++Jn0TAmU^Ra>SRx?iNz?vkqmVH2CW<%&Xb>2vW)(Ul
> z^f6INMqwv&Hq$aEo36eUfubL%Y9ta(Ynh#`rY^1O0Eac*A@wmAt-Wj}oy8WM!yyhs
> zu40fd4Ox4-na6gfyw*XgcwG89Ot6k;)}}*LinC#_$RY=MFFN4Gofwq*NT-hpM&9RP
> zpAP#fO_I0{JZeXnl!gb%sYKBgmHXh|8PfU4EWVCo)7==jgBQy&T1V$q+kL6!FnUF%
> zo(j|^dWhAlDp_bW6aGm)^+riUD={L7BiiioTiyj&UE09`UmU1%V&#rLi34eKTF8|i
> lg`pYfzz_{`no;0}G-+Dtic5)C{)_x|f?q~cv>;m`_yZJ@!>9lN
>
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
> new file mode 100644
> index 000000000..bb4345687
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Install a Debian system into a subdirectory"
> +HOMEPAGE = "https://wiki.debian.org/Debootstrap"
> +SECTION = "devel"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
> +
> +SRC_URI  = "\
> +    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_${PV}.tar.gz \
> +    file://0001-support-to-override-usr-sbin-and-usr-share.patch \
> +    file://0002-support-to-override-usr-bin-arch-test.patch \
> +"
> +
> +SRC_URI[md5sum] = "b959c7ac01839e9b96a733d27b19e59e"
> +SRC_URI[sha256sum] = "5e5a8147ecdd6be0eea5ac4d6ed8192cc653e93f744dd3306c9b1cc51d6ca328"
> +
> +S = "${WORKDIR}/debootstrap"
> +
> +fakeroot do_install() {
> +    oe_runmake 'DESTDIR=${D}' install
> +    chown -R root:root ${D}${datadir}/debootstrap
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
> deleted file mode 100644
> index 8472aca6c..000000000
> --- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SUMMARY = "Install a Debian system into a subdirectory"
> -HOMEPAGE = "https://wiki.debian.org/Debootstrap"
> -SECTION = "devel"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
> -
> -inherit pkgconfig
> -
> -SRC_URI  = "\
> -    http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_1.0.67.tar.gz \
> -    file://devices.tar.gz;unpack=0 \
> -"
> -
> -SRC_URI[md5sum] = "eacabfe2e45415af60b1d74c3a23418a"
> -SRC_URI[sha256sum] = "0a12e0a2bbff185d47711a716b1f2734856100e8784361203e834fed0cffa51b"
> -
> -S = "${WORKDIR}/${BP}"
> -
> -# All Makefile does is creation of devices.tar.gz, which fails in OE build, we use
> -# static devices.tar.gz as work around
> -# | NOTE: make -j 8 -e MAKEFLAGS=
> -# | rm -rf dev
> -# | mkdir -p dev
> -# | chown 0:0 dev
> -# | chown: changing ownership of `dev': Operation not permitted
> -# | make: *** [devices.tar.gz] Error 1
> -# | WARNING: exit code 1 from a shell command.
> -do_compile_prepend() {
> -    cp ${WORKDIR}/devices.tar.gz ${B}
> -}
> -
> -do_install() {
> -    oe_runmake 'DESTDIR=${D}' install
> -    chown -R root:root ${D}${datadir}/debootstrap
> -}
>
> 
>


--------------ED16FF7FFFD85BC6F924A64A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Ping</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">//Hongxu<br>
    </div>
    <div class="moz-cite-prefix">On 4/8/21 3:29 PM, hongxu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1673D172AFE69FE8.16683@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">- Excise all devices.tar.gz code

- Use yocto vars to override hardcoded dir to support native and nativesdk

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 ...t-to-override-usr-sbin-and-usr-share.patch |  41 +++++++++++++++
 ...upport-to-override-usr-bin-arch-test.patch |  47 ++++++++++++++++++
 .../debootstrap/debootstrap/devices.tar.gz    | Bin 767 -&gt; 0 bytes
 .../debootstrap/debootstrap_1.0.123.bb        |  23 +++++++++
 .../debootstrap/debootstrap_1.0.67.bb         |  35 -------------
 5 files changed, 111 insertions(+), 35 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
 delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
 delete mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
new file mode 100644
index 000000000..12dd23810
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
@@ -0,0 +1,41 @@
+From 87d0174e8d56e7458dc94f05f82ab7a67a5cf7d0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+Date: Thu, 8 Apr 2021 14:06:05 +0800
+Subject: [PATCH 1/2] support to override /usr/sbin and /usr/share
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55">https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55</a>]
+
+Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+---
+ Makefile | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8516803..a2d8c00 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,14 +5,16 @@ all:
+ 
+ clean:
+ 
+-DSDIR=$(DESTDIR)/usr/share/debootstrap
++datadir ?= &quot;/usr/share&quot;
++sbindir ?= &quot;/usr/sbin&quot;
++DSDIR=$(DESTDIR)${datadir}/debootstrap
+ install:
+ 	mkdir -p $(DSDIR)/scripts
+-	mkdir -p $(DESTDIR)/usr/sbin
++	mkdir -p $(DESTDIR)$(sbindir)
+ 
+ 	cp -a scripts/* $(DSDIR)/scripts/
+ 	install -o root -g root -m 0644 functions $(DSDIR)/
+ 
+-	sed 's/@VERSION@/$(VERSION)/g' debootstrap &gt;$(DESTDIR)/usr/sbin/debootstrap
+-	chown root:root $(DESTDIR)/usr/sbin/debootstrap
+-	chmod 0755 $(DESTDIR)/usr/sbin/debootstrap
++	sed 's/@VERSION@/$(VERSION)/g' debootstrap &gt;$(DESTDIR)$(sbindir)/debootstrap
++	chown root:root $(DESTDIR)$(sbindir)/debootstrap
++	chmod 0755 $(DESTDIR)$(sbindir)/debootstrap
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
new file mode 100644
index 000000000..69329df4e
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
@@ -0,0 +1,47 @@
+From f0420b201f2fb5286ccf5657faa6b38cd2680e10 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+Date: Thu, 8 Apr 2021 14:08:06 +0800
+Subject: [PATCH 2/2] support to override /usr/bin/arch-test
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55">https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55</a>]
+
+Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+---
+ debootstrap | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/debootstrap b/debootstrap
+index 9b9e58d..a3cf3af 100755
+--- a/debootstrap
++++ b/debootstrap
+@@ -51,6 +51,10 @@ INRELEASE_PATH=&quot;&quot;
+ DEF_MIRROR=<a class="moz-txt-link-rfc2396E" href="http://deb.debian.org/debian">&quot;http://deb.debian.org/debian&quot;</a>
+ DEF_HTTPS_MIRROR=<a class="moz-txt-link-rfc2396E" href="https://deb.debian.org/debian">&quot;https://deb.debian.org/debian&quot;</a>
+ 
++if [ -z &quot;$ARCH_TEST&quot; ]; then
++	ARCH_TEST=&quot;/usr/bin/arch-test&quot;
++fi
++
+ # set $CONTAINER
+ detect_container
+ 
+@@ -645,12 +649,12 @@ fi
+ 
+ ###########################################################################
+ 
+-if [ -x /usr/bin/arch-test ] &amp;&amp; am_doing_phase second_stage; then
++if [ -x ${ARCH_TEST} ] &amp;&amp; am_doing_phase second_stage; then
+ 	if doing_variant fakechroot; then
+-		ret=0; arch-test &quot;$ARCH&quot; || ret=$?
++		ret=0; ${ARCH_TEST} &quot;$ARCH&quot; || ret=$?
+ 	# Avoid failure with old arch-test package
+-	elif arch-test --version &gt; /dev/null 2&gt;&amp;1; then
+-		ret=0; arch-test -c &quot;$TARGET&quot; &quot;$ARCH&quot; || ret=$?
++	elif ${ARCH_TEST} --version &gt; /dev/null 2&gt;&amp;1; then
++		ret=0; ${ARCH_TEST} -c &quot;$TARGET&quot; &quot;$ARCH&quot; || ret=$?
+ 	else
+ 		ret=3
+ 	fi
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz b/meta-oe/recipes-devtools/debootstrap/debootstrap/devices.tar.gz
deleted file mode 100644
index 20eaba3ad22b1e47f6037dea2a0db73eb262ab25..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 767
zcmZwCeNfAB0LSqWmeAtza1IGwl2gu8?#%BF38A~LD&lt;bo7h$gz-O%L*wNtiRbQnsk`
z(3pqn#&amp;sTlp0iDMQABENY{##e)U{2&amp;eLs%Bz5jXr{SHz33;x#M&amp;souaLK7WS=$o3O
zXx$&gt;ZsnQ25NgZhQuh6w=YnJPhSA_*FtCl6pGAj&lt;PKe_LvYWpB{Z(CFF=|&lt;g|kc_w7
z?`-GPXd&amp;0V`I^2X#r|-cu)U#Y?zq5hM`kwW@BS8ZS^bh#b}cRRrnE%5cOGWy!e#!&amp;
zo_Q|Y)^Blk6aQ|-GQOyuUOn~9A`}`d;uOb8k0lZJ7vOs#WB%p%Fz((I8j)YVl@8sB
z)oNd!Qi@SVS~kOpjVKXKZewGuBvbwZTy89NwU^*c*W9OXvZQxqw`I*dTI=(3`b1G5
z)5IAF_1DAnm&gt;tjwtw&amp;-whEU0bhh3G^$714fW_S;+&gt;2E{qdMet5KqIYj-)Lh{ukV$_
zD-qv-6PR!mNf&gt;EIju8bM+wUlXaeX&gt;{w5fqC(vwYIM%YP3Nz{E|{P|jsdH%sk4P&gt;d6
z99tZDjmGg&gt;x;G+se=71kWJV?;eQaSbjz6~ywz=xO7g~sNLygAH)b_DMpIhQ&gt;F2C92
z@^5pwT0UmVSF%J!UAN~K2h++Jn0TAmU^Ra&gt;SRx?iNz?vkqmVH2CW&lt;%&amp;Xb&gt;2vW)(Ul
z^f6INMqwv&amp;Hq$aEo36eUfubL%Y9ta(Ynh#`rY^1O0Eac*A@wmAt-Wj}oy8WM!yyhs
zu40fd4Ox4-na6gfyw*XgcwG89Ot6k;)}}*LinC#_$RY=MFFN4Gofwq*NT-hpM&amp;9RP
zpAP#fO_I0{JZeXnl!gb%sYKBgmHXh|8PfU4EWVCo)7==jgBQy&amp;T1V$q+kL6!FnUF%
zo(j|^dWhAlDp_bW6aGm)^+riUD={L7BiiioTiyj&amp;UE09`UmU1%V&amp;#rLi34eKTF8|i
lg`pYfzz_{`no;0}G-+Dtic5)C{)_x|f?q~cv&gt;;m`_yZJ@!&gt;9lN

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
new file mode 100644
index 000000000..bb4345687
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
@@ -0,0 +1,23 @@
+SUMMARY = &quot;Install a Debian system into a subdirectory&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://wiki.debian.org/Debootstrap">&quot;https://wiki.debian.org/Debootstrap&quot;</a>
+SECTION = &quot;devel&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608">&quot;file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608&quot;</a>
+
+SRC_URI  = &quot;\
+    <a class="moz-txt-link-freetext" href="http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_$">http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_$</a>{PV}.tar.gz \
+    <a class="moz-txt-link-freetext" href="file://0001-support-to-override-usr-sbin-and-usr-share.patch">file://0001-support-to-override-usr-sbin-and-usr-share.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://0002-support-to-override-usr-bin-arch-test.patch">file://0002-support-to-override-usr-bin-arch-test.patch</a> \
+&quot;
+
+SRC_URI[md5sum] = &quot;b959c7ac01839e9b96a733d27b19e59e&quot;
+SRC_URI[sha256sum] = &quot;5e5a8147ecdd6be0eea5ac4d6ed8192cc653e93f744dd3306c9b1cc51d6ca328&quot;
+
+S = &quot;${WORKDIR}/debootstrap&quot;
+
+fakeroot do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+    chown -R root:root ${D}${datadir}/debootstrap
+}
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
deleted file mode 100644
index 8472aca6c..000000000
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = &quot;Install a Debian system into a subdirectory&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://wiki.debian.org/Debootstrap">&quot;https://wiki.debian.org/Debootstrap&quot;</a>
-SECTION = &quot;devel&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608">&quot;file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608&quot;</a>
-
-inherit pkgconfig
-
-SRC_URI  = &quot;\
-    <a class="moz-txt-link-freetext" href="http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_1.0.67.tar.gz">http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_1.0.67.tar.gz</a> \
-    <a class="moz-txt-link-freetext" href="file://devices.tar.gz;unpack=0">file://devices.tar.gz;unpack=0</a> \
-&quot;
-
-SRC_URI[md5sum] = &quot;eacabfe2e45415af60b1d74c3a23418a&quot;
-SRC_URI[sha256sum] = &quot;0a12e0a2bbff185d47711a716b1f2734856100e8784361203e834fed0cffa51b&quot;
-
-S = &quot;${WORKDIR}/${BP}&quot;
-
-# All Makefile does is creation of devices.tar.gz, which fails in OE build, we use
-# static devices.tar.gz as work around
-# | NOTE: make -j 8 -e MAKEFLAGS=
-# | rm -rf dev
-# | mkdir -p dev
-# | chown 0:0 dev
-# | chown: changing ownership of `dev': Operation not permitted
-# | make: *** [devices.tar.gz] Error 1
-# | WARNING: exit code 1 from a shell command.
-do_compile_prepend() {
-    cp ${WORKDIR}/devices.tar.gz ${B}
-}
-
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install
-    chown -R root:root ${D}${datadir}/debootstrap
-}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------ED16FF7FFFD85BC6F924A64A--
