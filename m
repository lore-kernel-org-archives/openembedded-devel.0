Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 07A6660169
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 20:36:29 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so1679197wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G7BKRxxA2RabuRqahkRzwkNjjLPhM5RMCJFYP2QxFJc=;
	b=EmBziWExBrS/eczqb6th4g752g06OmRIqBOGFzLF9GqQoFnOwnVSMrGl7e9a+6+dYq
	j0PnVJt0hafcdXpFPDwgEO9ML1KOMJd6qGQH4IREchXJ0jis+F+4le1EysBk3H9ZKGDz
	v2+PeNTtc7up5RIxSRWc3unA6YWO6n6GkD+FXd3R1e7NadBHKtWom2vUrs8A4PvndBwn
	oNv6muN9PqR4MX8pdrBTit3xmaQsS7mPZGdhXvKVSHqlhb4HeiuQHKX8iS/hqtiPkCGz
	p3s0Q9nOvdE7iEffymVpn02pkn0DGVqRIRuE+Syd5EJhBEFCxhWsSZCN5SznE8tKyQCI
	Uvng==
X-Received: by 10.194.221.74 with SMTP id qc10mr17981232wjc.39.1408912589855; 
	Sun, 24 Aug 2014 13:36:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm23930562wie.21.2014.08.24.13.36.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 13:36:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Aug 2014 22:36:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140824203635.GL20524@jama>
References: <1408909187-29642-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKoDCx4yHcKrfMiZr85vorRm-8fcsy6zG-r+YDxpp17bPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoDCx4yHcKrfMiZr85vorRm-8fcsy6zG-r+YDxpp17bPQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] php: Fix native build due mistakenly linking against host's iconv
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
X-List-Received-Date: Sun, 24 Aug 2014 20:36:31 -0000
X-Groupsio-MsgNum: 51835
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zROEGoKAXsG5UqGB"
Content-Disposition: inline

--zROEGoKAXsG5UqGB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2014 at 04:45:22PM -0300, Otavio Salvador wrote:
> On Sun, Aug 24, 2014 at 4:39 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > The configure script has mistakenly choose to enable iconv support,
> > due host to provide it, adding '/usr/lib' to the linking flags and
> > failing as:
> >
> > ,----[ Linking error while testing 'fork' support ]
> > | conftest.c:268: warning: conflicting types for built-in function 'for=
k'
> > | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
> > |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
> > | collect2: ld returned 1 exit status
> > `----
> >
> > This patch disables iconv support for native builds fixing the error.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>=20
> Same error exist in Daisy.
>=20
> I did the rebase here and I can send a patch for it, as it has a minor
> conflict due the pkgconfig rework. Martin, do you want me to send the
> patch on top of Daisy as well or do you resolve the conflict yourself?

Please send it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zROEGoKAXsG5UqGB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP6TNMACgkQN1Ujt2V2gBzjYACfcuvfSkjIS/xdLg+OzBfociCE
4IgAniWZKXlEiZf06H09mHrHV0JfPTK1
=b4l4
-----END PGP SIGNATURE-----

--zROEGoKAXsG5UqGB--
