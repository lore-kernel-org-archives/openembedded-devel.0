Return-Path: <gyurco@freemail.hu>
Received: from smarthost06.digicable.hu (smarthost06.digicable.hu
	[94.21.128.16])
	by mail.openembedded.org (Postfix) with ESMTP id EBA117580A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:50:40 +0000 (UTC)
Received: from [92.249.128.188] (helo=relay02.digicable.hu)
	by smarthost06.digicable.hu with esmtp
	id 1Z0bA1-0006YU-0z for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 21:50:41 +0200
Received: from [78.131.10.118] (helo=gyurco.localdomain)
	by relay02.digicable.hu with esmtpa
	id 1Z0bA0-0002tu-T5 for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 21:50:40 +0200
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 04 Jun 2015 21:50:40 +0200
Message-ID: <4544358.NGEuLsduST@gyurco.localdomain>
User-Agent: KMail/4.14.7 (Linux/4.0.2-300.fc22.x86_64; KDE/4.14.8; x86_64; ; )
In-Reply-To: <1808222.ViaJgov4XC@gyurco.localdomain>
References: <1808222.ViaJgov4XC@gyurco.localdomain>
MIME-Version: 1.0
X-Original: 78.131.10.118
X-Original: 92.249.128.188
Subject: Re: [meta-networking]Fix postfix-native on Linux 4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jun 2015 19:50:42 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Resubmitted with [PATCH] in the subject.

On Saturday 30 May 2015 14:45:04 Szombathelyi Gy=F6rgy wrote:
>     Make postfix compilable on 4.0 kernel.
>=20
>     Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
>=20
> diff --git a/meta-networking/recipes-daemons/postfix/files/makedefs.p=
atch
> b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
> index 32c31b0..ea1e994 100644
> --- a/meta-networking/recipes-daemons/postfix/files/makedefs.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
> @@ -10,14 +10,11 @@ for Linux2 and Linux3 systems.
>  Upstreamstatus: Inappropriate [embedded specific]
>=20
>  Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ----
> - makedefs |   27 +++++++++++----------------
> - 1 files changed, 11 insertions(+), 16 deletions(-)
>=20
> -diff --git a/makedefs b/makedefs
> -index dd5f256..e6fb795 100644
> ---- a/makedefs
> -+++ b/makedefs
> +5)add Linux 4.0 support
> +
> +--- a/makedefs=092015-05-30 13:38:50.346033228 +0200
> ++++ b/makedefs=092015-05-30 13:40:19.375364795 +0200
>  @@ -87,9 +87,6 @@
>=20
>   # Defaults for most sane systems
> @@ -68,7 +65,7 @@ index dd5f256..e6fb795 100644
>   =09=09       then
>   =09=09=09   echo CCARGS=3D"$CCARGS -DNO_EPOLL"
>   =09=09       else
> -@@ -356,8 +353,6 @@ int     main(int argc, char **argv)
> +@@ -356,22 +353,20 @@
>   }
>   EOF
>   =09=09=09   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
> @@ -77,7 +74,9 @@ index dd5f256..e6fb795 100644
>   =09=09=09   rm -f makedefs.test makedefs.test.[co]
>   =09=09       fi;;
>   =09=09esac
> -@@ -366,12 +361,12 @@ EOF
> + =09=09;;
> +-    Linux.3*)=09SYSTYPE=3DLINUX3
> ++    Linux.3*|Linux.4*)=09SYSTYPE=3DLINUX3
>   =09=09case "$CCARGS" in
>   =09=09 *-DNO_DB*) ;;
>   =09=09 *-DHAS_DB*) ;;
> @@ -111,6 +110,3 @@ index dd5f256..e6fb795 100644
>   =09=09    do
>   =09=09=09test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
>   =09=09=09    SYSLIBS=3D"$SYSLIBS -l$name"
> ---
> -1.7.1
> -


