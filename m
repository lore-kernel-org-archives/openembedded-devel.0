Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RzzEj-0005kH-7P
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 00:35:09 +0100
Received: by eaal10 with SMTP id l10so2380813eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 15:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.19.210 as permitted sender) client-ip=10.213.19.210; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.19.210 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.19.210])
	by 10.213.19.210 with SMTP id c18mr4144028ebb.130.1329866810018
	(num_hops = 1); Tue, 21 Feb 2012 15:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=awdpfCXN4d0c5HoGDGPQMzxeIgWPaf6N1TT3wWz+wSA=;
	b=sZP3lbbNqe0GCuoWrC1Fpyy2j/Loaxk+XekFoErQh4Cw9ic3+tz6yYi6supSZq9RtH
	RqiB0ShpXcS7m41jzTRPwjTGzAE3mNO2W0rsPvcaZfLU9FzP5KYGY8QOm5X0M0ql8SCX
	v+bhnjFAXY78W1qw7w7PmmpUnTPyjknx77Wkc=
Received: by 10.213.19.210 with SMTP id c18mr3289779ebb.130.1329866809494;
	Tue, 21 Feb 2012 15:26:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm78467197eem.11.2012.02.21.15.26.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 15:26:48 -0800 (PST)
Date: Wed, 22 Feb 2012 00:26:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120221232646.GD3769@jama.jama.net>
References: <1329846599-3469-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1329846599-3469-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] midori: disable gtk3
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
X-List-Received-Date: Tue, 21 Feb 2012 23:35:09 -0000
X-Groupsio-MsgNum: 37308
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 06:49:59PM +0100, Martin Jansa wrote:
> * waf configure/waf build always hangs when gtk3 was built before midori
>=20
> * usually it's on this line:
>   | Checking for program glib-genmarshal        : /OE/shr-core/tmp-eglibc=
/sysroots/x86_64-linux/usr/bin/glib-genmarshal
>   | Checking for program glib-mkenums           : /OE/shr-core/tmp-eglibc=
/sysroots/x86_64-linux/usr/bin/glib-mkenums
>   | Checking for program msgfmt                 : /OE/shr-core/tmp-eglibc=
/sysroots/x86_64-linux/usr/bin/msgfmt
>   | Checking for program intltool-merge         : /OE/shr-core/tmp-eglibc=
/sysroots/x86_64-linux/usr/bin/intltool-merge
>   | Checking for header locale.h                :
>   but I guess, that's it's because glib-genmarshal or glib-mkenums,
>   because if I finish do_configure somehow manually then waf build hangs
>   as soon as it starts glib_genmarshal (or seemingly a bit later if there=
 is more processes)
>   | Waf: Entering directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon=
-oe-linux-gnueabi/midori/midori-0.4.3-r0/midori-0.4.3/_build_'
>   | [  1/121] glib_genmarshal: midori/marshal.list -> _build_/default/mid=
ori/marshal.h _build_/default/midori/marshal.c
>   | [  2/121] valac: katze/midori-uri.vala midori/midori-extensions-colum=
n.vala -> _build_/default/katze/midori-uri.c _build_/default/midori/midori-=
core.h _build_/default/midori/midori-core.vapi _build_/default/midori/midor=
i-core.deps _build_/default/midori/midori-extensions-column.c _build_/defau=
lt/midori/midori-core.h _build_/default/midori/midori-core.vapi _build_/def=
ault/midori/midori-core.deps
>   | ../katze/midori-uri.vala:19.60-19.74: warning: use of possibly unassi=
gned parameter `path'
>   | ../katze/midori-uri.vala:19.60-19.74: warning: use of possibly unassi=
gned parameter `path'
>   | ../katze/midori-uri.vala:19.60-19.74: warning: use of possibly unassi=
gned parameter `path'
>   | ../katze/midori-uri.vala:134.34-134.49: warning: use of possibly unas=
signed parameter `label'
>   | ../katze/midori-uri.vala:134.13-134.31: warning: use of possibly unas=
signed parameter `checksum'
>   | Waf: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-=
oe-linux-gnueabi/midori/midori-0.4.3-r0/midori-0.4.3/_build_'
>   | Build failed:  -> task failed (err #-15):
>   |       {task: glib_genmarshal marshal.list -> marshal.h,marshal.c}
>=20
> * I was able to reproduce this 100%, I know that before it also hanged fr=
om
>   time to time in waf

Looks like this isn't enough to get rid of hangs completely, but at
least increases chances to be able to finish it, before this change I've
tried on one host >10 times without luck, then it worked imediately
after this patch and now it failed when building for other architecture
but worked in another run..

Cheers,

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-connectivity/midori/midori.inc     |    1 +
>  .../recipes-connectivity/midori/midori_0.4.3.bb    |    2 ++
>  2 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/midori/midori.inc b/meta-oe/rec=
ipes-connectivity/midori/midori.inc
> index 05db643..6837bfb 100644
> --- a/meta-oe/recipes-connectivity/midori/midori.inc
> +++ b/meta-oe/recipes-connectivity/midori/midori.inc
> @@ -22,6 +22,7 @@ do_configure() {
>              --infodir=3D${infodir} \
>              --mandir=3D${mandir} \
>              --disable-hildon \
> +            --disable-gtk3 \
>  }
> =20
>  LDFLAGS_append =3D " -ljavascriptcoregtk-1.0 "
> diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb b/meta-o=
e/recipes-connectivity/midori/midori_0.4.3.bb
> index 2be8274..635eb9e 100644
> --- a/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
> +++ b/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
> @@ -1,5 +1,7 @@
>  require midori.inc
> =20
> +PR =3D "r1"
> +
>  SRC_URI =3D "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.ta=
r.bz2;name=3Dmidori \
>             file://waf \
>            "
> --=20
> 1.7.8.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9EKDYACgkQN1Ujt2V2gBxBWgCeJ3K6Aurs84a3NOcNwe3lYXng
pToAnR3/Kk413tSTy8UJyw4sdHFK5Xxa
=Ez/m
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
