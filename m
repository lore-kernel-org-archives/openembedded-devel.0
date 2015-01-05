Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 988AF601F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 12:22:43 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id p10so7763305wes.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zh19b7Hqd2MOqGi/beYnGkGFFzWsWMb8TLEI5ZtgVEY=;
	b=cucezt+fMqdGjVgf63l6A9CAmM+4gfHHNwD775cNaEcmnvev6Bbuqig0L2D3iM9DdA
	vjJIJ+HblO42GcN7mow5KoH7k1zHkOQ8/XXuXA4/6ImbH7HYXHXcW2ahIroAXGN4PvCd
	kKcaI38Ugh5Rq0U6y43mcm74tQlgT6CQghLEzIWEL5+3TD7XnJRVlF5jYHbb2cw/JHvC
	lYKW/oZz9I6TJRXw/xxeTuIF7PypNsdJ4duXXV0SMJPTopZEuZbNehYG4F13iaXZ7EpM
	M4M4Wr3oi4wnb0ckDaFAApFfnj8N6T1IBTE2WKlRDQI9PK8sGICu4WK6QZ0arPaWS/Cj
	uWJw==
X-Received: by 10.194.60.19 with SMTP id d19mr173422778wjr.48.1420460563315;
	Mon, 05 Jan 2015 04:22:43 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dr3sm9736494wib.4.2015.01.05.04.22.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 04:22:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 13:22:43 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105122243.GJ2484@jama>
References: <1418969696-27325-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1418969696-27325-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Mon, 05 Jan 2015 12:22:54 -0000
X-Groupsio-MsgNum: 53651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6d1KVhp94hk3Jrm"
Content-Disposition: inline

