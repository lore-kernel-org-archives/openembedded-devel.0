Received: from mail-yw0-f171.google.com ([209.85.211.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NlRdL-0006kN-M9
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 19:43:24 +0100
Received: by ywh1 with SMTP id 1so548106ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 10:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=voLLh8bR2eukIJgROb9hBRECcwHCUgNuzmtI9PgTXKo=;
	b=JgFdVSGLsSg0fRmF8HT+qMpjc2sGVXD+AmggKoXp8sVxJLX28p8iOdPcVeogKPGZdv
	g4DbSxoBag4ENdCYF6VV3eXV0SFMM8scMcsizR+Ib4Xg1LRFWD9aiS1FcmV7g7oWcYOL
	OFoQJGLCZNyviHswWaBiHB68lRflWMTMmSs/M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MzMt7grlpV/s2NNtv2M+DbfL8fJUKYDcJ/yrizy3oGcEOhp44FF0qDbvVCjFXrBYUP
	CGKY1UiNvDcUpeR1fXmtY1fx0Mipr/usio/LGwt0Q50Uv3KsZmgSY1lYt+fsqGnCC1R4
	sL5D5S5T043dc2tLlmXDEDeYhDYWgGNywRWB8=
MIME-Version: 1.0
Received: by 10.101.179.30 with SMTP id g30mr724749anp.90.1267296032986; Sat, 
	27 Feb 2010 10:40:32 -0800 (PST)
In-Reply-To: <201002271904.22479.marcin@juszkiewicz.com.pl>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<ac9c93b11002270921rb738980ye29c6fd93913107a@mail.gmail.com>
	<201002271904.22479.marcin@juszkiewicz.com.pl>
Date: Sat, 27 Feb 2010 19:40:32 +0100
Message-ID: <ac9c93b11002271040i221bdb10o22cad1cf1551b6fb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sat, 27 Feb 2010 18:43:24 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2010/2/27 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia sobota, 27 lutego 2010 o 18:21:58 Frans Meulenbroeks napisa=B3(a):
>> One could do:
>> BBFILES =3D "${OE}/org.openembedded.dev/recipes/*/${DISTRO}/*.bb"
>> BBFILES +=3D "${OE}/org.openembedded.dev/recipes/*/*.bb"
>
> BBFILES =3D "${OE}/org.openembedded.dev/recipes/" is supported since I do=
 not
> remember when.
>
> Making extra levels in recipes/ dir was discussed so many times that it m=
akes
> me sad when I see yet another discussion about it which will change nothi=
ng.
>
> Images/ directory never had sensible naming. "angstrom-gnome-image" is sm=
aller
> then "angstrom-x-image", x11-image is another version of gpe-image (conte=
nt is
> other but result is same - user lands in GPE + Matchbox v1). If you want =
to
> have kind of order there then start creating "frans-really-minimal", "fra=
ns-
> basic-x11-without-gtk-but-small-as-possible", "frans-x11-gpe-mb1", "frans=
-x11-
> gnome" etc images.
>
> This directory is dump of recipes created by many developers, some of the=
m are
> probably 5-6 years old. There are many recipes for images outside of our
> repository (like bug-image-production for example or those which generate=
 1GB
> sized rootfs from Montavista). I have on disk image recipe which generate
> package which I use to generate final image. Etc, ETc, ETC...
>
> So generally I am against moving recipes which mention angstrom to
> recipes/angstrom/ just because they contain 'angstrom' word inside. If I =
will
> push "umbaumba-magic-image" recipe will you opt for moving it to
> recipes/umbaumba just because I wrote it for my internal-no-one-saw-it-an=
d-
> who-knows-does-it-exists-at-all distribution?
>

Ah well,
I just wanted to suggest a more sensible and clear naming scheme and
clean up a little bit, but apparently this is not appreciated :-(
(and yes, I also think it makes sense to remove old orphaned unused
5-year-old recipes, but guess I'm alone here too).
Guess I'd better not propose to remove some of those 26 (yes,
twenty-six!) glib recipes (or 8 abiword recipes )
Nevermind.

FM


