Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PzUiQ-0008NN-DU
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 14:55:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 7F16DA472A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 13:53:31 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Yz+w7CR+st8c
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 13:53:30 +0000 (GMT)
Received: from xora-eee (188-220-38-49.zone11.bethere.co.uk [188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 708CCA4622
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 13:53:30 +0000 (GMT)
Received: by xora-eee (Postfix, from userid 1000)
	id B0F3680282; Tue, 15 Mar 2011 13:53:30 +0000 (GMT)
Date: Tue, 15 Mar 2011 13:53:30 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110315135330.GA1913@xora-eee.xora.org.uk>
References: <1300185619.3759.155.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1300185619.3759.155.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: removal of `angstrom-2008.1` in dev and needed updates
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
X-List-Received-Date: Tue, 15 Mar 2011 13:55:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

For the angstrom self references we will fix these in next few days.

For the other distros using this file, I would suggest if they dont get
fixed within 14 days they are scheduled for removal as probably they are
dead distros anyway.

Graeme

On Tue, Mar 15, 2011 at 11:40:19AM +0100, Paul Menzel wrote:
> Dear OE folks,
> 
> 
> in case you are using `angstrom-2008.1` and are getting the following
> error message
> 
>         $ bitbake -k some-recipe
>         ERROR: Error parsing /home/paul/oe/openembedded/recipes/images/uml-image.bb: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass
>         ERROR: Command execution failed: Exited with 1
> 
> it means that `conf/distro/angstrom-2008.1.conf` was removed in [1].
> 
>         commit 67a7c91a4eeed0a5b48f99d98ec9bb54ba6ea120
>         Author: Koen Kooi <koen@openembedded.org>
>         Date:   Wed Mar 9 14:51:10 2011 +0100
>         
>             angstrom 2008.1: remove from .dev
>             
>             This will be maintained in the 2011.03-maintenance branch
>             
>             Signed-off-by: Koen Kooi <koen@openembedded.org>
> 
> It looks like some other configurations files and comments still refer
> to `angstrom-2008.1` though and probably need an update.
> 
>         conf/distro/amsdelta-oe.conf:require conf/distro/angstrom-2008.1.conf
>         conf/distro/angstrom-2010.x.conf:# If you want something stable *right now*, use angstrom-2008.1
>         conf/distro/angstrom-2010.x.conf:# Again, in doubt, use DISTRO="angstrom-2008.1"
>         conf/distro/foonas.conf:require conf/distro/angstrom-2008.1.conf
>         conf/distro/iphone-compat.conf:require conf/distro/angstrom-2008.1.conf
>         conf/distro/nylon.conf:require conf/distro/angstrom-2008.1.conf
>         conf/local.conf.sample:# DISTRO = "angstrom-2008.1"
>         contrib/angstrom/local.conf:DISTRO = "angstrom-2008.1"
>         contrib/buildbot/scripts/full-oe-autobuild:     echo 'DISTRO = "angstrom-2008.1"' >> "$CONFFILE"
>         contrib/testing/testbuilder/README:bitbake (e.g. angstrom-2008.1/qemuarm/console-image).
>         contrib/testing/testbuilder/README:    ./testbuilder -D angstrom-2008.1 -M qemuarm console-image
>         contrib/testing/testbuilder/README:    ./testbuilder -D angstrom-2008.1 -M qemuarm -S
>         contrib/testing/testbuilder/testbuilder.d/testing.conf.sample:DISTROS="angstrom-2008.1 angstrom-2010.x"
>         docs/usermanual/chapters/getting_oe.xml:DISTRO = "angstrom-2008.1"
>         recipes/linux/linux-2.6.29/cm-x270/0004-add-build-script.patch:+CROSS_COMPILER_PATH=`cd /build/oe/oe-stable/build/angstrom-2008.1/tmp/cross/armv5te/bin; pwd`
> 
> 
> Thanks,
> 
> Paul
> 
> 
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=67a7c91a4eeed0a5b48f99d98ec9bb54ba6ea120



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



