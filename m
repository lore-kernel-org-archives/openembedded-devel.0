Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id AF5B97121A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:27:50 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so834841wgh.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hNJ5kJUHfNW81aU96XjWizeZWPl5PVOz1V0suHhVy8U=;
	b=gwy/P32FktzLoZNi+TkVaHFkjMLVVkOMZc4/Vn6Kxan3RPQJdEGsgyMDJm5yQAw/79
	s96lffbeu4F/IdfTFXKHeDZCj4l7m3TXOuglcV99eReMndpIlY3vRrg+70FLN6j/drac
	9nZKKMuV1YCBdrzHjwrUB+wrstzZGZa8Y4D8EKT8iRkHvNsAl33VTgvbSnb+PfrrLimE
	o4k+VhFN1uIKij/dQuCyri3ZlmnYUfJxLeClpKjHWjpwfmxE57krsBbHbc+1SexIcnQU
	f11u8kW5oqrRDTJzk06aS+09NIbvhkWWVkSd3BxJ/3CHkmvUvikH+f38Jk/oScw8wcxJ
	ZT7A==
X-Received: by 10.180.99.4 with SMTP id em4mr6686031wib.8.1409236070949;
	Thu, 28 Aug 2014 07:27:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s3sm36242713wis.3.2014.08.28.07.27.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 07:27:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Aug 2014 16:27:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140828142759.GD16066@jama>
References: <20140827223659.1fb55fb4@symphony.aura-online.co.uk>
	<20140828074208.GG13139@haswell> <20140828092944.GB16066@jama>
	<20140828103826.3b133eb0@red.yakaraplc.local>
MIME-Version: 1.0
In-Reply-To: <20140828103826.3b133eb0@red.yakaraplc.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver] nginx 1.7.4 cross-compiling patches
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
X-List-Received-Date: Thu, 28 Aug 2014 14:27:54 -0000
X-Groupsio-MsgNum: 51898
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 10:38:26AM +0100, James Le Cuirot wrote:
> On Thu, 28 Aug 2014 11:29:44 +0200
> Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Thu, Aug 28, 2014 at 12:42:08AM -0700, Khem Raj wrote:
> > > On 14-08-27 22:36:59, James Le Cuirot wrote: =20
> > > > Hello,
> > > >=20
> > > > I was trying to cross-compile nginx 1.7.4 on Gentoo and found your
> > > > nginx-cross.patch. It almost applied, despite being prepared
> > > > against 1.0.11. I recreated it and everything worked except that
> > > > the --with-endian option is not actually effective. I have
> > > > attached the new nginx-cross.patch as well as a --with-endian
> > > > fix. Hope this helps. As I don't use OpenEmbedded, I'll leave
> > > > updating the nginx package to you. =20
> > >=20
> > > thanks for the patch. I hope it will appear in patchwork and can be
> > > picked by someone doing package upgrade =20
> >=20
> > It's not correctly picked by patchwork
> > http://patchwork.openembedded.org/patch/79247/
> >=20
> > James: Please resend with git send-email as README suggests
> > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>=20
> Hi Martin. I was going to but I figured that wouldn't really make sense
> unless the package script was updated as well. If it were just merged
> as-is, it would break the package. Would you still like it submitted in
> this form anyway?

Please submit it together with upgrade from 1.4.4. to newer 1.7.4 version.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP/PG8ACgkQN1Ujt2V2gBxVlwCglMFfK4rVinPNoeK/2V7ugQlf
GBIAn2IuXWmyC/o1A0Q3kZ7XlMj6nvKh
=cYL5
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
