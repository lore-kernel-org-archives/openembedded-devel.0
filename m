Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4581C6CEE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 08:07:24 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id d41so3893061eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dNP5s94E+xp3KbfjIPnNwJG2E+TZ3OeUpDNmd2jsTEs=;
	b=VvPOEV+ki3NcSmBR4LfiQQtCjF7ztAABsOREhmo1GHVqFNm/26IOw6Rs7/8sZZJTrZ
	cvtQJfd7fm7FETURvcdmrs+P37cKc7cbEO0aS4wsdJFLhUuRf5L9uib2EjCeXIZG0Cj/
	jVO42tmAyJUDUh2VWcdUUf0vFIvo0tfrK/aT7O4Mhh/LfGApyv2eaK7yOGrzbsh3J91E
	fujwQ/RlGbvEK9rllGrenTiNgj4wOWcoDrxq1gYeYXKCKs0mV4CWOghxHwY1xdIuCke+
	ak4prKMTbRuBONtOGk0RLUrVTPuJxfz2U5peEBpIjQTxKo14nqFtALXvLrY2gZhNlf0r
	QhXQ==
X-Received: by 10.14.3.9 with SMTP id 9mr1598093eeg.72.1383034045325;
	Tue, 29 Oct 2013 01:07:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b42sm67138758eem.9.2013.10.29.01.07.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 01:07:24 -0700 (PDT)
Date: Tue, 29 Oct 2013 08:07:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131029070736.GA3697@jama>
References: <1383001576-26578-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1383001576-26578-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][RFC] qtbase: fix build for gles2 enabled by PACKAGECONFIG
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
X-List-Received-Date: Tue, 29 Oct 2013 08:07:24 -0000
X-Groupsio-MsgNum: 46912
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2013 at 12:06:15AM +0100, Andreas M=FCller wrote:
> While playing around with QtQuick I needed gles2 support. Doing so I face=
d tons
> of error messages as mentionet in patch. It is caused by include chain:
>=20
> EGL/egl.h -> EGL/eglplatform.h -> X11/Xlib.h -> X.h
>=20
> In X.h we find definitions like
>=20
> #ifndef None
> #define None                 0L	/* universal null resource or null atom */
> #endif
>=20
> This causes building Qt to crash when using these kind of symbols.
>=20
> The patch was sent as RFC because:
>=20
> 1.  I would like ro discuss this at interest@qt-project.org and/or=20
>     development@qt-project.org but it was not possible to subscribe. I se=
nt
>     a mail to listmaster but no response either.
> 2.  qtbase_git might need same (and fails with the patch)
> 3.  This is not a proper solution: It is fragile and will return for futu=
re
>     changes. Proper soultion would be renaming the symbols Qt but I cannot
>     discuss due to 1.
> 4.  Nobody reported a build error for meta-qt5 so far.

We had similar problem, but fixed gles2 provider instead, in our case we
were using libhybris and the fix was to prevent loading X11 headers when
we want to use just gles2 from it.

Similar changes were added to mesa lately, can you do the same with
gles2 provider on your platform?

I must admit that I haven't read the patch yet and haven't finished
morning coffee :).

> Andreas M=FCller (1):
>   qtbase: fix build for gles2 enabled by PACKAGECONFIG
>=20
>  ...-reorder-includes-to-fix-build-with-eglfs.patch | 238 +++++++++++++++=
++++++
>  recipes-qt/qt5/qtbase.inc                          |   1 +
>  2 files changed, 239 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase-5.1.1/0027-reorder-includes-to-=
fix-build-with-eglfs.patch
>=20
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJvXrgACgkQN1Ujt2V2gBy3XACeL0yVl0MU8/UuCELOymvao+ux
ZpwAn0cXLrrohJZIwr/bkdZsQQy31ggS
=C2zS
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
