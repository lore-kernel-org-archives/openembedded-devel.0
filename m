Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SVNtv-0002FP-QG
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 16:11:27 +0200
Received: by eekd49 with SMTP id d49so814887eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LFXQeDkWECo+dCsLB1ZEM8jRlbWapWngBM+CmZUVEuY=;
	b=VIx4UQ3fvjKfUGjbuPUD2BFKYp+ob2MNVxunCngpxIqJtJ8ekzupfi/g6HxULtyZOf
	DmUSw+94bIHRfy1qf9gNQ/AijrickjDcaWuOEsc9RnoQ8h98sEBoMC8Bxlzg2qxB5KUV
	K31oZWT4rHIZf3s3BC5yWbd9y618TYS9lI/ZYxzrePj6pSOr500lTgmw9g4jVKTpeP9T
	tjAcsgdknV45VR2z80rpTflw+mN1m0liY+YLIJiDoSgzKcz82usPBOzrxDFYXruBJYWV
	iF7QZNIdeQLtoL173gcPx3Zs5aPyWdvhV56UmaWH7O8ZgQtYS1pAusvpilnqZooPaTvB
	sCow==
MIME-Version: 1.0
Received: by 10.213.28.202 with SMTP id n10mr3092318ebc.41.1337349684127; Fri,
	18 May 2012 07:01:24 -0700 (PDT)
Received: by 10.14.2.132 with HTTP; Fri, 18 May 2012 07:01:24 -0700 (PDT)
In-Reply-To: <CALbNGRTsKqcvJjYKWbewDYHkYEGz0Y-BarB-_bDUq3fizTB7uw@mail.gmail.com>
References: <CALbNGRTsKqcvJjYKWbewDYHkYEGz0Y-BarB-_bDUq3fizTB7uw@mail.gmail.com>
Date: Fri, 18 May 2012 07:01:24 -0700
Message-ID: <CAMKF1spVDie4PP5dAX840A5QvwZv86280Fwe=UtqUQDM=D0BCA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: libnotify does not work when linking with gold
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
X-List-Received-Date: Fri, 18 May 2012 14:11:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Friday, May 18, 2012, Andreas M=C3=BCller wrote:

> Hi,
>
> when using gold - angstrom default now - notifications in xfce do not
> work and complain with
>
> | notify-send: symbol lookup error: /usr/lib/libnotify.so.1: undefined
> symbol: gdk_screen_make_display_name
>
> To test I build an image without using gold and notifications work as
> expected.
>
> gdk_screen_make_display_name is part of gtk+. Is it possible that this
> is improperly exported? Or is it something like written in [1]
>
> Help appreciated


This looks like a case of under linking you need to specify the needed
library which provide these symbols on link line
Old linker allows over linking and I guess that's playing part here


>
> Andreas
>
> [1] https://fedoraproject.org/wiki/GoldIncompatibilities
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

