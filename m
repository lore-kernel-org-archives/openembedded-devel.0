Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ap.john.stirling@gmail.com>) id 1TWVZO-0004AH-AD
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2012 18:07:10 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so1274604bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2012 08:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Yw3xHbM7liYWBi7dsNsCcezugW5nyBwg5ZavDXFtba4=;
	b=P6jzTgjvzAy5ogNHIQnDNdzSLd7eKGf9noeV9N20NYNmfllDUlsuBXemGMxKSZkruZ
	hxUQpwCbdqXWfMaD5zcxroR0Zf6aStOMmHcD3Dr5q1OJIXkyZI7+wqQMawxOVnrSKsHO
	0nPB7L3I6t1zdEkEMEISg7tWsSfXKTGSDVphJXUHJU6GvAYG1e/qfiKMhobCk6l7S4na
	IJNPVUCmIUwB9+ZDr6VtENcgdGi/EmYAwG9tAKTTvCH+aMcBO1eNG8r9EW9Q6PrTaT7S
	6qhoJsADjRDQ7ntzDT9QNeLZaaXR9Bi2c7RKLQkYNyt2wOE1o6XlHrGQKA5wUQWKHh6+
	O8qg==
MIME-Version: 1.0
Received: by 10.204.128.144 with SMTP id k16mr2495573bks.64.1352393602818;
	Thu, 08 Nov 2012 08:53:22 -0800 (PST)
Received: by 10.205.43.200 with HTTP; Thu, 8 Nov 2012 08:53:22 -0800 (PST)
In-Reply-To: <CABcZAN=roEmCd3hYP9D6gB6tdAM+gp+ySmocz4o58VKm9H+EWQ@mail.gmail.com>
References: <CABuzA3PSXijNc_arax7faz0RAJbHW6A7yjk_BDLfqq3Oojurdg@mail.gmail.com>
	<CABcZAN=uQC5WEF6zg4N74=yibNoPUPwboAybi9mc+iKcrVPzzQ@mail.gmail.com>
	<CABuzA3Puc=w47VGFA5E67=w+6gxMGq8QmKNQXkL+c4e4Eze9uw@mail.gmail.com>
	<CABcZAN=roEmCd3hYP9D6gB6tdAM+gp+ySmocz4o58VKm9H+EWQ@mail.gmail.com>
Date: Thu, 8 Nov 2012 16:53:22 +0000
Message-ID: <CABuzA3M+N8J-3mThB0kCfQE6v=z6=6G9OKiYxvRr-RLi1-wMKg@mail.gmail.com>
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
X-List-Received-Date: Thu, 08 Nov 2012 17:07:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 November 2012 16:50, Chris Larson <clarson@kergoth.com> wrote:

> On Thu, Nov 8, 2012 at 9:48 AM, John Stirling <ap.john.stirling@gmail.com
> >wrote:
>
> > On 8 November 2012 14:09, Chris Larson <clarson@kergoth.com> wrote:
> >
> > > On Thu, Nov 8, 2012 at 3:03 AM, John Stirling
> > > <ap.john.stirling@gmail.com> wrote:
> > > > Can someone advise best way to set up additional environment
> variables
> > > > automatically when invoking devshell -
> > > >
> > > > We used to define a do_devshell_prepend() function but that doesn't
> > seem
> > > to
> > > > work any more.
> > >
> > >
> > > See OE_TERMINAL_EXPORTS -
> > >
> > >
> >
> https://github.com/openembedded/oe-core/blob/master/meta/classes/terminal.bbclass#L7
> > > --
> > >
> >
> > Am I correct in thinking that would set the extra variables up for every
> > devshell rather than for a specific package ? Or am I missing something ?
> >
> > I'd ideally like to set them on a per package basis rather than globally
> > for all devshells. We used to be able to do this in the .bb file via
> > do_devshell_prepend().
>
>
> No, you're missing something. The class gets inherited globally, but the
> task is still run in recipe context. You should be just fine in appending
> to OE_TERMINAL_EXPORTS in a recipe, if you really need to (though it seems
> a little odd :).
>
> ok, thanks

