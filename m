Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 54702725F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 13:05:03 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YB19b-00038q-08 for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jan 2015 14:05:03 +0100
Received: from 46-140-72-82.static.cablecom.ch
	([46-140-72-82.static.cablecom.ch])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 14:05:02 +0100
Received: from max.oss.09 by 46-140-72-82.static.cablecom.ch with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 14:05:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Tue, 13 Jan 2015 13:02:01 +0000 (UTC)
Message-ID: <loom.20150113T130012-516@post.gmane.org>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 46.140.72.82 (Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:34.0) Gecko/20100101 Firefox/34.0 AlexaToolbar/alxf-2.21)
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
X-List-Received-Date: Tue, 13 Jan 2015 13:05:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Victor

> I have OpenEmbedded setup and using the daisy branch. For the meta-java
layer I
> am using the master branch of
http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/.
> 
> For our embedded modules we have our own meta layer. I am trying to build
> an angstrom image with LXDE.
> 
> We are using ARMv7 hard-float Thumb2 builds (armv7at2hf-vfp). Most errors
seems
> to be "not declared in this scope" errors. Are there some definitions to
be 
> declared in the conf file, so the build picks it up or is some modification
> required to the source with a custome patch declared in the bb file for 
this?
I have run into the same issues.

This are follow up errors. The failing qemu-arm runs should have produced
header files which provide those definitions.

> 
> Not much knowledge on OpenEmbedded. Also can someone explain the qemu
segmentation
> fault errors?
see above

> Trying to build openjdk-7-jre gives me the following error. A complete 
log file is also attached.
> 
> Can someone give me any pointers on how can I get the build to be
successful for
> using Java?

My investigation showed that qemu-arm can not execute any binary which is
compiled with the compiler for Colibri-T20 and is linked with the -static
flag.
Even a simple hello world program does not work. When executing that hello
world on the real hardware I also get a segmentation fault.

I got java compiling and running by updating to the latest of meta-java,
applying the patch which enables xawt and applying a patch which compiles
all binaries without the -static flag. Compiling with dynamic linking
however produces a binary which run on qemu-arm and on the target.
Currently I have no idea why statically linked binaries fail.

You likely want to use xawt.

I do not think that the fix with removing '-static' should go into
meta-java!

cd stuff/meta-java
git remote set-url origin git://git.yoctoproject.org/meta-java
git fetch
git checkout -b t20-test c600dd3
git am 0001-openjdk-7-enable-xawt.patch
git apply remove_static_qemu_binaries.patch

0001-openjdk-7-enable-xawt.patch:
https://github.com/MaxKrummenacher/meta-java/commit
/ff0626363b3f11cc3435d3d081e2af93104faceb.patch
0002-qemu-binaries-remove-linking-with-static.patch:
https://github.com/MaxKrummenacher/meta-java/commit
/71ddc9a85509e6bd1ba1a3be2cc5e588e776f0b5.patch

Regards
Max


