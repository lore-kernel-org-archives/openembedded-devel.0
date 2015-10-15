Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id EEDC477109
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 15:17:51 +0000 (UTC)
Received: by qkht68 with SMTP id t68so39848072qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y0Vt7Am2gOnz9fE30lMu+VUQkk7XaiIh+IgAi0LmiHc=;
	b=iyiqa+plN9B4stnJWGZu65Z8Scywagy8PH5mtDEFuCsXEQNh+lXtpvqrjsSSQTDbbM
	j5Bav/7ime3+gic6j9Yu4HEHW7l0OWQYdgFYcZyTzH7df9eUDSWUTuMxvghj0ObOnbpv
	/mAfD/XE5rBCiFpK16g/WYGRY661yTla9IudeQZPI00vpGM0yUjbsLxTr00J4uGF0WfA
	7QRCAcjIQj7UcXMwCsteq0A4/suMFDejAWiDvGDUvmhn4yzc7yixupuzKEEc4SYfKF6g
	WWSmIcHUKghYrpHCylNCdlSifn1i7/qyQjwq21wqsMSwmVtYEzXbWoykpMlTWQ1CF49/
	zhTA==
X-Received: by 10.194.7.232 with SMTP id m8mr11538992wja.56.1444922271676;
	Thu, 15 Oct 2015 08:17:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jd7sm17054357wjb.19.2015.10.15.08.17.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 08:17:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Oct 2015 17:18:12 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20151015151812.GE2588@jama>
References: <CAAfyv34Ly=rBg=S60qYbjtszCLp7kUaQqwQ9taPen3s3fiokVg@mail.gmail.com>
	<90F3B45E-0156-46A9-8BF7-D83F9B0BD059@gmail.com>
MIME-Version: 1.0
In-Reply-To: <90F3B45E-0156-46A9-8BF7-D83F9B0BD059@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Martin Jansa <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: meta-qt5 - Qt5LinguistTools cmake problem
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
X-List-Received-Date: Thu, 15 Oct 2015 15:17:52 -0000
X-Groupsio-MsgNum: 57854
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3O1VwFp74L81IIeR"
Content-Disposition: inline

--3O1VwFp74L81IIeR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 11:44:33PM -0700, Khem Raj wrote:
>=20
> > On Oct 14, 2015, at 1:34 PM, Belisko Marek <marek.belisko@gmail.com> wr=
ote:
> >=20
> > Hi,
> >=20
> > I'm facing the same problem as already reported here:
> > http://patchwork.openembedded.org/patch/97183/
> >=20
> > when using qt5_add_translation in CMakeLists.txt
> >=20
> > Mentioned patch isn't included in actual meta-qt5 master which I'm
> > using. Is there other solution or can I use this approach? Many
> > thanks.
>=20
> that patch looks good to me. Martin ?

Thanks for review, it wasn't applied until now, because of author's
comment between "---".

> >=20
> > BR,
> >=20
> > marek
> >=20
> > --
> > as simple and primitive as possible
> > -------------------------------------------------
> > Marek Belisko - OPEN-NANDRA
> > Freelance Developer
> >=20
> > Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> > Tel: +421 915 052 184
> > skype: marekwhite
> > twitter: #opennandra
> > web: http://open-nandra.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3O1VwFp74L81IIeR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYfwY8ACgkQN1Ujt2V2gBy36wCfSPuhtzPTW4GkEVxZVSWj8dTt
5UcAn1BfXYTcuq3V+zFXySNBdAoknHyp
=YjSL
-----END PGP SIGNATURE-----

--3O1VwFp74L81IIeR--
