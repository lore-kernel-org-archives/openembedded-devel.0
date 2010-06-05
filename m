Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OKi0t-0004z5-2E
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 03:17:31 +0200
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 5 Jun 2010 03:13:09 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 5 Jun 2010 03:13:09 +0200
Received: from [192.168.10.100] ([79.21.49.187]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 5 Jun 2010 03:13:07 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <NGBBLNEOGLJIIJKLFLPFAEPMFAAA.linux@hf-electronics.com>
References: <NGBBLNEOGLJIIJKLFLPFAEPMFAAA.linux@hf-electronics.com>
Date: Sat, 05 Jun 2010 03:13:07 +0200
Message-ID: <1275700387.2670.6.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-OriginalArrivalTime: 05 Jun 2010 01:13:08.0872 (UTC)
	FILETIME=[426DF880:01CB044C]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Openembedded error on building xfce-image
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
X-List-Received-Date: Sat, 05 Jun 2010 01:17:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-06-04 at 13:08 +0200, Henk Geraads wrote:
> Hi,
> 
> We are trying to build a OpenEmbedded xfce-image for the
> compulab CM-T3530 board. Selected distribution is
> Angstrom-2008.1.
> We got following error message:
It seems that xfce-image is old...and that xfce46-image is newer.
Yesterday I tried xfce46-image with eee701 and everything went fine.
Altough I didn't test it yet.
> Henk $ bitbake xfce-image
> NOTE: Handling BitBake files: - (8393/8393) [100 %]
> NOTE: Parsing finished. 7595 cached, 468 parsed, 330
> skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> ERROR: Multiple .bb files are due to be built which each
> provide xfce4-panel
> (/home/armcore/oe/openembedded/recipes/xfce-base/xfce4-panel
> _4.6.3.bb
> /home/armcore/oe/openembedded/recipes/xfce-base/xfce4-panel_
> 4.4.2.bb).
>  This usually means one provides something the other doesn't
> and should.
> ERROR: Multiple .bb files are due to be built which each
> provide xfdesktop
> (/home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4
> .6.1.bb
> /home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4.
> 4.2.bb).
>  This usually means one provides something the other doesn't
> and should.
> ERROR: Multiple .bb files are due to be built which each
> provide xfce-utils
> (/home/armcore/oe/openembedded/recipes/xfce-base/xfce-utils_
> 4.6.1.bb
> /home/armcore/oe/openembedded/recipes/xfce-base/xfce-utils_4
> .4.2.bb).
>  This usually means one provides something the other doesn't
> and should.
> ERROR: Multiple .bb files are due to be built which each
> provide xfwm4
> (/home/armcore/oe/openembedded/recipes/xfce-base/xfwm4_4.6.1
> .bb
> /home/armcore/oe/openembedded/recipes/xfce-base/xfwm4_4.4.2.
> bb).
>  This usually means one provides something the other doesn't
> and should.
I don't know why it wants to build multiple versions,maybe bad config?
> NOTE: Executing runqueue
> NOTE: Running task 2975 of 4330 (ID: 339,
> /home/armcore/oe/openembedded/recipes/angstrom/angstrom-vers
> ion.bb, do_qa_configure)
> NOTE: Running task 2976 of 4330 (ID: 340,
> /home/armcore/oe/openembedded/recipes/angstrom/angstrom-vers
> ion.bb, do_compile)
> NOTE: Running task 2977 of 4330 (ID: 334,
> /home/armcore/oe/openembedded/recipes/angstrom/angstrom-vers
> ion.bb, do_install)
> NOTE: Running task 3006 of 4330 (ID: 342,
> /home/armcore/oe/openembedded/recipes/angstrom/angstrom-vers
> ion.bb, do_package)
> NOTE: Running task 3077 of 4330 (ID: 923,
> /home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4.
> 4.2.bb, do_install)
> ERROR: function do_install failed
> ERROR: log data follows
> (/home/armcore/oe/build/distrobuild/angstrom/work/armv7a-ang
> strom-linux-gnueabi/xfdesktop-4.4.2-r2/temp/log.do_install.1
> 609)
> | NOTE: make
> DESTDIR=/home/armcore/oe/build/distrobuild/angstrom/work/arm
> v7a-angstrom-linux-gnueabi/xfdesktop-4.4.2-r2/image install
> | make: *** No rule to make target `install'.  Stop.
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /home/armcore/oe/build/distrobuild/angstrom/work/armv7a-angs
> trom-linux-gnueabi/xfdesktop-4.4.2-r2/temp/log.do_install.16
> 09
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4.
> 4.2.bb do_install failed
> ERROR: Task 923
> (/home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4
> .4.2.bb, do_install) failed
> NOTE: Tasks Summary: Attempted 3076 tasks of which 3072
> didn't need to be rerun and 1 failed.
> ERROR:
> '/home/armcore/oe/openembedded/recipes/xfce-base/xfdesktop_4
> .4.2.bb' failed
> 
> Where should we, look to fix this?

look what happened
in /home/armcore/oe/build/distrobuild/angstrom/work/armv7a-ang
strom-linux-gnueabi/xfdesktop-4.4.2-r2/xfdesktop-4.4.2/

Denis.




