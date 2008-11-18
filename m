Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1L2FBh-0007zS-OQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Nov 2008 02:15:30 +0100
Received: from gandalf.denix.org ([71.255.226.167]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KAI00IEE8PI2V67@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Nov 2008 19:12:55 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E2C0A6B83A8; Mon,
	17 Nov 2008 20:12:53 -0500 (EST)
Date: Mon, 17 Nov 2008 20:12:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <59e7e6f90811171255j262492ebx71988554fc3532a@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081118011253.GB6993@denix.org>
MIME-version: 1.0
References: <59e7e6f90811161949k4020d983kf32263237b20bf9b@mail.gmail.com>
	<59e7e6f90811162118o68610184x6103071ebed9405d@mail.gmail.com>
	<20081117061235.GA2741@denix.org>
	<59e7e6f90811171255j262492ebx71988554fc3532a@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: poky@o-hand.com
Subject: Using pre-built binary CodeSourcery Lite as external toolchain
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
X-List-Received-Date: Tue, 18 Nov 2008 01:15:30 -0000
X-Groupsio-MsgNum: 6658
Content-type: multipart/mixed; boundary=tjCHc7DPkfUGtrlw
Content-disposition: inline

--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 17, 2008 at 02:55:36PM -0600, Mike Turquette wrote:
> On Mon, Nov 17, 2008 at 12:12 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Sun, Nov 16, 2008 at 11:18:49PM -0600, Mike Turquette wrote:
> >> Hi all,
> >>
> >> I'm attempting to write an external-csl-toolchain_2007q3-51 recipe for
> >> Poky.  This uses Poky's POKYMODE mechanism which is why I've copied
> >> the poky list on this email, however I think my error isn't
> >> necessarily Poky-specific as it has wider applications for anyone
> >> using an external toolchain.
> >>
> >> Attached is external-csl-toolchain_2007q3-51.bb.  It is basically a
> >> clone of Poky's external-csl-toolchain_2006q3-27.bb except that
> >> do_stage adds more stuff.  ${STAGING_DIR_TARGET}${base_libdir} does
> >> have libc.so.6 in it but libtool doesn't seem to be picking it up and
> >> instead tries (and fails) to link against my host /lib/libc.so.6,
> >> which seems like a Very Bad Thing to me.
> >>
> >> Why can't libtool find and use the libc I have in staging?  What do
> >> the normal compiled toolchains provide that I am not?  Also, does
> >> binconfig.bbclass know the difference between *-native packages and
> >> cross-compiled ones?  I know prebuilt toolchains aren't all the rage
> >> with OE devs, but some customers refuse to use toolchains built from
> >> source :(
> >
> > Mike,
> >
> > I'm sorry I'm not that familiar with Poky and the way it works with external
> > toolchains. But after numerous fixes (many of which are commited to OE .dev
> > branch) and several lines of additional configuration in my local.conf, I was
> > able to use pre-built binary CodeSourcery 2007q3 toolchain, as well as
> > MontaVista Pro 5, by using the standard meta/external-toolchain.bb recipe.
> 
> Denys,
> 
> Thanks for your reply.  I was looking for info on how to accomplish
> that same thing using POKYMODE and last night I got it working.  The
> two attached files make the most sense with respect to Poky, but can
> be generalize to OE if needed.
> 
> Hopefully someone will benefit from them.  I'll stop cross-posting to
> the lists now ;)

Mike,

I'm glad it worked for you with Poky. Just as a reference, I'm posting my 
setup of OpenEmbedded/Angstrom for using pre-built binary CodeSourcery Lite as 
external toolchain, which been working for me for quite some time. You can 
also check my setup at http://github.com/wmills/arago/tree

-- 
Denys

--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="arago-external-toolchain-config.diff"

diff -ur arago-oe-dev/conf/distro/angstrom-2008.1.conf arago/conf/distro/angstrom-2008.1.conf
--- arago-oe-dev/conf/distro/angstrom-2008.1.conf	2008-11-17 14:31:27.000000000 -0500
+++ arago/conf/distro/angstrom-2008.1.conf	2008-11-17 17:19:29.000000000 -0500
@@ -125,11 +125,11 @@
 PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
 
 # Virtuals:
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain"
 
 # hostap stuff, we prefer the in-kernel modules, but those don't work for all machines
 PREFERRED_PROVIDER_hostap-conf                      ?= "hostap-conf"
@@ -144,7 +144,7 @@
 PREFERRED_PROVIDER_virtual/xserver      ?= "xserver-kdrive"
 
 # Others:
-PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
+PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain"
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_esound 		?= "pulseaudio"
 PREFERRED_PROVIDER_gconf                ?= "gconf-dbus"
diff -ur arago-oe-dev/conf/distro/include/angstrom-glibc.inc arago/conf/distro/include/angstrom-glibc.inc
--- arago-oe-dev/conf/distro/include/angstrom-glibc.inc	2008-10-24 18:03:47.000000000 -0400
+++ arago/conf/distro/include/angstrom-glibc.inc	2008-11-06 18:09:33.000000000 -0500
@@ -1,18 +1,18 @@
 # glibc:
-PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
-PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
-PREFERRED_PROVIDER_virtual/libc ?= "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?= "glibc-initial"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
+PREFERRED_PROVIDER_virtual/libiconv ?= "external-toolchain"
+PREFERRED_PROVIDER_virtual/libintl ?= "external-toolchain"
+PREFERRED_PROVIDER_virtual/libc ?= "external-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?= "external-toolchain"
+PREFERRED_PROVIDER_linux-libc-headers ?= "external-toolchain"
 
 #Set preferred provider for the C library that is used to build the crosscompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            = "glibc"
-PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc"
-PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc"
-PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "external-toolchain"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "external-toolchain"
+PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "external-toolchain"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            = "external-toolchain"
+PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "external-toolchain"
+PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "external-toolchain"
+PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "external-toolchain"
 
 
 TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
diff -ur arago-oe-dev/conf/distro/include/angstrom.inc arago/conf/distro/include/angstrom.inc
--- arago-oe-dev/conf/distro/include/angstrom.inc	2008-11-17 14:31:27.000000000 -0500
+++ arago/conf/distro/include/angstrom.inc	2008-11-17 17:26:35.000000000 -0500
@@ -7,7 +7,7 @@
 DISTRO = "angstrom"
 DISTRO_NAME = "Angstrom"
 
-TARGET_VENDOR = "-angstrom"
+TARGET_VENDOR ?= "-none"
 
 # Add FEED_ARCH to overrides
 OVERRIDES .= ":${FEED_ARCH}"
@@ -18,7 +18,7 @@
 PSTAGE_EXTRAPATH = "${ANGSTROM_MODE}"
 
 CACHE = "${TMPDIR}/cache/${ANGSTROM_MODE}/${MACHINE}"
-DEPLOY_DIR = "${TMPDIR}/deploy/${ANGSTROM_MODE}"
+DEPLOY_DIR ?= "${TMPDIR}/deploy/${ANGSTROM_MODE}"
 require conf/distro/include/angstrom-${ANGSTROM_MODE}.inc
 
 # ARM920T and up can use thumb mode to decrease binary size at the expense of speed

--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="external-csl-local.conf"

# Enable following 4 lines to use binary CodeSourcery Lite 2007q3
TARGET_VENDOR = "-none"
SDK_PREFIX = "/opt/arm-2007q3"
TARGET_CPPFLAGS_append = " -I${SDK_PREFIX}/${TARGET_SYS}/libc/usr/include "
TARGET_LDFLAGS_prepend = " -L${SDK_PREFIX}/${TARGET_SYS}/libc/lib -Wl,-rpath-link,${SDK_PREFIX}/${TARGET_SYS}/libc/lib "

# Enable following 5 lines to use MontaVista Pro 5.0
#TARGET_VENDOR = "v5tl-montavista"
#TARGET_PREFIX = "arm_v5t_le-"
#SDK_PREFIX = "/opt/montavista/pro/devkit/arm/v5t_le"
#TARGET_CPPFLAGS_append = " -I${SDK_PREFIX}/target/usr/include "
#TARGET_LDFLAGS_prepend = " -L${SDK_PREFIX}/target/lib -Wl,-rpath-link,${SDK_PREFIX}/target/lib "

ASSUME_SHLIBS += "libc.so.6:libc6 libm.so.6:libc6 libutil.so.1:libc6 libcrypt.so.1:libc6"
ASSUME_SHLIBS += "libdl.so.2:libc6 libpthread.so.0:libc6 librt.so.1:libc6 libgcc_s.so.1:libgcc1"

--tjCHc7DPkfUGtrlw--
