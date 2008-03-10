Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JYqNp-0007N3-6h
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Mar 2008 23:22:15 +0100
Received: by an-out-0708.google.com with SMTP id b33so484314ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2008 15:20:17 -0700 (PDT)
Received: by 10.100.38.3 with SMTP id l3mr2233032anl.14.1205187616919;
	Mon, 10 Mar 2008 15:20:16 -0700 (PDT)
Received: from ?10.39.211.130? ( [128.252.210.40])
	by mx.google.com with ESMTPS id 9sm14015960agc.33.2008.03.10.15.20.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Mar 2008 15:20:16 -0700 (PDT)
Message-ID: <47D5C22B.4090308@gmail.com>
Date: Mon, 10 Mar 2008 18:20:11 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1205081794.8432.15.camel@localhost>
In-Reply-To: <1205081794.8432.15.camel@localhost>
X-SA-Exim-Connect-IP: 209.85.132.247
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Perl modules: Cannot compile due to wrong dependency in Makefile
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
X-List-Received-Date: Mon, 10 Mar 2008 22:22:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2008 11:56 AM, Thomas Reitmayr wrote:
> Hi,
> I have a problem building perl modules which have their own recipe and
> are built outside of the original perl tree, eg. libwww-perl. It looks
> like there is a wrong dependency in the Makefile of such a module. The
> Makefile is created from Makefile.PL and includes the following:

These are definitely overlooked host path pollution.

> 
> [...]
> PERL_LIB = /usr/share/perl/5.8
> PERL_ARCHLIB = /usr/lib/perl/5.8
> [...]
> # Where is the Config information that we are using/depend on
> CONFIGDEP = $(PERL_ARCHLIB)$(DFSEP)Config.pm $(PERL_INC)$(DFSEP)config.h
> [...]
> $(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
> 	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
> [...]
> 
> As there is no /usr/lib/perl/5.8 on my build host (a Gentoo system), the
> reported error in log.do_compile.ZZZ is
> 
> make: *** No rule to make target `/usr/lib/perl/5.8/Config.pm', needed
> by `Makefile'.  Stop.
> 
> The only Config.pm I can find
> is /home/nslu2/slugos/tmp/staging/i686-linux/usr/lib/perl/5.8.8/Config.pm, but I am not sure if it would be correct to just set the PERL_LIB to its directory path. I traced back the origin of PERL_LIB and found it is coming from a %Config setting 'archlibexp'. Its contents is read from tmp/staging/i686-linux/usr/lib/perl/5.8.8/Config_heavy-target.pl.
> 
> I am not sure whether the contents of the variable is wrong or its
> usage, and of course how to fix it.
> [My quick fix was to modify the MakeMaker (MM_Unix.pm) to not create
> this dependency.]
> 
> Has anyone an idea what's wrong?

The common fix for hard coded path in configure or Makefile is to patch 
those with the appropriate ${STAGINGDIR}.

Regards
Gordon


