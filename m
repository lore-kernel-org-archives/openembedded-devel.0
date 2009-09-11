Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1Mm5ln-0005Wf-H7
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 15:02:34 +0200
Received: by qyk34 with SMTP id 34so829542qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2009 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Nkax+xE4TT4JPUQUKE6W0c0u7uU38cuuaosOd9OLTH0=;
	b=rqYPuTdpqjl1FCNcmHKWl4B4JHkESn6s7G1n9q3eRw4JdwXc/CKXvcJfSyQKvJu32s
	60Loyr46Vi5gOSNHVBkBu/peWnTfvmgdRCw21sY/nD+OISVUtEzPc4zokouaBexzulO/
	9JRYBWdDQufrWCgzD1JS/gZ7NgIiz8bxOjTps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VqA6MqY5y1hQF9qGsPRViS+9V72QoBfnjYWnBbjPk3h/EqaTp9Z8GBvGvTh0zDGkRF
	jF+9aiSMFJ8XX1ns7sSyEivZl9qwSlkqwtKm7Gl5x4UGBqNm7VUREufBiTp4eQB9yaBQ
	mgd3pCKJvubEH4ZPdW6Ns5WeCA7zKOBIeT+9o=
Received: by 10.224.61.141 with SMTP id t13mr2385860qah.313.1252674122625;
	Fri, 11 Sep 2009 06:02:02 -0700 (PDT)
