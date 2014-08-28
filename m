Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 80F8A711CE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:32:17 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id e4so1001550wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=u03mSmAkzouGukXvuzZvPKdr0zF5FuqQF4s4Hty7FtU=;
	b=DogNEiGAGHaWXZ5eVNQe/QZmB136hEiJsuJsnQmA4rEhRI2E/tBCPBgGvnT4QUEGUE
	fN6ris+d/ZCMTty9bAd5fS3wLUZj4zuqGLd8HQpDkQKNK8cJXljSw0VWS9kh3DUo7i9Y
	fYifsk4gcNwwTYjnEp7tidwKwDO3fg90EYn/eml20r8VOhX6LT9MAcU+3rd4121p7c1d
	w8OYnnAGpOveW5e9bl5Q+in5n2WR1SEBn0U2bd9VhdAGJUW3M5UcMTZ0Lw+dxr0nAGZO
	xXHP3xNP+kezJdTdHEYcU2pSHaiShl/uIkiMsFcHAUf50wCUkU67TBhxZfDie4p5Gfm+
	AuUQ==
X-Received: by 10.194.59.244 with SMTP id c20mr5671574wjr.59.1409236339136;
	Thu, 28 Aug 2014 07:32:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ot5sm10344170wjc.42.2014.08.28.07.32.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 07:32:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Aug 2014 16:32:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140828143228.GF16066@jama>
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>
	<1409227581-20888-5-git-send-email-pab@pabigot.com>
	<CAJTo0LZtEMeRoxAd9h9K7dQX6peSJRdB+vFGtWQXDSNUC_UPTg@mail.gmail.com>
	<53FF2932.7080505@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <53FF2932.7080505@pabigot.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 4/5] gpsd: add optional support for KPPS interface
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
X-List-Received-Date: Thu, 28 Aug 2014 14:32:20 -0000
X-Groupsio-MsgNum: 51900
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline

--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2014 at 08:05:54AM -0500, Peter A. Bigot wrote:
> On 08/28/2014 07:53 AM, Burton, Ross wrote:
> > On 28 August 2014 13:06, Peter A. Bigot <pab@pabigot.com> wrote:
> >> +PACKAGECONFIG ??=3D ""
> >> +PACKAGECONFIG[kpps] =3D ",,pps-tools"
> > That's not actually deterministic - if pps-tools is installed but the
> > packageconfig option is disabled then gpsd will still enable the
> > support.
>=20
> Yeah, I'm aware of that.  It's also not something that can be=20
> controlled, since gpsd's author doesn't believe in configuration options=
=20
> to enable features: every capability is enabled or disabled by=20
> inspecting the environment at compile-time.
>=20
> Although ntp does support some explicit enable/disable flags, it too=20
> fails to provide a way to say "Pay no attention to that PPS header, it=20
> isn't really there."

Then we need to patch their configure.

> For this situation I don't think there's a big issue.  The PACKAGECONFIG=
=20
> setting ensures that the header will be available if the feature is=20
> desired.  If it happens to be present but PPS support isn't explicitly=20
> requested, there's no failure in either build or runtime: it's still=20
> gated by runtime checks for PPS sources and the option being enabled in=
=20
> the Linux kernel.  (There are no runtime libraries that need to be=20
> installed to use KPPS.)
>=20
> Is this going to be a problem with the patch being accepted?

Yes

people can be used to have KPPS support enabled by "accident" e.g.
because they are building ntp with KPPS support and pps-tools is almost
always built before gpsd..

and then once it's built in different order and end-user will be
surprised by lost KPPS support from gpsd.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP/PXwACgkQN1Ujt2V2gBwlEACeM2hI/rH/z7cr7qiokwoyYVkC
GhMAnRltxupwsqrZpA3grYY2B7ihRehk
=S1eo
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
