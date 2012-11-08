Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ap.john.stirling@gmail.com>) id 1TWVUs-0003yi-SJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2012 18:02:30 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so1272073bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2012 08:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4Q2jDt/Lf4D7PLK5DV8Xb2c4fmVRPt++/YR4y8KlRfs=;
	b=Edojb4X6uqfHWnvb4vROMJ9Jk6RBzqey3iJFavEXYYqxgt8igWdM3n0tQ5958Hi5Xx
	YyPUj417kdIF9AEX2LBfRcJfddbYktxeFKmNAlNQGMsh7Lhj2k1kj30zo7bMoVe8ZHGt
	cAwd6KDWNMm364WRSygUB7FyfF8IyzMSzWd1jx1K0zfhAfljUSTbQoJd7Yyk7S7iXNOP
	FdE2nugJ6ppl3aCiRQ4654qFtOlKuNf8QX2CQN4TzpX0lO5Nd6WfvWHFqsEbX1iy6qm9
	WshpoAuSEVDgyvG+r3GMBQTSr2JkBiujdI/T/Huh8sHlyJ0cafQGTVoZi/2jtRRUXOHd
	IBEg==
MIME-Version: 1.0
Received: by 10.204.148.89 with SMTP id o25mr2416428bkv.11.1352393323232; Thu,
	08 Nov 2012 08:48:43 -0800 (PST)
Received: by 10.205.43.200 with HTTP; Thu, 8 Nov 2012 08:48:43 -0800 (PST)
In-Reply-To: <CABcZAN=uQC5WEF6zg4N74=yibNoPUPwboAybi9mc+iKcrVPzzQ@mail.gmail.com>
References: <CABuzA3PSXijNc_arax7faz0RAJbHW6A7yjk_BDLfqq3Oojurdg@mail.gmail.com>
	<CABcZAN=uQC5WEF6zg4N74=yibNoPUPwboAybi9mc+iKcrVPzzQ@mail.gmail.com>
Date: Thu, 8 Nov 2012 16:48:43 +0000
Message-ID: <CABuzA3Puc=w47VGFA5E67=w+6gxMGq8QmKNQXkL+c4e4Eze9uw@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: devshell - setting up additional environment variable
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
X-List-Received-Date: Thu, 08 Nov 2012 17:02:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 November 2012 14:09, Chris Larson <clarson@kergoth.com> wrote:

> On Thu, Nov 8, 2012 at 3:03 AM, John Stirling
> <ap.john.stirling@gmail.com> wrote:
> > Can someone advise best way to set up additional environment variables
> > automatically when invoking devshell -
> >
> > We used to define a do_devshell_prepend() function but that doesn't seem
> to
> > work any more.
>
>
> See OE_TERMINAL_EXPORTS -
>
> https://github.com/openembedded/oe-core/blob/master/meta/classes/terminal.bbclass#L7
> --
>

Am I correct in thinking that would set the extra variables up for every
devshell rather than for a specific package ? Or am I missing something ?

I'd ideally like to set them on a per package basis rather than globally
for all devshells. We used to be able to do this in the .bb file via
do_devshell_prepend().

