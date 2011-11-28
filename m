Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RUyvw-0001Tg-4k
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 11:59:36 +0100
Received: by bkbzs2 with SMTP id zs2so7663780bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 02:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=K0qzmrceMCFiw8dWEGnqmyDj5oRWIN1pvS/n9BSwF50=;
	b=fM0a9vG5UZriK5+2LXozg31mJuqq1G4YFFmWfASrFGIgbzqyqcOfkdbY/Eku59SSrL
	IQGbRd5V/b0ddqXn8lmpPNMLnQmwQzfPwxBVIcVp0pJt/FSpjQntJl/Ks3IVHAxOM4ST
	Ss2otDDLAvtGB/Koj/u9jAWafWg4UkMlYLhqU=
MIME-Version: 1.0
Received: by 10.204.16.67 with SMTP id n3mr46689453bka.6.1322477578527; Mon,
	28 Nov 2011 02:52:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Mon, 28 Nov 2011 02:52:58 -0800 (PST)
In-Reply-To: <652FFCE9-01FD-4E13-8ABA-4B7100803BE0@dominion.thruhere.net>
References: <1322395493-30396-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1sreJB3qkFnDZPxpxBv7bZBkfE6aJ0Jwbv55HvQepitj6g@mail.gmail.com>
	<652FFCE9-01FD-4E13-8ABA-4B7100803BE0@dominion.thruhere.net>
Date: Mon, 28 Nov 2011 08:52:58 -0200
X-Google-Sender-Auth: P5O-P8XPNbxDQk7UNlepX-1lm0g
Message-ID: <CAP9ODKpFz5xpkJv-B1L5m2sMSERcN1d+P=hSJb=nDa7DxfdowQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] digitemp: fix QA issues:
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
X-List-Received-Date: Mon, 28 Nov 2011 10:59:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Mon, Nov 28, 2011 at 06:26, Koen Kooi <koen@dominion.thruhere.net> wrote:

>
> Op 28 nov. 2011, om 03:17 heeft Khem Raj het volgende geschreven:
>
> > On Sun, Nov 27, 2011 at 4:04 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >> -EXTRA_OEMAKE = "ds9097 ds9097u"
> >> +EXTRA_OEMAKE = "ds9097 ds9097u \
> >> +                SYSTYPE='Linux' \
> >> +               "
> >> +# Fix GNU_HASH QA errors
> >> +TARGET_CC_ARCH += "${CFLAGS} ${LDFLAGS}"
> >>
> >>
> >
> > why CFLAGS ? I thought only LDFLAGS would have been sufficient
>
> For GNU_HASH yes, but the buildsystem was ignoring both CFLAGS and LDFLAGS.
>
> regards,
>
> Koen
>
>
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk7TRcgACgkQMkyGM64RGpGywgCgjzrNXHq8p6U9B0SxwnA185VM
> cFoAn2GqpleZxYeGQkSsr7oy/0lfrJn5
> =Nbq+
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

