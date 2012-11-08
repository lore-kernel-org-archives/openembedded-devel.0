Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TWVXA-00044M-Dj
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2012 18:04:55 +0100
Received: by mail-ie0-f175.google.com with SMTP id c13so4556852ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2012 08:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=VfzKvFmlJH+i9aq2zqftTco0d4Z111fLSf2mkqA84og=;
	b=GcJGgl29YwwlF0fdG+ijjAS5TPwpvKKieckNyQARnWY9K6fpgOsIKiZUt0StRGhSQ3
	Kr4nupV50HOyEsRYfRIADqsi6iLDPj3vrJm5ZB3X+vSLct4Hx+cadVySb/128nOTqgSz
	hbnwUqgXSZ+Mk6nxmeBNXv/BjaVIB+DGB+3oH+7tXnxyOqmzLSkfu4dyjqXzhTFSt/CI
	sQOkNyUVAt5HUrgOOgjvgOV15/LhcjswMuOoCs4Blj0pl0PzOXDuaNRiWNE9a+LZHFhP
	i2VsrjPtlF5nfo2lg4t+bHnMr8nZuuX/LitkKxquDEneP7p/y5O7EnG2EucuObaHXPbj
	AuHQ==
Received: by 10.42.97.74 with SMTP id m10mr7599911icn.42.1352393464258; Thu,
	08 Nov 2012 08:51:04 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.50.62.97 with HTTP; Thu, 8 Nov 2012 08:50:43 -0800 (PST)
In-Reply-To: <CABuzA3Puc=w47VGFA5E67=w+6gxMGq8QmKNQXkL+c4e4Eze9uw@mail.gmail.com>
References: <CABuzA3PSXijNc_arax7faz0RAJbHW6A7yjk_BDLfqq3Oojurdg@mail.gmail.com>
	<CABcZAN=uQC5WEF6zg4N74=yibNoPUPwboAybi9mc+iKcrVPzzQ@mail.gmail.com>
	<CABuzA3Puc=w47VGFA5E67=w+6gxMGq8QmKNQXkL+c4e4Eze9uw@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 8 Nov 2012 09:50:43 -0700
X-Google-Sender-Auth: Pk6bObDihYBIyu055nrkdj0QvOU
Message-ID: <CABcZAN=roEmCd3hYP9D6gB6tdAM+gp+ySmocz4o58VKm9H+EWQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 08 Nov 2012 17:04:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 8, 2012 at 9:48 AM, John Stirling <ap.john.stirling@gmail.com>wrote:

> On 8 November 2012 14:09, Chris Larson <clarson@kergoth.com> wrote:
>
> > On Thu, Nov 8, 2012 at 3:03 AM, John Stirling
> > <ap.john.stirling@gmail.com> wrote:
> > > Can someone advise best way to set up additional environment variables
> > > automatically when invoking devshell -
> > >
> > > We used to define a do_devshell_prepend() function but that doesn't
> seem
> > to
> > > work any more.
> >
> >
> > See OE_TERMINAL_EXPORTS -
> >
> >
> https://github.com/openembedded/oe-core/blob/master/meta/classes/terminal.bbclass#L7
> > --
> >
>
> Am I correct in thinking that would set the extra variables up for every
> devshell rather than for a specific package ? Or am I missing something ?
>
> I'd ideally like to set them on a per package basis rather than globally
> for all devshells. We used to be able to do this in the .bb file via
> do_devshell_prepend().


No, you're missing something. The class gets inherited globally, but the
task is still run in recipe context. You should be just fine in appending
to OE_TERMINAL_EXPORTS in a recipe, if you really need to (though it seems
a little odd :).
-- 
Christopher Larson

