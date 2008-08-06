Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KQdlo-0000D2-5Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2008 09:49:20 +0200
Received: from 88-110-124-15.dynamic.dsl.as9105.com ([88.110.124.15]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KQdle-0002XN-Ja
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2008 08:49:13 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90808051757s7127b5eo5d289a667d732f69@mail.gmail.com>
References: <1217924342.25732.163.camel@lenovo.internal.reciva.com>
	<g79ade$amq$1@ger.gmane.org>
	<1217938413.24777.148.camel@mill.internal.reciva.com>
	<g79gss$vrd$1@ger.gmane.org>
	<19c1b8a90808051757s7127b5eo5d289a667d732f69@mail.gmail.com>
Date: Wed, 06 Aug 2008 08:49:20 +0100
Message-Id: <1218008960.25732.178.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Subject: Re: openmp in gcc-cross
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
X-List-Received-Date: Wed, 06 Aug 2008 07:49:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The error with gettext is just a straightforward "-lgomp not found" kind
of thing.  Gettext will compile OK with older, non-OpenMP-capable
compilers: it checks for the -fopenmp flag during configure, but it
expects (not unreasonably) that if you have an OpenMP capable compiler
then you will also have the right libraries available.

For people who don't want OpenMP I think the right thing is to have a
global "USE_OPENMP" variable to turn off OpenMP support at the package
level.  For most autotools-using packages this is going to mean adding
"--disable-openmp" to EXTRA_OECONF.

You're right that OpenMP might indeed be overkill on some/most embedded
systems, but embedded multi-threading is by no means unheard of and I
guess it will become more popular as CPUs like the Cortex-A9 and newer
Pentiums start to show up in these systems.

I verified that libgomp does compile OK with gcc 4.2.2, so I guess I'll
go ahead and re-enable it for that version at least.

p.

On Tue, 2008-08-05 at 17:57 -0700, Khem Raj wrote:
> I also saw the error long back on arm I dont remember the error
> anymore. This was with gcc 4.2.1 or some such. You can enable it may
> be it builds now its been long. Open MP on an embedded system might be
> overkill. What is the error you are getting ? Can gettext build
> without libgomp. How will it compile with older compilers ?
> 
> Thanks
> 
> -Khem
> 
> On Tue, Aug 5, 2008 at 5:26 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > Phil Blundell wrote:
> >>
> >> On Tue, 2008-08-05 at 12:35 +0200, Koen Kooi wrote:
> >>>
> >>> It broke builds for some people (but not all).
> >>
> >> What was the breakage?  It seems like it would be a better idea to fix
> >> that than just to disable it.
> >
> > I wasn't one of the people seeing the breakage, so I'll leave it to the
> > people that reported to respond.
> >
> > regards,
> >
> > Koen
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



