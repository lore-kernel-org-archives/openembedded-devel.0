Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oc2Pt-0000NS-6t
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 22:30:57 +0200
Received: by bwz10 with SMTP id 10so1235462bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=b7SlL0kmlEp1FENNHaJYGjdk9MaAqHSolORXrvKjQtE=;
	b=GxT/Am0cUNkfObYGlP7yuBJW9T51yQlivS9wcb+1yeiEEYweUPgSK7Mnh1j6TADDwO
	SwdFuBXXVK/Uc8vfvugoqvnkuqOR/Fqk3GmLZvW2Ypfs9FjYZvM9BvETs42HNCfXoy2r
	uQ1LuXSe/d8RoawIkw1p/t+ONJOjcABuzppx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MxV6k/eCWAp0a6TE1SzaLCXbD/oNzDttrHg0+Y8MivoN8ULaZ+1o1ivsfSWwY3n7eg
	DVIHv5XlxRsWXlPcGP2Mbtp3QGz9aEYdmhsCQqeCwF1AfSfH5X/d3GKJsVSQSz3wsaF4
	f5OYnRBC0jnlLPGVjIMz8CIcZMkpAkuo0yy2U=
MIME-Version: 1.0
Received: by 10.204.152.4 with SMTP id e4mr1717272bkw.120.1279830642741; Thu, 
	22 Jul 2010 13:30:42 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Thu, 22 Jul 2010 13:30:42 -0700 (PDT)
In-Reply-To: <201007222152.47408.david.lanzendoerfer@o2s.ch>
References: <201007222152.47408.david.lanzendoerfer@o2s.ch>
Date: Thu, 22 Jul 2010 22:30:42 +0200
Message-ID: <AANLkTinGXavCwkN8mPTn1ivVg_yCbJeMC1hTKx0W5B62@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Introduce maxima recipe
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
X-List-Received-Date: Thu, 22 Jul 2010 20:30:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/22 David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>

> Hello.
> I was a bit surprised that maxima was missing in OE.
> Because debian, maemo, and even windows have already maxima available.
> So I decided to make an initial try for building it.
> Could you please review it?
>
> thx and best regards
>        leviathan
> ---
>  recipes/maxima/maxima_5.21.1.bb |   26 ++++++++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/maxima/maxima_5.21.1.bb
>
> diff --git a/recipes/maxima/maxima_5.21.1.bb b/recipes/maxima/
> maxima_5.21.1.bb
> new file mode 100644
> index 0000000..2cf42c8
> --- /dev/null
> +++ b/recipes/maxima/maxima_5.21.1.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION=3D"Free computer algebra environment based on Macsyma"
> +HOMEPAGE=3D"http://maxima.sourceforge.net/"
> +SRC_URI=3D"http://www.sfr-fresh.com/unix/misc/maxima-5.21.1.tar.gz"
>
You can also use ${PV} in the URI

> +
> +LICENSE=3D"GPL-2"
>
This is written as GPLv2

+S =3D "${WORKDIR}/maxima-${PV}"
>
Isn't this the default? Can you try without it

> +
> +do_configure () {
> +        ./configure
> +}
>
+
> +do_install () {
> +        oe_runmake "DESTDIR=3D${D}" install
> +}
>
I thought that what you give for configure and install is the default.
Can you test without?

Frans

> +
> +SRC_URI[md5sum] =3D "e08ed533f3059cec52788ef35198bdcc"
> +SRC_URI[sha256sum] =3D
> "1dae887e1787871437d699a6b1acc1c1f7428729487492a07c6a31e26bf53a1b"
> +
> +FILES_${PN} +=3D "/usr/local/bin/*"
> +FILES_${PN} +=3D "/usr/local/share/*"
> +FILES_${PN} +=3D "/usr/local/lib/*"
> +FILES_${PN} +=3D "/usr/local/libexec/*"
> +
> +FILES_${PN}-doc +=3D "/usr/local/info/*"
> +FILES_${PN}-doc +=3D "/usr/local/man/*"
> +
> --
> 1.6.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

