Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A3400606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 15:10:37 +0000 (UTC)
Received: by wgsk9 with SMTP id k9so100989751wgs.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Apr 2015 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kMX6/Q9dKtYrg8oM/pz9ZzAzpW0FwpLyw9mOOx2Fl28=;
	b=hO0NCxJhP+ksh2OzY5lg+ifSUFcrPIGyxtD1No7NXWBXt4eSFdT3yaR8xjBsSQMFLq
	s/itCqMiOJNB+eUZ//CqfdgDP1FerNc40mBFFuyFUUGI54fIJ8EcSD5lZQ2nfbbKh86z
	0rZILvMVmAmlbMa3qUYbqKCymbn9ERzVhg9Lg7jwVUfq23Ll7ONvea7TEeUXCIKi/okb
	JXBf0IvGKTvxHe1cbQ9tEntJ5z8LpQ+gdm1OwuubSHmToo+2To3rlaUJSqEVMAtui08i
	4Cw/Ftori44IcIfaEb0NjjpZAQxdUfgLwLTuKfa4ZCQBtqkQlujTXKBtwcviH0mYb9k6
	zdsg==
X-Received: by 10.194.184.10 with SMTP id eq10mr11739229wjc.147.1428592237782; 
	Thu, 09 Apr 2015 08:10:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id fo7sm17315191wic.1.2015.04.09.08.10.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 08:10:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 9 Apr 2015 17:10:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150409151045.GB2340@jama>
References: <1427916099-30314-1-git-send-email-gshastri@juniper.net>
	<20150408195516.GB29645@jama>
	<BN3PR0501MB1427033101BD79CB1A787E9ED5FB0@BN3PR0501MB1427.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN3PR0501MB1427033101BD79CB1A787E9ED5FB0@BN3PR0501MB1427.namprd05.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [[meta-filesystems][Add xorriso support]] Add xorriso tool support
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
X-List-Received-Date: Thu, 09 Apr 2015 15:10:42 -0000
X-Groupsio-MsgNum: 55039
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2015 at 02:46:38PM +0000, Gaurang Shastri wrote:
> >> Have you tested this recipe before sending it?
>=20
> Yes, I have tested this in my Yocto 1.6 environment(x86_64) before sendin=
g it and did and get any error.
>=20
> Can you share your yocto environment information please ?

But you're sending patch for master branch, please test it with master
not year old 1.6.

Any 1.7, 1.8, master OpenEmbedded environment will show you the issue.

> //Gaurang Shastri
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Thursday, April 09, 2015 1:25 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [[meta-filesystems][Add xorriso support]] Add xorriso t=
ool support
>=20
> On Wed, Apr 01, 2015 at 12:21:39PM -0700, Gaurang Shastri wrote:
> > xorriso copies file objects from POSIX compliant filesystems into Rock=
=20
> > Ridge enhanced ISO 9660 filesystems and allows session-wise=20
> > manipulation of such filesystems.
>=20
> Have you tested this recipe before sending it?
>=20
> It fails to build, most likely because of missing foreign flag to automak=
e.
>=20
> | configure.ac:47: installing './compile'
> | configure.ac:14: installing './missing'
> | Makefile.am: error: required file './NEWS' not found
> | Makefile.am: installing './depcomp'
> | autoreconf: automake failed with exit status: 1
> | ERROR: autoreconf execution failed.
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at=20
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/xorriso/1
> | .3.8-r0/temp/log.do_configure.16725)
> NOTE: recipe xorriso-1.3.8-r0: task do_configure: Failed
>=20
> > Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
> > ---
> >  .../recipes-utils/xorriso/xorriso_1.3.8.bb         |   17 ++++++++++++=
+++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644=20
> > meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
> >=20
> > diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb=20
> > b/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
> > new file mode 100644
> > index 0000000..93914b4
> > --- /dev/null
> > +++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
> > @@ -0,0 +1,17 @@
> > +DESCRIPTIONS =3D "xorriso copies file objects from POSIX compliant fil=
esystems into Rock Ridge enhanced ISO 9660 filesystems and allows session-w=
ise manipulation of such filesystems"
> > +
> > +inherit autotools
> > +
> > +DEPENDS +=3D "attr zlib"
> > +
> > +SRC_URI =3D "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] =3D "a0fc534ef8f9589282a189f0e6cdf952"
> > +SRC_URI[sha256sum] =3D "901204634651533f7cbd105eab560534702458258529aa=
c4b2f0fc946992107e"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> > +LICENSE =3D "GPLv3"
> > +
> > +EXTRA_OECONF =3D "--disable-libacl"
> > +
> > +BBCLASSEXTEND =3D "nativesdk"
> > --
> > 1.7.9.5
> >=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUmlnUACgkQN1Ujt2V2gBzCLQCglM/1kEP5A/rNzqMXg0JPhMi/
C48AnA+MpMrjEVdG8NhWonShoOnLCKfl
=GU0y
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
