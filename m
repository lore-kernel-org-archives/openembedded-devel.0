Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3nJm-00042w-Jg
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 14:12:22 +0200
Received: by wibhn17 with SMTP id hn17so4041730wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2012 05:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p+o03tdqE7QjdVlKhUB5/+xBmpRs/JD5ZgZoJ4NrYFY=;
	b=0JpEl/gTbvBNoEHgJCOJl8FmpuNj2CgCs5H6mmtvvT3pm3FMcF6kPwPusNtVbA6YNc
	IVwk3mo8GWZ8vpnW8esasOMlXG706m2/C97932te3CykqXRweFAgqKpnRm7YCLFusKpA
	1A+NX/syaialsAzjHnWhXg89yJnltL1ZBEG6J2DBPPvzHU/lCgkrmN6/4+tUDlBcrorM
	7WHIPpjsrb/84SQa2Cv1c2z/HNS3n+1OMQRbnMx+7hYrgBtmFiuzTMxZw4OsTFUCp9xj
	OCDDCViQ7Wc5O6QFUXFyWbVOLY0IhbsdJFKHQ+d2lUeh+O0LjAZ41ZHgB9NkAqV84q6C
	x+mQ==
Received: by 10.180.84.104 with SMTP id x8mr35891489wiy.20.1345550419180;
	Tue, 21 Aug 2012 05:00:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm3730639wib.0.2012.08.21.05.00.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 05:00:16 -0700 (PDT)
Date: Tue, 21 Aug 2012 14:00:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120821120021.GB3029@jama.jama.net>
References: <1345386709-19033-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1345386709-19033-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] pixman: remove append from meta-oe
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
X-List-Received-Date: Tue, 21 Aug 2012 12:12:22 -0000
X-Groupsio-MsgNum: 40301
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline

--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 19, 2012 at 04:31:49PM +0200, Andreas M=FCller wrote:
> If [1] is going to be accepted, there is no need for pixman in meta-oe.
>=20
> [1] http://patches.openembedded.org/patch/34885/
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...lated-workarounds-in-cpu-features-detecti.patch |  121 --------------=
------
>  ...mplementation-of-pixman_blt-with-overlapp.patch |  114 --------------=
----
>  .../xorg-lib/pixman_0.26.2.bbappend                |   13 --
>  3 files changed, 0 insertions(+), 248 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0001-=
ARM-qemu-related-workarounds-in-cpu-features-detecti.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman-0.26.2/0008-=
Generic-C-implementation-of-pixman_blt-with-overlapp.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.26.2.bbapp=
end

Sorry I haven't noticed/tested it before merging your updated patches to
meta-oe (before [1] is applied), but your updated patch
0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch

does not work and emacs is failing again:
| LC_ALL=3DC qemu-arm -cpu cortex-a8 -s 1048576 -L
/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/=
armv7a-vfp-neon-oe-linux-gnueabi/emacs-23.4-r1/qemu-treedir
temacs -batch -l loadup dump
| qemu: uncaught target signal 11 (Segmentation fault) - core dumped
| Segmentation fault (core dumped)

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAzeFUACgkQN1Ujt2V2gBwIEwCeLko4BmJBJ/8kwHaPgF2+lDAo
tF8AmwbBenWnrGseVd+BH/GgpCd3ikcn
=tOJP
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
