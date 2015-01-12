Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEEE60670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 03:25:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0C3P7CY015716
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 11 Jan 2015 19:25:08 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.42]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Sun, 11 Jan 2015 19:25:07 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-perl][PATCH] adduser: add new recipe
Thread-Index: AQHQKOJxA69Js2lBmkOyyNVZfGr+Qpy73LiA
Date: Mon, 12 Jan 2015 03:25:06 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAD2A74ED1@ALA-MBB.corp.ad.wrs.com>
References: <1418969696-27325-1-git-send-email-jackie.huang@windriver.com>
	<20150105122243.GJ2484@jama>
In-Reply-To: <20150105122243.GJ2484@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.163.159]
MIME-Version: 1.0
Subject: Re: [meta-perl][PATCH] adduser: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Jan 2015 03:25:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Monday, January 05, 2015 8:23 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-perl][PATCH] adduser: add new recipe
>=20
> On Fri, Dec 19, 2014 at 02:14:56PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > This is a utility from debain to add users/groups to the system, which
> > is actually a perl wrapper of the useradd/groupadd command.
> >
> > We want this to replace the same commands provided by busybox.
> >
> > Homepage: https://alioth.debian.org/projects/adduser
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../recipes-perl/adduser/adduser_3.113+nmu3.bb     | 53 ++++++++++++++=
++++++
> >  ...-M-option-for-useradd-when-no-create-home.patch | 57
> > ++++++++++++++++++++++
> >  2 files changed, 110 insertions(+)
> >  create mode 100644
> > meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
> >  create mode 100644
> > meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-useradd-
> > when-no-create-home.patch
> >
> > diff --git a/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
> > b/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
> > new file mode 100644
> > index 0000000..2ba74b0
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
> > @@ -0,0 +1,53 @@
> > +SUMMARY =3D "a utility to add users/groups to the system"
> > +DESCRIPTION =3D "adduser, addgroup - add a user or group to the system=
"
> > +HOMEPAGE =3D "http://alioth.debian.org/projects/adduser/"
> > +SECTION =3D "base/utils"
> > +
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dcaed49ab166f22ef31=
bf1127f558d0ef"
> > +
> > +SRC_URI =3D "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}=
_${PV}.tar.gz \
> > +
> > +file://adduser-add-M-option-for-useradd-when-no-create-home.patch \ "
> > +
> > +SRC_URI[md5sum] =3D "ccb5864bde56683182c89c44474e7182"
> > +SRC_URI[sha256sum] =3D "02682be3f51f3e732121f20a3e4922bb8bef15cfacb876=
7fc250a01d09502122"
> > +
> > +inherit cpan-base update-alternatives
> > +
> > +do_install() {
> > +	install -d ${D}${sbindir}
> > +	install -m 0755 ${S}/adduser ${D}${sbindir}
> > +	install -m 0755 ${S}/deluser ${D}${sbindir}
> > +
> > +	install -d ${D}${libdir}/perl/${PERLVERSION}/Debian
> > +	install -m 0644 ${S}/AdduserCommon.pm ${D}${libdir}/perl/${PERLVERSIO=
N}/Debian
> > +	sed -i -e "s/VERSION/${PV}/" ${D}${sbindir}/*
> > +
> > +	install -d ${D}/${sysconfdir}
> > +	install -m 0644 ${S}/*.conf ${D}/${sysconfdir}
> > +
> > +	install -d ${D}${mandir}/man5
> > +	install -m 0644 ${S}/doc/*.conf.5 ${D}${mandir}/man5
> > +	install -d ${D}${mandir}/man8
> > +	install -m 0644 ${S}/doc/*.8 ${D}${mandir}/man8
> > +	install -d ${D}${docdir}/${BPN}
> > +	cp -rf ${S}/examples ${D}${docdir}/${BPN} }
>=20
> Use 4 spaces for indentation.

Sure, I will change and send v2.

Thanks,
Jackie

>=20
> > +
> > +RDEPENDS_${PN} +=3D "\
> > +	shadow \
> > +	perl-module-getopt-long \
> > +	perl-module-overloading \
> > +	perl-module-file-find \
> > +	perl-module-file-temp \
> > +"
> > +
> > +ALTERNATIVE_${PN} =3D "adduser deluser addgroup delgroup"
> > +ALTERNATIVE_PRIORITY =3D "60"
> > +ALTERNATIVE_LINK_NAME[adduser] =3D "${sbindir}/adduser"
> > +ALTERNATIVE_LINK_NAME[deluser] =3D "${sbindir}/deluser"
> > +ALTERNATIVE_LINK_NAME[addgroup] =3D "${sbindir}/addgroup"
> > +ALTERNATIVE_LINK_NAME[delgroup] =3D "${sbindir}/delgroup"
> > +ALTERNATIVE_TARGET[addgroup] =3D "${sbindir}/adduser.${BPN}"
> > +ALTERNATIVE_TARGET[delgroup] =3D "${sbindir}/deluser.${BPN}"
> > diff --git
> > a/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-userad
> > d-when-no-create-home.patch
> > b/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-userad
> > d-when-no-create-home.patch
> > new file mode 100644
> > index 0000000..4b0a03f
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-us
> > +++ eradd-when-no-create-home.patch
> > @@ -0,0 +1,57 @@
> > +From 809f00a6ef0224b41b2e1207194c8da3cd3e3c7e Mon Sep 17 00:00:00
> > +2001
> > +From: Jackie Huang <jackie.huang@windriver.com>
> > +Date: Thu, 18 Dec 2014 17:23:37 +0800
> > +Subject: [PATCH] adduser: add -M option for useradd when
> > +--no-create-home is specified
> > +
> > +The useradd (from package passwd) in debian based system sets -M
> > +(--no-create-home) by default, but the one we are using (from package
> > +shadow) sets -m (--create-home) by default, so we need to explicitly a=
dd -M option for useradd
> call when --no-create-home is specified for adduser.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > +---
> > + adduser |   20 ++++++++++++++++----
> > + 1 files changed, 16 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/adduser b/adduser
> > +index c3bd8b0..9a07f9f 100755
> > +--- a/adduser
> > ++++ b/adduser
> > +@@ -434,8 +434,14 @@ if ($action eq "addsysuser") {
> > +     $shell =3D $special_shell || '/bin/false';
> > +     $undouser =3D $new_name;
> > +     my $useradd =3D &which('useradd');
> > +-    &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
> > +-		$shell, '-u', $new_uid, $new_name);
> > ++    if ($no_create_home) {
> > ++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '=
-s',
> > ++		    $shell, '-u', $new_uid, '-M', $new_name);
> > ++    }
> > ++    else {
> > ++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '=
-s',
> > ++                    $shell, '-u', $new_uid, $new_name);
> > ++    }
> > +     if(!$disabled_login) {
> > +         my $usermod =3D &which('usermod');
> > +         &systemcall($usermod, '-p', '*', $new_name); @@ -524,8
> > ++530,14 @@ if ($action eq "adduser") {
> > + 	$shell =3D $special_shell || $config{"dshell"};
> > +     $undouser =3D $new_name;
> > +     my $useradd =3D &which('useradd');
> > +-    &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
> > +-		$shell, '-u', $new_uid, $new_name);
> > ++    if ($no_create_home) {
> > ++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '=
-s',
> > ++	    	    $shell, '-u', $new_uid, '-M', $new_name);
> > ++    }
> > ++    else {
> > ++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '=
-s',
> > ++	    	    $shell, '-u', $new_uid, $new_name);
> > ++    }
> > +     &invalidate_nscd();
> > +
> > +     create_homedir (1); # copy skeleton data
> > +--
> > +1.7.1
> > +
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

