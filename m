Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpcJx-0005eY-01
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 09:28:53 +0200
Received: by iwn2 with SMTP id 2so3832023iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 00:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=X1TtHqZAaE6zGINhUrUu0t19EEC7VLuBzS28R/vpwkE=;
	b=CJQJz1aS7E4JVA+V2OupO47zvhhJRmn7WIdMnBZitziQaimnlMDD39xFFZGpP02FYB
	bebHWKycmxTfzeSL9+GBe5EnvqiRks+BgKZ4bd6Cfs9LjT1fx+9CyxhL7y9zTYOjKO2D
	9xI+tNJPCh4TGexqTM5JkiRh7eWZeOoZNugdg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iPBYGp3eU9BxRj8DXIz7O4BWBbGdHD1gUKcqZwrM1VuoaNO9Rv1A3n1beXU/CbKEJA
	ui5lqbWx5i2HxHyWU6omBShMvcsmbQjOVp7UCGpf4npbFxO9Sr9Sotx+XsRnLgI5l0UK
	Sot6M7NYGxx97iRWE8iWFRcvNeH3KLwtge2LA=
MIME-Version: 1.0
Received: by 10.231.151.135 with SMTP id c7mr2757458ibw.184.1283066902590;
	Sun, 29 Aug 2010 00:28:22 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 00:28:22 -0700 (PDT)
In-Reply-To: <1283027073-12308-4-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-4-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 09:28:22 +0200
Message-ID: <AANLkTinqLrOTqvdTPrOyh-u-XtieLgywqZC-fSV3hJYR@mail.gmail.com>
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
Subject: Re: [PATCH 03/23] angstrom-bootmanager.bb: recipes it depends upon do not exist
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
X-List-Received-Date: Sun, 29 Aug 2010 07:28:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

for me all three # lines can go

anyway:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/8/28 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/angstrom/angstrom-bootmanager.bb | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/angstrom/angstrom-bootmanager.bb b/recipes/angstrom/=
angstrom-bootmanager.bb
> index 6cae115..ea8eaa0 100644
> --- a/recipes/angstrom/angstrom-bootmanager.bb
> +++ b/recipes/angstrom/angstrom-bootmanager.bb
> @@ -1,7 +1,8 @@
> =A0DESCRIPTION =3D "A graphical Boot Manager for the =C5ngstr=F6m Linux D=
istribution"
> =A0AUTHOR =3D "Michael 'Mickey' Lauer <mickey@Vanille.de>"
> =A0SECTION =3D "base"
> -DEPENDS =3D "evas-fb ecore-fb esmart-fb imlib2-fb edje efl++-fb"
> +# These depends are not available.
> +#DEPENDS =3D "ecore esmart-fb imlib2-fb edje efl++-fb"
> =A0#RDEPENDS_${PN} =3D "libefl++0"
>
> =A0ALLOW_EMPTY =3D "1"
> --
> 1.7.1
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


