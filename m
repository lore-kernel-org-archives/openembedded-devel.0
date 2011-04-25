Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QESo8-0006hA-Ax
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 22:55:00 +0200
Received: by yia13 with SMTP id 13so2048yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=OoXlheBAK/NLocea4cBGO9df4PTxGu6pKuR+ciV/yCo=;
	b=E2rOckVKDCHKkn9TkPg+cd99jCNYXrD2GfQ4R5QteiWpmPmieS3qFK4D2o6uvwos13
	lTnFetPEgYPRjkC0TmdgwU27i7PNeEM8JibUcYKJJ7gyVdWzsR17XHahgUpUHiHA1xHv
	60gRQ7GKeuE8j7PskcOJ6p89usG7DLPC2dojM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KBfLY4X5RV+DuKa/709lhAVlZVBtfGA6YcqKih1xeOmg7GiKYBx+DA3fxPfNsrrBN/
	BkjBmlNULIid/hRXbHSFqjIOXLJ72OdIQgzTofKsmqrGzH74MHaOkw0O/LIx+SjDWK2Y
	1mbQOAQRHlVA499jyTD2WhUOF5+/cpCNZTdOs=
MIME-Version: 1.0
Received: by 10.90.160.10 with SMTP id i10mr23079age.65.1303764747256; Mon, 25
	Apr 2011 13:52:27 -0700 (PDT)
Received: by 10.90.141.8 with HTTP; Mon, 25 Apr 2011 13:52:27 -0700 (PDT)
In-Reply-To: <4DB5DC4D.9080202@mentor.com>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
	<BANLkTikm-JOf-Y2E=gz8xhrbzst2SOMLOw@mail.gmail.com>
	<4DB5DC4D.9080202@mentor.com>
Date: Mon, 25 Apr 2011 22:52:27 +0200
Message-ID: <BANLkTinKZiHUR913r=582gPRPULh=N48Gw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC, PATCH] Add minver/maxver to patch.bbclass, update bluez
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
X-List-Received-Date: Mon, 25 Apr 2011 20:55:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/4/25 Tom Rini <tom_rini@mentor.com>

> On 04/25/2011 01:14 PM, Frans Meulenbroeks wrote:
> > 2011/4/25 Tom Rini <tom_rini@mentor.com>
> >
> >> Hey all,
> >>
> >> In digging at some other bluez problems, I found that at least
> >> 4.91 no longer needs the sbc-thumb patch.  But without moving it to the
> >> N versions of bluez4 we have or starting a new inc file for later bluez4
> >> versions, there wasn't a clean way to exclude the patch.  Until now.
> >> Borrowing the minrev/maxrev logic I added minver/maxver patch params
> >> and tested them lightly (the patch is applied on 4.89 and not on
> >> 4.91).  I'm cc'ing Koen here because patch #3 adds 4.91 and make it
> >> default for Angstrom, but all I've done myself is build testing.
> >> It should be safe, based on upstream changelog tho.
> >>
> >> First question should probably be: do we need 9 versions of bluez4? This
> is
> > not too much in line with the version policy the TSC once stipulated and
> > seems also different from the road oe-core and meta-oe are taking.
>
> For bluez4 we could probably drop out 4.31, 4.41 (4.43 seems to
> introduce some startup changes that might require folks to opt-in) and
> then all of the post ones until 4.91, since shr and angstrom would both
> depend on that.  I'd be happy to do that as a follow-up.
>
> > Also personally I'm not too keen on minrev/maxrev. It only makes things
> > again a little bit more complicated.
> > My preference would be to remove the patch from the .inc file and move to
> > the individual bb files
>
> Well, maybe the better answer is a re-worked series to drop out a number
> of older versions, and then it won't be bad to have the patch in a the
> bb files..  Need to think about this.
>

I appreciate it if you would.
To me the analysis of what is needed seems sound.

>
> > My 2 cents.
> >
> > Frans
> >
> > PS: two more cents: it seems somewhat odd that some distro's have a DP =
> 1
> > for more than one version of a recipe. While technically not wrong this
> > looks a little bit odd.
> > Also we seem to have two mechanisms to select a version for a distro. One
> is
> > the DP_distro mechanism the other one is the PREFERRED_VERSION_recipe in
> the
> > conf file
> > It seems to me one should be sufficient
>
> Well, this is in part something the oe-core/meta-oe/etc policy will help
> with since it does have a planned phasing out / removal of the old
> version, so we would have less in the way of "add the latest .z release
> and .z-1 through .z-5 just stick around).
>

Actually the last remark was mostly triggered by the observation that
distro's have two ways to pin a recipe (and actually use both of them).
Having only one mechanism might reduce the chance of causing confusion
and/or mistakes

Frans

