Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OovQi-0003vK-4e
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 11:41:01 +0200
Received: by iwn2 with SMTP id 2so2365698iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=w9gFDVE9dhoqPPgV2FVzd7h7byiQH0lMjTzEnttSo7s=;
	b=bS8QQXy1p5wPw0q267dNGxMEL1wLfXse1fwyYXT0iludRzX/eluw0TV/wWqLXMktSM
	kdlhIa40+9hLRkmx+YD/TU+pBhFWPMHZBrmaFR2/RBTNCUXONNP8hzPBD2bU1X19h8G3
	mXd7n4M0L8+Gh5YI8bAbMnkMNnMTNQWDONelQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TT82aHA2c7soCU2iw3vwkFvNvntdYHf0M/TH3SORaY4eCJo8NbnRTQN7FuS3lGct3V
	AXGFt254O7gL0VQip/Y01c6ArnpKB86FJjoyt3DGVkp6+w3XzPq9eV5kSnJGlqaec0+l
	TvQCu63V7V3mNrbQQLDARAGxN2H6bqdsAMZqE=
MIME-Version: 1.0
Received: by 10.231.190.75 with SMTP id dh11mr765243ibb.189.1282902030264;
	Fri, 27 Aug 2010 02:40:30 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 27 Aug 2010 02:40:30 -0700 (PDT)
In-Reply-To: <1282896714-3167-3-git-send-email-raj.khem@gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
Date: Fri, 27 Aug 2010 11:40:30 +0200
Message-ID: <AANLkTinOBdbZGQLChSYb1JtN5xU5QD5+dt0b=7KYTZZ1@mail.gmail.com>
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
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Fri, 27 Aug 2010 09:41:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Khem,

Thanks for the good work.
I've gone through the file and saw no problems.
The move of the nonbuilding recipes due to missing dependencies (like
with hildon) has been discussed on irc too).
I have a few small remarks (see below), but nothing blocking an ack so,
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Btw: next time please split things like this in two:
one patch with the files that are moved and one patch with the files
that are modified.
That makes it easier to review the modified recipes.

> diff --git a/recipes/angstrom/angstrom-bootmanager.bb b/recipes/angstrom/=
angstrom-bootmanager.bb
> index 6cae115..e5f3478 100644
> --- a/recipes/angstrom/angstrom-bootmanager.bb
> +++ b/recipes/angstrom/angstrom-bootmanager.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "A graphical Boot Manager for the =C5ngstr=F6m Linux D=
istribution"
> =A0AUTHOR =3D "Michael 'Mickey' Lauer <mickey@Vanille.de>"
> =A0SECTION =3D "base"
> -DEPENDS =3D "evas-fb ecore-fb esmart-fb imlib2-fb edje efl++-fb"
> +#DEPENDS =3D "ecore esmart-fb imlib2-fb edje efl++-fb"
> =A0#RDEPENDS_${PN} =3D "libefl++0"
>
> =A0ALLOW_EMPTY =3D "1"

I'm not too keen on commenting out things. If it is not needed any
more it should just go.
Something like the lines above only cause confusion.
suggest to remove the # lines or to add a short comment explaining why
they are commented out but not removed.


> diff --git a/recipes/xqt2/xqt2_20060509.bb b/recipes/xqt2/xqt2_20060509.b=
b
> index 7634d27..4492bc7 100644
> --- a/recipes/xqt2/xqt2_20060509.bb
> +++ b/recipes/xqt2/xqt2_20060509.bb
> @@ -1,6 +1,6 @@
> =A0DESCRIPTION =3D "Xqt2 is an X-Server than runs within the Opie environ=
ment"
> =A0HOMEPAGE =3D "http://xqt.sourceforge.jp"
> -DEPENDS =3D "freetype libxi xmu flex-native virtual/libqte2 libqpe-opie"
> +DEPENDS =3D "freetype libxi libxmu flex-native virtual/libqte2 libqpe-op=
ie"
> =A0LICENSE =3D "GPL"
> =A0SECTION =3D "opie/applications"
> =A0APPTYPE =3D "binary"
> --
> 1.7.1

With recipes like this I always wonder if we should keep them.
Apparently they are not build, otherwise the faulty DEPENDS would have
been detected earlier.
And the fact that it is a recipe from 2006 also indicates it is
probably not important.
Can an opie maintainer say whether it is useful to keep this?

Thanks for the good work!
Frans


