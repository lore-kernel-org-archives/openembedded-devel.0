Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Pg1Ek-0004Bf-Hd
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 21:36:06 +0100
Received: by bwz10 with SMTP id 10so932605bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 12:35:21 -0800 (PST)
Received: by 10.204.66.79 with SMTP id m15mr2343214bki.124.1295554847533;
	Thu, 20 Jan 2011 12:20:47 -0800 (PST)
Received: from mozart.localnet (95-29-184-245.broadband.corbina.ru
	[95.29.184.245])
	by mx.google.com with ESMTPS id a17sm4160856bku.11.2011.01.20.12.20.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 Jan 2011 12:20:46 -0800 (PST)
Sender: Yury Bushmelev <jay@jay-tech.ru>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jan 2011 23:20:40 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.36-ARCH; KDE/4.5.5; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201101202320.40462.jay4mail@gmail.com>
Subject: wrong paths inside autotools (and few others)
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
X-List-Received-Date: Thu, 20 Jan 2011 20:36:06 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello!

I've built minimal/qemuarm/native-sdk-image to do quick testing of kexecboot in qemu.

But I've found that autotools (at least) have wrong paths inside. Look at grep results below.

root@qemuarm:/usr/bin# grep -r sysroot * 2>/dev/null | grep -v Binary
arm-oe-linux-gnueabi-gccbug:configured with: /var/tmp/oe/minimal/arm/work/armv5te-oe-linux-gnueabi/gcc-4.5-r30.1+svnr168622/gcc-4_5-
branch/configure --build=x86_64-linux --host=arm-oe-linux-gnueabi --target=arm-oe-linux-gnueabi --prefix=/usr --exec_prefix=/usr --bindir=/usr/bin --
sbindir=/usr/sbin --libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com --localstatedir=/var --libdir=/usr/lib --
includedir=/usr/include --oldincludedir=/usr/include --infodir=/usr/share/info --mandir=/usr/share/man --with-libtool-
sysroot=/var/tmp/oe/minimal/arm/sysroots/armv5te-oe-linux-gnueabi --disable-largefile --disable-nls --enable-ipv6 --with-gnu-ld --enable-shared --
enable-languages=c,c++,objc --enable-threads=posix --disable-multilib --enable-c99 --enable-long-long --enable-symvers=gnu --enable-libstdcxx-
pch --program-prefix=arm-oe-linux-gnueabi- --enable-target-optspace --enable-lto --enable-libssp --disable-bootstrap --disable-libgomp --disable-
libmudflap --with-float=soft --with-local-prefix=/usr/local --with-gxx-include-dir=/usr/include/c++/4.5.3 --with-build-
sysroot=/var/tmp/oe/minimal/arm/sysroots/armv5te-oe-linux-gnueabi --enable-__cxa_atexit
autoheader:#! /var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl
autoheader:eval 'case $# in 0) exec /var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0";; *) exec 
/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0" "$@";; esac'
autom4te:eval 'case $# in 0) exec /var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0";; *) exec 
/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0" "$@";; esac'
autom4te:my $m4 = $ENV{"M4"} || '/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/m4';
autoreconf:eval 'case $# in 0) exec /var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0";; *) exec 
/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0" "$@";; esac'
autoscan:eval 'case $# in 0) exec /var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0";; *) exec 
/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0" "$@";; esac'
autoupdate:eval 'case $# in 0) exec /var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0";; *) exec 
/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0" "$@";; esac'
autoupdate:my $m4 = $ENV{"M4"} || '/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/m4';
chkdupexe:#!/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -w
cvsbug:MKTEMP="/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/mktemp"
fixcvsdiff:#!/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -w
ifnames:eval 'case $# in 0) exec /var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0";; *) exec 
/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl -S "$0" "$@";; esac'
rcs2log:: ${MKTEMP="/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/mktemp"}
recountdiff:#!/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl
splitdiff:#!/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl
unwrapdiff:#!/var/tmp/oe/minimal/arm/sysroots/x86_64-linux/usr/bin/perl

Next problem is unexpanded '@autom4te_perllibdir@' in /usr/bin/gnu-configize:29:
  my $datadir = $ENV{'autom4te_perllibdir'} || '@autom4te_perllibdir@';

This prevents gnu-configize to finish:
autoreconf: running: gnu-configize
Can't locate Autom4te/ChannelDefs.pm in @INC (@INC contains: @autom4te_perllibdir@ /etc/perl /usr/local/lib/perl/5.8.8 
/usr/local/share/perl/5.8.8 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.8 /usr/share/perl/5.8 /usr/local/lib/site_perl   .) at /usr/bin/gnu-configize line 
40.

If you need more info feel free to contact me.

P.S. May be add something like 'grep sysroots' against some files (perl, m4, sh) to QA testing?

-- 
Yury Bushmelev


