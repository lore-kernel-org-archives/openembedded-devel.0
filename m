Received: from [194.158.229.90] (helo=smtp-auth-be-05.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1K3OmO-0005ic-02
	for openembedded-devel@openembedded.org; Tue, 03 Jun 2008 07:09:52 +0200
Received: from [192.168.26.12] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140]) (authenticated bits=0)
	by smtp-auth-be-05.sunrise.ch (8.13.1/8.13.5) with ESMTP id
	m5355bed002991; Tue, 3 Jun 2008 07:05:38 +0200
Message-ID: <4844D115.9070209@vollmann.ch>
Date: Tue, 03 Jun 2008 07:05:25 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.14 (X11/20080502)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <g1jlpn$f7f$1@ger.gmane.org>
	<4843CCD6.8070601@vollmann.ch>	<1212404836.5008.16.camel@dax.rpnet.com>
	<48446FB3.8000201@vollmann.ch>
	<1212450339.5008.49.camel@dax.rpnet.com>
In-Reply-To: <1212450339.5008.49.camel@dax.rpnet.com>
Subject: Re: BB_STAMP_POLICY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 03 Jun 2008 05:09:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Tue, 2008-06-03 at 00:09 +0200, Detlef Vollmann wrote:
>> The biggest problem I see are silent breaks, because of changes in
>> some configuration files that are not tracked by dependency checking.
> 
> I not 100% sure what you're getting at here but I'll try and follow this
> to its logical conclusion.
> 
> If you change something in some recipe, say EXTRA_OECONF you then need
> to force a rebuild of the recipe either by bumping PR, using the --force
> option etc. to make the change take effect. This means package A would
> rebuild and the way BB_STAMP_POLICY full/whitelist works means that
> since A rebuilt, anything depending on A will also rebuild. So this case
> is covered.
Correct, this is the way as it should be.
But this way it's something manual, and that will get forgotten at
some time.  In our environment we sometimes build different projects
at the same time (using different chroot environments for that).
So if you want to change something for a project, you do the change
and start the build, and then you go to some other work and come
back after 20 minutes to do a short test and then publish the release
for the testers.  In such an environment, things like a forced build
easily get forgotten.
In our current build system, for switches between NPTL and linuxthreads
we have to exchange toolchain manually, and we had more than one case
where the image didn't contain the version that we expected, leading
to nasty, hard to track down errors.

> Perhaps you mean that you change some variable in say bitbake.conf and
> you then don't know which recipes it may have an effect on. You
> therefore don't know which to rebuild?
No, that's not the real problem.

> Bitbake can't know whether a given change in some conf file changes a
> given package. What it can in theory tell is whether the some
> conf/class/bb/inc file has changed or not since a given package was
> built. We already have this cache logic in place but it currently has no
> influence on stamp validity decisions. It would be possible to wire that
> into the stamp logic so if you touch bitbake.conf anything which could
> be influenced by that file (everything) would rebuild. If you touch a
> class file like kernel.bbclass, just the kernel would rebuild (and
> anything depending on it). Any change to local.conf would rebuild
> everything.
That would be the same as rebuilding a whole project because the
Makefile has changed.  I know people who do that, but I don't like this
approach.

> For comparison note that your USE variables just cover the EXTRA_OECONF
> variable. There are hundreds of other variables which can influence the
> build and trying to build a definitive list of them would be difficult.
> What makes EXTRA_OECONF special?
Sorry, but it seems that I didn't make myself very clear.
What I proposed is a naming scheme like:
USE_package_VARIABLE
where 'USE' is the marker for bitbake that this is something to track,
'package' is the package for which this needs to be tracked, and
'VARIABLE' is the name of the variable as it is used in the package's
recipe.

   Detlef


