Received: from mail-gx0-f217.google.com ([209.85.217.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NVLdd-0007NE-4p
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 10:05:12 +0100
Received: by gxk9 with SMTP id 9so50625531gxk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 01:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=9AJqw5mWmHTJ6+5K8BO18gYUgIFUpqDEJWxCyAUtXoY=;
	b=KBUsQZa3lD5ATqZpiHEVV+g0bVstoywz/2vhD5MncbCrNmHldiuwYxv9TmfbA8Cs6B
	KEARJ0Ga7+A55N6wvVcnwSWawV29cfbTHUGJaLrT+hdQXAMfOG0trGD7JU6U4MYpk7zM
	Wci3lq1X94rJuFim78gViaEnWepvfWy66ObTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LxOQOlnpjB6fKGlgFYH825pSF0yOyQygupCHNXugXBoK+l7m/d4x46a3PU9GRfNNDb
	zew8hHs8KKAIt5dw5sG3k/qM9Q+p28Do4Y9uXhWGG9k7f9+Eu9MsSJNEKGZDo9pJOn5y
	3t+NJxoyk2+WBbFId7/dPe8tpBqVFVXwnZy64=
MIME-Version: 1.0
Received: by 10.101.56.17 with SMTP id i17mr1149579ank.167.1263459777790; Thu, 
	14 Jan 2010 01:02:57 -0800 (PST)
In-Reply-To: <1263421337.3575.3.camel@dax.rpnet.com>
References: <1263421337.3575.3.camel@dax.rpnet.com>
Date: Thu, 14 Jan 2010 10:02:57 +0100
Message-ID: <ac9c93b11001140102j36e07ca9u7cb9ddc5a9770cd4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.217
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: TSC Meeting 7/1/2010
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
X-List-Received-Date: Thu, 14 Jan 2010 09:05:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Richard, Thanks for making the minutes available.

A short reaction on a few things:
>
> Current Issues
> ==============
>
> We did discuss the IMAGE_BOOT issue. We decided that weak defaults (?=)
> in the class where the variables are used is a good thing and that the
> current structure is pretty much inline with that for image.bbclass. The
> IMAGE_BOOT change could have been better thought out but we're stuck
> with it now with no real options for changing it.

I guess the IMAGE_BOOT issue is the defaulting to udev issue. Anyway
it seems good to briefly explain the issue.

Is there a rationale why (in this case) weak defaults were considered
a good thing?
Personally I would prefer no defaults as an image recipe can easily
define them themselves (perhaps using an include of udev.inc or so).
In any case I feel if there are defaults the existence of the default
and perhaps some rationale should be documented (in the cookbook?).
I think we may expect that someone doing a recipe reads the cookbook,
but it should not be required to go through the class code to find out
about defaults etc.

(btw and if IMAGE_BOOT is not the "default use udev" issue I suggest
to table the latter topic).

>
> Commit messages were mentioned. It should be clear from reading the
> commit message what the change applies to and why its necessary. The TSC
> will start naming and shaming people making lousy commit messages and
> reserve the right to impose sanctions against repeat offenders.

I agree that we want good commit messages.

Some remarks though:

Before publicly naming and shaming people, I would suggest discussing
it with the offender in private email or on irc.
Naming and shaming might drive people away from oe.

I suggest that when someone gets commit rights (s)he is explicity
reminded of http://wiki.openembedded.net/index.php/Commit_Policy and
http://wiki.openembedded.net/index.php/Commit_log_example

I suggest to review the rules;. E.g. this one:
# This should all be on one line and you should leave an empty line
before any detailed commit information.
Nice, but if you use git commit and enter your message empty lines are removed.

Also i suggest an additional rule that commit messages should be polite.
E.g. no snide remarks on someone who made an earlier patch or on the
source package or on the code itself.

Frans


