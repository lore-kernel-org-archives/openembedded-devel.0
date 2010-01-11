Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NURJZ-00012h-E5
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 21:56:44 +0100
Received: by yxe5 with SMTP id 5so16455907yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 12:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=HKHy0DbpfBbZtHZ1EU1NpW56V/wsWRHfjeBGsifdzqE=;
	b=tfSszJt+k914iY8l0Zg/dnfpII3vaXbHt8MSULFrms7s1empmCLCfx/0uE8fOw/pr4
	fv4rHMNrEp//5gpvX1SjZWCRqlqcnQGh2nvXtE+YtBLm8x1c7vpeAhaXXxmv4QqZErv2
	/9hXbD/Lyl6fGV1XFkAXKFiOzUMfdJbM5vt2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dfQae1YeTxpx1ijMQc+EyaOp8GqQjyQhr0sNYsVJh1OjjdgppMSubuy6Q49NY3XE84
	Gh8Upxys5dnsxzSZyEHDBwC8ojNsoMGm4FGbt7hdPdEF4NsM3oPpgknkMJ9LCBo9PqQB
	SyCnnlAyMlnDG7TlU+1zim0JgIxea9VcxxwaA=
MIME-Version: 1.0
Received: by 10.101.7.19 with SMTP id k19mr6513200ani.123.1263243272004; Mon, 
	11 Jan 2010 12:54:32 -0800 (PST)
In-Reply-To: <hig2fe$ui2$1@ger.gmane.org>
References: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
	<1263236290.22868.33.camel@andromeda> <hig2fe$ui2$1@ger.gmane.org>
Date: Mon, 11 Jan 2010 21:54:31 +0100
Message-ID: <ac9c93b11001111254j4a52b1a8xb6fa1c6c3a9567d6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dependencies between packages
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
X-List-Received-Date: Mon, 11 Jan 2010 20:56:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/11 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-01-10 19:58, Michael 'Mickey' Lauer wrote:
>
>> I would welcome such a mode that automatically rebuilds all depending
>> packages, however as this could dramatically increase build time it
>> would need to be optional. BitBake hackers, what do you think?
>
> Bitbake already has such a mechanism and like I mentioned earlier in
> this thread, it's of limited use, since the PRs won't get changed, so
> from a DISTRO POV you still need to manually increment each affected PR
> or bump DISTRO_PR, which will rebuild everything.
> And even if we could bump PR automatically, we need a way to distribute
> that too all buildhosts.
>
> And yes, I'm cranky because I need exactly this to deal with the bzip2
> SOVERSION fallout :/
>
> regards,
>
> Koen
>

One way to resolve this without bumping all the PR's would be to
record the PRs of all pacakges it depends on.  (direct and indirect).
If you rebuild a package and any of the depends packages has a PR that
is increased, the package is rebuild, even if PR is not changed.
Another way could be to use the timestamps. If the staging timestamp
of a package one depends on is newer than the last build of the
package itself it is rebuild.
And a third way is to compute all packages that depend on another
package and rebuild those when the package is changed. However that
would probably rebuild way too much (everyone depends on glibc so if
that changes this would become a bitbake world).

However, I think the problem is not the rebuilding of packages, but
more the deployment of packages. Currently PV + PR are used to
determine if an upgrade is needed and that kinda gets lost (unless
opkg also has a version or time check; yuk)..

Frans.


