Received: from [209.85.217.19] (helo=mail-gx0-f19.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <maurizio.rottin@gmail.com>) id 1KhgCR-0004Rf-PU
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Sep 2008 09:51:19 +0200
Received: by gxk12 with SMTP id 12so2846298gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2008 00:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=gHCJEZGj/u8qaPWDn66q3G3mTM28eX960M4OTd6uhgA=;
	b=aVrHPcK4eGIMQkbD7pQFxCNf9/qWl2eVXGdtvhF71nnd32dRIFXbfT3NPsKt0alqje
	x6VjfdA71MycetaRPPtpjjC+Ie93ru5NFHUgZt8Pbsc6mVRdgkVA0w1/ahXmdL58a2LH
	SAt8sj4rZ1XRWg0yHVEF3vwLnm9Rgz1nUFF1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=tr4+/D8S5f1Phpsg2W1wkqh/8MP6I73nRqqW8jTRiB92PzgbxEbyQkYvQLLUKjU5vP
	lZH5q5qQXbNJtJNgRDj9NB0e12PFJvgj9hlYiEfONKbmZuvhK1S9bwsV8ed7yxE6wlMo
	f67V+h1Mlx0Ap0NJKF4KNoYuirJof7h/xfyzA=
Received: by 10.150.230.15 with SMTP id c15mr1139111ybh.26.1222069664545;
	Mon, 22 Sep 2008 00:47:44 -0700 (PDT)
Received: by 10.151.84.13 with HTTP; Mon, 22 Sep 2008 00:47:44 -0700 (PDT)
Message-ID: <e83473390809220047j44f077b2kf2a84321cf7a827@mail.gmail.com>
Date: Mon, 22 Sep 2008 09:47:44 +0200
From: "Maurizio Rottin" <maurizio.rottin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: tzdata/tzcode fetch fails, outdated...and compile fails
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
X-List-Received-Date: Mon, 22 Sep 2008 07:51:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi,
i need to compile openntpd, but tzdata and tzcode version 2007 are no
more on the ftp server.

i did just
cp /stuff/org.openembedded.dev/packages/tzdata/tzdata_2007k.bb
/stuff/org.openembedded.dev/packages/tzdata/tzdata_2008f.bb
cp /stuff/org.openembedded.dev/packages/tzcode/tzcode-native_2007k.bb
/stuff/org.openembedded.dev/packages/tzcode/tzcode-native_2008e.bb

and since the versions 2008f and 2008e are different, the file
tzcode-native_2008e.bb must be edited to reflect SRC_URI
ftp://elsie.nci.nih.gov/pub/tzdat-2008f.tar.gz

then if i try to bitbake openntpd i get the following error:
------------------------------------------------------------------------------------------
NOTE: Handling BitBake files: | (5578/5578) [100 %]
NOTE: Parsing finished. 5306 cached, 0 parsed, 272 skipped, 0 masked.
NOTE: build 200809221139: started

OE Build Configuration:
BB_VERSION        = "1.8.10"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "4ac14ced8bc6330634ea2b24a201a4f6a556ef24"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-uclibc"
MACHINE           = "smdk2440"
DISTRO            = "mau-oe-uclibc"
DISTRO_VERSION    = ".dev-snapshot-20080922"
TARGET_FPU        = "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 141 of 264 (ID: 170,
/stuff/org.openembedded.dev/packages/pkgconfig/pkgconfig-native_0.22.bb,
do_configure)
NOTE: package pkgconfig-native-0.22: started
NOTE: package pkgconfig-native-0.22-r7: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows
(/stuff/org.openembedded.dev/packages/tzcode/tmp/work/pkgconfig-native-0.22-r7/temp/log.do_configure.26385)
| libtoolize: putting auxiliary files in `.'.
| libtoolize: linking file `./ltmain.sh'
| libtoolize: You should add the contents of the following files to
`aclocal.m4':
| libtoolize:
`/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/share/aclocal/libtool.m4'
| libtoolize:
`/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/share/aclocal/ltoptions.m4'
| libtoolize:
`/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/share/aclocal/ltversion.m4'
| libtoolize:
`/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/share/aclocal/ltsugar.m4'
| libtoolize:
`/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/share/aclocal/lt~obsolete.m4'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
| libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
| libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| NOTE: Running
/stuff/org.openembedded.dev/packages/tzcode/tmp/work/pkgconfig-native-0.22-r7/pkg-config-0.22//configure
                   --build=i686-linux
--host=i686-linux               --target=i686-linux
 --prefix=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr
             --exec_prefix=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr

--bindir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/bin

--sbindir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/sbin
               --libexecdir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/libexec
        --datadir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/share

--sysconfdir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/etc

--sharedstatedir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/com

--localstatedir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/var

--libdir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/lib

--includedir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/include

--oldincludedir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/include

--infodir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/share/info

--mandir=/stuff/org.openembedded.dev/packages/tzcode/tmp/staging/i686-linux/usr/share/man
                                           ...
| checking for a BSD-compatible install... /usr/bin/install -c
| checking whether build environment is sane... yes
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| configure: error: cannot run /bin/sh ./config.sub
| FATAL: oe_runconf failed
NOTE: Task failed:
/stuff/org.openembedded.dev/packages/tzcode/tmp/work/pkgconfig-native-0.22-r7/temp/log.do_configure.26385
NOTE: package pkgconfig-native-0.22-r7: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package pkgconfig-native-0.22: failed
ERROR: Build of
/stuff/org.openembedded.dev/packages/pkgconfig/pkgconfig-native_0.22.bb
do_configure failed
ERROR: Task 170
(/stuff/org.openembedded.dev/packages/pkgconfig/pkgconfig-native_0.22.bb,
do_configure) failed
NOTE: Tasks Summary: Attempted 140 tasks of which 140 didn't need to
be rerun and 1 failed.
ERROR: '/stuff/org.openembedded.dev/packages/pkgconfig/pkgconfig-native_0.22.bb'
failed
-----------------------------------------------------------------------------------------------------------------------

i'm not really into the aclocal mechanism, then can you help in
throubleshooting?

thanks,

-- 
mr


