Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1Iyc6w-0004KE-T5
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 00:51:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB1Nlj40019037
	for <openembedded-devel@openembedded.org>; Sat, 1 Dec 2007 23:47:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18884-03 for <openembedded-devel@openembedded.org>;
	Sat,  1 Dec 2007 23:47:42 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lB1Nldpt019029
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 1 Dec 2007 23:47:39 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Sat, 01 Dec 2007 23:47:39 +0000
Message-Id: <1196552859.6697.28.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Packaged Staging, nearly a reality!
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Dec 2007 23:51:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

As anyone watching the commits will notice, OE just gained the next
generation of packaged staging support! :)

To use simply INHERIT = "packaged-staging2". Staging packages end up in
tmp/deploy/pstage. To accelerate your next build, copy them into the
tmp/deploy/pstage directory in that build and it will take advantage of
them.

As with rm_work, there is the problem of the work directory being
missing if you try and then subsequently run tasks like configure or
compile. To avoid the staged version and trigger a manual build run
'bitbake xyz -c fetch -f'.

There are some problems:

* A handful of packages are missing from deploy/ipk and deploy/deb,
  specifically those from gcc-cross (libgcc* and libstdc++*).    
  Ultimately, I think we'll need to change gcc's packaging as this 
  experiment has highlighted some fundamental problems with it (and see 
  the comment I added to meta-toolchain.bb with a similar problem).
* Builds can crash out when building an image when trying to create 
  the installkit because zImage-foobar.bin is missing. This is due to 
  deploy/images not being part of the staging tarballs.
* Its using ipkg. It made Marcin/me finally track down the stupid 
  "can't create /usr/lib/ipkg" bug. ipkg has no locking so when 
  multiple threads install to staging at the same time things went 
  horribly wrong and the status file was corrupted. It was quite 
  amusing to watch but I've added locking in the tasks now.
* Due to locking, only one populate_staging can run at once (other may 
  look like they are but they'll be blocking on a lock). Bitbake really 
  needs to become aware of lock contention but I'll settle for working 
  safely atm. I have plans to change the way staging works to address 
  this and get some speed back, removing the need for stage-manager in 
  the process.
* The .la files will be corrupt when installed into a new build. Some
  sed magic is needed.
* -native packages aren't covered since these are compiled with build 
  specific paths. -native packages aren't skipped even if the build 
  doesn't need them directly, sadly :(. Extremely painful to fix (I'm 
  not even sure how) but can be hacked around, see below.
* -cross packages aren't covered but they don't need to be, we can use 
  meta-toolchain to handle these.
* The -native and -cross packages in staging are not under packaging 
  control at present.
* We create too many stamps when accelerating.

Looks like a long list but nothing fundamental IMO! :)

To give an idea of the speedup this brings, I managed a build of a GUI
image in 6 minutes 14 seconds which included recompiling a package that
had changed and all the -native packages. I used the ASSUME_PROVIDED at
the end of the mail to skip some -native packages I didn't need in this
case.

Neat features:

* If the PR of any package has changed it will rebuild just those 
  changed packages since it realises the staging packages aren't current
  enough.
* When you clean a package, the staged files are uninstalled from 
  staging.
* Any package can be rebuilt, altered etc. nearly the same as a normal 
  poky build bearing in mind the need for "-c fetch -f".
* -cross packages are covered by using meta-toolchain.

I've not yet tried installing just the depends of a given recipe but
this should be possible and will introduce a neat way of testing recipe
DEPENDS :).

Anyone feeling brave can try this, just keep in mind it is highly
experimental. There are bugs and work remains although hopefully others
can help from here. It has a lot of potential and I suspect its a
glimpse into the future :).

Cheers,

Richard

ASSUME_PROVIDED += "\
openssl-native \
git-native \
qemu-native \
libtool-native \
gettext-native \
automake-native \
perl-native \
libxml-parser-perl-native \
dbus-native \
libxml2-native \
db-native \
pkgconfig-native \
gtk-doc-native \
tzcode-native \
xorg-headers-native \
glib-2.0-native \
dbus-glib-native \
intltool-native \
desktop-file-utils-native \
pax-util-native \
freetype-native \
fontconfig-native \
unzip-native \
util-macros-native \
flex-native \
curl-native \
zlib-native \
file-native \
bison-native \
ncurses-native"



