Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OpfBE-0004rW-JF
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 12:32:05 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o7TAVU7G024554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 29 Aug 2010 12:31:31 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OpfAg-0006pG-AA; Sun, 29 Aug 2010 12:31:30 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4C79C7C4.1050304@mwester.net>
Date: Sun, 29 Aug 2010 12:31:30 +0200
In-Reply-To: <4C79C7C4.1050304@mwester.net> (Mike Westerhof's message of "Sat, 
	28 Aug 2010 21:36:52 -0500")
Message-ID: <ly1v9h7lrx.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ncurses 5.7 doesn't build libtermcap anymore?
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
X-List-Received-Date: Sun, 29 Aug 2010 10:32:05 -0000
Content-Type: text/plain; charset=us-ascii

Mike Westerhof <mike@mwester.net> writes:

> I've been working on some recent problems that popped up in the SlugOS
> feeds; one that appeared recently is that asterisk no longer builds;
> configure complains about -ltermcap,

When I remembed an irc discussion, asterisk (tested on version 1.6.0.28)
is able to use -ltinfo from recent ncurses.  afair, the explicit

  --with-termcap=${STAGING_EXECPREFIXDIR}

must be removed from the recipe too.


> and investigation shows that indeed, libtermcap is missing.  

libtermcap is dead and unmaintained since 1996 (!).  Recent software
should be able to use -ltinfo instead of -ltermcap.


> It seems that the new ncurses recipe (5.7) no longer builds it for
> some reason.  I think the same problem is the root cause for the
> failure of js to build as well.

Recent js-1.8.0rc1 brings in the -ltermcap by

| ifdef JS_READLINE
| ...
| PROG_LIBS += -lreadline -ltermcap

libreadline itself should be linked against the correct termcap library
(ltinfo or ltermcap) so that this '-ltermcap' can be removed.

Accordingly Makefile.ref, the '-DUSE_TERMCAP' option requires manual
addition of '-ltermcap' to LDFLAGS (which is btw usually the wrong
variable for extra libraries).

So, when somebody revives the js recipe (last package specific changes
were in Feb 2007) and sets '-DUSE_TERMCAP', (s)he should link against
'-ltinfo'.


> So I guess the first question is if this is intentional or not?  If it
> is, then I guess I'll modify the asterisk recipe to remove the
> dependency and submit that patch.  Otherwise, well, I guess I could
> attempt to debug and fix the ncurses recipe, but it looks a bit, um,
> "non-trivial" so any advice would be appreciated.

We could provide like Fedora a linkerscript 'libtermcap.so' with

| INPUT(-ltinfo)

content.  But I am not sure whether -ltinfo is really 100% compatible
to -ltermcap and if such a workaround would break autodetection which
checks whether termcap or tinfo is to be used.


Enrico


