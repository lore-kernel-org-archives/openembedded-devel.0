Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4366A4BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 09:25:09 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id p58so5168436wes.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cuJIYlLT18xsUTBL3zGZbxfk8/qW21xaB5OgEe8dZ+Q=;
	b=A+B0Jm/HN7qNE+kNvhv67YAujeUQaVHqIm5DZpMM/okgxQNGA0ymrNpkogiudB/s8P
	CoZIzxcVFTy6hRWjgJqUX9N4jsq0Jb/iv48oyo9X4QaZkzgfBU51fjVmafMhqDImrlJ1
	9Qbx8FklFGIIIMbuznX5CotDsw9HESz+IWg0rmlm2rfOt/gdO7zeTU3yqMNgT05QNgtT
	5p06SPiCoZ/DRT9IRUJ/5VlkMqg7xui4cixHjI6FsD0g8ej67rOGt+XPnozJusFJ8hTB
	ggz7w+RI8OWlpaBwFvTvR6k94/HaEbZQ5rNw+A83h+NoCuyacnNEaNr9SqKxwLL5kU3d
	CHnA==
X-Received: by 10.180.14.199 with SMTP id r7mr11190590wic.6.1369733109561;
	Tue, 28 May 2013 02:25:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	fu14sm23026338wic.0.2013.05.28.02.25.08 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 28 May 2013 02:25:08 -0700 (PDT)
Date: Tue, 28 May 2013 11:25:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20130528092518.GE3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-8-git-send-email-eric@eukrea.com>
	<20130528084655.GB3192@jama> <20130528105056.62ea3b76@e6520eb>
MIME-Version: 1.0
In-Reply-To: <20130528105056.62ea3b76@e6520eb>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH 8/8] qtbase: add option to enable tslib support
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
X-List-Received-Date: Tue, 28 May 2013 09:25:09 -0000
X-Groupsio-MsgNum: 44892
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline

--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 10:50:56AM +0200, Eric B=E9nard wrote:
> Le Tue, 28 May 2013 10:46:55 +0200,
> Martin Jansa <martin.jansa@gmail.com> a =E9crit :
> > > +# if you want to enable tslib in your .bbappend, don't forget to add=
 tslib dependencies
> > > +# TSLIB_DEPENDS =3D "tslib"
> > > +# QT_TSLIB =3D "-tslib"
> >=20
> > I've added
> > TSLIB_DEPENDS ?=3D ""
> > here, otherwise it's uninitialized for DEPENDS.
> >=20
> true do you want a v2 ?

No, I've already added it and merged it :)

Normally I would take longer for testing it, but I know about other
people starting to work on 5.0.2 so I wanted them to start with your
fixes included.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGkd/4ACgkQN1Ujt2V2gByM5ACgkJTXMBio9AUbAmZ4p/J0UB3k
yUAAn3HSYg/E8lT7x319QAAfrAYstU9f
=urKy
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
