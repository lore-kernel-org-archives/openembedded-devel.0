Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NAmOR-0007Kv-GV
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 16:24:30 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NAmN4-0008US-AP for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:23:02 -0500
Date: Wed, 18 Nov 2009 10:22:48 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B040BB5.20308@balister.org>
Message-ID: <alpine.LFD.2.00.0911181018010.22422@localhost>
References: <alpine.LFD.2.00.0911180935590.20580@localhost>
	<4B040BB5.20308@balister.org>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building versus just using native guile?
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
X-List-Received-Date: Wed, 18 Nov 2009 15:24:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 18 Nov 2009, Philip Balister wrote:

> Can you remind me what distro you are using on your build machine?
> Normally, I seem to share your pain, but beagle-demo-image is
> building for me at the moment. (I'm basically wiping tmp and
> starting over as fast as i can atm)
>
> I am building on F11.
>
> Philip
>
> On 11/18/2009 09:40 AM, Robert P. J. Day wrote:
> >
> >    i'm hoping there's a simple OE solution to this.  i'm still fighting
> > trying to bitbake guile-native, and here's the tail end of log file
> > that shows the problem:
> >
> > cat alist.doc arbiters.doc async.doc backtrace.doc boolean.doc
> > chars.doc continuations.doc debug.doc deprecation.doc deprecated.doc
> > discouraged.doc dynl.doc dynwind.doc environments.doc eq.doc error.doc
> > eval.doc evalext.doc extensions.doc feature.doc fluids.doc fports.doc
> > futures.doc gc.doc goops.doc gsubr.doc gc-mark.doc gc-segment.doc
> > gc-malloc.doc gc-card.doc guardians.doc hash.doc hashtab.doc hooks.doc
> > i18n.doc init.doc ioext.doc keywords.doc lang.doc list.doc load.doc
> > macros.doc mallocs.doc modules.doc numbers.doc objects.doc objprop.doc
> > options.doc pairs.doc ports.doc print.doc procprop.doc procs.doc
> > properties.doc random.doc rdelim.doc read.doc root.doc rw.doc
> > scmsigs.doc script.doc simpos.doc smob.doc sort.doc srcprop.doc
> > stackchk.doc stacks.doc stime.doc strings.doc srfi-4.doc srfi-13.doc
> > srfi-14.doc strorder.doc strports.doc struct.doc symbols.doc
> > threads.doc throw.doc values.doc variable.doc vectors.doc version.doc
> > vports.doc weaks.doc ramap.doc unif.doc dynl.doc filesys.doc posix.doc
> > net_db.doc socket.doc regex-posix.doc |
> > GUILE="/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.7-r0/guile-1.8.7/pre-inst-guile"
> > ../scripts/snarf-check-and-output-texi>
> > guile-procedures.texi || { rm guile-procedures.texi; false; }

  i'm effectively on F12 (rawhide updated F11), about to re-install
fresh with F12.  not that long ago, adrian alonso(?) mentioned that,
when his build of guile-native failed, he *manually* ran that failing
step, substituting a reference to the already-installed guile on his
system, and that seemed to work.

  and when i pull open the guile 1.8.7 tarball (i was testing to see
if a newer version would help), down in the libguile directory, in
Makefile.am, there's this snippet that clearly represents that command
that's failing:

=====

alldotdocfiles    = $(DOT_DOC_FILES) $(EXTRA_DOT_DOC_FILES)
snarf2checkedtexi = GUILE="$(GUILE_FOR_BUILD)" $(top_srcdir)/scripts/snarf-check-and-output-texi
dotdoc2texi       = cat $(alldotdocfiles) | $(snarf2checkedtexi)

=====

  you can see how those Makefile variables are set up to construct
that massive "cat" command that eventually fails.  and how the GUILE
variable is being set to the constructed version (pre-inst-guile)
rather than to the native version, even after i set the
GUILE_FOR_BUILD env variable.  so all i can deduce is that that env
var isn't percolating down to the libguile build step.

  so i'm still confused.  and i'm guessing that my f12-ishness on this
system is what's causing the difference in our builds.

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


