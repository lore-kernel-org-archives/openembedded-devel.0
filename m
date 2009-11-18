Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NAm1D-0006u9-Qi
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 16:00:31 +0100
Received: (qmail 12119 invoked by uid 1003); 18 Nov 2009 14:59:02 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 18 Nov 2009 14:59:02 -0000
Message-ID: <4B040BB5.20308@balister.org>
Date: Wed, 18 Nov 2009 09:59:01 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911180935590.20580@localhost>
In-Reply-To: <alpine.LFD.2.00.0911180935590.20580@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
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
X-List-Received-Date: Wed, 18 Nov 2009 15:00:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Can you remind me what distro you are using on your build machine? 
Normally, I seem to share your pain, but beagle-demo-image is building 
for me at the moment. (I'm basically wiping tmp and starting over as 
fast as i can atm)

I am building on F11.

Philip

On 11/18/2009 09:40 AM, Robert P. J. Day wrote:
>
>    i'm hoping there's a simple OE solution to this.  i'm still fighting
> trying to bitbake guile-native, and here's the tail end of log file
> that shows the problem:
>
> cat alist.doc arbiters.doc async.doc backtrace.doc boolean.doc
> chars.doc continuations.doc debug.doc deprecation.doc deprecated.doc
> discouraged.doc dynl.doc dynwind.doc environments.doc eq.doc error.doc
> eval.doc evalext.doc extensions.doc feature.doc fluids.doc fports.doc
> futures.doc gc.doc goops.doc gsubr.doc gc-mark.doc gc-segment.doc
> gc-malloc.doc gc-card.doc guardians.doc hash.doc hashtab.doc hooks.doc
> i18n.doc init.doc ioext.doc keywords.doc lang.doc list.doc load.doc
> macros.doc mallocs.doc modules.doc numbers.doc objects.doc objprop.doc
> options.doc pairs.doc ports.doc print.doc procprop.doc procs.doc
> properties.doc random.doc rdelim.doc read.doc root.doc rw.doc
> scmsigs.doc script.doc simpos.doc smob.doc sort.doc srcprop.doc
> stackchk.doc stacks.doc stime.doc strings.doc srfi-4.doc srfi-13.doc
> srfi-14.doc strorder.doc strports.doc struct.doc symbols.doc
> threads.doc throw.doc values.doc variable.doc vectors.doc version.doc
> vports.doc weaks.doc ramap.doc unif.doc dynl.doc filesys.doc posix.doc
> net_db.doc socket.doc regex-posix.doc |
> GUILE="/home/rpjday/oe/angstrom-dev/work/x86_64-linux/guile-native-1.8.7-r0/guile-1.8.7/pre-inst-guile"
> ../scripts/snarf-check-and-output-texi>
> guile-procedures.texi || { rm guile-procedures.texi; false; }
>
>
>    long story short, the fact that it's the pre-installation version of
> guile that's being used there is what's killing the build.  if my
> already-installed native guile were used, apparently there would be no
> problem.  so ... is there an OE setting that just says, no, use the
> guile that's already installed.
>
>    a bit more detail -- i downloaded the 1.8.7 tarball and found the
> following in the top-level README:
>
> "The `GUILE_FOR_BUILD=...' setting is needed because some later steps
> of the build process use Guile itself.  In the non-cross-compiling
> case this is the version of Guile that has just been built.  When
> cross-compiling, you have to set GUILE_FOR_BUILD to tell the build
> where it can find a native version of Guile, to use for these steps."
>
>    i have, in fact, tried that, but it doesn't make a difference.  i'm
> about to follow the logic down to see how one affects that GUILE
> variable at that stage.  but is there a simpler way to just point OE
> at the native guile for this step?
>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


