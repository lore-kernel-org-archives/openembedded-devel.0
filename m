Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2861D6E26B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 15:43:48 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so30216723wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bPiurlb7YaUFwWKMYxwG3qpbpJ7OoTK6s/qDqjP9xRc=;
	b=qLjPhHHif2ZlHmmi4DYi89K/JcxUBdj3GKaAZzlzwHyNo11N5S3J7LGJN+Q+fw1v5+
	Uz7METs6KR75zdcN+9FW1nbK76iQSiDEWJpazkg5wJFe9QY/TfFZwnTQvJ/UuEsmOTnR
	apQ0i/qYDuUZ0a5vrnOx2tofVpCzJh6xeUhu+UdEMO9X/DA6+Z3BxRogytsMkisU7Ykk
	OaJPPzCg5vMRYsNZYu4yQ4gO6oz2m0S6HQpJCTQqkUlQJ3dr/MAoMHrGvbX+nbpSY3jw
	uElADeW0irP4Eox30PCRM864dDl/Xcivm2UzXczCOIPTpkVgb583ZTDqLAUSQ4NyVXGD
	8BaA==
X-Received: by 10.194.9.42 with SMTP id w10mr68567893wja.146.1441899828479;
	Thu, 10 Sep 2015 08:43:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r4sm9932299wia.19.2015.09.10.08.43.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 08:43:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Sep 2015 17:44:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150910154447.GC2387@jama>
References: <1441398373-21244-1-git-send-email-alejandro.joya.cruz@intel.com>
	<1441899228.12956.8.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1441899228.12956.8.camel@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH]] toybox: upgrade to 0.6.0
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
X-List-Received-Date: Thu, 10 Sep 2015 15:43:50 -0000
X-Groupsio-MsgNum: 57294
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline

--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 03:33:52PM +0000, Joya Cruz, Alejandro wrote:
> Some feedback on this.

Sigh!

commit 7ad835c9f84acb34f6d29a3352f24812ef295b63
Author:     Alejandro Joya <alejandro.joya.cruz@intel.com>
AuthorDate: Fri Sep 4 15:26:13 2015 -0500
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Tue Sep 8 16:21:38 2015 +0200

    toybox: upgrade to 0.6.0

http://patchwork.openembedded.org/project/oe/list/?state=3D*&q=3Dtoybox&arc=
hive=3Dboth
allows you to find:
http://patchwork.openembedded.org/patch/102625/
which says:
State	Accepted, archived

If you really want some feedback, then learn to use --subject-prefix
parameter, you have extra ']' in commit message and I had to remove it
manually when cherry-picking to master-next.

Regards,

> On vie, 2015-09-04 at 20:26 +0000, Joya Cruz, Alejandro wrote:
> > Change SRC_URI since patch is not longer need it.
> > Update the checksum for package.
> >=20
> > Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
> > ---
> >  meta-oe/recipes-core/toybox/{toybox_0.5.2.bb =3D> toybox_0.6.0.bb} | 9=
 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >  rename meta-oe/recipes-core/toybox/{toybox_0.5.2.bb =3D> toybox_0.6.0.=
bb} (90%)
> >=20
> > diff --git a/meta-oe/recipes-core/toybox/toybox_0.5.2.bb b/meta-oe/reci=
pes-core/toybox/toybox_0.6.0.bb
> > similarity index 90%
> > rename from meta-oe/recipes-core/toybox/toybox_0.5.2.bb
> > rename to meta-oe/recipes-core/toybox/toybox_0.6.0.bb
> > index bcd6a72..da03200 100644
> > --- a/meta-oe/recipes-core/toybox/toybox_0.5.2.bb
> > +++ b/meta-oe/recipes-core/toybox/toybox_0.6.0.bb
> > @@ -1,10 +1,11 @@
> >  SUMMARY =3D "Toybox combines common utilities together into a single e=
xecutable."
> >  HOMEPAGE =3D "http://www.landley.net/toybox/"
> > =20
> > -SRC_URI =3D "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.=
gz \
> > -    file://0001-Match-paths-with-busybox.patch"
> > -SRC_URI[md5sum] =3D "b5d1242767c411b69dcd717da1c218b2"
> > -SRC_URI[sha256sum] =3D "dec7f6433ee0e130f224fc63760b347ad0572280c4de32=
f1aaefbee813a79a00"
> > +SRC_URI =3D "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.=
gz"
> > +
> > +SRC_URI[md5sum] =3D "7f4a6c89e56c48e3350e611f5b36c2cf"
> > +SRC_URI[sha256sum] =3D "b6e2694d19ac08f1c3416d5b2a02a31d445db2ed98dec8=
9761430cdff2c9710d"
> > +
> > =20
> >  LICENSE =3D "BSD-0-Clause"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df0b8b3dd6431bcaa245da0a08bd=
0d511"
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXxpW0ACgkQN1Ujt2V2gBwmjQCffBMnJ1ABgKNN+VtC9Oxuh2VD
L6sAnRB/EOA5usvrSjATiWTeIS5Z2anp
=CLQf
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
