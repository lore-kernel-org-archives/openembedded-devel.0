Received: from [67.19.73.58] (helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <richard@openedhand.com>) id 1MoMG9-0005qR-RV
	for openembedded-devel@openembedded.org; Thu, 17 Sep 2009 21:03:17 +0200
Received: from [192.168.1.3] (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 8D6AF12EC1F5;
	Thu, 17 Sep 2009 14:15:50 -0500 (CDT)
From: Richard Purdie <richard@openedhand.com>
To: poky <poky@o-hand.com>
Date: Thu, 17 Sep 2009 19:59:37 +0100
Message-Id: <1253213978.30165.188.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: richard@openedhand.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Poky SDK generation changes
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
X-List-Received-Date: Thu, 17 Sep 2009 19:03:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

As people who've used it probably know, SDK generation is a bit of a
hack at the moment since the SDK is compiled against the system its
built on. This means its not possible to produce a i586 SDK on a x86_64
build machine for example.

The current sdk.bbclass also has an identity crisis powering both cross
toolchain recipes (like gcc, binutils and gdb) along with non-cross sdk
tools like qemu and pkgconfig.

I've wanted to see "proper" SDK generation with Poky for a while and
I've now created a series of patches which enable this which includes
the layout variable changes I previously mentioned:

http://git.pokylinux.org/cgit.cgi/poky/log/?h=canadian

The idea is similar to some of the canadian* classes in OE.dev but I
ended up rewriting them entirely as I believed something simpler was
possible and desirable. The idea is the same in that you set
SDK_ARCH="i586" in local.conf and then the SDK will be one that runs on
that ARCH.

The end result is three classes:

cross-canadian.bbclass
crosssdk.bbclass
nativesdk.bbclass

nativesdk - These recipes provide "SDK" versions of the recipe for
things like pkgconfig, qemu, the xlibs qemu needs and so on. The class
is BBCLASSEXTEND capable so its usually just a case of adding
BBCLASSEXTEND = "nativesdk" to the recipe.

crosssdk - These build a cross compiler toolchain which runs on your
build machine and cross compiles to SDK_ARCH. Its pretty much
cross.bbclass but with TARGET_ARCH = SDK_ARCH.

canadian-cross - These are the strangest packages as they're built on
BUILD_ARCH to run on SDK_ARCH to generate output to run on TARGET_ARCH.

As a nice benefit we end up with a libc in the SDK tarball which the SDK
uses instead of linking against the one on the build machine. Poky also
contains some code to link qemu against a dummy libGL as I didn't
believe adding a libGL to the SDK tarball was sensible.

I've cc'd the OE list since I think the changes in here are desirable
for OE too. I haven't had much time to run OE builds of late for many
reasons. I don't really want to make changes there without testing the
result so any help in merging this into OE would be really appreciated.

Cheers,

Richard

-- 
Richard Purdie
Intel Open Source Technology Centre



