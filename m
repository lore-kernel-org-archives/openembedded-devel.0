Received: from [80.243.163.21] (helo=smtpgw01.world4you.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <treitmayr@devbase.at>) id 1JYOqt-0001fv-9f
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Mar 2008 17:58:25 +0100
Received: from [85.127.81.17] (helo=[192.168.1.76])
	by smtpgw01.world4you.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.67) (envelope-from <treitmayr@devbase.at>)
	id 1JYOp8-0004W6-EB for openembedded-devel@lists.openembedded.org;
	Sun, 09 Mar 2008 17:56:34 +0100
From: Thomas Reitmayr <treitmayr@devbase.at>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 09 Mar 2008 17:56:34 +0100
Message-Id: <1205081794.8432.15.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
X-SA-Exim-Connect-IP: 80.243.163.21
X-SA-Exim-Mail-From: treitmayr@devbase.at
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Perl modules: Cannot compile due to wrong dependency in Makefile
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
X-List-Received-Date: Sun, 09 Mar 2008 16:58:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
I have a problem building perl modules which have their own recipe and
are built outside of the original perl tree, eg. libwww-perl. It looks
like there is a wrong dependency in the Makefile of such a module. The
Makefile is created from Makefile.PL and includes the following:

[...]
PERL_LIB = /usr/share/perl/5.8
PERL_ARCHLIB = /usr/lib/perl/5.8
[...]
# Where is the Config information that we are using/depend on
CONFIGDEP = $(PERL_ARCHLIB)$(DFSEP)Config.pm $(PERL_INC)$(DFSEP)config.h
[...]
$(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
[...]

As there is no /usr/lib/perl/5.8 on my build host (a Gentoo system), the
reported error in log.do_compile.ZZZ is

make: *** No rule to make target `/usr/lib/perl/5.8/Config.pm', needed
by `Makefile'.  Stop.

The only Config.pm I can find
is /home/nslu2/slugos/tmp/staging/i686-linux/usr/lib/perl/5.8.8/Config.pm, but I am not sure if it would be correct to just set the PERL_LIB to its directory path. I traced back the origin of PERL_LIB and found it is coming from a %Config setting 'archlibexp'. Its contents is read from tmp/staging/i686-linux/usr/lib/perl/5.8.8/Config_heavy-target.pl.

I am not sure whether the contents of the variable is wrong or its
usage, and of course how to fix it.
[My quick fix was to modify the MakeMaker (MM_Unix.pm) to not create
this dependency.]

Has anyone an idea what's wrong?
Regards,
-Thomas

PS: The repository was updated yesterday, the ABI version is '1', host
is an i686 Gentoo system, target is an Arm/BE (NSLU2).



