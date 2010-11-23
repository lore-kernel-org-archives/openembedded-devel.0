Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PKxqE-00013p-5P
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 19:43:46 +0100
Received: by vws6 with SMTP id 6so2127277vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 10:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=1MBKKD6AzUzzBdU6X6sbePk1eZ2s5VgtWeDVmoDIzx8=;
	b=b5omGFQp2LNJcGCL5ViCB0Z/J0jgfy+dNzh3WdoAJJSxDbYvHEGkpeQrlPRSPdg1iO
	FRq4WFejF/XO0WevJ7GIhzK3+EJvY8sdDIl4FXCWKV/AlhBnKsmhWsL/bfXuztdYeR7b
	W4ga75hZKMwgQ8qS7iPFih9r0Lsc7KEipZve0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=rPud1todsxAmfg4X2vgQmS9CIb+6DjlbbiQH49hNVzs+JW3zfdymSvqXMvX81WLr8t
	Jqhavr39gGDBIKZv9gp12RKBlv5cnQKYlmlCcGkPHyC0JIetiMgIDYhd4PM6Ord3AZ0l
	75skWRr36cDBsFIK53Tw7RwplypyQK4mDUyjQ=
Received: by 10.216.154.8 with SMTP id g8mr1440957wek.12.1290537751041; Tue,
	23 Nov 2010 10:42:31 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 23 Nov 2010 10:42:10 -0800 (PST)
In-Reply-To: <ich10v$f5b$1@dough.gmane.org>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
	<ich10v$f5b$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Nov 2010 11:42:10 -0700
X-Google-Sender-Auth: oP-I9POGnj04lTX7C7AzkJa_s7I
Message-ID: <AANLkTimuLxR88D2jRH=-Ky0BRLK5GkbyqUcSO8FhK=KW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Tue, 23 Nov 2010 18:43:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 23, 2010 at 11:26 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 23-11-10 15:29, Chris Larson wrote:
>
>> Thanks for your time, and do let me know what you think, either of the
>> code, performance in general, or the new progress bar (shows an ETA),
>
> The heuristic for the progress needs some work, it currently seems to
> take in account all the parsed recipes instead of the last N recipes.

That's what our progress display always did, it's just more obvious now.

> Try ctrl-c'ing it at 75% and restarting, you'll see the ETA taking weird
> values. In my case it stayed on "10 seconds" for more than a minute.

The issue is one I've discussed with foerster a fair bit already.
When you're fully cached, the majority of the time isn't in the
parsing, it's in the loading of the cache file from disk, which isn't
part of our progress at all right now.  Either we stall for seconds
before the progress bar comes up, or we don't appear to stall, but the
ETA is a bit off.

Long term the intent is to properly integrate cache loading into this
progress bar, or into its own -- see
https://github.com/foerster/bitbake/commit/320b114d92181b3f944776b7e8c8db4b868ee3f1
for foerster's initial work on this.

After thinking about what you mentioned about the recipe count being
parsed, and given the fact that cached recipes aren't "parsed",
they're loaded from disk and then added to our CacheData, perhaps we
should change the parsing progress display to truly only show the
recipes being *parsed*, which is what you implied, and add a "Loading
cache..." message before the progress bar comes up, so we don't appear
to stall, then add a proper progress bar for the cache file loading as
a second step.

Alternatively, we change the progress display to truly indicate what's
being done.. if we consider all recipes, it's not *parsing* that we're
doing, its .. perhaps.. processing?

*ponders*
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


