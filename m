Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Uct7q-0000Xf-8p
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 May 2013 10:01:29 +0200
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 49B814B017B;
	Thu, 16 May 2013 09:43:02 +0200 (CEST)
Date: Thu, 16 May 2013 09:43:00 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130516094300.579a4b16@e6520eb>
In-Reply-To: <1368689209-26886-1-git-send-email-raj.khem@gmail.com>
References: <1368689209-26886-1-git-send-email-raj.khem@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] nss: Build on mips64
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
X-List-Received-Date: Thu, 16 May 2013 08:01:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Le Thu, 16 May 2013 00:26:49 -0700,
Khem Raj <raj.khem@gmail.com> a =C3=A9crit :

> Now that we have mips64 qemu support in OE-Core
> this started to fail to build. So lets fix it
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: Eric B=C3=A9nard <eric@eukrea.com>
> CC: Denis Carikli <denis@eukrea.com>
> CC: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes-support/nss/nss_3.13.3.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/nss_=
3.13.3.bb
> index fbab6ee..ac77547 100644
> --- a/recipes-support/nss/nss_3.13.3.bb
> +++ b/recipes-support/nss/nss_3.13.3.bb
> @@ -25,6 +25,8 @@ TD =3D "${S}/tentative-dist"
>  PARALLEL_MAKE =3D ""
> =20
>  USE64BIT_x86-64 =3D "USE_64=3D1"
> +USE64BIT_mips64 =3D "USE_64=3D1"
> +USE64BIT_mips64el =3D "USE_64=3D1"
>  USE64BIT ?=3D ""
> =20
>  do_compile() {


pushed to master

Thanks
Eric


