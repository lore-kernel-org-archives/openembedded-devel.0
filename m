Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PZ6Kz-00034R-VI
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 19:37:58 +0100
Received: by iwn8 with SMTP id 8so12801606iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jan 2011 10:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=XuCMU0pAFkvY+R3s7DFjDpnYjGPxf/wAsOskCpbiIUs=;
	b=xVvOdhMxHkW3tJ6myEuC2b1Qy17HgAZm0+8y2aFiBAozEIlrqt9IKa5d8xpZeaOUjg
	l7Ewm5AHJLS2OURr4KSNnlAZGSkzsO0E/gUJEunTKq4wbz7vv9IJNKD3salPSWW5Xa8M
	sllHys6aC9YmSgoi34yw79qcZ/I+nmwvoRww4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jtR/hpfp0vNRuS6Qor41dG93DR8ztmZ4HeuuhGlTTLkWrOSmYxuXOfB8bjCxRnD+7H
	/vFHaMWB6BighQqnSAAtNJX5Z454VbFoZo3BNxFtgha74FkA29Zx1eW89Jjv+dP/oQ/e
	gA7umVSY2kL4cbASq04dKgLMbabgqR3FmovmQ=
MIME-Version: 1.0
Received: by 10.231.15.202 with SMTP id l10mr2564650iba.19.1293907057482; Sat,
	01 Jan 2011 10:37:37 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Sat, 1 Jan 2011 10:37:37 -0800 (PST)
In-Reply-To: <4D1E32AF.70203@balister.org>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>
	<ifl85e$ets$1@dough.gmane.org>
	<AANLkTikBC4nhO1ZSkuYcyoEPNonS4YeXCP6vzKJ3d3Fr@mail.gmail.com>
	<4D1E32AF.70203@balister.org>
Date: Sat, 1 Jan 2011 19:37:37 +0100
Message-ID: <AANLkTinDNZbGuuXj4rkkphC5bdN+zaLfc+TYYD5gQS+j@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, tsc@openembedded.org
Subject: Re: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Sat, 01 Jan 2011 18:37:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

[Added TSC to the email, as I would like to request a decision on how
to handle this]

> Frans, given these two choices:
>
> 1) Recipe that builds and has tested output (but depends on distro source
> mirrors).
>
> 2) Recipe that builds (even without source mirrors), BUT the output is not
> tested.
>
> We should use choice #1, since the OUTPUT is tested. If someone who can test
> the output wants to bump the SRCREV, that is fine. Bumping SRCREVs just to
> get recipes to build and not testing the output only leads to frustrated
> users who think the output works.
>
> I'd point out that no one on the panda list (or this list) has mentioned
> they noticed the recipe doesn't build, so I am not sure you are addressing
> an actual problem.
>
> Philip
>

Philip, thanks for your reply.

I'd like to point out that the fact that the recipe does not build has
been reported to this very list late oct 2010.
At that point Steve Sakoman (the owner of the git from which the
recipe pulls) suggested to use u-boot 2010.09.
I did not get to fixing the recipe until yesterday. As u-boot 2010.12
is already out I figured that this would be a better choice.
I am also on the u-boot list and I know the changes from Steve are
pulled into u-boot master.
(and wrt to availability: I am quite confident that in a few years
time this version can still be retrieved).

The problem that this recipe does not build is already known for more
than 2 months but the machine maintainer apparently is not interested
in fixing his recipe.
As such I feel the maintainer is doing a bad job.

There are several ways to fix the problem.
To coin a few:
- move to a SRCREV that seems to me more stable (e.g. because it is a
merge with upstream). I agree that there is still a chance of getting
a breakage in the future
- putting the tarball for the version that we have now at e.g.
downloads.openembedded.org or so and adapt the recipe (we have done
this for other recipes as well)
- move to upstream. The panda changes from Steve have been merged by
Wolfgang. I am not aware of any reason not to do so.

While each alternative has its pro's and con's none of them is
complicated, and any of them could have been done easily.
As the problem is already reported last october, I feel the maintainer
is not doing a good job, and actually makes things worse by abusing
his powers to block others who want to fix it.
Apparently spending a few minutes to resolve the issue is too much
work, but there is of course always time to bitch and moan toward
others who do want to keep OE a system that supports multiple machines
and multiple distros.

I'd like to ask the TSC to come up with a decision on how we should
fix this recipe. I have already indicated a few solutions above. Yet
another alternative (which is not too desirable) is to create another
machine that chooses a proper recipe for u-boot.

Frans

PS: the fact that there are no other reports of this is probably
because not many people rebuild u-boot. Most of my boards still use
the u-boot that was on the board when I got it. I guess this also
holds for other people.


