Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hgn2b-0007na-LS
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Apr 2007 21:20:39 +0200
Received: by nz-out-0506.google.com with SMTP id m22so379136nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2007 12:11:52 -0700 (PDT)
Received: by 10.114.25.3 with SMTP id 3mr293811way.1177528312055;
	Wed, 25 Apr 2007 12:11:52 -0700 (PDT)
Received: by 10.115.92.7 with HTTP; Wed, 25 Apr 2007 12:11:52 -0700 (PDT)
Message-ID: <432beae0704251211g4aa73e46u914b9593219b940c@mail.gmail.com>
Date: Wed, 25 Apr 2007 12:11:52 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <462DC919.4050300@a1.net>
MIME-Version: 1.0
References: <200704192334.00169.patrick.steiner@a1.net>
	<432beae0704191642m79afc9aaia85466716ee744af@mail.gmail.com>
	<462853A9.6020309@a1.net>
	<1177061454.5842.7.camel@localhost.localdomain>
	<462DC919.4050300@a1.net>
Subject: Re: strange build errors after (Checking Package:...)
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
X-List-Received-Date: Wed, 25 Apr 2007 19:20:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/24/07, Patrick Steiner <patrick.steiner@a1.net> wrote:
> Richard Purdie wrote:
> > On Fri, 2007-04-20 at 07:46 +0200, Patrick Steiner wrote:
> >> Justin Patrin wrote:
> >>> On 4/19/07, Patrick Steiner <patrick.steiner@a1.net> wrote:
> >>> Sounds to me like a missing native dep on whatever package scanelf comes from
> >> hi i think this was the problem i did bitbake pax-utils-native now it works
> >>
> >> i think this should be added as default dependency, also the sha256sum
> >> stuff...
> >
> > It should be a dependency by default. Was this with bitbake 1.8.0? Does
> > 1.8.1 from svn work any better?
> >
> > To check, look at the task-depends.dot file saved by "bitbake something
> > -g" and see if pax-utils-native is mentioned as a dependency for
> > do_package tasks...
> >
> > I just checked here and it seems to be working for me with 1.8.1.
> >
> > Cheers,
> >
> > Richard
> i have tested it now with the bitbake svn version (1.8.0 branch) now it
> also works.
>
> so this could be an bug in 1.8.0 stable...
>

1.6 branch does the same thing. Looks like this dependency only works
in 1.8 svn. Of course 1.8 svn has problems with SRCDATE and so it not
usable either.

-- 
Justin Patrin


