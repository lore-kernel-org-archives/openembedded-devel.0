Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OrulP-0002wC-Rx
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Sep 2010 17:34:45 +0200
Received: by wwi14 with SMTP id 14so1830970wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Sep 2010 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=OcKpq/iAjsWRyZA3lZn1s2pOcL8j60PYI6NG9ruLtTo=;
	b=k7EQKmpBfQjMwNl310GlvbwvZlmyrU9QBJw2mflI46Abgw7fc/5Y55EjxWOFRMpPor
	2uh59Pd0O3ak0Vh4Vcu8txYKCBIhQXuSIwTB0LTf8ZQt/Ng62nEGNCnHxJHbn0cV490l
	3+DbMuuzXGOrZBJ0eKRSSwtG2DR3AIRM5YTmI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=tMbnndfD9tn5C5z/aTKrcJm6MQd8ZMiCy7tynjo2J5YeK4p1KBfYF4kaFaPeSLZ+jE
	ZoBx4IGHsP/dZix5JKp22N9a41DTXY2FU7dk4YH4rqmYFjuj76OOh7r5FdtJRZgOepmA
	63ZH90SBiSROESSvmtTDGcH03pXfGDFu6rxj4=
Received: by 10.216.234.93 with SMTP id r71mr2374weq.104.1283614287477; Sat,
	04 Sep 2010 08:31:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Sat, 4 Sep 2010 08:31:07 -0700 (PDT)
In-Reply-To: <20100904141126.GB29434@merkur.sol.de>
References: <AANLkTim_ukfazSeQbS5H_f=ouSzf1QUbJL3PvLivP9+O@mail.gmail.com>
	<20100812223234.GA7917@merkur.sol.de>
	<AANLkTi=B4WQ+LWOHFS1tWFfb32S+x4Ebm46EdP4VG+ea@mail.gmail.com>
	<20100904141126.GB29434@merkur.sol.de>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 4 Sep 2010 08:31:07 -0700
X-Google-Sender-Auth: _BBv5gRIOGp9ZIXuxEX6fKfrpsE
Message-ID: <AANLkTikiza4bNpf1uLbMP9mRht55ODae4jZQuxz6Fr-Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: autotools issues (MKINSTALLDIRS, -s_
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
X-List-Received-Date: Sat, 04 Sep 2010 15:34:45 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 4, 2010 at 7:11 AM, Jens Seidel <jensseidel@users.sf.net> wrote:

> Chris, please don't top post. How the hell should I reply to it? Read an
> arbitrary mailing list netiquette guide ...
>

Uh, the one time I've top posted in years of using mailing lists and you
choose that one to be an asshole? bite me.

>
> On Fri, Sep 03, 2010 at 08:46:39PM -0700, Chris Larson wrote:
> > I noticed a long time ago that a certain error from the autoreconf is a
> sign
> > that your po/ makefiles are from old gettext, and will end up seeing the
> > mkinstalldirs failure.  See
> http://patchwork.openembedded.org/patch/1004/.
> > Haven't had a chance to do any further investigation on it since then,
> > however.
>
> Your patch just refers to the warning
> "WARNING:  po/Makefile.in seems to ignore the .*dir setting"
>

Yes, I know, I wrote it.


> Maybe it causes make to install files into wrong directories but I had
> never
> problems with this. The error from this thread was a real error because of
> an incompatibility of special versions of gettext and automake. As we both
> observed using a newer gettext version (by just bumping the minimal
> gettext version in configure.ac, in general not by upgrading gettext)
> helps.
>

I did not say that this warning referred to the exact behavior you saw.
Perhaps you should re-read the email.  I said it's a sign of use of
makefiles from old gettext, which also tend to run into the problem you've
seen.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

