Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QzAkZ-0003vS-8b
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 19:08:23 +0200
Received: (qmail invoked by alias); 01 Sep 2011 17:03:21 -0000
Received: from p4FDF1E49.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.30.73]
	by mail.gmx.net (mp067) with SMTP; 01 Sep 2011 19:03:21 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/fYWtoTJ/fGagq2OYB/taRsaHcKyUMxsH8j8RRSu
	T0ZUk1dKWamg2L
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Sep 2011 19:06:42 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1314863091-17113-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1314863091-17113-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201109011906.43131.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-xfce] task-xfce-base: add thunar-volman
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
X-List-Received-Date: Thu, 01 Sep 2011 17:08:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday, September 01, 2011 09:44:51 AM you wrote:
> This fixes:
>=20
> ERROR: There is a comment on line 34 of file
> /OE/tentacle/sources/meta-openembedded/meta-xfce/recipes-xfce/tasks/task-x
> fce-base.bb (#    thunar-volman \) which is in the middle of a multiline
> expression. Bitbake used to ignore these but no longer does so, please fix
> your metadata as errors are likely as a result of this change.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-xfce/recipes-xfce/tasks/task-xfce-base.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
> b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb index 8a87203..7589f6d
> 100644
> --- a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
> +++ b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "All packages required for a base
> installation of XFCE" SECTION =3D "x11/wm"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58" -PR =
=3D
> "r0"
> +PR =3D "r1"
>=20
>  inherit task
>=20
> @@ -31,5 +31,5 @@ RDEPENDS_${PN} =3D " \
>      xfce4-settings \
>      xfce-terminal \
>      thunar \
> -#    thunar-volman \
> +    thunar-volman \
>  "
Acked-by: Andreas M=FCller <schnitzeltony@gmx.de>

By the way: what is the automated / correct workflow to=20

* apply a patch ( wget from patchwork & 'git am'? )=20
* generate 'acked by' / 'tested by' / .. messages=20

Andreas


