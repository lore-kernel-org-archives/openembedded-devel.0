Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 63C9960EAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 13:58:45 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id A75204B0252;
	Mon, 30 Sep 2013 15:58:39 +0200 (CEST)
Date: Mon, 30 Sep 2013 15:58:38 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: riku.voipio@linaro.org
Message-ID: <20130930155838.08e5f9d4@e6520eb>
In-Reply-To: <1380548771-13812-3-git-send-email-riku.voipio@linaro.org>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
	<1380548771-13812-3-git-send-email-riku.voipio@linaro.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, patches@linaro.org
Subject: Re: [meta-java][PATCH 3/3] jamvm/java: allow spaces in arguments
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
X-List-Received-Date: Mon, 30 Sep 2013 13:58:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Riku,

Le Mon, 30 Sep 2013 16:46:11 +0300,
Riku Voipio <riku.voipio@linaro.org> a =E9crit :

> Current IFS mangling blows up on the face:
>=20
>     | configure:2341: javac  -classpath .: Test.java
>     | Invalid maximum heap size: -Xmx1024m-cp/srv/oe/b
>=20
> Simpler command line expansion works just as easy.
> ---
>  recipes-core/jamvm/files/java | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-core/jamvm/files/java b/recipes-core/jamvm/files/java
> index 27cf094..9a396a7 100755
> --- a/recipes-core/jamvm/files/java
> +++ b/recipes-core/jamvm/files/java
> @@ -1,6 +1,5 @@
>  #!/bin/sh
> =20
> -IFS=3D""
> -export LD_LIBRARY_PATH=3D"$LD_LIBRARY_PATH:STAGING_LIBDIR_NATIVE/classpa=
th:STAGING_LIBDIR_NATIVE/jamvm"
> -export BOOTCLASSPATH=3D"STAGING_DATADIR_NATIVE/jamvm/classes.zip:STAGING=
_DATADIR_NATIVE/classpath/glibj.zip"
> -exec jamvm ${1+"$@"}
> +export LD_LIBRARY_PATH=3D"$LD_LIBRARY_PATH:/srv/oe/build/tmp-eglibc/sysr=
oots/x86_64-linux/usr/lib/classpath:/srv/oe/build/tmp-eglibc/sysroots/x86_6=
4-linux/usr/lib/jamvm"
> +export BOOTCLASSPATH=3D"/srv/oe/build/tmp-eglibc/sysroots/x86_64-linux/u=
sr/share/jamvm/classes.zip:/srv/oe/build/tmp-eglibc/sysroots/x86_64-linux/u=
sr/share/classpath/glibj.zip"
> +exec jamvm "$@"

so now we have your path "/srv/oe/build/tmp-eglibc/" hardcoded in the
recipe ;-)

Eric

