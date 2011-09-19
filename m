Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R5f64-0008KY-Fo
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 16:45:24 +0200
Received: by bke11 with SMTP id 11so25228860bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JOptYmTPBU2HwXlyI9rB4/bDGDLBrW8sgYv9DMt5f3Y=;
	b=hqKjUxNzpZNptVVKiUNkrn80aSZY64+1ULhYqweTFbEuE93oES7Te1A/cch8uIYsq0
	XbTaEtxXVMtLCMsFlgOUFOXyn8vFL7eD0Tq0TYi0poNJErB6KkNqQwitlB0S19I6kns4
	vyIV3xsEbaAbfys8W2WO0lS/H12NRjf2GFIyg=
Received: by 10.204.135.138 with SMTP id n10mr792745bkt.256.1316443208350;
	Mon, 19 Sep 2011 07:40:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fc13sm13989125bkc.0.2011.09.19.07.40.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Sep 2011 07:40:07 -0700 (PDT)
Date: Mon, 19 Sep 2011 16:39:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110919143959.GC19168@jama.jama.net>
References: <1316384018-7651-1-git-send-email-dbaryshkov@gmail.com>
	<j56n5t$s0d$2@dough.gmane.org> <j57i4p$i51$1@dough.gmane.org>
	<j57inn$mme$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j57inn$mme$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][V3] openssl: fixup the openssl-fix-link patch
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
X-List-Received-Date: Mon, 19 Sep 2011 14:45:24 -0000
X-Groupsio-MsgNum: 34373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline

--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2011 at 04:14:15PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 19-09-11 16:03, Dmitry Eremin-Solenikov schreef:
> > On 09/19/2011 10:23 AM, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
> >>=20
> >> Op 19-09-11 00:13, Dmitry Eremin-Solenikov schreef:
> >>> Include more dependencies into openssl-fix-link.patch patch.
> >>>=20
> >>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>  ---=20
> >>> .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   22=20
> >>> +++++++++++--------=20
> >>> .../recipes-connectivity/openssl/openssl_1.0.0e.bb | 2 +- 2 files=20
> >>> changed, 14 insertions(+), 10 deletions(-)
> >>=20
> >>=20
> >> I still get: NOTE: package openssl-native-1.0.0e-r13.1: task do_patch:=
=20
> >> Failed
> >=20
> > Strange. Please check: md5sum=20
> > sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-=
1.0.0e/openssl-fix-link.patch
> >
> >
> >=20
> 03c99586e59ea5a25e0598c7419d8aff
> > sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-=
1.0.0e/openssl-fix-link.patch
> >
> >
> >=20
> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ md5sum
> recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
> 03c99586e59ea5a25e0598c7419d8aff
> recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFOd043MkyGM64RGpERAnKnAJwJMqWQhqhqLYRycKAmkAwzOvMHoACeP2Xm
> F2AqsDz4e8AzU6FRz5po5Fk=3D
> =3DSnrw
> -----END PGP SIGNATURE-----

FWIW:=20

OE spitz@shr ~/shr-core/meta-openembedded $ ~/oe/contrib/patchwork/pw-am.sh=
 11669
2011-09-19 16:17:30 URL:http://patches.openembedded.org/patch/11669/mbox/ [=
2673] -> "pw-am-11669.patch" [1]
Applying: openssl: fixup the openssl-fix-link patch
/OE/shr-core/meta-openembedded/.git/rebase-apply/patch:19: space before tab=
 in indent.
        @dir=3Dcrypto; target=3Dall; $(BUILD_ONE_CMD)
/OE/shr-core/meta-openembedded/.git/rebase-apply/patch:22: space before tab=
 in indent.
        @dir=3Dssl; target=3Dall; $(BUILD_ONE_CMD)
/OE/shr-core/meta-openembedded/.git/rebase-apply/patch:26: space before tab=
 in indent.
        @dir=3Dengines; target=3Dall; $(BUILD_ONE_CMD)
/OE/shr-core/meta-openembedded/.git/rebase-apply/patch:33: space before tab=
 in indent.
        @dir=3Dapps; target=3Dall; $(BUILD_ONE_CMD)
/OE/shr-core/meta-openembedded/.git/rebase-apply/patch:36: space before tab=
 in indent.
        @dir=3Dtest; target=3Dall; $(BUILD_ONE_CMD)
warning: squelched 1 whitespace error
warning: 6 lines add whitespace errors.

=2E..
03c99586e59ea5a25e0598c7419d8aff  meta-openembedded/meta-oe/recipes-connect=
ivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
=2E..

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 731 of 958 (ID: 4, virtual:native:/OE/shr-core/meta-open=
embedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_fetch)
NOTE: Running task 885 of 958 (ID: 18, /OE/shr-core/meta-openembedded/meta-=
oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_fetch)
NOTE: package openssl-native-1.0.0e-r13.1: task do_fetch: Started
NOTE: package openssl-native-1.0.0e-r13.1: task do_fetch: Succeeded
NOTE: package openssl-1.0.0e-r13.1: task do_fetch: Started
NOTE: package openssl-1.0.0e-r13.1: task do_fetch: Succeeded
NOTE: Running task 886 of 958 (ID: 0, virtual:native:/OE/shr-core/meta-open=
embedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_unpack)
NOTE: Running task 887 of 958 (ID: 14, /OE/shr-core/meta-openembedded/meta-=
oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_unpack)
NOTE: package openssl-1.0.0e-r13.1: task do_unpack: Started
NOTE: package openssl-native-1.0.0e-r13.1: task do_unpack: Started
NOTE: package openssl-1.0.0e-r13.1: task do_unpack: Succeeded
NOTE: Running task 888 of 958 (ID: 15, /OE/shr-core/meta-openembedded/meta-=
oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_patch)
NOTE: package openssl-native-1.0.0e-r13.1: task do_unpack: Succeeded
NOTE: Running task 889 of 958 (ID: 1, virtual:native:/OE/shr-core/meta-open=
embedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_patch)
NOTE: package openssl-1.0.0e-r13.1: task do_patch: Started
NOTE: package openssl-native-1.0.0e-r13.1: task do_patch: Started
NOTE: package openssl-1.0.0e-r13.1: task do_patch: Succeeded
NOTE: package openssl-native-1.0.0e-r13.1: task do_patch: Succeeded


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk53VD8ACgkQN1Ujt2V2gBw7iACZAQj2uqcnQZdMZah1muze5OCu
7x4An3chFDRdcQhv1rtYgkTRvDrM4jrm
=m7it
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
