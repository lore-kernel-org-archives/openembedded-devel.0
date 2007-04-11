Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HbYga-0005Cj-2w
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 11:00:16 +0200
Received: by ug-out-1314.google.com with SMTP id e2so65919ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2007 02:00:15 -0700 (PDT)
Received: by 10.67.98.9 with SMTP id a9mr302368ugm.1176282015787;
	Wed, 11 Apr 2007 02:00:15 -0700 (PDT)
Received: by 10.66.251.2 with HTTP; Wed, 11 Apr 2007 02:00:15 -0700 (PDT)
Message-ID: <c384c5ea0704110200q43512f77gaa3092f081b18d91@mail.gmail.com>
Date: Wed, 11 Apr 2007 11:00:15 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1176280755.5843.3.camel@localhost.localdomain>
MIME-Version: 1.0
References: <c384c5ea0704110132s27b28fcifba5fc2db437e167@mail.gmail.com>
	<1176280755.5843.3.camel@localhost.localdomain>
Subject: Re: deterministic OE builds - multiple providers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2007 09:00:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard,

On 4/11/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Wed, 2007-04-11 at 10:32 +0200, Leon Woestenberg wrote:
> > ...
> > In tracking down a host dependency I found that in cases where
> > multiple providers are present, the behaviour is undeterministic, i.e.
> > a provider is picked more or less randomly.
> > ...
>
> Which bitbake version is this with? Later versions should have more
> deterministic handling that older versions.
>
URL: svn://svn.berlios.de/bitbake/branches/bitbake-1.8
Revision: 812

I tried multiple, also 1.6, same issues remain.

Some issues:

My private bitbake collection has customized copies of upstream .bb.
Although my private bitbake collection has a higher priority, I
noticed bitbake "randomly" selecting either the upstream or local
collection for packages which have multiple providers left.

In one case (ixp4xx-kernel) if I run "bitbake ixp4xx-kernel -c patch",
then "bitbake ixp4xx-kernel" it selects my private .bb for the first
bitbake, and then selects the upstream .bb for the second bitbake
build.

One machine notes about multiple providers for kernel-image-, whereas
the other does not.

They run the exact same copies of the upstream sources, local
collection and the  bitbake tool.

Regards,
-- 
Leon


