Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1USO8C-0005So-37
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 10:54:21 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 40D944B019B;
	Wed, 17 Apr 2013 10:36:37 +0200 (CEST)
Date: Wed, 17 Apr 2013 10:36:35 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130417103635.2e081896@e6520eb>
In-Reply-To: <1366149409-3168-1-git-send-email-steven.w.warren@gmail.com>
References: <1366149409-3168-1-git-send-email-steven.w.warren@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: steven.w.warren@gmail.com
Subject: Re: [PATCH] qwt: Adjusted SRC_URI to point to a URL + PATH that works.
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
X-List-Received-Date: Wed, 17 Apr 2013 08:54:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Wayne,

Le Tue, 16 Apr 2013 16:56:49 -0500,
Wayne Warren <steven.w.warren@gmail.com> a =C3=A9crit :

> Signed-off-by: Wayne Warren <steven.w.warren@gmail.com>
> ---
>  meta-oe/recipes-qt/qwt/qwt.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.=
inc
> index d9d47f0..e771b01 100644
> --- a/meta-oe/recipes-qt/qwt/qwt.inc
> +++ b/meta-oe/recipes-qt/qwt/qwt.inc
> @@ -5,7 +5,7 @@ SECTION =3D "libs"
>  LICENSE =3D "QWTv1.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddac2743472b0462ff3cfb4af42051=
c88"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=3Dqwt \
> +SRC_URI =3D "http://sourceforge.net/projects/qwt/files/qwt/${PV}/qwt-${P=
V}.tar.bz2;name=3Dqwt \

What problem do you meet exactly ?
original SRC_URI works fine from here :
bitbake.conf defines :
SOURCEFORGE_MIRROR =3D "http://downloads.sourceforge.net"

[ebenard@e6520eb ~]$ wget
http://downloads.sourceforge.net/qwt/qwt-6.0.1.tar.bz2
[ebenard@e6520eb ~]$ $ echo $?
0
[ebenard@e6520eb ~]$ md5sum qwt-6.0.1.tar.bz2=20
ace68558eab873e2da7e641179c4ef0c  qwt-6.0.1.tar.bz2

and the recipe has :
SRC_URI[qwt.md5sum] =3D "ace68558eab873e2da7e641179c4ef0c"

Eric


