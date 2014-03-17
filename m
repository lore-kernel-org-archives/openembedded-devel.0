Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0646F769
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 17:24:23 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so4362537eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 10:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CyvwhEZLsqgnsW1BbHoevLOrZ3EnqFn+mvus4l/wyEw=;
	b=BBUnCqZG1QuaDsjqO/lHhxZGEUp2Rv+siJZuUsMc57COfXfMeTXdOOoVsDz7SVfSWi
	Xc4ejp5pJJIoPljPeObIwRRK9SUjMIaF7lQTav8YBngWQt1rkb71NY57OTnpUnXayDz9
	XZv9k8h6kIIIBMAigKJvQJ5rGKDQEyzldi757eh3J1d/TBjmhDP4gsTxYXcxZzWIKHnk
	F1Bd5Eh7auRWHMfVKL5eaNBe+ThoNbGgZPDYugDY/2hbRUhxGFMlq31zDC/9jLJZVcNB
	vadKMnI4I4jLyfnPxppiu5sxMB4sC2kY0lI497wUbmIx0pkHBiniAtnlQmOL/Qvnu1RF
	4/eQ==
X-Received: by 10.14.22.69 with SMTP id s45mr24783492ees.56.1395077064353;
	Mon, 17 Mar 2014 10:24:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm40800601eeg.8.2014.03.17.10.24.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 10:24:23 -0700 (PDT)
Date: Mon, 17 Mar 2014 18:24:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140317172434.GI3725@jama>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
	<1394227575-27897-6-git-send-email-lauren.post@freescale.com>
	<20140311141735.GC2137@jama>
	<CAP9ODKqg25BUOXFgB5Dh3O7pJ2T359+aABy-WE-ioMnx1r9BSw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqg25BUOXFgB5Dh3O7pJ2T359+aABy-WE-ioMnx1r9BSw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH 6/7] vlan: Create 1.9 version
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
X-List-Received-Date: Mon, 17 Mar 2014 17:24:25 -0000
X-Groupsio-MsgNum: 48732
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline

--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2014 at 01:26:21PM -0300, Otavio Salvador wrote:
> Hello Martin,
>=20
> On Tue, Mar 11, 2014 at 11:17 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Fri, Mar 07, 2014 at 03:26:14PM -0600, Lauren Post wrote:
> >> VLAN provides vconfig utility
> >>
> >> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> >> ---
> >>  .../recipes-connectivity/vlan/vlan_1.9.bb          |   25 +++++++++++=
+++++++++
> >>  1 file changed, 25 insertions(+)
> >>  create mode 100644 meta-networking/recipes-connectivity/vlan/vlan_1.9=
=2Ebb
> >>
> >> diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/m=
eta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> >> new file mode 100644
> >> index 0000000..a9711ed
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
> >> @@ -0,0 +1,25 @@
> >> +DESCRIPTION =3D "VLAN provides vconfig utility"
> >
> > DESCRIPTION -> SUMMARY
> >
> >> +LICENSE =3D "GPLv2"
> >> +LIC_FILES_CHKSUM =3D "file://vconfig.c;md5=3D293ef69c4e88434d37a5ee57=
7a5288cb"
> >> +
> >> +SRC_URI =3D "http://vlan.sourcearchive.com/downloads/1.9-3ubuntu9/vla=
n_1.9.orig.tar.gz"
> >
> > vlan -> ${BPN}
> > 1.9 -> ${PV}
> >
> >> +
> >> +SRC_URI[md5sum] =3D "5f0c6060b33956fb16e11a15467dd394"
> >> +SRC_URI[sha256sum] =3D "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a773=
92d9aeb4868842b4cca"
> >> +
> >> +S =3D "${WORKDIR}/vlan"
> >
> > vlan -> ${BPN}
> >
> >> +
> >> +# comment out MakeInclude in Makefile which sets build environment
> >> +do_configure_append () {
> >> +    sed -i 's/^ include/#^include/' ${S}/Makefile
> >> +}
> >> +
> >> +# ignore strip to avoid yocto errors in stripping
> >> +do_compile () {
> >> +    oe_runmake PLATFORM=3DARM 'STRIP=3Decho' all
> >> +}
> >> +
> >> +do_install () {
> >> +     install -d ${D}/${exec_prefix}/bin
> >> +     cp ${S}/vconfig ${D}/${exec_prefix}/bin
> >
> > 5 spaces -> 4 spaces
> >
> > I'll modify above comments when cherry-picking to master-next.
>=20
> So I assume this one does not need a v2. Am I right?

Yes, it's already modified in:
http://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=3D=
095fbd60d7b0b59558e49b97a20814d34626084e
so it doesn't need v2.

Other patches where I didn't say that I'll do the changes when
cherry-picking need v2.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMnL9IACgkQN1Ujt2V2gBxTEQCdEjy4xCzAY5Dac6kkmmfrT7Dq
XRYAoLpmUcecbS6z44WfDkMUTcpWXQyP
=wZhO
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--
