Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UdnXv-0004re-0h
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 May 2013 22:16:07 +0200
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 019D9A612F;
	Sat, 18 May 2013 21:57:38 +0200 (CEST)
Date: Sat, 18 May 2013 21:57:37 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130518215737.43f90b9c@e6520eb>
In-Reply-To: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
References: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] libxi: Match the bbappend to OE-Core
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
X-List-Received-Date: Sat, 18 May 2013 20:16:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Le Sat, 18 May 2013 09:39:27 -0700,
Khem Raj <raj.khem@gmail.com> a =C3=A9crit :

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: Eric B=C3=A9nard <eric@eukrea.com>
> CC: Denis Carikli <denis@eukrea.com>
> CC: Otavio Salvador <otavio@ossystems.com.br>
>=20
> ---
>  recipes-graphics/libxi/libxi_1.7.1.bbappend |    2 ++
>  recipes-graphics/libxi/libxi_1.7.bbappend   |    2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-graphics/libxi/libxi_1.7.1.bbappend
>  delete mode 100644 recipes-graphics/libxi/libxi_1.7.bbappend
>=20
> diff --git a/recipes-graphics/libxi/libxi_1.7.1.bbappend b/recipes-graphi=
cs/libxi/libxi_1.7.1.bbappend
> new file mode 100644
> index 0000000..c90046b
> --- /dev/null
> +++ b/recipes-graphics/libxi/libxi_1.7.1.bbappend
> @@ -0,0 +1,2 @@
> +PRINC :=3D "${@int(PRINC) + 1}"
> +BBCLASSEXTEND +=3D "native"
> diff --git a/recipes-graphics/libxi/libxi_1.7.bbappend b/recipes-graphics=
/libxi/libxi_1.7.bbappend
> deleted file mode 100644
> index c90046b..0000000
> --- a/recipes-graphics/libxi/libxi_1.7.bbappend
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -PRINC :=3D "${@int(PRINC) + 1}"
> -BBCLASSEXTEND +=3D "native"

pushed to master

Thanks
Eric


