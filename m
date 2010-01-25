Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NZXRp-0006W4-G3
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 23:30:20 +0100
Received: by pwi4 with SMTP id 4so2580990pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 14:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=zVWDWx64f7vyRQZZ3L9DaM739hqgk3mHW5fK8IkWcfU=;
	b=dcnHLRytFE2eQVYTeIyPFP9A6T2lxVJ5b5z8J9cb5zZxbMTxxplCzr8F/H0xGncKqO
	IEHBB4v42sdUcuWrx/752q2POSYT+Wv3STZDPVUv63nE034XGx5Tf0LOQKq8c/OYjtDZ
	iBIZS4Lwmcx+bkekrcusefMeC5PD5iVF8gRg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=cUxWg21/cpp1qsePL0m22zMAR9Q1zaot9v0kK/orLFIt3U3vC/Vs6zuVMAmk95L3sA
	iDIBiSsUAgrIj5lHswiMn7BLLB7kYBNR7kxSMqHUhO4rLVReniQ70OYSWmfyFgYamiTf
	JGG5UFu2DU3nLjLg1hgDf6ECbu6f33wyOGzws=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.9.17 with SMTP id 17mr4930112wfi.235.1264458476069; Mon, 
	25 Jan 2010 14:27:56 -0800 (PST)
In-Reply-To: <D15778FFF6A6CA4FAF01B8D2C3780300499D3EAEDF@ushqwmb02.palm1.palmone.com>
References: <D15778FFF6A6CA4FAF01B8D2C3780300499D3EAEDF@ushqwmb02.palm1.palmone.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 25 Jan 2010 15:27:36 -0700
X-Google-Sender-Auth: 3c41e5fa9f88b286
Message-ID: <b6ebd0a51001251427y6b1519b9l418214ad544c923e@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Making bitbake directives conditional
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
X-List-Received-Date: Mon, 25 Jan 2010 22:30:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 25, 2010 at 2:32 PM, Michael Morrell
<Michael.Morrell@palm.com>wrote:

> >On Thursday 31 December 2009 19:55:52 Michael Morrell wrote:
> >> I have two quick OE questions.
> >>
> >> First, is it possible to use any of the "directives" in a bb file or
> conf
> >>  file based on a condition?  For example, can I "inherit" a class or use
> >>  "addtask" only under certain conditions.  I couldn't find a way to do
> >>  this.
>
> >The question is why do you need this? What would be your usecase? You
> could
> >achieve this with inherit ${MY_VAR} and then have MY_VAR be either "base"
> >(which is already included) or what you want... but this is kind of ugly
> >and hard to understand.
>
> Agreed this might work, but is ugly.
>
> One reason why I'd like to do this is so that "inherit package" which adds
> the package and package_write tasks isn't done if PACKAGES is empty (like
> for native package).  It is more efficient to not have these tasks scheduled
> and executed since they don't do anything in this case.
>

An alternative I've played with was avoiding the execution of any task whose
function is empty or nonexistant, and then emptying the definition of the
function in the metadata depending on the condition in question (i.e.
setVar("do_package", "") if not packages), but I don't really like that
approach either.  Yes, ideally we'd have a nice clean mechanism for
conditional definitions and conditional operations, but changes to the file
format need to be made carefully and with forethought or not at all
(alternatively, a new file format could be introduced).

I was thinking about implementing something like:
>
>  inherit <name> [if <cond>]
>

I vote against this.  Something like this would be good, yes, but not a
single syntax for a single bitbake recipe directive.. it should be a more
generic mechanism, in my opinion.

By the way, is there a difference between using "inherit" and assigning to
> the INHERIT variable?


Items listed in INHERIT are parsed into the global configuration metadata
prior to parsing any recipes, so are parsed before the recipe.  Items parsed
with 'inherit' are parsed *right there* in the file, so whether a variable
definition is before or after the inherit directive can make a difference.
 (Personally, I think we should move in the direction of ditching this
behavior, and move all of the classes between the config metadata & the
recipe).
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

