Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ne9vj-0004hX-UW
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 17:24:19 +0100
Received: by yxe10 with SMTP id 10so4624409yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2010 08:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=yD2t8wxL5g0aYPB1Lgwm7XZwSvsunFKl5zbvADqWBVk=;
	b=J94NwprWeV4BQZjV/z90MLTpIUkHBSMRrEFDbR+TqBmmtxH1DsCU0lQuXpGIOSSVq4
	6TMCKgvGMJR9mORoRYemfgge/i0r4vYsNvTwHO1ib3HV994jDM5Gy05F5Kk5YOw2gdxe
	sgeuigCyWifrdjcpKknW/03Yrrz0zHsySYYWw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sgB9Y4jpGzahfZIb7hAnpZAt6+XkE5J4+0aWK9riVOX8t6bXVrQ90OzDOTcXhbj8h3
	YOaBGewRgE5mbWoQ5Jxp1jiZkGImxcbqXAUaM3G1uk7Ig+chYLj1ran67DOgNRxUVYW/
	hFkjabzsMgt6ZEsAaY36tGDZlTCiGn0JQIQac=
MIME-Version: 1.0
Received: by 10.100.25.14 with SMTP id 14mr1276161any.158.1265559704060; Sun, 
	07 Feb 2010 08:21:44 -0800 (PST)
In-Reply-To: <hkm5j4$fib$2@ger.gmane.org>
References: <hkm5j4$fib$2@ger.gmane.org>
Date: Sun, 7 Feb 2010 17:21:43 +0100
Message-ID: <ac9c93b11002070821x6d5ac559sd8bb519b902b0af0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: TSC meeting minutes 20100204
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
X-List-Received-Date: Sun, 07 Feb 2010 16:24:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/7 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> TSC Meeting 20100204
>
> Attendees: Chris, Graeme, Koen
>
> Looking back a the past month the naming and shaming campaign for bad
> commit messages seems to work well. People also seem to be able to solve
> problems themselves instead of moving everything to the TSC.
>
> The TSC also discussed where variable defaults should be and Chris is
> going to start a wiki to form an idea on the scope of the cleanup and
> gauge interest in a 'kernel janitors' type of project for it.
>
> The TSC is also wondering what our userbase wants OE to be like and what
> to focus on, but we need to find the right tools to ask such questions
> first, the website vote method is just too passive.
>
> On overriding default variables the TSC is very clear: we should try to
> make it impossible to do things like PACKAGES = "of". An idea would be
> to move the PACKAGES =+ -dbg, -dev, doc to e.g. package.bbclass. More
> thought on this is needed.
>
> The last two items discussed were new-style staging and packaged
> staging. The TSC would like to *strongly* encourage people to move their
> recipes to new style staging. If you are using packaged-staging with a
> big TMPDIR (e.g. a few machines with big images built) legacy staging
> will easily take more than 15 minutes per recipe because it scans
> through the complete staging looking for changes.

Maybe I missed a thing, but can someone provide a pointer to how a
good recipe with new style staging  should look like?
I'll happily modify the recipes I touch regularly, but don't exactly
know what to do.

FM
>
> The consensus in the TSC is that DISTROs are in charge of enabling
> packaged-staging or not, but keeping the non-packaged-staging working
> well is not a priority.
>
> End of meeting
>
> Postscript: Richard mentions that keeping non-packaged staging working
> will be a major pain, so DISTRO maintainers should aim to enable it so
> OE can move forward.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLbpmlMkyGM64RGpERAtgXAJ9q7s562EhMwdNRbfBcu2R+1dVwywCfdPEl
> rgF/e2PDzsBkUj0Kf12y/wE=
> =kLei
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


