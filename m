Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UAUhA-0007uF-Da
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 01:16:31 +0100
Received: by mail-da0-f52.google.com with SMTP id x33so1242838dad.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2013 16:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=xOULlr7MTCgVvpbIO4Kt9h4IfA+UUwVRPQbO7HnvoXA=;
	b=jDwGCo+A1mbmWfGjpfQyk2EHH96i1rc2htAz1gLEbjw83/7Fl6wgf3QXlw8t1I0nuv
	uwqPBL9gyXfNItpOqPUZJ3vwZLsYsd8hjZ4SCa+Z+RSkvhdw9Som2uAbrvtRkGBOwbZf
	9TGrLMh5j1zAtnohFx/1mZoOKcr3DsMXEm69NMxUO8a1DR2EIG5hW+/Ih51dDrliiV0t
	WqFoUVuxqHgE4S6fk3ZVFjLY2UyIhIFtKJyBCfmXoVQfnD0NGZSAPWwuMrRq0u4bbSBj
	uPg6A98mkJJNxzB6ke+eYVUVlAcRk3FOhERDt4esp/4ToK54XE1E0/B0Fl22koeMjphi
	8cZQ==
X-Received: by 10.66.162.133 with SMTP id ya5mr4362039pab.104.1361923207928;
	Tue, 26 Feb 2013 16:00:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kt5sm2428352pbc.30.2013.02.26.16.00.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 16:00:06 -0800 (PST)
Date: Wed, 27 Feb 2013 00:59:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130226235955.GA8208@jama.dyndns-home.com>
References: <1361388555-28107-1-git-send-email-ftonello@cercacor.com>
MIME-Version: 1.0
In-Reply-To: <1361388555-28107-1-git-send-email-ftonello@cercacor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Wed, 27 Feb 2013 00:16:32 -0000
X-Groupsio-MsgNum: 43311
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2013 at 11:29:15AM -0800, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>=20
> Fingerterm is a terminal emulator for Nokia Harmattan, but it works in an=
y Qt4
> environment.
>=20
> This recipe can be extended by a .bbappend to add .desktop, icon and othe=
rs to
> the target device.
>=20
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
> ---
>  meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   27 +++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
>=20
> diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/=
recipes-qt/fingerterm/fingerterm_1.0.2.bb
> new file mode 100644
> index 0000000..e345131
> --- /dev/null
> +++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "A terminal emulator for Harmattan (Nokia N9/N950) with =
a custom \
> +virtual keyboard and usability-enhancing features such as URL grabber, p=
an \
> +gestures and customizable shortcut menu. Designed especially to be used =
with \
> +screen and irssi."
> +HOMEPAGE =3D "http://hqh.unlink.org/harmattan"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +SECTION =3D "qt/app"
> +
> +PR =3D "r0"
> +
> +inherit qt4x11 pkgconfig
> +
> +SRC_URI =3D " \
> +  http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz \
> +"

Missing checksums:
NOTE: Running task 14747 of 25316 (ID: 16879, /home/jenkins/oe/shr-core-bra=
nches/shr-core/meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserv=
er-socketcan_svn.bb, do_rm_work_all)
ERROR: Fetcher failure for URL: 'http://hqh.unlink.org/harmattan/fingerterm=
-1.0.2.tar.gz'. No checksum specified for /home/jenkins/oe/shr-core-branche=
s/shr-core/downloads/fingerterm-1.0.2.tar.gz, please add at least one to th=
e recipe:
SRC_URI[md5sum] =3D "d53b0f463c025583cd52accf95715448"
SRC_URI[sha256sum] =3D "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6=
674dd82d95150"
ERROR: Function failed: Fetcher failure for URL: 'http://hqh.unlink.org/har=
mattan/fingerterm-1.0.2.tar.gz'. No checksum specified for /home/jenkins/oe=
/shr-core-branches/shr-core/downloads/fingerterm-1.0.2.tar.gz, please add a=
t least one to the recipe:
SRC_URI[md5sum] =3D "d53b0f463c025583cd52accf95715448"
SRC_URI[sha256sum] =3D "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6=
674dd82d95150"
ERROR: Logfile of failure stored in: /home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/fingerterm/1.0.2-r0/temp/log=
=2Edo_fetch.16478

> +
> +S =3D "${WORKDIR}/${PN}"
> +
> +FILES_${PN} =3D " \
> +  ${bindir}/${PN} \
> +"
> +
> +do_install() {
> +  install -d ${D}${bindir}
> +  install -m 0744 ${S}/${PN} ${D}${bindir}
> +}
> \ No newline at end of file
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEtTHsACgkQN1Ujt2V2gBwQdACfU9hQHIM2Md1tV6WdKp8B7dLe
x6wAn2jWI/kFCIgPHbcMmK6ZYalwaTXe
=HIex
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
