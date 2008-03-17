Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JbMaW-0005MW-F9
	for openembedded-devel@openembedded.org; Mon, 17 Mar 2008 22:09:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2HL9ies027158
	for <openembedded-devel@openembedded.org>; Mon, 17 Mar 2008 21:09:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26931-07 for <openembedded-devel@openembedded.org>;
	Mon, 17 Mar 2008 21:09:39 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2HL9bL0027150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 17 Mar 2008 21:09:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 17 Mar 2008 21:09:39 +0000
Message-Id: <1205788179.4552.69.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Packaged staging update
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
X-List-Received-Date: Mon, 17 Mar 2008 21:09:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I've just committed some fixes for various issues including:

* Including the target triplet in the staging package name
* Using BUILD_SYS as the architecture for the staging packages
* Fixing some perl native package staging issues
* Use DEPLOY_DIR_IPK and DEPLOY_DIR_DEB, not some assumed value
* Fix handling of packaged with split PR (e.g. python)

The current list of known issues and possible enhancements is:

* Moving SHLIBSDIR/PKGDATA_DIR to somewhere outside staging to reduce 
  lock contention
* Add code to the do_deploy methods so they work with packaged-staging
* Consider how to handle .la file corruption if TMPDIR changes
* Identify any other TMPDIR dependent paths
* Fix a couple of other bugs I've noticed in staging coverage so far
(sqlite stages a file in its compile function for example!)
* Fetching of packaged staging packages from a mirror or other sources
* When accelerating a build gcc-cross-initial can be installed instead 
  of gcc-cross

I've been testing with some builds and Angstrom in the following way:

bitbake meta-toolchain
bitbake gpe-image
mv tmp tmp-orig
mkdir -p tmp/deploy/glibc/pstage
cp -pr tmp-orig/deploy/glibc/pstage/* tmp/deploy/glibc/pstage/
bitbake meta-toolchain
bitbake gpe-image
diff -qr tmp-orig/staging/ tmp/staging/
diff -qr tmp-orig/cross/ tmp/cross/

The idea is if packaged-staging is working properly this will succeed
and there should be few differences between the staging areas. The
result of one of my tests follows:

Only in tmp-orig/staging/arm-angstrom-linux-gnueabi/shlibs: perl-lib.list
Only in tmp-orig/staging/arm-angstrom-linux-gnueabi/shlibs: perl-lib.ver
Only in tmp-orig/staging/arm-angstrom-linux-gnueabi/usr/include: device_symbols.h
Only in tmp-orig/staging/arm-angstrom-linux-gnueabi/usr/include/python2.5: pyconfig.h
Only in tmp-orig/staging/arm-angstrom-linux-gnueabi/usr/include: sqlite3.h
Files tmp-orig/staging/arm-angstrom-linux-gnueabi/usr/include/X11/extensions/scrnsaver.h and tmp/staging/arm-angstrom-linux-gnueabi/usr/include/X11/extensions/scrnsaver.h differ
Only in tmp-orig/staging/arm-angstrom-linux-gnueabi/usr/lib/pkgconfig: libsoup-2.2.pc
Only in tmp-orig/staging/arm-angstrom-linux-gnueabi/usr/lib: python2.5
Only in tmp-orig/staging/arm-angstrom-linux-gnueabi/usr/lib: terminfo
Only in tmp-orig/staging/pkgdata: all-angstrom-linux
Files tmp-orig/staging/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libg2c and tmp/staging/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libg2c differ
Files tmp-orig/staging/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libg2c-dev and tmp/staging/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libg2c-dev differ
Files tmp-orig/staging/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libgcc and tmp/staging/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libgcc differ
Files tmp-orig/staging/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libstdc++ and tmp/staging/pkgdata/armv5te-angstrom-linux-gnueabi/runtime/libstdc++ differ
Only in tmp-orig/staging/spitz-angstrom-linux-gnueabi/kernel/scripts/genksyms: .tmp_versions
Files tmp-orig/staging/x86_64-linux/etc/ipkg.conf and tmp/staging/x86_64-linux/etc/ipkg.conf differ
Files tmp-orig/staging/x86_64-linux/etc/ipkg-sdk.conf and tmp/staging/x86_64-linux/etc/ipkg-sdk.conf differ
Only in tmp-orig/staging/x86_64-linux: shlibs
Files tmp-orig/staging/x86_64-linux/usr/bin/arfile.pyc and tmp/staging/x86_64-linux/usr/bin/arfile.pyc differ
Files tmp-orig/staging/x86_64-linux/usr/bin/ipkg.pyc and tmp/staging/x86_64-linux/usr/bin/ipkg.pyc differ
Only in tmp-orig/staging/x86_64-linux/usr/include: c++
Files tmp-orig/staging/x86_64-linux/usr/lib/libipkg.a and tmp/staging/x86_64-linux/usr/lib/libipkg.a differ
Files tmp-orig/staging/x86_64-linux/usr/lib/libltdl.a and tmp/staging/x86_64-linux/usr/lib/libltdl.a differ
Only in tmp-orig/staging/x86_64-linux/usr/lib/terminfo/r: rxvt-unicode
Files tmp-orig/staging/x86_64-linux/usr/share/man/man1/guards.1 and tmp/staging/x86_64-linux/usr/share/man/man1/guards.1 differ
Only in tmp-orig/staging/x86_64-linux/usr/share/terminfo/r: rxvt-unicode

The idea is you should also be able to continue to build other targets
with packaged staging active and those builds should succeed since
staging is no different to the original.

Some of these are clearly red herrings which can be ignored (lots of the
x86_64 differences), others are real problems (sqlite3.h). There are
also some interesting problems (libg2c is being built by both gcc-cross
and gcc if understand correctly).

This highlights that we really need to teach the packaging system more
about identifying conflicts over shared files. We do have the ability to
snapshot staging more often and could identify "unauthorised" changes
too.

All things considered I'm pleased with the way this is going though and
welcome any feedback from others keeping the above known issues in mind.

Cheers,

Richard



