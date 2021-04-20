Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.89])
 by mx.groups.io with SMTP id smtpd.web10.8433.1618913600829606926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 03:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=b+IGIGQS;
 spf=pass (domain: siemens.com, ip: 40.107.13.89, mailfrom: andrej.kozemcak@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7PD/zxEFas6d4fc0REjR8jyuMFucqwR76ulnE6KTh9TlFq5vUa78suBm1/90XhZAmNunPo3gye8vk99Ll4QUgY4HxqG4u8Fl3XySNe43BdNavrxkb3dbuBS/SQvFN94j2Rw4A4PtI7uZfKVENYfldPg3XlSS5cnSIwPx4Vb3WygvItgnsCygNKIs4WSBz+u9MACAoxFXkGvcsRnfXitz/V24IecmtQJIOJSSPSCZQvapX3kNZ/sxaoKWzPhNRfqqwkV/1280oKmc+W3x8M8AyEZbM2yq9NB2YZ3b4wOXtAIUVrXBPFHlRe3fpweFaRLjsQg7/Yrcgz0rbN7Z1VpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXY3s8jwzX5L32XWX+RYOR9e0IvXiwR1Q1XMGi/VfYg=;
 b=UhA6juI5wrVvLPUMHQLyFD5kUTNaW8KWIXzHUaWUWuyVUSpn143ymjvkxHdW2qAO75K6KFRMiXods5+13KcyzJE9dLE2eVoAlg4gkmiUasfIXDFUuJpslJanNkM3HD8MI4VSdiHQYLQfRQhtetZVWMou0eqA5A9Mr9KCuNxv4/HUDZDDTXD+RXxCv4MEbWsFPAG+EsbqheWOiOWXQa8Ou6ICE7cpX+lNHLxBFWE/NSllZOePCxaBxqO+uDRDV8bJ8sK9s2SJkQfabnUsjlwxEmJSNfZrCfWLZvn6MSCWfyMxeK9JeGUzCqt4J9yQ6aWlUMR3ZHHFdl9MdTTAAGUuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXY3s8jwzX5L32XWX+RYOR9e0IvXiwR1Q1XMGi/VfYg=;
 b=b+IGIGQSUddybB+OZw7FDnMeveDgOVO4Cvxs1wdI9pJzUcVpVEvsdRaFtEXS29pGZSvqZWlDzOXusDB5DWMeCXK5ccxEouRbxNH14ZCVyH6dDz5q4jQh8QC9M6bGIauPnpQhP/nf0/hcKJzoV5R5E8ecEPQ8hUZ2Ut9lqT0ORdI=
Received: from DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:a6::22)
 by DB8PR10MB2873.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.23; Tue, 20 Apr
 2021 10:13:18 +0000
Received: from DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddb3:46bc:d8fd:e199]) by DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddb3:46bc:d8fd:e199%5]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 10:13:18 +0000
From: "Andrej Kozemcak" <andrej.kozemcak@siemens.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 1/1] proftpd: Update to 1.3.7a release
Thread-Topic: [oe] [meta-oe][PATCH 1/1] proftpd: Update to 1.3.7a release
Thread-Index: AQHXNPFKRrAENflMzEGrE2a+UX8Qw6q8WI6AgADXXOA=
Date: Tue, 20 Apr 2021 10:13:17 +0000
Message-ID: 
 <DB8PR10MB26497409FFD581F05D522DD6F8489@DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM>
References: <20210419075251.21268-1-andrej.kozemcak@siemens.com>
 <20210419075251.21268-2-andrej.kozemcak@siemens.com>
 <98ee4faf-76a7-7417-dccc-e27805a176e6@gmail.com>
