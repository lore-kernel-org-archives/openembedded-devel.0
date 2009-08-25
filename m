Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mfwze-0007b3-Qf
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 16:28:14 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 92AFA1B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 14:13:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 16:09:24 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <91283b620908241055p6b67a7edy44a3dee2f88e2b40@mail.gmail.com>
	<4A93BC84.7070106@gmail.com>
	<91283b620908250454n428bdc4ek2cd4df45690e47c0@mail.gmail.com>
In-Reply-To: <91283b620908250454n428bdc4ek2cd4df45690e47c0@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908251609.25008.holger+oe@freyther.de>
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
X-List-Received-Date: Tue, 25 Aug 2009 14:29:02 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 25 August 2009 13:54:26 Stuart Gray wrote:
> Hi we have just solved the problem

No, you have not "solved" the problem. Your next problems will be uic, moc, 
etc. not working...


>do_compile() {
>   oenote Running our qmake work dir is $WORKING_DIR
>    cd ${WORKING_DIR}
>   qmake2 ${WORKING_DIR}/dockamp.pro
>    oenote Running our libinstall SGNOTE
>   oe_libinstall -s libQtGuiE ${OVEROTOP}/tmp/work/armv7a-angstrom-linux-
gnueabi/qt4-embedded-4.5.2-r14.1/qt-embedded-linux-opensource-src-4.5.2/lib
>    oenote Running our make current dir is $PWD
>    cd ${WORKING_DIR}
>   make
>   oenote Finished our qmake


Comments:
	- Using oe_libinstall in do_compile is never ever the right thing.. there is
          no need for that. Forget about the existance of oe_libinstall... you 
          are just increasing the hole you are sitting in.
	- You should add a separate recipe for the statemachine framework, stage it.. 
          and build a package. I might just do that now...

Some remarks on tasks:
	- In do_configure you configure
	- In do_compile one is compiling
        - In do_install one is installing to ${D}
        - In do_stage one is staging

The good:
	- You are already doing "Inherit qmake2" and "inherit qt4e"... this should 
          setup things correctly.

The bad:
	- You are invoking qmake yourself.. You should at least invoke:
            qmake_base_do_configure... this will have QMAKESPEC set

The ugly:
	- I don't understand why stock do_configure is not good enough... you have 
          copied everything to ${S} anyway. So the stock do_configure should
          find your pro file? Is that not the case? Which initial problem did 
          you try to solve?


do you hang out on irc? it might be more easy to go through all these in real 
time.

z.