--d6d1KVhp94hk3Jrm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2014 at 02:14:56PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> This is a utility from debain to add users/groups to the system,
> which is actually a perl wrapper of the useradd/groupadd command.
>=20
> We want this to replace the same commands provided by busybox.
>=20
> Homepage: https://alioth.debian.org/projects/adduser
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-perl/adduser/adduser_3.113+nmu3.bb     | 53 ++++++++++++++++=
++++
>  ...-M-option-for-useradd-when-no-create-home.patch | 57 ++++++++++++++++=
++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
>  create mode 100644 meta-perl/recipes-perl/adduser/files/adduser-add-M-op=
tion-for-useradd-when-no-create-home.patch
>=20
> diff --git a/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb b/meta-=
perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
> new file mode 100644
> index 0000000..2ba74b0
> --- /dev/null
> +++ b/meta-perl/recipes-perl/adduser/adduser_3.113+nmu3.bb
> @@ -0,0 +1,53 @@
> +SUMMARY =3D "a utility to add users/groups to the system"
> +DESCRIPTION =3D "adduser, addgroup - add a user or group to the system"
> +HOMEPAGE =3D "http://alioth.debian.org/projects/adduser/"
> +SECTION =3D "base/utils"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dcaed49ab166f22ef31bf=
1127f558d0ef"
> +
> +SRC_URI =3D "http://ftp.de.debian.org/debian/pool/main/a/${BPN}/${BPN}_$=
{PV}.tar.gz \
> +           file://adduser-add-M-option-for-useradd-when-no-create-home.p=
atch \
> +"
> +
> +SRC_URI[md5sum] =3D "ccb5864bde56683182c89c44474e7182"
> +SRC_URI[sha256sum] =3D "02682be3f51f3e732121f20a3e4922bb8bef15cfacb8767f=
c250a01d09502122"
> +
> +inherit cpan-base update-alternatives
> +
> +do_install() {
> +	install -d ${D}${sbindir}
> +	install -m 0755 ${S}/adduser ${D}${sbindir}
> +	install -m 0755 ${S}/deluser ${D}${sbindir}
> +
> +	install -d ${D}${libdir}/perl/${PERLVERSION}/Debian
> +	install -m 0644 ${S}/AdduserCommon.pm ${D}${libdir}/perl/${PERLVERSION}=
/Debian
> +	sed -i -e "s/VERSION/${PV}/" ${D}${sbindir}/*
> +
> +	install -d ${D}/${sysconfdir}
> +	install -m 0644 ${S}/*.conf ${D}/${sysconfdir}
> +
> +	install -d ${D}${mandir}/man5
> +	install -m 0644 ${S}/doc/*.conf.5 ${D}${mandir}/man5
> +	install -d ${D}${mandir}/man8
> +	install -m 0644 ${S}/doc/*.8 ${D}${mandir}/man8
> +	install -d ${D}${docdir}/${BPN}
> +	cp -rf ${S}/examples ${D}${docdir}/${BPN}
> +}

Use 4 spaces for indentation.

> +
> +RDEPENDS_${PN} +=3D "\
> +	shadow \
> +	perl-module-getopt-long \
> +	perl-module-overloading \
> +	perl-module-file-find \
> +	perl-module-file-temp \
> +"
> +
> +ALTERNATIVE_${PN} =3D "adduser deluser addgroup delgroup"
> +ALTERNATIVE_PRIORITY =3D "60"
> +ALTERNATIVE_LINK_NAME[adduser] =3D "${sbindir}/adduser"
> +ALTERNATIVE_LINK_NAME[deluser] =3D "${sbindir}/deluser"
> +ALTERNATIVE_LINK_NAME[addgroup] =3D "${sbindir}/addgroup"
> +ALTERNATIVE_LINK_NAME[delgroup] =3D "${sbindir}/delgroup"
> +ALTERNATIVE_TARGET[addgroup] =3D "${sbindir}/adduser.${BPN}"
> +ALTERNATIVE_TARGET[delgroup] =3D "${sbindir}/deluser.${BPN}"
> diff --git a/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-fo=
r-useradd-when-no-create-home.patch b/meta-perl/recipes-perl/adduser/files/=
adduser-add-M-option-for-useradd-when-no-create-home.patch
> new file mode 100644
> index 0000000..4b0a03f
> --- /dev/null
> +++ b/meta-perl/recipes-perl/adduser/files/adduser-add-M-option-for-usera=
dd-when-no-create-home.patch
> @@ -0,0 +1,57 @@
> +From 809f00a6ef0224b41b2e1207194c8da3cd3e3c7e Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Thu, 18 Dec 2014 17:23:37 +0800
> +Subject: [PATCH] adduser: add -M option for useradd when --no-create-hom=
e is specified
> +
> +The useradd (from package passwd) in debian based system sets -M (--no-c=
reate-home) by default,
> +but the one we are using (from package shadow) sets -m (--create-home) b=
y default, so we
> +need to explicitly add -M option for useradd call when --no-create-home =
is specified for adduser.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + adduser |   20 ++++++++++++++++----
> + 1 files changed, 16 insertions(+), 4 deletions(-)
> +
> +diff --git a/adduser b/adduser
> +index c3bd8b0..9a07f9f 100755
> +--- a/adduser
> ++++ b/adduser
> +@@ -434,8 +434,14 @@ if ($action eq "addsysuser") {
> +     $shell =3D $special_shell || '/bin/false';
> +     $undouser =3D $new_name;
> +     my $useradd =3D &which('useradd');
> +-    &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
> +-		$shell, '-u', $new_uid, $new_name);
> ++    if ($no_create_home) {
> ++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s=
',
> ++		    $shell, '-u', $new_uid, '-M', $new_name);
> ++    }
> ++    else {
> ++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s=
',
> ++                    $shell, '-u', $new_uid, $new_name);
> ++    }
> +     if(!$disabled_login) {
> +         my $usermod =3D &which('usermod');
> +         &systemcall($usermod, '-p', '*', $new_name);
> +@@ -524,8 +530,14 @@ if ($action eq "adduser") {
> + 	$shell =3D $special_shell || $config{"dshell"};
> +     $undouser =3D $new_name;
> +     my $useradd =3D &which('useradd');
> +-    &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
> +-		$shell, '-u', $new_uid, $new_name);
> ++    if ($no_create_home) {
> ++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s=
',
> ++	    	    $shell, '-u', $new_uid, '-M', $new_name);
> ++    }
> ++    else {
> ++        &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s=
',
> ++	    	    $shell, '-u', $new_uid, $new_name);
> ++    }
> +     &invalidate_nscd();
> +=20
> +     create_homedir (1); # copy skeleton data
> +--=20
> +1.7.1
> +
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d6d1KVhp94hk3Jrm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqghMACgkQN1Ujt2V2gBwdJACgrMwHqFSVAR4tWpN8jqAIy1Hn
lWMAnRSheVaEHo5aY7dkQMUw5hksD6xY
=RROL
-----END PGP SIGNATURE-----

--d6d1KVhp94hk3Jrm--
