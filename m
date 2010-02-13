Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1NgJmy-0001eN-24
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 16:20:11 +0100
Received: by fxm26 with SMTP id 26so3454214fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 07:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=tqxQzkreWL4FJEogM8tmk9/lcgaGxzAMs/Jh87+fZ9M=;
	b=t6/VJZkKPbV7c0lFj0uSuDlnY43GrXYQQflO+lF2oIE6PN/k1CJIb1Mx8Y4eab8G05
	KcwZXZwdS+MLf7GTHWC/0+6+maVoftezoH5ci/2+56CDyjWdZsG0vrztVa4DUlJvjxJ/
	IX2yZiXw+Ecb/fy5qgECEA9ltW4x5O18cH3I4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HA8WJXjfFvb0qVMVZS39hPV6dLs42L3paeYWp5+faKAxFm/ykyqetUKE6YTtNziRJ7
	wVipo5SyRY45TcTjoacud7Yir9fytcD2tNhav3zaIAdmJns3K8NisIHbU5YKqMbpOtoA
	IaVamxdSTRfWNccICAO3nGbkJIhRVpibPAIvw=
MIME-Version: 1.0
Received: by 10.223.17.80 with SMTP id r16mr2510976faa.28.1266074251773; Sat, 
	13 Feb 2010 07:17:31 -0800 (PST)
In-Reply-To: <ac9c93b11002130655p454b5931od630b58e995772a1@mail.gmail.com>
References: <ac9c93b11002130655p454b5931od630b58e995772a1@mail.gmail.com>
Date: Sat, 13 Feb 2010 16:17:31 +0100
Message-ID: <ade1bdc1002130717v2573bd35m165c6c887ca408e3@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC} rootfs directory path
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
X-List-Received-Date: Sat, 13 Feb 2010 15:20:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Frans,

2010/2/13 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Currently the rootfs ends up in ${TMPDIR}/work/rootfs/console-image
> (at least if I bake console-image).
> When dealing with multiple systems and either doing a parallel build
> or keep the rootfs that could lead to inconsistent/faulty situations.
> Shouldn't the dir be something like
> ${TMPDIR}/work/rootfs/$DISTRO}-${MACHINE}/console-image or so
> (or maybe $DISTRO/$MACHINE or the other way around).
>
> How do you feel about it (and what would be the preferred path?)

My settings for rootfs are:
${TMPDIR}/deploy/glibc/images/${MACHINE}

so the problem on deploy is not present I think, but I'm not an OE
expert and maybe some staging or other intermediare files can give the
problem you have.

If I'm wrong please ignore my information.

Raffaele

>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
www.opensurf.it


