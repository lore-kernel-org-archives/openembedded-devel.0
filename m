Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6TYf-0006uT-UN
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 22:38:19 +0200
Received: (qmail invoked by alias); 21 Sep 2011 20:32:59 -0000
Received: from p5B0A3DD1.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.61.209]
	by mail.gmx.net (mp053) with SMTP; 21 Sep 2011 22:32:59 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19dbe17VspdkaxrmqYeMh4g0ZO4wpDcbGKQQwGBi9
	4Rh3pxwJyW9hBS
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:36:34 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
	<1316585520-18605-2-git-send-email-schnitzeltony@gmx.de>
	<j5c2lj$nn1$1@dough.gmane.org>
In-Reply-To: <j5c2lj$nn1$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201109212236.34679.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-xfce 01/11] xfce4-dev-tools: add native support
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
X-List-Received-Date: Wed, 21 Sep 2011 20:38:19 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday, September 21, 2011 09:10:43 AM Koen Kooi wrote:
> Op 21-09-11 08:11, Andreas M=C3=BCller schreef:
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de> ---
> > .../xfce4-dev-tools/xfce4-dev-tools_4.8.0.bb       |    7 ++++++-
> >=20
> > +# inherited SRC_URI does not work for native +SRC_URI =3D
> > "http://archive.xfce.org/src/xfce/xfce4-dev-tools/${@'${PV}'[0:3]}/xfce=
4-
> > dev-tools-${PV}.tar.bz2"
>=20
> +
>=20
> Could give this patch a try?
>=20
> diff --git a/meta-xfce/classes/xfce.bbclass
> b/meta-xfce/classes/xfce.bbclass index a5a35bb..5b12cba 100644
> --- a/meta-xfce/classes/xfce.bbclass
> +++ b/meta-xfce/classes/xfce.bbclass
> @@ -1,5 +1,5 @@
>  HOMEPAGE =3D "http://www.xfce.org"
> -SRC_URI =3D
> "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.tar.=
bz
> 2" +SRC_URI =3D
> "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.ta=
r.
> bz2"
>=20
Thanks for teaching me what BPN is for :-)

Andreas