In-Reply-To: <98ee4faf-76a7-7417-dccc-e27805a176e6@gmail.com>
Accept-Language: sk-SK, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-04-20T10:13:16Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=193a3659-421c-499a-8791-6acaab9ca61b;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69379efb-7e20-41c4-5f1c-08d903e4eb18
x-ms-traffictypediagnostic: DB8PR10MB2873:
x-microsoft-antispam-prvs: 
 <DB8PR10MB28736847D2CC10D5BDCE2B8AF8489@DB8PR10MB2873.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pcOVuKOIEEIQMYP5zHJZw42eWw6M/u9DWj6op5+yeQVIq8HsYHxujxpROqc/HuWh1YAXEI0Ki5I39bbfQRY5b4ukWqDL1YKtmK6mLhAwIp8+ho4C6+qrUqigAUOfMK/ywoAjZYxay6HouGc2FdArTqUM4Z+6Bi1BEM4kTK3P+L4jf5Y0IAowsMqE5Y5iF/rOhjBkqO+1zC9NWIRY0BnL1Fq6eXdKN4OVdOPgs6EKEilmvih8gmPplmQ9lgsmJQPcrk+/90d6gmsNqsXWZx7uExvRTURcp4j1AaxvapeSlVmhQmQfuJI28XRjVYIKT1loiI9YDEcZhuT1BYFQHrETnobh1X4UBdIiCzzIJR6DZldGCqrlSzev3QxhWjeFQqIPIBuK8RqFYZKHrAKr6HtkF6eTwbTvo2vpljYK2lZ6bS/wKT9Xadn8qXYIIa8ugGNpVlz90L3KfU0ugJrNjJqI4Tb5EQzVo7iom8elCfjFM8sxmv0MxyGhUtuou7CVyg0hsuCRbxk8tpI3jgDbB4iMLuGgqB1qoBVy3466/TChWZTyB/loU4lNl8fgtkSHjAVG4pEsAhG+PSlFj33t2y5w4OBxu5eU1BhaKoVzvJC2t9lokn53NSR5ncL32nhsKgiq6dH+s1wacqAz4sOImuQrcblele0Vgf9Oc8dCfqRTOFU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(66946007)(8936002)(64756008)(55016002)(15650500001)(7696005)(498600001)(52536014)(5660300002)(186003)(9686003)(8676002)(110136005)(33656002)(53546011)(30864003)(45080400002)(86362001)(83380400001)(26005)(2906002)(55236004)(66446008)(66476007)(76116006)(38100700002)(122000001)(71200400001)(6506007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?RIip49iOfifGLPB4P2fPGjH5P31VeFyxsinVoYmR2UBjEQQEEN+sLbCMCPwp?=
 =?us-ascii?Q?v+Mzwor4ZAetheYpphuaBV+xD4fUmvcPfzMMK7pjoXZUb6CUMWeQ5e6JW3FI?=
 =?us-ascii?Q?eu/Y6j5wHcU96pifAIwgtn25nyPM8RjHhR0GRFeA/0ONILhe8rJrWq/KR/Fq?=
 =?us-ascii?Q?kS0FiEEQ3bVbMtApv+x6Dd3FRWDd92a8xVrWRnreiJvt1MxsCpwNEDe0wcqg?=
 =?us-ascii?Q?W9HnVaTGYfoVuOF3fB6lDSvYdUeBxS7mMxMGSABlwwjTeoqbOGle2s7QFOHg?=
 =?us-ascii?Q?k0XbPQnS+y7mjxYE8ioE6DpQCVwhzADzSDHSW7ft2QNT0llHSQVwWZX0Fkrt?=
 =?us-ascii?Q?pj7as7GOk/qT0gRoTDTvLn8UYCzsO8ecDwpd3efcZqyHFOXqJXcbv88/OkxN?=
 =?us-ascii?Q?Jaqn7MDpAzQghZ+jhKg4yrzUlvXWWGCJT0OQ3eU5yNu6wAAqxrLE+gTQ1Ky1?=
 =?us-ascii?Q?w8uguAibvQr67rtnyGaR+qne7xytGdCn8Tv2ARHAfUJ/+h19jYHKKSDYdMIs?=
 =?us-ascii?Q?VCtyNwmjRdjjI+pbFsMa+Hcfnyz7G3/zKroHoNH0MYD0Ibu3654CY7RlGM6Y?=
 =?us-ascii?Q?ZPEdWSzUPvD6YH4jNBPWiTa9gm0Wl8mPFzPjOR2dohOVMBJnZXrR4XYYJMOy?=
 =?us-ascii?Q?wYKnOvjzXr3zBlDtAm+FXgn9GviqT1Jmd7fJdyNq4+J0E9xOjMjM4jk5HBZG?=
 =?us-ascii?Q?pJjCZ8Q7VfXinyMH3hGnTaklfE+voQepycGTAtA20zgqQwSOBtPsqYHWLswn?=
 =?us-ascii?Q?4MHWy11Zb5JaMVEpMHyObhARubew8J1y/1NuVkLJCbOfhyxirqLfq0ECaBtP?=
 =?us-ascii?Q?63mHKI88aLfl/rsE3e+1VG9lh3s0bwLe9katTdyQIc/g1tGHePmpPJLiaeuW?=
 =?us-ascii?Q?XknJoaBWimE8S1z8SWHX5NTcPVKLLSxAh5iEqD2nuIPI5fzkTaNRkeXYzHA7?=
 =?us-ascii?Q?65S7J9hnFySame1NipvKG2/8e8YHLlAGxnd/ybcxplSddTYJIUtWPUANMnEJ?=
 =?us-ascii?Q?H8anaH7b1slj95LCemJ3mkZbLku3k/vRDEHfDpv4bSNr/bZglfkM4CCr1hup?=
 =?us-ascii?Q?eGGcW5g4dLGamGJvFCvuANY6WTgHGoVEIaKW3KcKX1Yad7goo9SOo9LTBUBQ?=
 =?us-ascii?Q?RT/MMPA8cvzbfvdZ5CMMfpmZRUTroNA33V3jKx7Wd4Ve6QuCRJSmSizhW7nr?=
 =?us-ascii?Q?r6BUsW/7musmi1OxaxuCaBZFfLypclCXXVGJopkqlZ++ZXRAxoc0KbZpLm8k?=
 =?us-ascii?Q?HBDnr5v+Ru+XW5y+Db0BjbxOFH8384yIVFT13wMObj2KGvUAzPstaU3MXBs5?=
 =?us-ascii?Q?mmETQjX+Xp1Top9zJeEFgnEh?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69379efb-7e20-41c4-5f1c-08d903e4eb18
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 10:13:18.0476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A0882hCeVqQOC6dD2dgry+fno3xpEJL0nl9enYsfFWwgc9Iq26C4cq3OrKmm4XFxKFeDiFpUrwq61FN/gfaLfEnmrgYjSVWPMn0xbVmoDfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB2873
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Raj,

Thank you for the review.
I looked at you commend and fix the issue.
I will send the new patch.

>> +PACKAGECONFIG[pam] =3D "--enable-tests, --enable-auth-pam, --disable-a=
uth-pam, libpam, libpam"

> This seems a bit off to me. There is a syntax problem where the comma af=
ter --enable-tests is not required if  you wanted to enable tests when pam =
is enabled in > > packageconfig. Second question is if this is required to =
be bundled with this knob or should it be a seprate independent knob.

My error, I was playing with testing and I forgot/miss remove that line. (=
But I was 100% sure I was remove it).
Thank you, for noticed that.

Best Regards,
Andrej=20

-----Original Message-----
From: Khem Raj <raj.khem@gmail.com>=20
Sent: Monday, April 19, 2021 11:16 PM
To: Kozemcak, Andrej (ADV D EU SK SI-BP1) <andrej.kozemcak@siemens.com>; o=
penembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 1/1] proftpd: Update to 1.3.7a release

