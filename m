Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TrmxX-0005lx-LQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:56:03 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so10095604pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=iG/4UHXyeEyXP3UARVYgjHgU/jdfGdHF6IHNLaLfkKU=;
	b=AMEqIFZAHe5hcfIFFnm5O9yTQh+zxk4lIczq56sVGctDoZWWuczEJRegtsyYiiVycQ
	5iBCXHRLURxIMPk9a1z74VVUTWbjQxWNcc5J8nmOchgGF0XFqi2LZ5itz/J6rdC3t2Sj
	AX4w15lhh0/ihTuvDRgmL0eAlNmB1I6VtD0fKAah9oo5KvQhFoeiaRum8LBOHjM51EIL
	QAQNeRz7j2pCHcEthz3w2dtwkZ0vnzTh2ytgqHwibbYoRzV/eGtHAKFzZxwHmwkRVYur
	n4mDcYoBmJKQbZ4D2pKKWchVEeZ/HTZjbJjz2yTXSjzgWqzUxLvfaY5p5Y5I8bWRHTRF
	4Xug==
X-Received: by 10.68.241.103 with SMTP id wh7mr177928238pbc.153.1357465255398; 
	Sun, 06 Jan 2013 01:40:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id sb3sm35540574pbc.44.2013.01.06.01.40.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:40:54 -0800 (PST)
Date: Sun, 6 Jan 2013 10:40:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130106094053.GC3272@jama>
References: <1357407870-22272-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1357407870-22272-1-git-send-email-philip@balister.org>
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
X-List-Received-Date: Sun, 06 Jan 2013 09:56:04 -0000
X-Groupsio-MsgNum: 42528
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline

--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 05, 2013 at 12:44:30PM -0500, Philip Balister wrote:
>  * Convert --enable-neon selection to use neon tune feature.
>  * Drop neon patch since fftw now has direct neon support.
>  * Remove SRC_URI from each bb file and use only SRC_URI from fftw.inc fi=
le.
>=20
> The old recipe selected neon for all armv7 machines, which was not
> entirely correct.

2013-01-06 10:38:18
URL:http://patchwork.openembedded.org/patch/42019/mbox/ [1082569] ->
"pw-am-42019.patch" [1]
Applying: fftw : Update to version 3.3.3.
fatal: corrupt patch at line 23200
Patch failed at 0001 fftw : Update to version 3.3.3.

--ac_cr=3D'
'
-+ac_cr=3D`echo X | tr X '\015'`

Please fix that.

>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-support/fftw/fftw_3.2.2.bb         |     8 -
>  meta-oe/recipes-support/fftw/fftw_3.3.3.bb         |     7 +
>  .../recipes-support/fftw/fftwf/vesperix-neon.patch | 31791 -------------=
------
>  meta-oe/recipes-support/fftw/fftwf_3.2.2.bb        |    15 -
>  meta-oe/recipes-support/fftw/fftwf_3.3.3.bb        |    10 +
>  meta-oe/recipes-support/fftw/fftwl_3.2.2.bb        |     8 -
>  meta-oe/recipes-support/fftw/fftwl_3.3.3.bb        |     7 +
>  7 files changed, 24 insertions(+), 31822 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/fftw/fftw_3.2.2.bb
>  create mode 100644 meta-oe/recipes-support/fftw/fftw_3.3.3.bb
>  delete mode 100644 meta-oe/recipes-support/fftw/fftwf/vesperix-neon.patch
>  delete mode 100644 meta-oe/recipes-support/fftw/fftwf_3.2.2.bb
>  create mode 100644 meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
>  delete mode 100644 meta-oe/recipes-support/fftw/fftwl_3.2.2.bb
>  create mode 100644 meta-oe/recipes-support/fftw/fftwl_3.3.3.bb

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDpRqUACgkQN1Ujt2V2gBz0BgCgpUKhRnGODyN2Iv7wlgbZH9ua
pSUAoLSpShNkplCaQ+Ub14LibwPLYrRX
=HQ0W
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
