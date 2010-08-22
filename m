Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OnDMH-0000ii-U3
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 18:25:23 +0200
Received: by iwn2 with SMTP id 2so2211754iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oEVXkY01bEhfJ39HxgAIWHbIE4lFEDm+sdytVOE/aow=;
	b=Hh304E9qHOx8Jj8kznT4d+yzlwSYTH0JuiOzmx4ifrWyy7mAYFBIcfnjTuzkn44Dc/
	8BBIY2F0OyzFfsS/Nl4NT1rrvFULSlFzJmlCTaUhGjjHU/C7dWl4aeFVyeWk0rGsrRiJ
	eq+uVjT34GbuD2mtoiq9PJTHfU+nE5JBi4ixM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MYmJgWHVtH9oSjl0lRn0pzZsZQEAaqMhXuE6sjXjBX06CdBqMt5R8qfVpgufq+VLv7
	wNqanG0IHJlzcjMFAENn1KY5ZlJSoe+7j1/SqWKhoIDCoxDTeF5RvNh/yYx8wvPYdJZH
	GDMQmKbiSE0E1gsMLHA/dx4KnnoV0MkKK9+wU=
MIME-Version: 1.0
Received: by 10.231.182.9 with SMTP id ca9mr4902549ibb.120.1282494297027; Sun,
	22 Aug 2010 09:24:57 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 22 Aug 2010 09:24:56 -0700 (PDT)
In-Reply-To: <1282493728-2421-2-git-send-email-khimov@altell.ru>
References: <1282493728-2421-1-git-send-email-khimov@altell.ru>
	<1282493728-2421-2-git-send-email-khimov@altell.ru>
Date: Sun, 22 Aug 2010 18:24:56 +0200
Message-ID: <AANLkTin4CFNR-sLvKU8Z93Vg1YhomMOMz16Z8EcJpwmF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] ethtool: remove versions prior to 2.6.35
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
X-List-Received-Date: Sun, 22 Aug 2010 16:25:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/22 Roman I Khimov <khimov@altell.ru>:
> since 2.6.33 ethtool have changed version numbering and old versions
> override new one. 2.6.35 is considered as safe upgrade for three year
> old version 6, so there is no point in keeping it or any previous one
> around.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
> =A0recipes/ethtool/ethtool_3.bb | =A0 =A05 -----
> =A0recipes/ethtool/ethtool_4.bb | =A0 =A05 -----
> =A0recipes/ethtool/ethtool_5.bb | =A0 =A05 -----
> =A0recipes/ethtool/ethtool_6.bb | =A0 =A05 -----
> =A04 files changed, 0 insertions(+), 20 deletions(-)
> =A0delete mode 100644 recipes/ethtool/ethtool_3.bb
> =A0delete mode 100644 recipes/ethtool/ethtool_4.bb
> =A0delete mode 100644 recipes/ethtool/ethtool_5.bb
> =A0delete mode 100644 recipes/ethtool/ethtool_6.bb
>
> diff --git a/recipes/ethtool/ethtool_3.bb b/recipes/ethtool/ethtool_3.bb
> deleted file mode 100644
> index 0583eb1..0000000
> --- a/recipes/ethtool/ethtool_3.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require ethtool.inc
> -PR =3D"r1"
> -
> -SRC_URI[md5sum] =3D "b4e71f7fa2629250677eefcb338442c5"
> -SRC_URI[sha256sum] =3D "015d7c6084a668d7c2868d074e41a9cdd80bb6f0c7c6b9d2=
75802e1629dd301f"
> diff --git a/recipes/ethtool/ethtool_4.bb b/recipes/ethtool/ethtool_4.bb
> deleted file mode 100644
> index 84c4984..0000000
> --- a/recipes/ethtool/ethtool_4.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require ethtool.inc
> -PR =3D"r0"
> -
> -SRC_URI[md5sum] =3D "3882c7c9cb9b4c37b08846dea9370245"
> -SRC_URI[sha256sum] =3D "4536d6bc9ce52b9f4d505ff36aefca23c1042a92fd2f9a54=
308eff6e09b1a22b"
> diff --git a/recipes/ethtool/ethtool_5.bb b/recipes/ethtool/ethtool_5.bb
> deleted file mode 100644
> index 58b6cf7..0000000
> --- a/recipes/ethtool/ethtool_5.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require ethtool.inc
> -PR =3D"r0"
> -
> -SRC_URI[md5sum] =3D "5df7f165974e096e2de890e099f87a12"
> -SRC_URI[sha256sum] =3D "9eaad6076e57a5e2019733e4387705dc66829ea17cce0470=
1b436cf5f374bb8f"
> diff --git a/recipes/ethtool/ethtool_6.bb b/recipes/ethtool/ethtool_6.bb
> deleted file mode 100644
> index ada11c4..0000000
> --- a/recipes/ethtool/ethtool_6.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require ethtool.inc
> -PR =3D "r0"
> -
> -SRC_URI[md5sum] =3D "3b721ec27f17ebf320ba8c505cf66d9c"
> -SRC_URI[sha256sum] =3D "5046f573e7dd77f689c33c5f0aa0f2b7f96c79e0b37d6ecc=
78bae74c094fb4c6"
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


