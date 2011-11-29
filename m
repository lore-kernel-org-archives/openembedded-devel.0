Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RVIav-0004Qc-KR
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2011 08:59:13 +0100
Received: by vbbfc21 with SMTP id fc21so4027121vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 23:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=3cayWMxyiphaN3WOt9QJ5B1QDq/9e4qZQGTNaLZ3rAc=;
	b=JZtySb8GCc0s73l7Yk8aB9D1WK5GltQrHoSqboHnUZMWjSNMb/71Ags0ca1uBMEtLw
	GgIUNN9h93Bo9+I6AS6tqizDfgWAwdkfuP5/opNaQyBE7z3fGTrpo/KumNnriY9hyZNQ
	0k2BTlnRmbiEW+Jpt9FTCFTd9f/pDE9+3v1JQ=
MIME-Version: 1.0
Received: by 10.52.97.35 with SMTP id dx3mr46958999vdb.2.1322553154382; Mon,
	28 Nov 2011 23:52:34 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Mon, 28 Nov 2011 23:52:34 -0800 (PST)
In-Reply-To: <CAMKF1sqdDTL5NshgoiGaN67GwynMZ+rWnwCRvo3+YAy4e3Tepw@mail.gmail.com>
References: <1322395493-30396-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1sreJB3qkFnDZPxpxBv7bZBkfE6aJ0Jwbv55HvQepitj6g@mail.gmail.com>
	<652FFCE9-01FD-4E13-8ABA-4B7100803BE0@dominion.thruhere.net>
	<CAMKF1sqdDTL5NshgoiGaN67GwynMZ+rWnwCRvo3+YAy4e3Tepw@mail.gmail.com>
Date: Tue, 29 Nov 2011 08:52:34 +0100
Message-ID: <CACW_hTaLjh10+YEfHkvTDkLC_PNxAjG8kBJkuUVemoO8+NC-Rw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2011 07:59:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/28 Khem Raj <raj.khem@gmail.com>

> On Mon, Nov 28, 2011 at 12:26 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >
> > Op 28 nov. 2011, om 03:17 heeft Khem Raj het volgende geschreven:
> >
> >> On Sun, Nov 27, 2011 at 4:04 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >>> -EXTRA_OEMAKE = "ds9097 ds9097u"
> >>> +EXTRA_OEMAKE = "ds9097 ds9097u \
> >>> +                SYSTYPE='Linux' \
> >>> +               "
> >>> +# Fix GNU_HASH QA errors
> >>> +TARGET_CC_ARCH += "${CFLAGS} ${LDFLAGS}"
> >>>
> >>>
> >>
> >> why CFLAGS ? I thought only LDFLAGS would have been sufficient
> >
> > For GNU_HASH yes, but the buildsystem was ignoring both CFLAGS and
> LDFLAGS.
> >
>
> bug in the build system I would say
>
> Actually personally I'd say passing CFLAGS and LDFLAGS to TARGET_CC_ARCH
is a workaround and the real solution is patching the build system to not
to ignore those flags.

Frans

