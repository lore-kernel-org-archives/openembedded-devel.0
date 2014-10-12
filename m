Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id EB92171909
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 22:04:32 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id em10so5987387wid.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 15:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OoqGSdWmjhqjPY0773AJEKM6r3XlfjDFlw1rRyDaRi8=;
	b=ExmthCNXdNkchptWvHjdJYzXc8C7owsSja11IL2sytHMmUBnLPXQFrvFclsJ6m5QWh
	Mv3j+GeXcfVpRts5j+3qZCyQaPewQgXbAQxoaCWZpn/M25t8sY9moxUCrwauba8xBugG
	gIhNFZxbYWFs7BbibskIPQ4z+l5UGCyrMr7xkol5GVxTaeVliBV6ZMV0GpYTxwYwa9AI
	wj1d7jPwT6lCI6b4N9H3HjDNUPoTaM+xKcHRbpP8XWx6QwQJsEAi+fhsZNzQuZBmxN1l
	aSfEtEygM5jtUINhU0+/Bc3Z6jB3+076dKQk1Vj1Q49WEHZTmmeyxL0EEQc42QD4YLoS
	/VbA==
X-Received: by 10.180.182.72 with SMTP id ec8mr16144017wic.33.1413151473694;
	Sun, 12 Oct 2014 15:04:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wm6sm14618766wjb.5.2014.10.12.15.04.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Oct 2014 15:04:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Oct 2014 00:06:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141012220618.GD3000@jama>
References: <1413130443-11407-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1413130443-11407-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [dizzy][PATCH] update maintainer info in README's for dizzy
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
X-List-Received-Date: Sun, 12 Oct 2014 22:04:33 -0000
X-Groupsio-MsgNum: 52462
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bFsKbPszpzYNtEU6"
Content-Disposition: inline

--bFsKbPszpzYNtEU6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2014 at 09:14:03AM -0700, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-efl/README             | 14 ++++++++++----
>  meta-filesystems/README     | 14 ++++++++++----
>  meta-gnome/README           | 14 ++++++++++----
>  meta-gpe/README             | 14 ++++++++++----
>  meta-initramfs/README       | 12 +++++++++---
>  meta-multimedia/README      | 13 +++++++++----
>  meta-networking/MAINTAINERS | 10 ++++++++--
>  meta-networking/README      |  6 +++---
>  meta-oe/README              | 12 +++++++++---
>  meta-perl/README            | 12 +++++++++---
>  meta-ruby/README            | 14 ++++++++++----
>  meta-systemd/README         | 14 ++++++++++----
>  meta-webserver/README       | 11 ++++++++---
>  meta-xfce/README            | 14 ++++++++++----
>  toolchain-layer/README      | 11 ++++++++---
>  15 files changed, 133 insertions(+), 52 deletions(-)

Please add update for meta-python/README.

