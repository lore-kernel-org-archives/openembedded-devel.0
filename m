Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9Yow-0000zI-Jw
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 09:47:25 +0200
Received: by iwn5 with SMTP id 5so480077iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=46cWNF+G/naEbK1TYjQKgzQRmlklOKZu+AD+fHK4jIE=;
	b=T0sRxlQN2h3kNYfAbB70PMZ33ChfYsaksgtMTWpfp6Gj/mlFOK9xUlrx6jElYXZmli
	rilyIRs0C85Opq8qc+2lmBcnJgCOW0sqYqn+kSmv2P/LGizBeZHRxFBZBNmytfxjXhGY
	0vvGs3h9Hnkmz9SZuYeIbJjHxjyP/PxWCn9jM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mnfAyUyCaqUstM4UecWvDZiV0ZECwXCTj9G35ZdCa/WRBY3pDJG9fv0kNuJF5svTM2
	ASjiIkFYyg1Nce9ooozQ2gMGp+nJxLgSrDOe0G3o6JRODXvhPXbFwctj0+llJbl2/KXa
	wrNNhuikq19xXdMNKvTc0jQtGAUaCMs+E2L2I=
MIME-Version: 1.0
Received: by 10.231.79.77 with SMTP id o13mr3476465ibk.36.1287819996086; Sat,
	23 Oct 2010 00:46:36 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 23 Oct 2010 00:46:36 -0700 (PDT)
In-Reply-To: <i9s8nh$e2$1@dough.gmane.org>
References: <i9s8nh$e2$1@dough.gmane.org>
Date: Sat, 23 Oct 2010 09:46:36 +0200
Message-ID: <AANLkTi=NBNEgPe5j3vb74KTmGJALSmNqbPx_Bg-kKxMu@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] using kernel.bbclass rename hook for external modules as well
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
X-List-Received-Date: Sat, 23 Oct 2010 07:47:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/22 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Currently kernel.bbclass splits and renames modules into
> kernel-module-<foo>, but module.bbclass doesn't. What's your opinion on
> making modules.bbclass follow the same logic for consistency?
> To make upgrade paths work the 'kernel-modules' metapackage would be
> ${PN} for external modules.

The idea looks good to be, but can you explain the last sentence?
I would expect the recipes that use these modules get changed too and
with a PR bump they will drag in the new module with the new name, and
not too much additional work needed.
What I am missing?

BTW did a quick grep for "inherit module" (which also matches
module-base), matches 90 recipes (some of which are probably (nearly)
outdated as they are mainline; eg. pvrusb2)
And of course there are some recipes with older versions that are
probably not too interesting to keep)

Frans


