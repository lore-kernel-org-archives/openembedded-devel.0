Received: from [194.158.229.24] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IVQvS-0003BU-Jq
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 14:02:34 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB80E3003CCFAD for openembedded-devel@openembedded.org;
	Wed, 12 Sep 2007 13:59:26 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l8CC2Vn10469;
	Wed, 12 Sep 2007 14:02:31 +0200
Sender: dv@vollmann.ch
Message-ID: <46E7D557.FDC1B77@vollmann.ch>
Date: Wed, 12 Sep 2007 14:02:31 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.21 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <HOECLKEKOHLAMMGDLLBHGENPMDAA.skoroneos@digital-opsis.com>
	<46E79AFE.9040304@xora.org.uk>
Subject: Binary packages (was: Task-base is big :( )
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
X-List-Received-Date: Wed, 12 Sep 2007 12:02:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

This thread touches two very interesting, but not directly
related issues, so I decided to split here.

Graeme Gregory wrote:
> I personally think this discussion is a clear example of why Koen's
> work on packaged staging needs to be finished.
> 
> Just think how much faster you could build if all the system did was
> download and install these dependencies rather than build them
> from scratch.
Exactly.

For our current project, we have a build system based on
Gentoo's portage, and we're currently planning to switch to
OpenEmbedded.
We want to be able to build everything ourselves from scratch,
and we do that.  But we don't want to do that each time we
build an (internal) release (we do sometimes several releases
a week and a full build including toolchain takes about
two hours).
So in our current build system, we just use portage's --usepkg,
and if the package we want to build is already built and in
our repository, we just unpack that (unfortunately this doesn't
always work as expected, but that's a different story).
For OpenEmbedded, I looked at options how I could do something
similar, and I came up with some ideas.

First, we need to care for everything a recipe does.
For the staging part I hoped that packaged staging solves the
problem (and from the discussion in
http://bugs.openembedded.org/show_bug.cgi?id=354
I thought it might already work, but I didn't test it yet).
But there are other things (like ipkg-make-index) and I don't
know what to do about those.  Possibly just not allowing
binary packages for such recipes.

Then we have the problem that most recipes build more than one ipk,
so we have to put all of them into one combined file, probably
an ipk package that just contains other ipk packages.

So I thought about two possible solutions to get binary packages:
 one - to add an option like '--usepkg' to bitbake and let bitbake
       take care of everything.
 two - putting the required actions into the recipes themselves
       (possibly by using some bbclasses).
       http://bugs.openembedded.org/show_bug.cgi?id=2948
       seems to implement this approach at least partly, but
       I don't understand that fully yet and I still have to
       test it to get a better feeling for it.

 Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