>=20
> diff --git a/meta-efl/README b/meta-efl/README
> index cfffc47..dfcf93e 100644
> --- a/meta-efl/README
> +++ b/meta-efl/README
> @@ -1,18 +1,24 @@
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch:  dizzy
>  revision: HEAD
> =20
>  URI: git://github.com/openembedded/meta-oe.git
>  layers: meta-oe, meta-python
> -branch: master
> +branch: dizzy=20
>  revision: HEAD
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-efl]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-efl][dizzy]' in the subject'
> =20
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-efl][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-efl][dizzy][PATCH'
> =20
>  Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
>                             Martin Jansa <martin.jansa@gmail.com>
> +
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index d2716f8..639d9ee 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -10,22 +10,28 @@ Dependencies
>  This layer depends on:
> =20
>    URI: git://git.openembedded.org/bitbake
> -  branch: master
> +  branch: 1.24
> =20
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: dizzy
> =20
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: dizzy
> =20
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
> =20
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (openembedded-devel@lists.openembe=
dded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][dizzy]' in the subject.
> +
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> =20
>  Maintainers List:
>    physfs      Andreas M=FCller <schnitzeltony@googlemail.com>
> diff --git a/meta-gnome/README b/meta-gnome/README
> index 0c4fbd2..6358d14 100644
> --- a/meta-gnome/README
> +++ b/meta-gnome/README
> @@ -1,16 +1,22 @@
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome][dizzy]' in the subject'
> =20
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-gnome][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-gnome][dizzy][PATCH'
> =20
>  Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> diff --git a/meta-gpe/README b/meta-gpe/README
> index 7d019f6..3be1d10 100644
> --- a/meta-gpe/README
> +++ b/meta-gpe/README
> @@ -1,17 +1,23 @@
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gpe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gpe][dizzy]' in the subject'
> =20
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-gpe][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-gpe][dizzy][PATCH'
> =20
>  Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
>                             Martin Jansa <martin.jansa@gmail.com>
> +
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index e24acf9..e5d27d7 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -12,7 +12,7 @@ Dependencies
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
> =20
> @@ -20,15 +20,21 @@ Maintenance
>  -----------
> =20
>  Send patches / pull requests to openembedded-devel@lists.openembedded.org
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][dizzy]' in the subject.
> =20
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-initramfs][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-initramfs][dizzy][PATCH'
> =20
>  Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
>                     Paul Eggleton <paul.eggleton@linux.intel.com>
> =20
> =20
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> +
>  License
>  -------
> =20
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index cbdc1b5..9727ac6 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -1,21 +1,26 @@
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  URI: git://github.com/openembedded/meta-oe.git
>  layers: meta-oe, meta-ruby
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia][dizzy]' in the subject'
> =20
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-multimedia][PATCH
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-multimedia][dizzy][PATCH
> =20
>  You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets co=
nsisting of more than one patch. Other services like gitorious, repo.or.cz =
or self hosted setups are of course accepted as well, 'git fetch <remote>' =
works the same on all of them. We recommend github because it is free, easy=
 to use, has been proven to be reliable and has a really good web GUI.
> =20
>  Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
>                          Martin Jansa <martin.jansa@gmail.com>
> =20
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> index 49ced8f..82f9dcc 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-n=
etworking layer.
> =20
>  Please submit any patches against meta-networking to the OpenEmbedded
>  development mailing list (openembedded-devel@lists.openembedded.org) with
> -'[meta-networking]' in the subject.
> +'[meta-networking][dizzy]' in the subject.
> =20
>  When sending single patches, please use something like:
> =20
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3Dmeta-networking][PATCH
> +        --subject-prefix=3Dmeta-networking][dizzy][PATCH
> =20
>  You may also contact the maintainers directly.
> =20
> @@ -25,6 +25,12 @@ Please keep this list in alphabetical order.
> =20
>  Maintainers List (try to look for most precise areas first)
> =20
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> +
>  COMMON
>  M:      Joe MacDonald <joe_macdonald@mentor.com>
>  F:      conf
> diff --git a/meta-networking/README b/meta-networking/README
> index e1ba27d..383a028 100644
> --- a/meta-networking/README
> +++ b/meta-networking/README
> @@ -18,19 +18,19 @@ Dependencies
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  For some recipes, the meta-oe layer is required:
> =20
>  URI: git://github.com/openembedded/meta-openembedded.git
>  subdirectory: meta-oe
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  URI: git://github.com/openembedded/meta-openembedded.git
>  subdirectory: meta-python
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  Maintenance
> diff --git a/meta-oe/README b/meta-oe/README
> index 6ad87c5..c5823eb 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -1,15 +1,21 @@
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][dizzy]' in the subject'
> =20
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][dizzy]PATCH'
> =20
>  You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets co=
nsisting of more than one patch. Other services like gitorious, repo.or.cz =
or self hosted setups are of course accepted as well, 'git fetch <remote>' =
works the same on all of them. We recommend github because it is free, easy=
 to use, has been proven to be reliable and has a really good web GUI.
