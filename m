Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SZkly-0002Ta-6Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 17:25:18 +0200
Received: by yenl13 with SMTP id l13so3166973yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lK27r2/L6MfSzJJn430WsEUnMXlEQveHyWur3Gcnp5A=;
	b=wH4f5Cs/EiHHpjQDs5UZsNA1nImEawUzFDniodyLyPaMAaTm8w5LoCgcjm4J+G9ZJ5
	PUlLGnAPss2em7sgFT5G5JwRqY54BPxUyc5aVQ5bUTysGO6du15AOFotmsMQlEFnm3EB
	goFOnvSlpkXASu3EgyUGO2Ga2P5rgGBQ0Svelr2qu9CFJYTPgxmKMgLf88SbWWlbAnvv
	MVFP+4OnBb5vgVfclI0vc3KBeD3iMzP/n2djsHXtgIb2pVpo8lDdEHenCam7it+FzSSr
	AOx3bxfwNP0Pm3XYPYDckBXeH2H52cWblWwX7SqqtqHiM6tcfELJm/dtSaeCtyng/uth
	ErNw==
MIME-Version: 1.0
Received: by 10.50.95.135 with SMTP id dk7mr10884303igb.53.1338390898674; Wed,
	30 May 2012 08:14:58 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Wed, 30 May 2012 08:14:58 -0700 (PDT)
In-Reply-To: <2484826dbf17baf50370f5484aa22f43200992dd.1338386047.git.Martin.Jansa@gmail.com>
References: <cover.1338386047.git.Martin.Jansa@gmail.com>
	<2484826dbf17baf50370f5484aa22f43200992dd.1338386047.git.Martin.Jansa@gmail.com>
Date: Wed, 30 May 2012 17:14:58 +0200
Message-ID: <CALbNGRTHSa+An9tURPWUQRgzZL8dMWN2s1uYJ+WyH41W=y-98Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][PATCH 2/3] systemd.bbclass: fix postinst/rdepends generation for recipes with SYSTEMD_SERVICE (without _PN suffix)
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
X-List-Received-Date: Wed, 30 May 2012 15:25:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 4:21 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0meta-oe/classes/systemd.bbclass | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bb=
class
> index db35717..e895021 100644
> --- a/meta-oe/classes/systemd.bbclass
> +++ b/meta-oe/classes/systemd.bbclass
> @@ -201,7 +201,8 @@ python populate_packages_prepend () {
> =A0 =A0 =A0 =A0# run all modifications once when creating package
> =A0 =A0 =A0 =A0if os.path.exists('${D}'):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for pkg_systemd in d.getVar('SYSTEMD_PACKA=
GES', 1).split():
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if d.getVar('SYSTEMD_SERVIC=
E' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_syste=
md, 1).strip():
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 systemd_services =3D d.getV=
ar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE',=
 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if systemd_services and sys=
temd_services.strip():
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemd_ge=
nerate_package_scripts(pkg_systemd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemd_ad=
d_rdepends(pkg_systemd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0systemd_check_services()
> --
> 1.7.8.6
>
Two questions:

1. Did you see [1]?
2. What is that strip for?

Andreas


