Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBtht-0000oH-7q
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 21:02:04 +0200
Received: by bwz5 with SMTP id 5so4500620bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 11:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=n0J9StjlWr2K1wzcfhNMr8rtLSKAmIlFC/pjt12FDI4=;
	b=GxnoUD8cxc+x/CwGqvKVOlnvUVDY9RF7GJqIjdfRtRopdjQA/fSVmduFYf7zJVJeOJ
	2S+1jUS1Qgqw2w9tHQn+qjuwu5SNK9pP4Fpbl5fPAEfnhnSN7C+LddD/yKKGblB8FYxN
	h82GK05NS7l/4K8i/zeNay6oI6MDpRXJoBzwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QTiCJycXaxjdETyfJmVjJqEwY7zZd/q2BhflUKTp7NFJqZw110nzetCdLKs3gADx8V
	p9RZyUs9SJ6NsOhMFVMnBmG/1TNtvcMt6/yyNo0qW7vPnYKOSJyL33Rg3UgwJXsmGpZ5
	nUdrTa6kqPwjK5+GMNPPYVb+5ZXhFWj3ow75U=
Received: by 10.204.136.210 with SMTP id s18mr154970bkt.56.1303153174904;
	Mon, 18 Apr 2011 11:59:34 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm3411107bkt.5.2011.04.18.11.59.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 11:59:33 -0700 (PDT)
Date: Mon, 18 Apr 2011 20:59:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110418185927.GH24192@jama.jama.net>
References: <1302620577.4323.143.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1302620577.4323.143.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [REGRESSION] gst-plugins-base-meta missing
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
X-List-Received-Date: Mon, 18 Apr 2011 19:02:04 -0000
X-Groupsio-MsgNum: 31291
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rWhLK7VZz0iBluhq"
Content-Disposition: inline

--rWhLK7VZz0iBluhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2011 at 05:02:57PM +0200, Paul Menzel wrote:
> Dear OE folks,

Dear Paul,

should be fixed by 275aaa67263317255d1cc4a70feec8651e390829
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D275aaa672633=
17255d1cc4a70feec8651e390829

still not really sure why that happen..

> I just want to report that due to the recent commit e6d170ab [1]
>=20
>         commit e6d170abad28fcd0e3b8ba831705bed23e3309a4
>         Author: Martin Jansa <martin.jansa@gmail.com>
>         Date:   Thu Apr 7 00:12:22 2011 +0000
>        =20
>             gst-plugins: define disjunctive PACKAGES_DYNAMIC for each pac=
k base/good/bad/ugly
>            =20
>             * adds a bit more bits to keep in sync while changing gst-plu=
gins
>               version, but not that much (this patch was mostly prepared =
by script)
>             * overlap in PACKAGES_DYNAMIC namespace causes notes like thi=
s in every build
>               NOTE: multiple providers are available for runtime gst-plug=
in-autodetect (gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plu=
gins-ugly)
>               NOTE: consider defining a PREFERRED_PROVIDER entry to match=
 gst-plugin-autodetect
>            =20
>             Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>             Acked-by: Mike Westerhof <mike@mwester.net>
>=20
> the following recipes fail to build.
>=20
>         $ git grep gst-plugins-base-meta
>         recipes/gnome/cheese_2.30.1.bb:RRECOMMENDS_${PN} =3D "gst-plugin-=
gconfelements gst-plugins-good-meta gst-plugins-base-meta"
>         recipes/tasks/angstrom-task-gnome.bb:  gst-plugins-base-meta \
>         recipes/tasks/task-gstreamer-ti.bb:     gst-plugins-base-meta \
>=20
> I will hopefully have some more time tomorrow to try out what Martin
> asked me in the other thread [2] with the following subject.
>=20
> 	[oe] gstreamer*, starling: ERROR: Nothing RPROVIDES 'gst-plugin-ivorbis'=
 (but /oe/openembedded/recipes/starling/starling_0.9.bb
>=20
>=20
> Thanks,
>=20
> Paul
>=20
>=20
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De6d17=
0abad28fcd0e3b8ba831705bed23e3309a4
> [2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/03=
1867.html



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rWhLK7VZz0iBluhq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2sig8ACgkQN1Ujt2V2gBwSdwCggJAEKbCLI4aoNnzT1LakdQPK
B8oAnjsMpOw8u5pSja5A0awie+D1IqgI
=O3dC
-----END PGP SIGNATURE-----

--rWhLK7VZz0iBluhq--