> =20
>  Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
>                         Martin Jansa <martin.jansa@gmail.com>
> +
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> diff --git a/meta-perl/README b/meta-perl/README
> index 68160a6..04ecefc 100644
> --- a/meta-perl/README
> +++ b/meta-perl/README
> @@ -52,7 +52,7 @@ Dependencies
>  This layer depends on:
> =20
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: dizzy=20
>    revision: HEAD
>    prio: default
> =20
> @@ -75,13 +75,19 @@ Maintenance
>  -----------
> =20
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g with
> -'[meta-perl]' in the subject.
> +'[meta-perl][dizzy]' in the subject.
> =20
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-perl][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-perl][dizzy][PATCH'
> =20
>  Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
> =20
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> +
>  License
>  -------
> =20
> diff --git a/meta-ruby/README b/meta-ruby/README
> index 99cd9bc..65db19e 100644
> --- a/meta-ruby/README
> +++ b/meta-ruby/README
> @@ -1,16 +1,22 @@
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-ruby]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-ruby][dizzy]' in the subject'
> =20
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-ruby][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-ruby][dizzy][PATCH'
> =20
>  Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> diff --git a/meta-systemd/README b/meta-systemd/README
> index 2cd90b4..5f42b99 100644
> --- a/meta-systemd/README
> +++ b/meta-systemd/README
> @@ -1,13 +1,13 @@
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  And we're working to break the dependency on this one:
> =20
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  To make BBMASK'ing per layer possible the following directory structure =
is
> @@ -15,12 +15,18 @@ used:
> =20
>  $[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name=
>.bbappend
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][meta-systemd]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][meta-systemd][dizzy]' in the subject'
> =20
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][meta-systemd][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][meta-systemd][dizzy][PATCH'
> =20
>  You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets co=
nsisting of more than one patch. Other services like gitorious, repo.or.cz =
or self hosted setups are of course accepted as well, 'git fetch <remote>' =
works the same on all of them. We recommend github because it is free, easy=
 to use, has been proven to be reliable and has a really good web GUI.
> =20
>  Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
>                         Martin Jansa <martin.jansa@gmail.com>
> +
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> diff --git a/meta-webserver/README b/meta-webserver/README
> index f3fe735..ead9e2a 100644
> --- a/meta-webserver/README
> +++ b/meta-webserver/README
> @@ -13,14 +13,14 @@ This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
>  subdirectory: meta
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  For some recipes, the meta-oe layer is required:
> =20
>  URI: git://github.com/openembedded/meta-oe.git
>  subdirectory: meta-oe
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
> =20
> @@ -38,10 +38,15 @@ Maintenance
>  -----------
> =20
>  Send patches / pull requests to openembedded-devel@lists.openembedded.org
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][dizzy]' in the subject.
> =20
>  Layer maintainer: Paul Eggleton <paul.eggleton@linux.intel.com>
> =20
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> =20
>  License
>  -------
> diff --git a/meta-xfce/README b/meta-xfce/README
> index e346888..5caff8f 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -1,11 +1,11 @@
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
>  meta-xfce depends on meta-oe and meta-multimedia in this repository.
> =20
> @@ -14,9 +14,15 @@ this to local.conf:
> =20
>  BBMASK =3D "meta-xfce/recipes-multimedia"
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce][dizzy]' in the subject'
> =20
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-xfce][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-xfce][dizzy][PATCH'
> =20
>  Interim layer maintainer: Andreas M=FCller <schnitzeltony@googlemail.com>
> +
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> diff --git a/toolchain-layer/README b/toolchain-layer/README
> index 7af26ec..611524d 100644
> --- a/toolchain-layer/README
> +++ b/toolchain-layer/README
> @@ -1,15 +1,20 @@
>  This layer depends on:
> =20
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: dizzy
>  revision: HEAD
> =20
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][toolchain-layer]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][toolchain-layer][dizzy]' in the subject'
> =20
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][toolchain-layer][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][toolchain-layer][dizzy][PATCH'
> =20
>  You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets co=
nsisting of more than one patch. Other services like gitorious, repo.or.cz =
or self hosted setups are of course accepted as well, 'git fetch <remote>' =
works the same on all of them. We recommend github because it is free, easy=
 to use, has been proven to be reliable and has a really good web GUI.
> =20
>  Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
> =20
> +Dizzy branch maintainers:
> +    Otavio Salvador <otavio@ossystems.com.br>
> +    Armin Kuster <akuster808@gmail.com>
> +
> +Prefix email subject with: [dizzy]
> --=20
> 1.9.1
>=20

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bFsKbPszpzYNtEU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ6+1oACgkQN1Ujt2V2gBxliACfU1GVyYQJtq1Isi0QxelUosKW
bfMAoLO9rvfwlcE+KUx7+HGYqzQvclri
=Tudg
-----END PGP SIGNATURE-----

--bFsKbPszpzYNtEU6--