Received: from localhost.minsk.epam.com (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 8sm1410488qwj.18.2009.09.11.06.02.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 11 Sep 2009 06:02:01 -0700 (PDT)
Date: Fri, 11 Sep 2009 16:01:27 +0300
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090911130127.GC19399@localhost.minsk.epam.com>
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>
	<4A93BC84.7070106@gmail.com>
	<91283b620908250454n428bdc4ek2cd4df45690e47c0@mail.gmail.com>
	<200908251609.25008.holger+oe@freyther.de>
	<91283b620909102232me9db8dck490abb53a8ba8fff@mail.gmail.com>
	<20090911081303.GA18964@localhost.minsk.epam.com>
	<91283b620909110351r2d9758b4n20f0f02dfed4b058@mail.gmail.com>
	<20090911112612.GB19399@localhost.minsk.epam.com>
	<91283b620909110506p5768a960o6bf4abab421cb1b3@mail.gmail.com>
	<91283b620909110523je5eb85atc7c421ac0e64df61@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <91283b620909110523je5eb85atc7c421ac0e64df61@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Sep 2009 13:02:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2009 at 01:23:01PM +0100, Stuart Gray wrote:
> Here is what I have added to qt4-embedded.inc
> 
> QT_CONFIG_FLAGS += " \
>     -qtlibinfix ${QT_LIBINFIX} \
>     -qt-decoration-styled -plugin-decoration-default
> -plugin-decoration-windows \
>     -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc
> -plugin-gfx-directfb \
>     -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
>     -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
>  *   -system-sqlite -plugin-sql-sqlite -phonon -phonon-backend \
>     -no-webkit -no-xmlpatterns -no-qt3support \
>     -shared -release \*
>     -DQT_KEYPAD_NAVIGATION \
>     "
> 
> 
> 2009/9/11 Stuart Gray <stuart68@gmail.com>
> 
> > How do I do this?
> >
> > Do I use the names as below and add them to my image file under
> > SIMPLE_AUDIO or are they RDEPENDS????
> >
> > Thanks,
> > Stuart
> >
> >
> > 2009/9/11 Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> >
> >> On Fri, Sep 11, 2009 at 11:51:23AM +0100, Stuart Gray wrote:
> >> > Ok,
> >> >
> >> > I have attached several files showing the bb files and some of the pro
> >> > files. To give an idea of my problem, when I run the image I have no
> >> > libraries installed that are pulled in by our Qt code.
> >> >
> >> > Some of them are:
> >> >
> >> > libphonon-gstreamer  and
> >> > libqsqlite
> >> >
> >> > Now when the image builds I can see these files being created under my
> >> tmp,
> >> > the problem would as I understand it is that they are never installed
> >> with
> >> > the image.
> >> >
> >> > When I run my code I get:
> >> >
> >> > DatabasePrivate::init
> >> > QSqlDatabase: QSQLITE driver not loaded
> >> > QSqlDatabase: available drivers:
> >> > WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend
> >> plugin
> >> > could not be loaded
> >> > WARNING: Phonon::createPath: Cannot connect  Phonon::MediaObject ( no
> >> > objectName ) to  Phonon::AudioOutput ( no objectName ).
> >> > WARNING: bool Phonon::FactoryPrivate::createBackend() phonon backend
> >> plugin
> >> > could not be loaded
> >> >
> >> >
> >> > When I search the SD card I cannot find libphonon-gstreamer or
> >> libqsqlite.
> >> >
> >> > Any help you can provide would be great.
> >> >
> >> > Regards,
> >> > Stuart
> >> >
> >>
> >> You should include the needed sqlite, phonon plugins etc. into your
> >> custom image. Sql plugins are not included by default. Phonon isn't too
> >> I think.
> >> >
> >> > 2009/9/11 Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> >> >
> >> > > On Fri, Sep 11, 2009 at 06:32:48AM +0100, Stuart Gray wrote:
> >> > > > Right. I took your advice and recoded my bb file. As suggested it
> >> uses
> >> > > the
> >> > > > standard do_compile and it is only the do_unpack that I have
> >> overridden.
> >> > > I
> >> > > > have attached my latest .inc file.
> >> > > >
> >> > > > I have posted my latest problem that is very close to working, but I
> >> have
> >> > > > found libraries that are not installed. The debug output basically
> >> states
> >> > > > that it cannot find directory /usr/lib/qtopia. The output is shown
> >> below.
> >> > > >
> >> > > > NOTE: Running task 2663 of 3643 (ID: 117, /home/stuart/overo-oe/org.
> >> > > > openembedded.dev/recipes/x-load/x-load_git.bb, do_compile)
> >> > > > NOTE: Running task 2664 of 3643 (ID: 718,
> >> > > > /home/stuart/overo-oe/user.collection/recipes/qt4/
> >> qt4-embedded_4.5.2.bb,
> >> > > > do_populate_staging)
> >> > > > NOTE: Running task 2665 of 3643 (ID: 720,
> >> > > > /home/stuart/overo-oe/user.collection/recipes/qt4/
> >> qt4-embedded_4.5.2.bb,
> >> > > > do_package)
> >> > > > NOTE: The path does not
> >> > > >
> >> > >
> >> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/accessible/
> >> > > > NOTE: The path does not
> >> > > >
> >> > >
> >> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/codecs/
> >> > > > NOTE: The path does not
> >> > > >
> >> > >
> >> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/graphicssystems/
> >> > > > NOTE: The path does not
> >> > > >
> >> > >
> >> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/inputmethods/
> >> > > > NOTE: The path does not
> >> > > >
> >> > >
> >> exist:/home/stuart/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.5.2-r16.1/image/usr/lib/qtopia/plugins/styles/
> >> > > > NOTE: Running task 2666 of 3643 (ID: 118,
> >> > > > /home/stuart/overo-oe/org.openembedded.dev/recipes/x-load/
> >> x-load_git.bb,
> >> > > > do_install)
> >> > > > NOTE: Running task 2673 of 3643 (ID: 9,
> >> > > > /home/stuart/overo-oe/user.collection/recipes/images/
> >> > > omap3-console-image.bb,
> >> > > > do_populate_staging)
> >> > > >
> >> > > > Can  you please tell me how I instruct bitbake to install these
> >> > > directories.
> >> > > >
> >> > > > Regards,
> >> > > > Stuart
> >> > > >
> >> > > >
> >> > > >
> >> > > > 2009/8/25 Holger Hans Peter Freyther
> >> > > > <holger+oe@freyther.de <holger%2Boe@freyther.de> <
> >> holger%2Boe@freyther.de <holger%252Boe@freyther.de>><
> >> holger%2Boe@freyther.de <holger%252Boe@freyther.de><
> >> holger%252Boe@freyther.de <holger%25252Boe@freyther.de>>
> >> > > >
> >> > > > >
> >> > > >
> >> > > > > On Tuesday 25 August 2009 13:54:26 Stuart Gray wrote:
> >> > > > > > Hi we have just solved the problem
> >> > > > > .
> >> > > > > No, you have not "solved" the problem. Your next problems will be
> >> uic,
> >> > > moc,
> >> > > > > etc. not working...
> >> > > > >
> >> > > > >
> >> > > > > >do_compile() {
> >> > > > > >   oenote Running our qmake work dir is $WORKING_DIR
> >> > > > > >    cd ${WORKING_DIR}
> >> > > > > >   qmake2 ${WORKING_DIR}/dockamp.pro
> >> > > > > >    oenote Running our libinstall SGNOTE
> >> > > > > >   oe_libinstall -s libQtGuiE
> >> > > ${OVEROTOP}/tmp/work/armv7a-angstrom-linux-
> >> > > > >
> >> > >
> >> gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/lib
> >> > > > > >    oenote Running our make current dir is $PWD
> >> > > > > >    cd ${WORKING_DIR}
> >> > > > > >   make
> >> > > > > >   oenote Finished our qmake
> >> > > > >
> >> > > > >
> >> > > > > Comments:
> >> > > > >        - Using oe_libinstall in do_compile is never ever the right
> >> > > thing..
> >> > > > > there is
> >> > > > >          no need for that. Forget about the existance of
> >> > > oe_libinstall...
> >> > > > > you
> >> > > > >          are just increasing the hole you are sitting in.
> >> > > > >        - You should add a separate recipe for the statemachine
> >> > > framework,
> >> > > > > stage it..
> >> > > > >          and build a package. I might just do that now...
> >> > > > >
> >> > > > > Some remarks on tasks:
> >> > > > >        - In do_configure you configure
> >> > > > >        - In do_compile one is compiling
> >> > > > >        - In do_install one is installing to ${D}
> >> > > > >        - In do_stage one is staging
> >> > > > >
> >> > > > > The good:
> >> > > > >        - You are already doing "Inherit qmake2" and "inherit
> >> qt4e"...
> >> > > this
> >> > > > > should
> >> > > > >          setup things correctly.
> >> > > > >
> >> > > > > The bad:
> >> > > > >        - You are invoking qmake yourself.. You should at least
> >> invoke:
> >> > > > >            qmake_base_do_configure... this will have QMAKESPEC set
> >> > > > >
> >> > > > > The ugly:
> >> > > > >        - I don't understand why stock do_configure is not good
> >> > > enough...
> >> > > > > you have
> >> > > > >          copied everything to ${S} anyway. So the stock
> >> do_configure
> >> > > should
> >> > > > >          find your pro file? Is that not the case? Which initial
> >> > > problem
> >> > > > > did
> >> > > > >          you try to solve?
> >> > > > >
> >> > > > >
> >> > > > > do you hang out on irc? it might be more easy to go through all
> >> these
> >> > > in
> >> > > > > real
> >> > > > > time.
> >> > > > >
> >> > > > > z.
> >> > > > >
> >> > >
> >> > > There is nothing wrong in log snipper you've shown us. Describe your
> >> > > problem correctly and show us the code (.bb I mean).
> >> > >

You can find package names in tmp/deploy/ipk/qt4-*
Then just create your own image recipe and extend IMAGE_INSTALL
variable. More info in OpenEmbedded Manual.


