Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OchLc-0004Gp-LR
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 18:13:16 +0200
Received: by qyk32 with SMTP id 32so1100750qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=F7xvATJBZXo/eekfBRXAbQpdF89krwOR/DFWLrjm6kQ=;
	b=n4tu3/fPB7fo/j3wUivark+3ic/dB0fnOEwP+rittwp0uUd78R8j8vEHeKjTiWcC7K
	pslTWOa2L9YhnQO6ITdRYSUloXbevRSXNOQDcFf9bovnGCUXx27DWjGFqlkvSofbKRkS
	5zM1O/tZ6ZTmCKoOFnqlPb8Mxdmtbro3JaVLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=BxzlEor+QCsuVvPXiH4GGaY22QhO4Ekpr96ZHijUt7fVlfmJwKtU3hzcQmc/noi0AV
	AMhJfsxaw5UqLYOkE9yMZueX5qUhN8Fl74wukd8woQz0OxCKjT+SZhrkSQ6ksTuMrnAi
	PTXjZyFKMb6fPrK5/GoD9/jA0ndfSmFxeVTzM=
Received: by 10.224.96.150 with SMTP id h22mr4132185qan.173.1279987977145; 
	Sat, 24 Jul 2010 09:12:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.236.80 with HTTP; Sat, 24 Jul 2010 09:12:36 -0700 (PDT)
In-Reply-To: <AANLkTi=MJyW68ppn7YH-1LNp3rVwii9Gas+kUjQYAEEo@mail.gmail.com>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com> 
	<4C4AE42C.5000306@welchs.me.uk>
	<AANLkTimG_U4Gsc9LuK6oKDJO2rE=xB7cDQzGf6dsh2GM@mail.gmail.com> 
	<4C4B0125.1040304@vollmann.ch>
	<AANLkTi=MJyW68ppn7YH-1LNp3rVwii9Gas+kUjQYAEEo@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 24 Jul 2010 09:12:36 -0700
X-Google-Sender-Auth: HSM-0KnXOvSb_XKDnimKylVOIIQ
Message-ID: <AANLkTimfB5y2WDyrNr7EZD+gFDS4cE-F_LkquAtD+UZF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Sat, 24 Jul 2010 16:13:16 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 24, 2010 at 9:08 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/7/24 Detlef Vollmann <dv@vollmann.ch>
>
> > On 07/24/10 16:35, Frans Meulenbroeks wrote:
> >
> >> 2010/7/24 Martyn Welch <martyn@welchs.me.uk>
> >>
> >>  Can anyone point me to any documentation that describes what legacy
> >>> staging
> >>> is and roughly what needs to be done to remove it?
> >>>
> >>
> >
> >> There was a post half a year or so ago from Koen, but I can't find it.
> >> Basically it boils down to removing do_stage from a recipe in which case
> >> do_install is used to install things in staging
> >> in some cases do_install need to be modified to deal with peculiarities
> >> that
> >> were done in do_stage
> >>
> >> For native recipes NATIVE_INSTALL_WORKS = "1" may need to be added.
> >>
> > That's not really much of an explanation.
> > Let's take an example.  I have two out of tree kernel modules A and B.
> > B depends on A.
> > With "legacy" staging, in A_1.0.bb I have a do_install, that copies
> > the kernel object, and a do_stage, that copies the header file at
> > a place where B_1.0.bb can find it.
> >
> > How do I do that with non-"legacy" staging?
> >
>
> Apologies if my explanation was too brief. Didn't have too much time (and
> still haven't)
> I hope Koen's explanation below helps.
> The way I perceive it is that the non-legacy staging is performed by doing
> a
> do_install with the staging dir as target directory.
> Guess someone will correct this if I am wrong.


You never touch a staging directory from do_install, ever.  You install into
the usual paths, relative to ${D}, and the machinery in the classes will
automatically populate staging from that.  If you need to mangle a file
differently in staging from how you want it in your package, you can install
a hook that will be called at staging population time.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

