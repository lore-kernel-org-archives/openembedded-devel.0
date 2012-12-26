Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Tnopu-0001x6-NZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 12:07:46 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TnobX-003Mms-T8>; Wed, 26 Dec 2012 11:52:55 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TnobX-003yJ5-Rc>; Wed, 26 Dec 2012 11:52:55 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1TnobW-0005BJ-Om
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 11:52:54 +0100
Date: Wed, 26 Dec 2012 11:52:54 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121226105254.GA18297@mi.fu-berlin.de>
References: <20121224185436.GA1230@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20121224185436.GA1230@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: Linker Problem: Unrecognized '-Wl,-O1'
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
X-List-Received-Date: Wed, 26 Dec 2012 11:07:46 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Dec 24, 2012 at 08:54:36PM +0200, Eren Türkay wrote:
> Hello,
> 
> I am packaging 'arpx' [0] daemon and I have a problem in linking stage.
> The linker complains about unrecognized options "-Wl,-O1". It is strange
> that i586-poky-linux-ld does not have an option for linker hash table
> optimization, which seems to be around for a long time [1]
> 
> "-Wl,-O1" is provided by bitbake by default so I think that it is
> expected to run but it fails in my configuration. What am I missing
> here? I would really appreciate a hand for fixing this.
> 
> [0]: https://github.com/hambedded-linux
> [1]: https://lwn.net/Articles/192624/
> 
> #### START: Stripped Bitbake Output ####
> 
> Build Configuration:
> BB_VERSION        = "1.16.0"
> TARGET_ARCH       = "i586"
> TARGET_OS         = "linux"
> MACHINE           = "alix3d3"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.3"
> TUNE_FEATURES     = "m32 i586"
> TARGET_FPU        = ""
> meta              
> meta-yocto        = "danny:09031ac2fc0f30ec577ee823fc61ff0e5d852e21"
> meta-alix3d3      = "master:02f8693c35789471f4a3296358f0add538a1142a"
> meta-hamradio     = "master:1e440d60699e1b03c5aec78a64a98bc3f5494e5f"
> 
> i586-poky-linux-ld --sysroot=/home/eren/sourcebox/yocto/poky-1.3/build/tmp/sysroots/alix3d3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -o aprx aprx.o ttyreader.o ax25.o aprsis.o beacon.o config.o netax25.o erlang.o aprxpolls.o telemetry.o igate.o cellmalloc.o historydb.o keyhash.o parse_aprs.o dupecheck.o  kiss.o interface.o pbuf.o digipeater.o valgrind.o filter.o dprsgw.o  crc.o  agwpesocket.o netresolver.o -lpthread  -lutil    -lm
> i586-poky-linux-ld: unrecognized option '-Wl,-O1'
> i586-poky-linux-ld: use the --help option for usage information
> make: *** [aprx] Error 1
> 
> #### END: Stripped Bitbake Output ####

Hi,

easy to fix edit the buildsystem to usee gcc as linker no ld directly or fix the build system not to use CFLAGS for linking, but LDFLAGS.

Bye Henning


