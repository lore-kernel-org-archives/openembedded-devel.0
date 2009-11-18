Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NAliw-0002DD-N6
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 15:41:37 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NAlhb-0004ag-K6 for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 09:40:11 -0500
Date: Wed, 18 Nov 2009 09:40:08 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911180935590.20580@localhost>
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
Subject: building versus just using native guile?
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
X-List-Received-Date: Wed, 18 Nov 2009 14:41:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm hoping there's a simple OE solution to this.  i'm still fighting
trying to bitbake guile-native, and here's the tail end of log file
that shows the problem:

cat alist.doc arbiters.doc async.doc backtrace.doc boolean.doc
chars.doc continuations.doc debug.doc deprecation.doc deprecated.doc
discouraged.doc dynl.doc dynwind.doc environments.doc eq.doc error.doc
eval.doc evalext.doc extensions.doc feature.doc fluids.doc fports.doc
futures.doc gc.doc goops.doc gsubr.doc gc-mark.doc gc-segment.doc
gc-malloc.doc gc-card.doc guardians.doc hash.doc hashtab.doc hooks.doc
i18n.doc init.doc ioext.doc keywords.doc lang.doc list.doc load.doc
macros.doc mallocs.doc modules.doc numbers.doc objects.doc objprop.doc
options.doc pairs.doc ports.doc print.doc procprop.doc procs.doc
properties.doc random.doc rdelim.doc read.doc root.doc rw.doc
scmsigs.doc script.doc simpos.doc smob.doc sort.doc srcprop.doc
stackchk.doc stacks.doc stime.doc strings.doc srfi-4.doc srfi-13.doc
srfi-14.doc strorder.doc strports.doc struct.doc symbols.doc
threads.doc throw.doc values.doc variable.doc vectors.doc version.doc
vports.doc weaks.doc ramap.doc unif.doc dynl.doc filesys.doc posix.doc
net_db.doc socket.doc regex-posix.doc |
GUILE="/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.7-r0/guile-1.8.7/pre-inst-guile"
../scripts/snarf-check-and-output-texi          >
guile-procedures.texi || { rm guile-procedures.texi; false; }


  long story short, the fact that it's the pre-installation version of
guile that's being used there is what's killing the build.  if my
already-installed native guile were used, apparently there would be no
problem.  so ... is there an OE setting that just says, no, use the
guile that's already installed.

  a bit more detail -- i downloaded the 1.8.7 tarball and found the
following in the top-level README:

"The `GUILE_FOR_BUILD=...' setting is needed because some later steps
of the build process use Guile itself.  In the non-cross-compiling
case this is the version of Guile that has just been built.  When
cross-compiling, you have to set GUILE_FOR_BUILD to tell the build
where it can find a native version of Guile, to use for these steps."

  i have, in fact, tried that, but it doesn't make a difference.  i'm
about to follow the logic down to see how one affects that GUILE
variable at that stage.  but is there a simpler way to just point OE
at the native guile for this step?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


