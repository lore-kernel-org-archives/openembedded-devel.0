Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OYt27-0007nY-E1
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 05:53:20 +0200
Received: by iwn34 with SMTP id 34so6688038iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 20:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=631DXFEdaRB0Qb/ZcpaY/nZgLQjlyYPy7kQzwR/VRRg=;
	b=I5R7x9UlBdzll+3e5IYsjc8y0E5Xnwmofe4qrdzU+9n6+Mo+BvH3h7iFwPUSizl+6i
	sHmzngPwkVhuDeZGQllDKD+Hg0nThSV2Cwd3qyvUHxQLYpAhDftTqCz98jZP3AVoOxPq
	4tWWIswFE4aq2B+MSE31c19EEfVuj/JZdkZgg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=elNvtr5qrS9J06BAFAU2+ZcTTxGIdGQsiGq48EJQKsQawv6Kn4YT85fEiLLWOnIGXg
	U28vfTZ3OFGAi1dFbJKL49fsa7t0PQNqU8M5NtikG+LAN33rStqCv3Lhtp1uhWL0ZiiA
	HzBmXRH06/eBiFUan7/sRM6FconCKBgZcPS7U=
Received: by 10.231.146.136 with SMTP id h8mr17115960ibv.0.1279079590200; Tue, 
	13 Jul 2010 20:53:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.11.12 with HTTP; Tue, 13 Jul 2010 20:52:50 -0700 (PDT)
In-Reply-To: <201007140043.18547.schnitzeltony@gmx.de>
References: <201007140043.18547.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jul 2010 20:52:50 -0700
Message-ID: <AANLkTinpg0fPP-Tw0-pu5hil413KHsOCMJtmyvCVCIvp@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Naming/Version conventions for git/svn recipes
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
X-List-Received-Date: Wed, 14 Jul 2010 03:53:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 13, 2010 at 3:43 PM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
> I did not find this in documentation. What is the preferred convention for PV/PR. Up to now I saw:
>
> Option 1:
> PV = "1.3.8+git${SRCREV}"
> PR = "r0"

if you have select this recipe you have to specify the SRCREV which is git SHA
in the PREFERRED_VERSION which is kind of long and annoying.

>
> Option 2:
> PV = "1.1.0"
> PR = "${INC_PR}.0"
> PR_append = "+git${SRCREV}"
>

which this one you PV is 1.1.0 you can set PV to git also which means
then you can say PREFERRED_VERSION_xxx = "git"

Recipe still gets rebuilt if you bump SRCREV because of
PR_append = "+gitr${SRCPV}"




> Is there a preferred convention?
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


