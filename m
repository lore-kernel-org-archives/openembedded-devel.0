Received: from [64.233.162.226] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1HlTbE-0008Pc-30
	for openembedded-devel@openembedded.org; Tue, 08 May 2007 19:35:44 +0200
Received: by nz-out-0506.google.com with SMTP id j2so2114287nzf
	for <openembedded-devel@openembedded.org>;
	Tue, 08 May 2007 10:35:14 -0700 (PDT)
Received: by 10.114.94.1 with SMTP id r1mr2686554wab.1178645714320;
	Tue, 08 May 2007 10:35:14 -0700 (PDT)
Received: by 10.115.92.3 with HTTP; Tue, 8 May 2007 10:35:14 -0700 (PDT)
Message-ID: <432beae0705081035i1b017e3eg652644541f257bbf@mail.gmail.com>
Date: Tue, 8 May 2007 10:35:14 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1178627405.6061.17.camel@localhost.localdomain>
MIME-Version: 1.0
References: <35653307.20070503154732@gmail.com>
	<1178198199.6312.30.camel@localhost.localdomain>
	<432beae0705062129i11f69731n1d12777f46a83316@mail.gmail.com>
	<1178627405.6061.17.camel@localhost.localdomain>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: [ALERT] Security vulnerability with recent OE bitbake.conf changes
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
X-List-Received-Date: Tue, 08 May 2007 17:35:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 5/8/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Sun, 2007-05-06 at 21:29 -0700, Justin Patrin wrote:
> > Ummm...where? I tried that in my local.conf and it did nothing. I've
> > also grepped for PATCH_RESOLVER in both bitbake and oe and found
> > nothing.
>
> Sorry, it should be PATCHRESOLVE = "noop", my memory is playing tricks.

Ah there we go, thanks a lot. I tried grepping for gnome-terminal and
it hadn't lead me there.

>
> > Please, let's remove the gnome-terminal default, it makes no sense to
> > assume that the lowest common denominator is running bitbake from X...
>
> "noop" should be the default. There is no good argument for which
> terminal UI should/shouldn't be the default. Ideally I guess it would
> autoselect unless the user specifies, I'll give that some thought. A
> warning from sanity.bbclass about a missing command might be good too...
>

It appears not to be, however...:-|

-- 
Justin Patrin


