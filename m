Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1Mm1Gh-0000mr-GC
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 10:14:10 +0200
Received: by qyk34 with SMTP id 34so734653qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 01:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Kd1w/pdpkTMGA9vNC2tKM2lEo0DwoY4DE2DM9SX8h/g=;
	b=jF+LrsBJfRpZ/xohih5IkRQW/5qwI8diPITg5oGvLkgTJ1hKJPmxvPNRMRY6Fh4pri
	5IWFgg9s4iAYseF7UUFtD4M46pZXQSNSD20dlvmF3x1pgycXm8kTTivjuq7jAZV1bC8l
	gl5rGXkpjJihLao9LNdua3uDZ2Fcp+xDPP5fI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=lQCuSH4Qs7v54icSTtiLCLNb7BCpsy3ezqj0alU20XzbYdwtLgBevmrWCl6CUdNmgv
	xiGuK/kU0YX8xhEV7rmb4LwrrxXw/Goog1S7VZAApBENvnHuZVx7au0T9WzXA31BFBmO
	gyUVEz/Oun89D3lENfSSLmHYejeOXHTpn/xp4=
Received: by 10.224.58.201 with SMTP id i9mr2251111qah.8.1252656818906;
	Fri, 11 Sep 2009 01:13:38 -0700 (PDT)
Received: from localhost.minsk.epam.com (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 6sm723250qwd.43.2009.09.11.01.13.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 11 Sep 2009 01:13:37 -0700 (PDT)
Date: Fri, 11 Sep 2009 11:13:03 +0300
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090911081303.GA18964@localhost.minsk.epam.com>
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>
	<4A93BC84.7070106@gmail.com>
	<91283b620908250454n428bdc4ek2cd4df45690e47c0@mail.gmail.com>
	<200908251609.25008.holger+oe@freyther.de>
	<91283b620909102232me9db8dck490abb53a8ba8fff@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <91283b620909102232me9db8dck490abb53a8ba8fff@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.221.196
X-SA-Exim-Mail-From: ihar.hrachyshka@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt problems
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
X-List-Received-Date: Fri, 11 Sep 2009 08:14:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2009 at 06:32:48AM +0100, Stuart Gray wrote:
> Right. I took your advice and recoded my bb file. As suggested it uses the
> standard do_compile and it is only the do_unpack that I have overridden. I
> have attached my latest .inc file.
> 
> I have posted my latest problem that is very close to working, but I have
> found libraries that are not installed. The debug output basically states
> that it cannot find directory /usr/lib/qtopia. The output is shown below.
> 
> NOTE: Running task 2663 of 3643 (ID: 117, /home/stuart/overo-oe/org.
> openembedded.dev/recipes/x-load/x-load_git.bb, do_compile)
> NOTE: Running task 2664 of 3643 (ID: 718,
> /home/stuart/overo-oe/user.collection/recipes/qt4/qt4-embedded_4.5.2.bb,
> do_populate_staging)
> NOTE: Running task 2665 of 3643 (ID: 720,
> /home/stuart/overo-oe/user.collection/recipes/qt4/qt4-embedded_4.5.2.bb,
> do_package)
> NOTE: The path does not
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/accessible/
> NOTE: The path does not
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/codecs/
> NOTE: The path does not
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/graphicssystems/
> NOTE: The path does not
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/inputmethods/
> NOTE: The path does not
> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/styles/
> NOTE: Running task 2666 of 3643 (ID: 118,
> /home/stuart/overo-oe/org.openembedded.dev/recipes/x-load/x-load_git.bb,
> do_install)
> NOTE: Running task 2673 of 3643 (ID: 9,
> /home/stuart/overo-oe/user.collection/recipes/images/omap3-console-image.bb,
> do_populate_staging)
> 
> Can  you please tell me how I instruct bitbake to install these directories.
> 
> Regards,
> Stuart
> 
> 
> 
> 2009/8/25 Holger Hans Peter Freyther
> <holger+oe@freyther.de<holger%2Boe@freyther.de>
> >
> 
> > On Tuesday 25 August 2009 13:54:26 Stuart Gray wrote:
> > > Hi we have just solved the problem
> > .
> > No, you have not "solved" the problem. Your next problems will be uic, moc,
> > etc. not working...
> >
> >
> > >do_compile() {
> > >   oenote Running our qmake work dir is $WORKING_DIR
> > >    cd ${WORKING_DIR}
> > >   qmake2 ${WORKING_DIR}/dockamp.pro
> > >    oenote Running our libinstall SGNOTE
> > >   oe_libinstall -s libQtGuiE ${OVEROTOP}/tmp/work/armv7a-angstrom-linux-
> > gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/lib
> > >    oenote Running our make current dir is $PWD
> > >    cd ${WORKING_DIR}
> > >   make
> > >   oenote Finished our qmake
> >
> >
> > Comments:
> >        - Using oe_libinstall in do_compile is never ever the right thing..
> > there is
> >          no need for that. Forget about the existance of oe_libinstall...
> > you
> >          are just increasing the hole you are sitting in.
> >        - You should add a separate recipe for the statemachine framework,
> > stage it..
> >          and build a package. I might just do that now...
> >
> > Some remarks on tasks:
> >        - In do_configure you configure
> >        - In do_compile one is compiling
> >        - In do_install one is installing to ${D}
> >        - In do_stage one is staging
> >
> > The good:
> >        - You are already doing "Inherit qmake2" and "inherit qt4e"... this
> > should
> >          setup things correctly.
> >
> > The bad:
> >        - You are invoking qmake yourself.. You should at least invoke:
> >            qmake_base_do_configure... this will have QMAKESPEC set
> >
> > The ugly:
> >        - I don't understand why stock do_configure is not good enough...
> > you have
> >          copied everything to ${S} anyway. So the stock do_configure should
> >          find your pro file? Is that not the case? Which initial problem
> > did
> >          you try to solve?
> >
> >
> > do you hang out on irc? it might be more easy to go through all these in
> > real
> > time.
> >
> > z.
> >

There is nothing wrong in log snipper you've shown us. Describe your
problem correctly and show us the code (.bb I mean).


