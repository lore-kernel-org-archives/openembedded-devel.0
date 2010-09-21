Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxzaW-0007Zr-Gl
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 11:56:38 +0200
Received: by iwn2 with SMTP id 2so5144936iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 02:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bVAgYl3KjCbrFjBi6o8LpIqEhYh5+SUBG7IUDyZkJgE=;
	b=SppWq/2oXyV5hgwY5RcQuX6LGbtYVgGLY+J8EMPKvKuKwNBDzFxDW5Oe1yNztHDRFc
	Wn0hVX1LJqEYttwNr54Nj+fxj1lZT94OZIrBqoha4URQXaQEKlS8RchDZk5KHGaQHigq
	m7f8NAtmHWb/gf6h5H2tan+P7yAwlpRaLMq3Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kSwhdVUPfmgxx+vGO3sbI47Dwy8MigobKqKH7VjazaVaSXdd2lmOOrf3XvVz0FX1Nl
	fqBpzoPx5jIPcWjLXPq1m1MOEyzkocXDz6VNS5CSpwKQpLtBIDXv8wIAkYi01YfnYCFT
	GFlMSO+pnGOrBoo3gBmR58wlWHOoUkjE7hrpE=
MIME-Version: 1.0
Received: by 10.231.182.204 with SMTP id cd12mr11974796ibb.101.1285062994247; 
	Tue, 21 Sep 2010 02:56:34 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 21 Sep 2010 02:56:34 -0700 (PDT)
In-Reply-To: <1285059363-2190-1-git-send-email-eric@eukrea.com>
References: <1285059363-2190-1-git-send-email-eric@eukrea.com>
Date: Tue, 21 Sep 2010 11:56:34 +0200
Message-ID: <AANLkTikKwmBvHMEGESdXgOo5PTqk=CAGr19kWOJ-ZwM4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] liburi-perl: fix SRC_URI
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
X-List-Received-Date: Tue, 21 Sep 2010 09:56:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/21 Eric B=E9nard <eric@eukrea.com>:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
> =A0recipes/perl/liburi-perl_1.52.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/perl/liburi-perl_1.52.bb b/recipes/perl/liburi-perl_=
1.52.bb
> index d9cf315..54f69da 100644
> --- a/recipes/perl/liburi-perl_1.52.bb
> +++ b/recipes/perl/liburi-perl_1.52.bb
> @@ -2,9 +2,9 @@ DESCRIPTION =3D "Manipulates and accesses URI strings"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPL"
> =A0#RDEPENDS_${PN} +=3D " libmime-base64-perl libnet-perl"
> -PR =3D "r3"
> +PR =3D "r4"
>
> -SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-${PV}.=
tar.gz"
> +SRC_URI =3D "http://cpan.yimg.com/modules/by-authors/id/GAAS/URI-${PV}.t=
ar.gz"
>
> =A0S =3D "${WORKDIR}/URI-${PV}"
>
> --

Hm, you're touching an interesting issue here.
First time I tried:
http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-1.52.tar.gz works for =
me
it did not work, 2nd time it did 3rd time it didn't
seems it sometimes redirects to a mirror that is not there or does not
have the file
I got as faulty mirror:
http://archive.cs.uu.nl/mirror/CPAN/authors/id/G/GA/GAAS/URI-1.52.tar.gz

cpan.yimg.com is apparently not something that redirects to a mirror
so seems a better choice.
Probably we should also do something like this for other recipes that
use search.cpan.org

It might also be a good plan to update the recipe to 1.55.

One other thing: The rdepends is commented out.
Accordign to http://deps.cpantesters.org/?module=3DURI;perl=3Dlatest the
depends are on
 1.  	      MIME::Base64   	 S  B  R  D   	  	 Core module   	 Core module
	2. 	     ExtUtils::MakeMaker 	S B R D 		Core module 	Core module
Suggest to fix this too.

After considering those fixes
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>


