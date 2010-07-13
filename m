Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OYYiI-00085n-K4
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 08:11:31 +0200
Received: by iwn34 with SMTP id 34so5598338iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 23:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=jsTggijT8otVyWTvPmzqhGet4UiyuO7fvYnMuP+8bfo=;
	b=ay/hH3MLopQ7wWdXIdXcQzAJMiPi/5uo2QsCTIXRP3XfIbZnm+CbpwRIc8pa3l3hRh
	ohvo+W/GJwoHIBEnQOvJ8jC9qqb6yKjRmZ2UvyxKRL/JpcK3Ln0M2Fg3M0qMEVEA1E5X
	zRHpLznxuUJrT/omhEU13VIHdIKx0EQELGTPQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=bnKYMGWRdEAjvFrdqVTy1UZsyRMp8Y5/5nFjIjMKOZrXyqjt+sqKS4RhqKy3hWD7I9
	MDMS268KbCNRXhTF7UhNbfhMz97Vfes2OuGOWTYTikf9FO6s0o5YY+FnKAGMQIw4hFVe
	jRysrH+DOljl5B6xDyMFkLxOVdxF32bkhAciE=
Received: by 10.231.173.144 with SMTP id p16mr8757459ibz.108.1279001194471; 
	Mon, 12 Jul 2010 23:06:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.11.12 with HTTP; Mon, 12 Jul 2010 23:06:14 -0700 (PDT)
In-Reply-To: <113134CF306E8E4CACC27BE5937261B20931BF148F@AUSX7MCPS303.AMER.DELL.COM>
References: <AcsiEe3JHQwDByVbTtuXbCTfXM2oUg==>
	<113134CF306E8E4CACC27BE5937261B20931BF148F@AUSX7MCPS303.AMER.DELL.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jul 2010 23:06:14 -0700
Message-ID: <AANLkTilYsPNfPjreXVd31_k4mzUDHLiyY4XlPNmJh6x-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Correcting APACHE mirror location for APR recipes.
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
X-List-Received-Date: Tue, 13 Jul 2010 06:11:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2010 at 3:31 PM,  <Sean_Hudson@dell.com> wrote:
> Hi all,
>
> =A0We recently noticed that apr and apr-util recipes were not fetching co=
rrectly.
> =A0It appears as though the APACHE_MIRROR variable in the bitbake.conf fi=
le.
>
> =A0Below is a trivial patch to update the variable.

I am able to see the files in existing URL. What problem did you have

>
> Regards,
> Sean
>
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 12a5522..71c7273 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -533,7 +533,7 @@ export palmqtdir =3D "${palmtopdir}"
> =A0OE_STRICT_CHECKSUMS ?=3D "1"
>
> =A0ADOBE_MIRROR =3D "http://fpdownload.macromedia.com/get/flashplayer/cur=
rent/"
> -APACHE_MIRROR =3D "http://www.apache.org/dist"
> +APACHE_MIRROR =3D "http://archive.apache.org/dist"
> =A0DEBIAN_MIRROR =3D "ftp://ftp.debian.org/debian/pool"
> =A0E_CVS =3D "cvs://anonymous@anoncvs.enlightenment.org/var/cvs/e"
> =A0E_URI =3D "http://enlightenment.freedesktop.org/files"
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


