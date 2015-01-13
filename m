Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 95DE060017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 13:24:52 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 915A6D40348
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 14:24:26 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 31AFED40345
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 14:24:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 14:24:25 +0100 (CET)
Date: Tue, 13 Jan 2015 14:24:22 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150113132422.GJ18240@mail.itconsulting-heinold.de>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
MIME-Version: 1.0
In-Reply-To: <loom.20150113T130012-516@post.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Query on meta-java layer openjdk-7-jre build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Jan 2015 13:24:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 13, 2015 at 01:02:01PM +0000, Max Krummenacher wrote:
> Hi Victor
> 
> > I have OpenEmbedded setup and using the daisy branch. For the meta-java
> layer I
> > am using the master branch of
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/.
> > 
> > For our embedded modules we have our own meta layer. I am trying to build
> > an angstrom image with LXDE.
> > 
> > We are using ARMv7 hard-float Thumb2 builds (armv7at2hf-vfp). Most errors
> seems
> > to be "not declared in this scope" errors. Are there some definitions to
> be 
> > declared in the conf file, so the build picks it up or is some modification
> > required to the source with a custome patch declared in the bb file for 
> this?
> I have run into the same issues.
> 
> This are follow up errors. The failing qemu-arm runs should have produced
> header files which provide those definitions.
> 
> > 
> > Not much knowledge on OpenEmbedded. Also can someone explain the qemu
> segmentation
> > fault errors?
> see above
> 
> > Trying to build openjdk-7-jre gives me the following error. A complete 
> log file is also attached.
> > 
> > Can someone give me any pointers on how can I get the build to be
> successful for
> > using Java?
> 
> My investigation showed that qemu-arm can not execute any binary which is
> compiled with the compiler for Colibri-T20 and is linked with the -static
> flag.
> Even a simple hello world program does not work. When executing that hello
> world on the real hardware I also get a segmentation fault.
> 
> I got java compiling and running by updating to the latest of meta-java,
> applying the patch which enables xawt and applying a patch which compiles
> all binaries without the -static flag. Compiling with dynamic linking
> however produces a binary which run on qemu-arm and on the target.
> Currently I have no idea why statically linked binaries fail.
> 

Hi Max,

thanks to investigate this and now it make some sense why qemu is collapsing.
To notice I switched to static builds long ago
because the qemu-calls did not worked with the shared compiled executables. Now
it looks like the other way around. And we maybe should consider to switch back
to shared library builds.

Bye Henning

