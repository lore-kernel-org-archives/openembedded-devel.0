Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9B43961222
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 07:34:41 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3286090eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 00:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=saCvQlAXW4bbv8TjeTrBH1FgiKf2MN2/oFr0q0eSlVg=;
	b=PidqVbq2twCA3NJDjGHtarNz3aiMYRSWjxL86mJv5JIpY04I0ZFJnQF9o0PNAZgbG8
	iFlXvVlwb7ZzNg4xvrMZqeSoFupZlcWffD2s8SsW/7WGcUl79sv+R4FM1DiI2SI6Rfm0
	cuY4WqsIcPpCFWePgRzGb7jMMYv8fPLPV7abXIP2zZx06WqcfpVR+y0lzxJuNahPsNIb
	CpKQENzS318F+NtPq+hn2FuUWX+ceHd7kIgf2adJNdis9Rv1p8MIBs+hUqBn+iuiu0Po
	/fXpqWKssPDhWtpDqCrha/k/0FRtjP2Jp+sH2IhT/bBSmmpCPp+Qrpqc+jPGz49O3vAM
	wwqQ==
X-Received: by 10.14.45.70 with SMTP id o46mr11756135eeb.19.1376292881600;
	Mon, 12 Aug 2013 00:34:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm41852784eeh.8.2013.08.12.00.34.40 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 00:34:41 -0700 (PDT)
Date: Mon, 12 Aug 2013 09:35:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130812073530.GJ17945@jama>
References: <cover.1376281943.git.hongxu.jia@windriver.com>
	<b924f5411208349fcab702a887b1bfd30a182fd7.1376281943.git.hongxu.jia@windriver.com>
	<20130812070333.GI17945@jama> <52088E97.7000800@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52088E97.7000800@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-cpan 1/3] meta-cpan creation
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
X-List-Received-Date: Mon, 12 Aug 2013 07:34:42 -0000
X-Groupsio-MsgNum: 45642
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bWEb1MG/o7IKOlQF"
Content-Disposition: inline

--bWEb1MG/o7IKOlQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2013 at 03:28:23PM +0800, Hongxu Jia wrote:
> Thank you for pointing out, I have updated the branch to add this:
>=20
> +When sending single patches, please using something like:
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org=20
> --subject-prefix=3Dmeta-cpan][PATCH'
> +

What about the name question? cpan or perl?

> >> index 0000000..11da11f
> >> --- /dev/null
> >> +++ b/conf/layer.conf
> >> @@ -0,0 +1,10 @@
> >> +# We have a conf and classes directory, add to BBPATH
> >> +BBPATH .=3D ":${LAYERDIR}"
> >> +
> >> +# We have recipes-* directories, add to BBFILES
> >> +BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
> >> +	${LAYERDIR}/recipes-*/*/*.bbappend"
> >> +
> >> +BBFILE_COLLECTIONS +=3D "perl"
> > I don't have strong opinion either way, but lets call this layer
> > meta-perl or meta-cpan and use the same name in BBFILE_COLLECTIONS.
> >
> > meta-perl would be more generic (matching with meta-ruby) and maybe
> > we'll need to add some perl related recipes which aren't from cpan?
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bWEb1MG/o7IKOlQF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIIkEIACgkQN1Ujt2V2gBxSlQCeP2n6+Z4m2d3FjE0jyJ3kKVvL
2ZQAoIp+bHVNTebtgl5CK5aZd1IESrIv
=qWL2
-----END PGP SIGNATURE-----

--bWEb1MG/o7IKOlQF--
