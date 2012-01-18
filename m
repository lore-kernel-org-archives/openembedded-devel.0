Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RnZWs-0004tw-MY
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 18:42:34 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EA50D11001B1;
	Wed, 18 Jan 2012 18:34:57 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 70DF9110018B;
	Wed, 18 Jan 2012 18:34:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g230119221.adsl.alicedsl.de
	[92.230.119.221]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Wed, 18 Jan 2012 18:34:56 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 249523C4B0; Wed, 18 Jan 2012 18:34:55 +0100 (CET)
Date: Wed, 18 Jan 2012 18:34:55 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20120118173454.GA27993@mail.familie-heinold.de>
References: <1326645768-13447-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1326645768-13447-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java 1/2] openjdk-6-6b24: fix icedtea-launcher-stdc++.patch
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
X-List-Received-Date: Wed, 18 Jan 2012 17:42:34 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2012 at 05:42:47PM +0100, Eric B=E9nard wrote:
> without this fix I get (on a FC16) :
> | Checking patches/icedtea-launcher-stdc++.patch
> | /usr/bin/patch: **** rejecting absolute target file name: /openjdk/ho=
tspot/make/linux/makefiles/launcher.make
> | ERROR patch patches/icedtea-launcher-stdc++.patch FAILED!
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  .../openjdk-6-6b24/icedtea-launcher-stdc++.patch   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc+=
+.patch b/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.pat=
ch
> index ebe34e7..b97745d 100644
> --- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
> +++ b/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
> @@ -1,7 +1,7 @@
>  Index: openjdk/hotspot/make/linux/makefiles/launcher.make
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:3=
3:37.000000000 +0100
> -+++ /openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:=
37:54.055022618 +0100
> ++++ openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:3=
7:54.055022618 +0100
>  @@ -51,7 +51,7 @@
>   else
>     LAUNCHER.o                 =3D launcher.o
> --=20
> 1.7.7.5
>=20

Thanks Eric,

Patch is apllied, but I still wonder why I didnt saw it here.

Bye Henning


