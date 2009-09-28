Received: from [82.195.155.133] (helo=mail.techworks.ie)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cgagneraud@techworks.ie>) id 1MsO08-0001S9-FL
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Sep 2009 23:43:23 +0200
Received: from archeopterix.techworks.local (unknown [86.43.120.173])
	by mail.techworks.ie (Postfix) with ESMTP id E3414BC0F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 22:42:39 +0100 (IST)
Message-ID: <4AC12E48.3010801@techworks.ie>
Date: Mon, 28 Sep 2009 22:44:40 +0100
From: Christian Gagneraud <cgagneraud@techworks.ie>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 82.195.155.133
X-SA-Exim-Mail-From: cgagneraud@techworks.ie
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: meta-native?
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
X-List-Received-Date: Mon, 28 Sep 2009 21:43:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Is there a way to build all and only the native recipes in a single shot?

Short answer I suppose:
Write a meta-native recipe that depends on all the native recipes and 
then do a "MACHINE=native bitbake your-meta-native"

But If anyone fancy explain me why my first attemp didn't give me the 
expected results:

I've tried naively to write a meta-native recipe by putting in DEPENDS 
a list of native recipes (from stamps/x86_64-linux/*-native-*) that 
have been built after a "bitbake console-image" but still using my 
usual MACHINE (ts72xx).
Here is my meta-native:
----
DESCRIPTION="Meta package to build all native packages in a raw"

DEPENDS = "\
autoconf-native \
automake-native \
bison-native \
bzip2-full-native \
curl-native \
db-native \
dbus-glib-native \
dbus-native \
desktop-file-utils-native \
expat-native \
fakeroot-native \
file-native \
flex-native \
gdbm-native \
gettext-native \
glib-2.0-native \
gmp-native \
gnu-config-native \
gtk-doc-native \
intltool-native \
ipkg-utils-native \
libtool-native \
libxml-parser-perl-native \
libxml2-native \
m4-native \
mpfr-native \
ncurses-native \
openssl-native \
opkg-native \
pax-utils-native \
perl-native \
pkgconfig-native \
python-native \
quilt-native \
sed-native \
shared-mime-info-native \
shasum-native \
stagemanager-native \
unifdef-native \
xorg-headers-native \
xproto-native \
zlib-native \
"

inherit meta
----

I expected then that a "rm -Rf $TMPDIR; MACHINE=whatever bitbake 
meta-native" would have build only the native recipes but it looks 
like some cross/target recipes are being build too, for now (the build 
is still ongoing) it has pulled the following "non-native" 
dependencies (found in stamps/armv4t-angstrom-linux-gnueabi):
binutils-cross
expat
gcc-cross
gcc-cross-initial
gcc-cross-intermediate
glibc
glibc-initial
libtool-cross
linux-libc-headers

Is it really a native package that pulls these dependencies, or is it 
because the cross-toolchain is a kind of default dependency?

I'm using angstrom 2008.1-stable, my goal is to build all the native 
recipes and then make a big tarball of my TMPDIR to save time for the 
future.
Ideally i would like then to build the toolchains I need, install them 
and use them with openembedded. If that doesn't work I will go for the 
big tarball as well.

I'm only interesting in repeatable images creation, not repeatable 
toolchain and native stuff and I would like to use this big tarball as 
a starting point to speed-up my "build images from scratch" process.
As I'm not modifying any native/cross/sdk recipes, but only recipes 
for the target, my way of doing should be safe to guarantee the 
repeatability of image building.

Any thought?

Regards,
Chris



