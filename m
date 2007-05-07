Received: from [64.233.162.232] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hkur5-0005rD-Bp
	for openembedded-devel@openembedded.org; Mon, 07 May 2007 06:29:47 +0200
Received: by nz-out-0506.google.com with SMTP id j2so1480340nzf
	for <openembedded-devel@openembedded.org>;
	Sun, 06 May 2007 21:29:27 -0700 (PDT)
Received: by 10.114.153.18 with SMTP id a18mr1975761wae.1178512166901;
	Sun, 06 May 2007 21:29:26 -0700 (PDT)
Received: by 10.115.92.3 with HTTP; Sun, 6 May 2007 21:29:26 -0700 (PDT)
Message-ID: <432beae0705062129i11f69731n1d12777f46a83316@mail.gmail.com>
Date: Sun, 6 May 2007 21:29:26 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1178198199.6312.30.camel@localhost.localdomain>
MIME-Version: 1.0
References: <35653307.20070503154732@gmail.com>
	<1178198199.6312.30.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: [ALERT] Security vulnerability with recent OE bitbake.conf changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2007 04:29:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 5/3/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Thu, 2007-05-03 at 15:47 +0300, Paul Sokolovsky wrote:
> > Hello openembedded-devel,
> >
> > A commit made some time ago,
> >
> > http://lists.linuxtogo.org/pipermail/openembedded-commits/2007-April/004912.html
> >
> > introduced a hole which may lead to unnoticed security vulnerabilities
> > slipping into the packages/images produced. Specifically, it defines a
> > random application of a random suite to be used for resolving patching
> > conflicts/failures. If you don't happen to have that random tool,
> > patching failure will be silently swallowed, leading to any adverse
> > effects imaginable - from compile failure to the mentioned security
> > vulnerabilities.
>
> Patch failure should not be silently swallowed, the builds should abort.
> If they don't, we need to fix that underlying problem.
>
> FWIW, your first solution using SHELLRCCMD won't actually work due to
> the way IO redirection is done in recent bitbake.
>
> Your second solution of adding the DEPENDS is impractical due to the
> amount of -native packages it would require.
>
> So we need to find the real problem and fix that, probably somewhere in
> patch.bbclass an error code isn't being propagated at a guess.
>
> I will also hint at the use of PATCH_RESOLVER = "noop" which means the
> user gets the old behaviour of patch failure aborts the build with no
> help from any resolver. It should have always been the default but
> wasn't. I'm not sure what the current default is but we can change it to
> that if its not.
>

Ummm...where? I tried that in my local.conf and it did nothing. I've
also grepped for PATCH_RESOLVER in both bitbake and oe and found
nothing.

Please, let's remove the gnome-terminal default, it makes no sense to
assume that the lowest common denominator is running bitbake from X...

-- 
Justin Patrin


