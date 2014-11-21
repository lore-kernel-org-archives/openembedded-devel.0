Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2969C721AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 14:19:04 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so8981639wiw.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2014 06:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wf1tqI+Ea6qma7qRnznrAFYRaMAb81WElTmSUI0xVh4=;
	b=BwOHODIgTYU380cuhmwgds0xzC3d631mNmqWPYWBd49gqSyiU2hBoyricvx3UyZctj
	Td1DdIWtVKkohL/vZNg0d5XbR/3nMWEnUYJpXunNRoiWcXRpr4fZaVIfpJOnAZmfmZpc
	GdPHaa6coCP7UXQ6z5c3j3jp+shIdlBAp/jtwunrGslgkhVnGdj/FGgXwi2qnJybsbE9
	93/mlJW0Gil2KA+g5MVBgOYRJT1J8sVh8Ms5bxnJ6wfclUKcp+VHhE7+SjdEGILEMwxS
	s5hIIO7HJeKqn9zQyFrypNW7tZ+QBUF0eabRLyWDk5TE9ECFg1pFojHoD/Cr7wbOIoFU
	Yf+A==
X-Received: by 10.194.83.8 with SMTP id m8mr8288946wjy.58.1416579544366;
	Fri, 21 Nov 2014 06:19:04 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h14sm7508550wic.8.2014.11.21.06.19.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 06:19:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 15:19:04 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141121141904.GK2163@jama>
References: <20141119154912.GP3315@jama>
	<1416556558-15428-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1416556558-15428-2-git-send-email-qianl.fnst@cn.fujitsu.com>
	<20141121140616.GB20204@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20141121140616.GB20204@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2 1/2] UMIP: add new recipe
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
X-List-Received-Date: Fri, 21 Nov 2014 14:19:06 -0000
X-Groupsio-MsgNum: 52975
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KjSGHOmKKB2VUiQn"
Content-Disposition: inline

--KjSGHOmKKB2VUiQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2014 at 09:06:18AM -0500, Joe MacDonald wrote:
> [[oe] [PATCH v2 1/2] UMIP: add new recipe] On 14.11.21 (Fri 15:55) Qian L=
ei wrote:
>=20
> > UMIP is an open source implementation of Mobile IPv6 and NEMO Basic
> > Support for Linux. It is released under the GPLv2 license. It supports
> > the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776
> > and RFC4877 (IPsec and IKEv2).
>=20
> I think this recipe also probably belongs in meta-networking.  I'm
> catching up on the merges today, so if there's no objection, I'll put it
> there in the same place in the hierarchy.

It's failing to build in my world builds, so please wait a bit more.

Also a lot of patches from last week were modified when I was
cherry-picking them to master-next, please make sure you're using right
version.

> > Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> > ---
> >  meta-oe/recipes-connectivity/umip/umip_1.0.bb | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/umip/umip_1.0.bb
> >=20
> > diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/re=
cipes-connectivity/umip/umip_1.0.bb
> > new file mode 100644
> > index 0000000..76901ab
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "Mobile IPv6 and NEMO for Linux"
> > +DESCRIPTION =3D "UMIP is an open source implementation of Mobile IPv6 =
and NEMO \
> > +Basic Support for Linux. It is released under the GPLv2 license. It su=
pports \
> > +the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776=
 and \
> > +RFC4877 (IPsec and IKEv2)."
> > +HOMEPAGE =3D "http://umip.org/"
> > +SECTION =3D "System Environment/Base"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D073dc31ccb2ebed70db54f1e8ae=
b4c33"
> > +DEPENDS =3D "rpm indent-native"
> > +
> > +SRC_URI =3D "git://git.umip.org/umip.git"
> > +SRCREV =3D "428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"
> > +
> > +S =3D "${WORKDIR}/git"
> > +EXTRA_OE_CONF =3D "--enable-vt"
> > +
> > +inherit autotools-brokensep
> > --=20
> > 1.8.3.1
> >=20
> --=20
> -Joe MacDonald.
> :wq



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KjSGHOmKKB2VUiQn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvSdgACgkQN1Ujt2V2gBymggCgoIxFhagVIe61z1tU+o78aQpo
FpkAoIHHeh9s5f9iQ8AtR6puN5Fe3Vd8
=yk2/
-----END PGP SIGNATURE-----

--KjSGHOmKKB2VUiQn--
