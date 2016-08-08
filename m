Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 34B1E77133
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 11:51:10 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id q128so19590330wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2016 04:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=j77eZbnwTW+Ngnl3Z767k68HCnMZq37JpuXTYmEeVns=;
	b=RHQeOaD2rcWMWCbYef5iHvVoJbArpZoo7FlSS95fV6VG0k2uoQoPErmql1aQoV+siN
	MzIsA14QNks0EOht0yWF0+tLMFmjSXr2XRTj7DIOe86ABPdlHdjRAwpl1AcTkUVjTK7E
	AWzmeMGS++h3Ygzdk05veMVlzxRwK/oefB0ukL3LgHbRYvBnBHn41Za6nc2+Fml+0Dfq
	kECLgS+z6odfgMKIJqU8nbrDKdb++HbF2vMCDVCR53y2prKaB3XmvlhpQqJen1utRuDV
	zCMQxGP+tI4Of6HzfS0Z2vvCbIBRSBeRuxRFwYcRHj2Aojkhd50Oj6L0ZwqKyrgYaM/p
	VBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=j77eZbnwTW+Ngnl3Z767k68HCnMZq37JpuXTYmEeVns=;
	b=AIY8rwX6dEAoJevznJCOXIo6G49YenolAPsxogNOSyROyAwr7uX/gNc3TkdlXyVkQ7
	MJeuqCna52IQ7RtjJUhyWGnp+cjTbNhWxsYxBYAUn4+w6XMvmayfypwtCYuTQGwAn7ir
	XfeJtGsHEeq+0O2FRY6GDJQbP+MqscSVG8/rZpOq/liVG7OjdyWYHc/CHhwYsM2UsnpF
	qvDcvuesBtN43mzbxaed8WKUGN2Wylpkbr011FWvINIYGzbVu2PeSO/STvobUsIh9IBy
	bE3WgdYzoL2pBCPQWen9FMEPHA8EC99jPC2WS+9tV98tpGSDMMQb/7dX3UBTrl3hRHrc
	avpw==
X-Gm-Message-State: AEkoousCgbNAu8x2TmACLPI8ycffNEs0xAZQhbmAgpkkh4Mrbqd+hFi52aHCj6SjyttJTw==
X-Received: by 10.28.168.83 with SMTP id r80mr14932547wme.44.1470657071051;
	Mon, 08 Aug 2016 04:51:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	ly9sm32493268wjb.44.2016.08.08.04.51.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Aug 2016 04:51:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 8 Aug 2016 13:51:12 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160808115112.jhhfu6wqmwbv5qzh@jama>
References: <20160805102559.8258.90195@opal.openembedded.org>
	<20160805102605.C658350173@opal.openembedded.org>
	<CALbNGRTU4aQO2A6Hwz5BSSA4XTk6FOGKgwrCiiOTYoiRtnWEcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTU4aQO2A6Hwz5BSSA4XTk6FOGKgwrCiiOTYoiRtnWEcQ@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: "fan.xin" <fan.xin@jp.fujitsu.com>
Subject: Re: [oe-commits] [meta-openembedded] 24/39: qpdf: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 11:51:12 -0000
X-Groupsio-MsgNum: 62475
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="glxtuz3fmnt45rff"
Content-Disposition: inline

--glxtuz3fmnt45rff
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2016 at 01:22:08PM +0200, Andreas M=FCller wrote:
> On Fri, Aug 5, 2016 at 12:26 PM,  <git@git.openembedded.org> wrote:
> > martin_jansa pushed a commit to branch master-next
> > in repository meta-openembedded.
> >
> > commit 183ecb3a05823343525d7acc1a650d4b2a0e4183
> > Author: fan.xin <fan.xin@jp.fujitsu.com>
> > AuthorDate: Mon Aug 1 18:46:35 2016 +0900
> >
> >     qpdf: add new recipe
> >
> >     QPDF is a command-line program that does structural,
> >     content-preserving transformation on PDF files.
> >
> >     Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb | 26 +++++++++++++++++++++=
+++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb b/meta-oe/reci=
pes-extended/qpdf/qpdf_6.0.0.bb
> > new file mode 100644
> > index 0000000..d5645d7
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb
> > @@ -0,0 +1,26 @@
> > +SUMMARY =3D "QPDF is a command-line program that does structural, cont=
ent-preserving transformations on PDF files"
> > +DESCRIPTION =3D "QPDF is capable of creating linearized files and encr=
ypted files. It is also capable of \
> > +converting PDF files with object streams to files with no compressed o=
bjects or to generate object streams \
> > +from files that don't have them. QPDF also supports a special mode des=
igned to allow you to edit the content \
> > +of PDF files in a text editor."
> > +HOMEPAGE =3D "http://qpdf.sourceforge.net/"
> > +
> > +PR =3D "r0"
> ^ Nit

All 4 changes done in master-next.

> > +
> > +RDEPENDS_${PN} =3D "libpcre zlib"
> > +
> > +LICENSE =3D "Artistic-2.0"
> > +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/qpdf-${PV}/Artistic-2.0;md5=3D=
7806296b9fae874361e6fb10072b7ee3"

Dropped ${S} - "${WORKDIR}/qpdf-${PV}"

> > +
> > +SRC_URI =3D "http://nchc.dl.sourceforge.net/project/qpdf/qpdf/${PV}/qp=
df-${PV}.tar.gz"

SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.gz"

> > +
> > +SRC_URI[md5sum] =3D "e014bd3ecf1c4d1a520bbc14d84ac20e"
> > +SRC_URI[sha256sum] =3D "a9fdc7e94d38fcd3831f37b6e0fe36492bf79aa6d54f8f=
66062cf7f9c4155233"
> > +
> > +inherit autotools-brokensep pkgconfig
> > +
> > +EXTRA_OECONF +=3D "--with-random=3D/dev/urandom"
> > +
> > +do_configure_prepend() {
> > +      sh autogen.sh

4 spaces for indentation

Isn't this the only reason for brokensep? Would it work with sh ${S}/autoge=
n.sh?

> > +}
> >
> > --
> > To stop receiving notification emails like this one, please contact
> > the administrator of this repository.
> > --
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--glxtuz3fmnt45rff
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleoci8ACgkQN1Ujt2V2gBz7mwCePkicI1Fcr96ZQpXwzy7lOZ2m
x00An1d5i9I5cedTMqyYwYrpgj+wm0DI
=8UGG
-----END PGP SIGNATURE-----

--glxtuz3fmnt45rff--
