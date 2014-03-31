Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id B9A916BBDC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 12:17:41 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so3173811wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S6X84qWRdNKdPs/oQkZR2MI3ghd9tMVd31QB2JSCI60=;
	b=PwcHwB/5rpw7lrS95jMNIbU1nVFEj99UAU9zILXXCL7MWRvRRppV/wvM2zYArsdlP7
	fOLjfTGnfPICVrjwOWaC1xdOzTCsjumRm7Be22k0CDvHmyyu5ga8EMfpVl4+m95KOjmG
	MxqjkOO17wvfxpzVTAGPrUve93dMZXaTyBZyqADmcLiFqGgGW8l1CA4boAcEg7NUdYVh
	8sudDKM76lxU1iwnUoQ9YwpAze2T5T8svjPnyqUE7xMOw/u4A+dh4yHAlLsyMxlS2kAj
	xCKut04d/UbrIeNVfFUGSr/Hc6/UQACOAiONg1u94ljEJ2TCnmd6GMBhlBA4vk7xJakx
	gEMA==
X-Received: by 10.180.73.141 with SMTP id l13mr11931682wiv.60.1396268261769;
	Mon, 31 Mar 2014 05:17:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm32689215eeg.11.2014.03.31.05.17.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 05:17:40 -0700 (PDT)
Date: Mon, 31 Mar 2014 14:17:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140331121739.GE2425@jama>
References: <1396267345.14790.70.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1396267345.14790.70.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5] Antisocial layer behaviour
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
X-List-Received-Date: Mon, 31 Mar 2014 12:17:44 -0000
X-Groupsio-MsgNum: 48919
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s5/bjXLgkIwAv6Hi"
Content-Disposition: inline

--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 01:02:25PM +0100, Richard Purdie wrote:
> I noticed some rebuilds happening when my cache should have been good.
> "bitbake xxxx -S printdiff" showed:
>=20
> Task cmake-native:do_configure couldn't be used from the cache because:
>   We need hash f8a8910df42f4330ddaf9e40105baa7d, closest matching task wa=
s 93ac4b3cc3e9b5dd0868377cf287ca3d
>   basehash changed from 6b93d63cb19070822b91834c3ec58922 to a805733675f04=
ac021199aa92ed54cb5
>   Variable do_configure value changed from '    sed -i 's/^find_package(Q=
t5Core QUIET)$/#find_package(Qt5Core QUIET)/g' ${S}/Tests/RunCMake/CMakeLis=
ts.txt
>     sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUI=
RED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
>     sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Wid=
gets REQUIRED)/g' ${S}/Tests/QtAutomoc/CMakeLists.txt
>     sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUI=
RED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
>     sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#  find_package=
(Qt5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
>     sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QU=
IET)/g' ${S}/Source/QtDialog/CMakeLists.txt
> 	./configure --prefix=3D${prefix}
> ' to '	./configure --prefix=3D${prefix}
> '
>=20
> so basically the bbappend in meta-qt5 means that everything using
> cmake-native will get rebuilt unless you either include or exclude the
> layer everywhere :(

Well it's fixing the issue which happens only when you're including
meta-qt5 and have qtbase(-native) installed in sysroot, that's why it
was fixed by .bbappend.

> Can we try and find a better way to work around whatever that bbappend
> is trying to fix please?

I have patch to move this hack to oe-core recipe, but it's still hack
I'm not very proud of.

Should I send it?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s5/bjXLgkIwAv6Hi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM5XOMACgkQN1Ujt2V2gBxnewCeNmUTNTaFBxbUT1fwlytPhhTo
q9YAoIOLmJMHVENYqdQSE9XeOn3xBXUC
=x1Nk
-----END PGP SIGNATURE-----

--s5/bjXLgkIwAv6Hi--