Hello Andrej

Thanks for your contribution, there are few comments I have

On 4/19/21 12:52 AM, Andrej Kozemcak wrote:
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>   .../proftpd/files/build_fixup.patch           | 69 ++++++++-----------
>   .../proftpd/files/contrib.patch               | 29 ++++----
>   .../{proftpd_1.3.6.bb =3D> proftpd_1.3.7a.bb}   | 12 ++--
>   3 files changed, 47 insertions(+), 63 deletions(-)
>   rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.6.bb =3D>=
=20
> proftpd_1.3.7a.bb} (93%)
>=20
> diff --git=20
> a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch=20
> b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> index 9816d4d22..d888dd826 100644
> --- a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> +++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> @@ -9,10 +9,10 @@ redefine PR_RUN_DIR as ${localstatedir}/run
>   Signed-off-By: Armin Kuster <akuster808@gmail.com>
>  =20
>  =20
> -Index: proftpd-1.3.6/Make.rules.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/Make.rules.in
> -+++ proftpd-1.3.6/Make.rules.in
> +diff --git a/Make.rules.in b/Make.rules.in index a5028ac..ccd7807=20
> +100644
> +--- a/Make.rules.in
> ++++ b/Make.rules.in
>   @@ -30,9 +30,9 @@ INSTALL=3D@INSTALL@
>    INSTALL_STRIP=3D@INSTALL_STRIP@
>    INSTALL_USER=3D@install_user@
> @@ -26,11 +26,11 @@ Index: proftpd-1.3.6/Make.rules.in
>    
>    RM=3Drm -f
>    SHELL=3D@CONFIG_SHELL@
> -Index: proftpd-1.3.6/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/Makefile.in
> -+++ proftpd-1.3.6/Makefile.in
> -@@ -105,7 +105,6 @@ check: proftpd$(EXEEXT)
> +diff --git a/Makefile.in b/Makefile.in index 9434cbd..13f2e16 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -123,7 +123,6 @@ check: proftpd$(EXEEXT)
>    $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir=
)/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)=
/proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sys=
confdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DES=
TDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
>    	@if [ ! -d $@ ]; then \
>    	=09mkdir -p $@; \
> @@ -38,20 +38,20 @@ Index: proftpd-1.3.6/Makefile.in
>    	=09chmod 0755 $@; \
>    	fi
>    
> -@@ -115,7 +114,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
> +@@ -133,7 +132,6 @@ install-proftpd: proftpd$(EXEEXT)=20
> +$(DESTDIR)$(includedir) $(DESTDIR)$(localstate
>    	=09rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
>    	fi
> - =09ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
> +	ln -s $(top_builddir)/proftpd $(DESTDIR)$(sbindir)/in.proftpd
>   -	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.p=
roftpd
>    
>    install-libs: $(DESTDIR)$(libdir)/proftpd
>    	cd lib/ && $(MAKE) install
> -@@ -152,11 +150,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
> - =09$(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
> - =09$(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
> - =09$(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
> --	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/prxs $(=
DESTDIR)$(bindir)/prxs
> -+	$(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
> +@@ -170,11 +168,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(b=
indir)
> +	$(INSTALL_SBIN) $(top_builddir)/ftpshut  $(DESTDIR)$(sbindir)/ftpshut
> +	$(INSTALL_BIN)  $(top_builddir)/ftptop   $(DESTDIR)$(bindir)/ftptop
> +	$(INSTALL_BIN)  $(top_builddir)/ftpwho   $(DESTDIR)$(bindir)/ftpwho
> +-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(top_build=
dir)/src/prxs $(DESTDIR)$(bindir)/prxs
> ++	$(INSTALL) -m 0755 $(top_builddir)/src/prxs=20
> ++$(DESTDIR)$(bindir)/prxs
>    
>    install-conf: $(DESTDIR)$(sysconfdir)
>    	if [ ! -f $(DESTDIR)$(sysconfdir)/proftpd.conf ] ; then \ @@=20
> -60,11 +60,11 @@ Index: proftpd-1.3.6/Makefile.in
>    	=09           $(top_srcdir)/sample-configurations/basic.conf \
>    	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
>    	fi
> -Index: proftpd-1.3.6/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/configure
> -+++ proftpd-1.3.6/configure
> -@@ -41777,7 +41777,7 @@ _ACEOF
> +diff --git a/configure b/configure
> +index 0a51670..69fa130 100755
> +--- a/configure
> ++++ b/configure
> +@@ -25116,7 +25116,7 @@ _ACEOF
>    
>    
>    cat >>confdefs.h <<_ACEOF
> @@ -73,7 +73,7 @@ Index: proftpd-1.3.6/configure
>    _ACEOF
>    
>    
> -@@ -41787,7 +41787,7 @@ _ACEOF
> +@@ -25126,7 +25126,7 @@ _ACEOF
>    
>    
>    cat >>confdefs.h <<_ACEOF
> @@ -82,11 +82,11 @@ Index: proftpd-1.3.6/configure
>    _ACEOF
>    
>    
> -Index: proftpd-1.3.6/configure.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/configure.in
> -+++ proftpd-1.3.6/configure.in
> -@@ -3833,8 +3833,8 @@ locale_dir=3D"`eval echo ${locale_dir}`"
> +diff --git a/configure.in b/configure.in index 50561de..93cad3f=20
> +100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -4059,8 +4059,8 @@ locale_dir=3D"`eval echo ${locale_dir}`"
>    AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`",=20
> [Define the locale directory])
>    
>    AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`",=20
> [Define the run directory]) @@ -97,16 +97,3 @@ Index:=20
> proftpd-1.3.6/configure.in
>    
>    prefix=3D"$pr_saved_prefix"
>    exec_prefix=3D"$pr_saved_exec_prefix"
> -Index: proftpd-1.3.6/lib/libcap/Makefile=20
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/lib/libcap/Makefile
> -+++ proftpd-1.3.6/lib/libcap/Makefile
> -@@ -26,7 +26,7 @@ OBJS=3D$(addsuffix .o, $(FILES))
> - all: $(LIBNAME)
> -
> - _makenames: _makenames.c cap_names.sed
> --	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> -+	$(BUILD_CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> -
> - cap_names.h: _makenames
> - =09./_makenames > cap_names.h
> diff --git=20
> a/meta-networking/recipes-daemons/proftpd/files/contrib.patch=20
> b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> index 7e2a8e3ce..96c237d38 100644
> --- a/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> +++ b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> @@ -11,32 +11,29 @@ Signed-off-by: Kevin Strasser <kevin.strasser@linux.=
intel.com>
>    2 files changed, 4 insertions(+), 4 deletions(-)
>  =20
>   diff --git a/Makefile.in b/Makefile.in -index 5b2e683..ee72fe1=20
> 100644
> +index 9434cbd..8da7d1f 100644
>   --- a/Makefile.in
>   +++ b/Makefile.in
> -@@ -120,7 +120,7 @@ install-modules: $(DESTDIR)$(libexecdir)=20
> $(DESTDIR)$(sysconfdir)
> +@@ -163,7 +163,7 @@ install-modules: $(DESTDIR)$(libexecdir)=20
> +$(DESTDIR)$(sysconfdir)
>    	test -z "$(SHARED_MODULE_OBJS)" -a -z "$(SHARED_MODULE_DIRS)" -a=20
> -z "$(STATIC_MODULE_DIRS)" || (cd modules/ && $(MAKE) install)
>    
>    install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
>   -	cd contrib/ && $(MAKE) install-utils
>   +	cd contrib/ && $(MAKE) DESTDIR=3D${DESTDIR} install-utils
> - =09$(INSTALL_BIN)  ftpcount $(DESTDIR)$(bindir)/ftpcount
> - =09$(INSTALL_BIN)  ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
> - =09$(INSTALL_SBIN) ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
> +	$(INSTALL_BIN)  $(top_builddir)/ftpcount $(DESTDIR)$(bindir)/ftpcount
> +	$(INSTALL_BIN)  $(top_builddir)/ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
> +	$(INSTALL_SBIN) $(top_builddir)/ftpscrub=20
> +$(DESTDIR)$(sbindir)/ftpscrub
>   diff --git a/contrib/Makefile.in b/contrib/Makefile.in -index=20
> 5bcc038..51d248c 100644
> +index d1a31af..65d2abc 100644
>   --- a/contrib/Makefile.in
>   +++ b/contrib/Makefile.in
> -@@ -18,6 +18,6 @@ Makefile: Makefile.in ../config.status
> +@@ -17,6 +17,6 @@ Makefile: Makefile.in ../config.status
>    	cd ../ && ./config.status
>    
>    install-utils:
> --	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpasswd $(=
DESTDIR)$(bindir)/ftpasswd
> --	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpmail $(D=
ESTDIR)$(bindir)/ftpmail
> --	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpquota $(=
DESTDIR)$(bindir)/ftpquota
> -+	$(INSTALL) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
> -+	$(INSTALL) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
> -+	$(INSTALL) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
> ---
> -1.7.9.5
> -
> +-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/f=
tpasswd $(DESTDIR)$(bindir)/ftpasswd
> +-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/f=
tpmail $(DESTDIR)$(bindir)/ftpmail
> +-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/f=
tpquota $(DESTDIR)$(bindir)/ftpquota
> ++	$(INSTALL) -m 0755 $(srcdir)/ftpasswd $(DESTDIR)$(bindir)/ftpasswd
> ++	$(INSTALL) -m 0755 $(srcdir)/ftpmail $(DESTDIR)$(bindir)/ftpmail
> ++	$(INSTALL) -m 0755 $(srcdir)/ftpquota $(DESTDIR)$(bindir)/ftpquota
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb=20
> b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> similarity index 93%
> rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
> rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> index 1e4697a63..7bd41546e 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> @@ -4,17 +4,17 @@ HOMEPAGE =3D "https://eur01.safelinks.protection.outlo=
ok.com/?url=3Dhttp%3A%2F%2Fwww.proftpd.org%2F&amp;data=3D04%7C01%7Candrej.k=
ozemcak%40siemens.com%7Ce79d5485369e4416d5a308d903785e75%7C38ae3bcd95794fd4=
addab42e1495d55a%7C1%7C0%7C637544637785377046%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DCeYGBB6XgsHXv3MbCqadtvUFBpFMM5lO9BJGXWzN2Y4%3D&amp;reserved=3D0"
>   LICENSE =3D "GPLv2+"
>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb0d1484d11915fa88a6a7702f1=
dc184"
>  =20
> -SRC_URI =3D=20
> "https://eur01.safelinks.protection.outlook.com/?url=3Dftp%3A%2F%2Fftp.p
> roftpd.org%2Fdistrib%2Fsource%2F%24&amp;data=3D04%7C01%7Candrej.kozemcak
> %40siemens.com%7Ce79d5485369e4416d5a308d903785e75%7C38ae3bcd95794fd4ad
> dab42e1495d55a%7C1%7C0%7C637544637785377046%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100
> 0&amp;sdata=3D6ROO2ugn0EAD8%2BsVOupDogNREpO7OI2Gf6si7DjrvGk%3D&amp;reser
> ved=3D0{BPN}-${PV}.tar.gz \
> +SRC_URI =3D=20
> +"https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi
> +thub.com%2Fproftpd%2Fproftpd%2Farchive%2Frefs%2Ftags%2Fv%24&amp;data=3D
> +04%7C01%7Candrej.kozemcak%40siemens.com%7Ce79d5485369e4416d5a308d9037
> +85e75%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637544637785377046
> +%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6
> +Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DTFaiJj5gD7RKwNUGT1EpYj4ZcE15D
> +5lm2UzKACfZWR8%3D&amp;reserved=3D0{PV}.tar.gz \

usually we do not use github archive provided tarballs as they are known t=
o mutate and checksums change. Perhaps better to use github fetcher if ther=
e is no other place where release tarballs are available.

>              file://basic.conf.patch \
>              file://proftpd-basic.init \
>              file://default \
> -           file://close-RequireValidShell-check.patch \
> -           file://contrib.patch  \
> +           file://contrib.patch \
>              file://build_fixup.patch \
> +           file://close-RequireValidShell-check.patch \
>              file://proftpd.service \

There seems to mix of spaces and tabs, so perhaps make them uniform as wel=
l while here, perhaps in a separate patch though.

>              "
> -SRC_URI[md5sum] =3D "13270911c42aac842435f18205546a1b"
> -SRC_URI[sha256sum] =3D "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc=
8cc541b40e152ecaf"
> +SRC_URI[md5sum] =3D "4a9b8877b2e9b08d70e71ad56c19e2c9"
> +SRC_URI[sha256sum] =3D "8b7bbf9757988935352d9dec5ebf96b6a1e6b63a6cdac2e=
93202ac6c42c4cd96"
>  =20
>   inherit autotools-brokensep useradd update-rc.d systemd=20
> multilib_script
>  =20
> @@ -24,7 +24,7 @@ PACKAGECONFIG ??=3D "shadow \
>  =20
>   PACKAGECONFIG[curses] =3D "--enable-curses --enable-ncurses, --disable=
-curses --disable-ncurses, ncurses"
>   PACKAGECONFIG[openssl] =3D "--enable-openssl, --disable-openssl, opens=
sl, openssl"
> -PACKAGECONFIG[pam] =3D "--enable-auth-pam, --disable-auth-pam, libpam, =
libpam"
> +PACKAGECONFIG[pam] =3D "--enable-tests, --enable-auth-pam, --disable-au=
th-pam, libpam, libpam"

This seems a bit off to me. There is a syntax problem where the comma afte=
r --enable-tests is not required if  you wanted to enable tests when pam is=
 enabled in packageconfig. Second question is if this is required to be bun=
dled with this knob or should it be a seprate independent knob.

>   PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6"
>   PACKAGECONFIG[shadow] =3D "--enable-shadow, --disable-shadow"
>   PACKAGECONFIG[pcre] =3D "--enable-pcre, --disable-pcre, libpcre "
>=20
>=20
>=20
>=20
>=20
