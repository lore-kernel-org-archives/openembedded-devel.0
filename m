Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TstJQ-00050W-Mm
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 11:55:14 +0100
Received: by mail-pa0-f46.google.com with SMTP id bh2so948960pad.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 02:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0XI63YQ40f8heGY2X7egBaoSXNu83bFXeDjpt0E1C6M=;
	b=MEi1MSWKUcDgafB7taUKDNLmpHYDs1oObzE9cOT4g36naZV5b4p4jlRfYfd9pcofxf
	iHK4qvMY4I0DyhHjpz2dTyhJAAMjnJfAtC9LumeM0DQ47UnVmAt5SU38dVDFWHPaOU4E
	hVR4vSVrXscWry6lUyGVZdusrZ12okgTo9tzIwMvX7OqnjMbveJa5dO3LuA5FnwIyPfm
	/Qa3vCj/mVYAglQexmewN6kw/aStLEEXcgR/GUSR2g4ZKZ1sHfu842uQAmaVCMXCAldp
	0N/RRjpTlBSQ8gFEtzUAQ3Bt6T4jpC1cgYy650fBEcy2TQzp3oGL+OaC2BA4+Jro+ySj
	koxA==
X-Received: by 10.68.230.135 with SMTP id sy7mr209763475pbc.76.1357727999975; 
	Wed, 09 Jan 2013 02:39:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f5sm42594334pav.22.2013.01.09.02.39.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 02:39:59 -0800 (PST)
Date: Wed, 9 Jan 2013 11:40:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130109104003.GG3722@jama.palm1.palmone.com>
References: <1357407870-22272-1-git-send-email-philip@balister.org>
	<20130106094053.GC3272@jama>
MIME-Version: 1.0
In-Reply-To: <20130106094053.GC3272@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@openembedded.org
Subject: Re: [meta-oe][PATCH] fftw : Update to version 3.3.3.
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
X-List-Received-Date: Wed, 09 Jan 2013 10:55:16 -0000
X-List-Received-Date: Wed, 09 Jan 2013 10:55:16 -0000
X-Groupsio-MsgNum: 42590
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iAL9S67WQOXgEPD9"
Content-Disposition: inline

--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 06, 2013 at 10:40:53AM +0100, Martin Jansa wrote:
> On Sat, Jan 05, 2013 at 12:44:30PM -0500, Philip Balister wrote:
> >  * Convert --enable-neon selection to use neon tune feature.
> >  * Drop neon patch since fftw now has direct neon support.
> >  * Remove SRC_URI from each bb file and use only SRC_URI from fftw.inc =
file.
> >=20
> > The old recipe selected neon for all armv7 machines, which was not
> > entirely correct.
>=20
> 2013-01-06 10:38:18
> URL:http://patchwork.openembedded.org/patch/42019/mbox/ [1082569] ->
> "pw-am-42019.patch" [1]
> Applying: fftw : Update to version 3.3.3.
> fatal: corrupt patch at line 23200
> Patch failed at 0001 fftw : Update to version 3.3.3.
>=20
> --ac_cr=3D'
> '
> -+ac_cr=3D`echo X | tr X '\015'`

Original file had --ac_cr=3D'^M' and ^M got interpreted somewhere between
Philip's repo and ML/PW, pulled from Philip's repo directly.

Merged, thanks!

> Please fix that.
>=20
> >=20
> > Signed-off-by: Philip Balister <philip@balister.org>
> > ---
> >  meta-oe/recipes-support/fftw/fftw_3.2.2.bb         |     8 -
> >  meta-oe/recipes-support/fftw/fftw_3.3.3.bb         |     7 +
> >  .../recipes-support/fftw/fftwf/vesperix-neon.patch | 31791 -----------=
--------
> >  meta-oe/recipes-support/fftw/fftwf_3.2.2.bb        |    15 -
> >  meta-oe/recipes-support/fftw/fftwf_3.3.3.bb        |    10 +
> >  meta-oe/recipes-support/fftw/fftwl_3.2.2.bb        |     8 -
> >  meta-oe/recipes-support/fftw/fftwl_3.3.3.bb        |     7 +
> >  7 files changed, 24 insertions(+), 31822 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/fftw/fftw_3.2.2.bb
> >  create mode 100644 meta-oe/recipes-support/fftw/fftw_3.3.3.bb
> >  delete mode 100644 meta-oe/recipes-support/fftw/fftwf/vesperix-neon.pa=
tch
> >  delete mode 100644 meta-oe/recipes-support/fftw/fftwf_3.2.2.bb
> >  create mode 100644 meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
> >  delete mode 100644 meta-oe/recipes-support/fftw/fftwl_3.2.2.bb
> >  create mode 100644 meta-oe/recipes-support/fftw/fftwl_3.3.3.bb



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iAL9S67WQOXgEPD9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtSQMACgkQN1Ujt2V2gBzX2QCeJvUdiyKJbXtbY74DyHomZl/Z
tjMAn2eWvHWyv/6tAh1Rd7BAX9u4/r8y
=q0vc
-----END PGP SIGNATURE-----

--iAL9S67WQOXgEPD9--
