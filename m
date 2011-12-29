Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RgDHM-0004Gy-NC
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Dec 2011 11:32:08 +0100
Received: by wgbds11 with SMTP id ds11so19640687wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2011 02:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j9V4wVdnnrfMVGx5V7qTpy8mKNOckjRXL9ZY4q4jjIk=;
	b=ZqQy8SINBY1t6Vv7f5CXa1t0cnQI4Y1IS0M19pAJsO1WU/cxg6xYsJe1rJrCzbBamu
	bH/0bBz0vtqIJsaqW9eB8FODUfPaARI7mGwaSv+SNjBesnFWJOiuKrGbqXeqAEROrdnk
	X4EryaomVj5yrukP519XwS1IgV7fwlHrGzc+0=
Received: by 10.227.204.208 with SMTP id fn16mr34990110wbb.6.1325154294435;
	Thu, 29 Dec 2011 02:24:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm82071548wiz.4.2011.12.29.02.24.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Dec 2011 02:24:53 -0800 (PST)
Date: Thu, 29 Dec 2011 11:24:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111229102439.GA16885@jama.jama.net>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
	<20111223100335.GO12791@jama.jama.net>
	<CAEsOVNc05t2eoOqYo8U1Ktz4O4cKNgnve2qMLgB0_qn+7H4JDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNc05t2eoOqYo8U1Ktz4O4cKNgnve2qMLgB0_qn+7H4JDA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2 meta-oe 1/7] xmlto: add version 0.0.25
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Dec 2011 10:32:08 -0000
X-Groupsio-MsgNum: 36300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2011 at 01:32:24AM +0000, McClintock Matthew-B29882 wrote:
> On Fri, Dec 23, 2011 at 4:03 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Is there plan to provide native stylesheets too? Because after building
> > xmlto-native some packages are failing because they detect xmlto-native
> > available but don't check if all needed stylesheets are installed.
>=20
> Can you help us out here and tell us what package would provide these?

In gentoo they are provided by packages like this
app-text/docbook-xml-dtd
but because each docs build can ask for different dtd version then it's
common to have more than one version installed at the same time (e.g. 4.1,
4.2 and 4.3 are mostly used at my gentoo installation)

That's why OE-classic and OE-core has those PV already in PN:
=2E/recipes/docbook-sgml-dtd
=2E/recipes/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
=2E/recipes/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
=2E/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
=2E/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.4-native.bb
=2E/recipes/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
and
=2E/meta/recipes-devtools/docbook-sgml-dtd
=2E/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
=2E/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
=2E/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
=2E/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb

But those xorg recipes seems to be using dtd-4.3.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk78P+cACgkQN1Ujt2V2gByakQCeJMVxBFm8fURs9JlWvJpBp7Es
PHcAn1fXadOzHqr72V8euwOOuJ88RNE4
=ydFR
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
