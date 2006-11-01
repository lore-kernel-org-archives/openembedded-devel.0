Received: from [130.94.188.223] (helo=porcine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jimham@porcine.com>) id 1GfNj6-0008CK-KC
	for openembedded-devel@openembedded.org; Wed, 01 Nov 2006 22:34:24 +0100
Received: (qmail 84729 invoked by uid 15583); 1 Nov 2006 21:33:33 -0000
Received: from unknown (HELO [192.168.0.253]) ([66.159.230.24])
	(envelope-sender <jimham@porcine.com>)
	by 130.94.188.223 (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	1 Nov 2006 21:33:33 -0000
From: Jim Ham <jimham@porcine.com>
To: openembedded-devel@lists.openembedded.org
Organization: Porcine Associates
Date: Wed, 01 Nov 2006 13:33:32 -0800
Message-Id: <1162416812.18790.14.camel@linux.site>
Mime-Version: 1.0
X-Mailer: Evolution 2.4.0 
Subject: bitbake gs fails
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
X-List-Received-Date: Wed, 01 Nov 2006 21:34:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I just got OE working yesterday, so please bear with me if I'm making
any obvious mistakes.

Problem #1: The "file" package is on the dependency list and fails

I found that the archive referred to in "file_4.16.bb" 
"ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz" only has rev 4.17 and
4.18, no 4.16. I changed the name of the .bb files to xxx4.17.bb and
this task completed. As I have not yet made gs completely I don't know
if I broke something or not.

Problem #2: The qemu package is on the dependency list and fails

Apparently qemu wants gcc <4.0. Here's the results. My target is an
Arcom Viper SBC that has a PXA255 on it. It looks like the "tosa"
configuration is pretty close.

OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "95d2b2a99ed6c847a4d694730352bf03fab11239"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "tosa"
DISTRO         = "familiar"
DISTRO_VERSION = "unstable-20061101"
TARGET_FPU     = ""

NOTE: multiple providers are available (glibc, glibc-intermediate);
NOTE: consider defining
PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc
NOTE: multiple providers are available (qemu-native,
qemu-qop-nogfx-native);
NOTE: consider defining PREFERRED_PROVIDER_qemu-native
NOTE: package qemu-native-0.8.2+cvs20060723: started
NOTE: package qemu-native-0.8.2+cvs20060723-r1: task do_configure:
started
ERROR: function do_configure failed
ERROR: log data follows (/stuff/tmp/work/i686-linux/qemu-native-0.8.2
+cvs20060723-r1/temp/log.do_configure.18828)
| NOTE: Running /stuff/tmp/work/i686-linux/qemu-native-0.8.2
+cvs20060723-r1/qemu/configure                  --build=i686-linux
--host=i686-linux               --target=i686-linux
--prefix=/stuff/tmp/staging
--exec_prefix=/stuff/tmp/staging/i686-linux
--bindir=/stuff/tmp/staging/i686-linux/bin
--sbindir=/stuff/tmp/staging/i686-linux/bin
--libexecdir=/stuff/tmp/staging/i686-linux/libexec
--datadir=/stuff/tmp/staging/i686-linux/share
--sysconfdir=/stuff/tmp/staging/etc
--sharedstatedir=/stuff/tmp/staging/com
--localstatedir=/stuff/tmp/staging/var
--libdir=/stuff/tmp/staging/i686-linux/lib
--includedir=/stuff/tmp/staging/i686-linux/include
--oldincludedir=/stuff/tmp/staging/i686-linux/include
--infodir=/stuff/tmp/staging/i686-linux/share/info
--mandir=/stuff/tmp/staging/i686-linux/share/man                                         ...
| ERROR: "gcc" looks like gcc 4.x
| QEMU is known to have problems when compiled with gcc 4.x
| It is recommended that you use gcc 3.x to build QEMU
| To use this compiler anyway, configure with --disable-gcc-check
| FATAL: oe_runconf failed
NOTE: Task failed: /stuff/tmp/work/i686-linux/qemu-native-0.8.2
+cvs20060723-r1/temp/log.do_configure.18828
NOTE: package qemu-native-0.8.2+cvs20060723-r1: task do_configure:
failed
ERROR: TaskFailed event exception, aborting
NOTE: package qemu-native-0.8.2+cvs20060723: failed
ERROR: Build of gs failed

Can anyone tell me how to pass the "--disable-gcc-check" argument into
configure? I don't really want to go back to gcc 3.xx. Is there a better
way of handling this?

I'd appreciate any general pointers to help me along with this process.

Regards,

Jim Ham




