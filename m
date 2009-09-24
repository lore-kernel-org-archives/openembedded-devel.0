Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MquKL-0006I0-KO
	for openembedded-devel@openembedded.org; Thu, 24 Sep 2009 21:50:08 +0200
Received: (qmail 25533 invoked from network); 24 Sep 2009 19:49:27 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 24 Sep 2009 12:49:27 -0700
Date: Thu, 24 Sep 2009 12:49:26 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090924194926.GG9726@smtp.west.cox.net>
References: <1253213978.30165.188.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1253213978.30165.188.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 71.6.201.124
X-SA-Exim-Mail-From: trini@embeddedalley.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	poky <poky@o-hand.com>
Subject: Re: Poky SDK generation changes
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
X-List-Received-Date: Thu, 24 Sep 2009 19:50:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2009 at 07:59:37PM +0100, Richard Purdie wrote:
> As people who've used it probably know, SDK generation is a bit of a
> hack at the moment since the SDK is compiled against the system its
> built on. This means its not possible to produce a i586 SDK on a x86_64
> build machine for example.
> 
> The current sdk.bbclass also has an identity crisis powering both cross
> toolchain recipes (like gcc, binutils and gdb) along with non-cross sdk
> tools like qemu and pkgconfig.
> 
> I've wanted to see "proper" SDK generation with Poky for a while and
> I've now created a series of patches which enable this which includes
> the layout variable changes I previously mentioned:
> 
> http://git.pokylinux.org/cgit.cgi/poky/log/?h=canadian
> 
> The idea is similar to some of the canadian* classes in OE.dev but I
> ended up rewriting them entirely as I believed something simpler was
> possible and desirable. The idea is the same in that you set
> SDK_ARCH="i586" in local.conf and then the SDK will be one that runs on
> that ARCH.
> 
> The end result is three classes:
> 
> cross-canadian.bbclass
> crosssdk.bbclass
> nativesdk.bbclass
> 
> nativesdk - These recipes provide "SDK" versions of the recipe for
> things like pkgconfig, qemu, the xlibs qemu needs and so on. The class
> is BBCLASSEXTEND capable so its usually just a case of adding
> BBCLASSEXTEND = "nativesdk" to the recipe.
> 
> crosssdk - These build a cross compiler toolchain which runs on your
> build machine and cross compiles to SDK_ARCH. Its pretty much
> cross.bbclass but with TARGET_ARCH = SDK_ARCH.
> 
> canadian-cross - These are the strangest packages as they're built on
> BUILD_ARCH to run on SDK_ARCH to generate output to run on TARGET_ARCH.
> 
> As a nice benefit we end up with a libc in the SDK tarball which the SDK
> uses instead of linking against the one on the build machine. Poky also
> contains some code to link qemu against a dummy libGL as I didn't
> believe adding a libGL to the SDK tarball was sensible.
> 
> I've cc'd the OE list since I think the changes in here are desirable
> for OE too. I haven't had much time to run OE builds of late for many
> reasons. I don't really want to make changes there without testing the
> result so any help in merging this into OE would be really appreciated.

This all sounds pretty good.  My first concern is where does MACHINE
fit into this stuff?  My second is, is it possible to do something like:
$ SDK_ARCH="i586-linux" MACHINE=machine1 bitbake my-sdk-target
$ SDK_ARCH="i586-mingw" MACHINE=machine1 bitbake my-sdk-target
I assume so.  Then after those two, how about:
$ SDK_ARCH="i586-linux" MACHINE=machine2 bitbake my-sdk-target
$ SDK_ARCH="i586-mingw" MACHINE=machine2 bitbake my-sdk-target

And still get sensible results (assuming my-sdk-target takes MACHINE
into account in naming the output)?

-- 
Tom Rini


