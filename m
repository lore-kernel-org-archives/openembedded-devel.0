Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2F960DD7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 06:37:14 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so2016074eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 22:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VaJ/Yx9wGcSwwIaoUSOCBUM4sYdvpvNE3NediuUrqcg=;
	b=E2VL3pJNem6UjL6saheEjC6DsIYDMU6kGSAtPwKnxioXord8/voolSiy8QQtMXlGT2
	oaJetUR21yDUTtqGKpjDRYpuKH2tQw9BjFcvND/24ev9/chQA07B3rG9IN5+ec1v4dQQ
	MzosKLwwmld4W0KnE1xDguZkRF2/+Sf7yZmeCWGuiE49BDUb2X1La0wMjcwd0rKKByGM
	pg/MjbJrpmEczkbl2NHC0ZsT2VdF7w8zJgHa02/4Aes1uhol+1OF1piMumZfgZ7em0Xt
	haMOjQdvhHpueSsKK0eOaCAK4GLF2wMcwbm1PgWJtPa1vDG7Sy7UJ69DtjuTYaOxr4ek
	ZSxg==
X-Received: by 10.14.87.129 with SMTP id y1mr12811827eee.38.1393051035617;
	Fri, 21 Feb 2014 22:37:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o43sm35171210eef.12.2014.02.21.22.37.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Feb 2014 22:37:14 -0800 (PST)
Date: Sat, 22 Feb 2014 07:37:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140222063750.GI3854@jama>
References: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
	<20140221211207.GW22890@denix.org>
MIME-Version: 1.0
In-Reply-To: <20140221211207.GW22890@denix.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 1/4] qmake5_base.bbclass: Use Qt version path for headers
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
X-List-Received-Date: Sat, 22 Feb 2014 06:37:17 -0000
X-Groupsio-MsgNum: 48263
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Content-Disposition: inline

--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2014 at 04:12:07PM -0500, Denys Dmytriyenko wrote:
> On Fri, Feb 21, 2014 at 05:41:01PM -0300, Otavio Salvador wrote:
> > When looking for Qt5 headers we ought to use the Qt5 specific path. In
> > case the distribution wants to have a flat tree it can set QT_DIR_NAME
> > and it will still works as expected.
> >=20
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>=20
> Acked-by: Denys Dmytriyenko <denys@ti.com>
>=20
> Martin,
>=20
> Thinking about what you said in that Wiki section - I believe the number =
of=20
> apps consuming headers from /usr/include/qt5 is much higher than number o=
f=20
> non-Qt5 libs/modules potentially installing headers in there... So, we=20
> shouldn't require every app recipe to set PATH_HEADERS properly.

Setting OE_QMAKE_PATH_HEADERS is simple oneline change:
OE_QMAKE_PATH_HEADERS =3D "${OE_QMAKE_PATH_QT_HEADERS}"

undoing this implementation isn't, if you really want to change
OE_QMAKE_PATH_HEADERS then include QT_DIR_NAME in it, but leave
OE_QMAKE_PATH_QT_HEADERS alone.

> >  classes/qmake5_base.bbclass |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> > index 3861cd0..0cfb5a4 100644
> > --- a/classes/qmake5_base.bbclass
> > +++ b/classes/qmake5_base.bbclass
> > @@ -57,7 +57,7 @@ do_generate_qt_config_file() {
> >      cat > ${QT_CONF_PATH} <<EOF
> >  [Paths]
> >  Prefix =3D ${OE_QMAKE_PATH_PREFIX}
> > -Headers =3D ${OE_QMAKE_PATH_HEADERS}
> > +Headers =3D ${OE_QMAKE_PATH_QT_HEADERS}
> >  Libraries =3D ${OE_QMAKE_PATH_LIBS}
> >  ArchData =3D ${OE_QMAKE_PATH_ARCHDATA}
> >  Data =3D ${OE_QMAKE_PATH_DATA}
> > --=20
> > 1.7.10.4
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMIRb4ACgkQN1Ujt2V2gBy55gCfeNqV8OwxwYKBSRqoW1K+CNMN
snkAn3zKc+IxFp22vWLuhOGAOtKVAt6g
=10Zg
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--
