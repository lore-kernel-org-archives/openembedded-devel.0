Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGcko-0005lI-Lo
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 22:28:46 +0200
Received: by bkat8 with SMTP id t8so2818762bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 13:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9nSpwXFgszuFnAi6h7a2CbW4BiyFjmIonRBk8IHl+6g=;
	b=Txkfmn1cyDayFtQN+1YTlYTIpHgChly1rJzdvOkSVqH5lPTXOKkYKs3h/sE7c1T07w
	paScZI/fCbhApm8IWymgeb+KXzHwF5bcu9V7h1PB9znB+6hWCuBL+suTS6OJDCyjL+PQ
	zT/NSTfgWs1dxxpJC/h5md+7ceQzs3i43Q9d8=
Received: by 10.204.156.150 with SMTP id x22mr6036371bkw.86.1319055775557;
	Wed, 19 Oct 2011 13:22:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u18sm7279773bkn.6.2011.10.19.13.22.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 13:22:54 -0700 (PDT)
Date: Wed, 19 Oct 2011 22:22:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111019202248.GE3522@jama.jama.net>
References: <1319027399-8297-1-git-send-email-Martin.Jansa@gmail.com>
	<201110192135.56318.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201110192135.56318.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] midori: fix build with dirty vala
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Oct 2011 20:28:47 -0000
X-Groupsio-MsgNum: 34908
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VUDLurXRWRKrGuMn"
Content-Disposition: inline

--VUDLurXRWRKrGuMn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2011 at 09:35:55PM +0200, Andreas M=FCller wrote:
> On Wednesday, October 19, 2011 02:29:59 PM Martin Jansa wrote:
> > * there is only one line added to default waf file
> >   in unpack_wafdir() just before last chdir and return
> >   because those files are downloaded and cannot be patched in normal way
> >   os.system("sed -i \"s/version=3Doutput.split/version=3Doutput.replace=
('-dirty','').split/g\" wafadmin/Tools/vala.py")
> >=20
> > * It fails to parse version like this
> >   /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/valac --version
> >   Vala 0.12.1-dirty
> >   reporting 0.0.0 instead which breaks configure
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../recipes-connectivity/midori/midori-0.4.1/waf   |  Bin 0 -> 92569 b=
ytes
> >  .../recipes-connectivity/midori/midori_0.4.1.bb    |    8 ++++++++
> >  2 files changed, 8 insertions(+), 0 deletions(-)
> >  create mode 100755 meta-oe/recipes-connectivity/midori/midori-0.4.1/waf
> >=20
> > diff --git a/meta-oe/recipes-connectivity/midori/midori-0.4.1/waf b/met=
a-oe/recipes-connectivity/midori/midori-0.4.1/waf
> > new file mode 100755
> > index 0000000000000000000000000000000000000000..b74a2d809a1bca11ec8548c=
b9dfcd7501c5f346d
> > GIT binary patch
> > literal 92569
=2E..
> > literal 0
> > HcmV?d00001
> >=20
> > diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb b/meta=
-oe/recipes-connectivity/midori/midori_0.4.1.bb
> > index 2805b92..860ed21 100644
> > --- a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
> > +++ b/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
> > @@ -1,7 +1,15 @@
> >  require midori.inc
> > =20
> > +PR =3D "r1"
> > +
> >  SRC_URI =3D "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.=
tar.bz2;name=3Dmidori \
> > +           file://waf \
> >            "
> > +
> > +do_configure_prepend() {
> > +  cp -f ${WORKDIR}/waf ${S}/
> > +}
> > +
> >  SRC_URI[midori.md5sum] =3D "33dde203cd71ae2b1d2adcc7f5739f65"
> >  SRC_URI[midori.sha256sum] =3D "b3c77ddb6f562a0ea3d2e6fbb756ca0dc158ad8=
410f4b60f8e5998c2f7305f07"
> > =20
> >=20
> Just my personal interest: How did you get to new waf. Can you suggest so=
urces to lift waf out of black-box?

I've edited old one with vim :)

Not that I'm usually able after few beers to fix binaries directly in vim..=
=20
but the beginning of that file is python script where I've put that
extra line..

Maybe it would be worth it to upgrade waf to 1.6.0 or newer (where vala
issue is also resolved), but I haven't tried to build midori with it as
there were many changes in waf and I hope that newer midori will be
using it already from upstream.

Other option is to store only smaller binary patch to upstream waf, but
that wont probably apply to next version too.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VUDLurXRWRKrGuMn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6fMZgACgkQN1Ujt2V2gBxEJACfUWvPpfnvLnLpNQZl8mGEJSSh
jJAAn3jZSw7Ccxxb+DHaI5RbBXo3oXb+
=w0XU
-----END PGP SIGNATURE-----

--VUDLurXRWRKrGuMn--
