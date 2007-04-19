Received: from [213.173.72.1] (helo=tor.twin.at)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <patrick.steiner@a1.net>) id 1HeeGV-0006uG-Ab
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2007 23:34:07 +0200
Received: from [213.173.86.202] (helo=isengard.skynet)
	by tor.twin.at with esmtp (Exim 4.66)
	(envelope-from <patrick.steiner@a1.net>) id 1HeeIe-0002kp-Qx
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2007 23:36:21 +0200
Received: from tux4u.skynet (tux4u.skynet [192.168.0.31])
	by isengard.skynet (Postfix) with ESMTP id C530A14C15E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2007 23:34:01 +0200 (CEST)
From: Patrick Steiner <patrick.steiner@a1.net>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Apr 2007 23:33:59 +0200
User-Agent: KMail/1.9.6
MIME-Version: 1.0
Message-Id: <200704192334.00169.patrick.steiner@a1.net>
Subject: strange build errors after (Checking Package:...)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2007 21:34:07 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi,

i have some problems with latest OE (bitbake)

i currently try to build a gpephone image but i get some errors on every 
package.

NOTE: Running task 321 of 3196 (ID: 
1373, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb, 
do_qa_configure)
NOTE: package libxdmcp-1.0.2: started
NOTE: package libxdmcp-1_1.0.2-r0: task do_qa_configure: started
NOTE: Checking sanity of the config.log file
NOTE: package libxdmcp-1_1.0.2-r0: task do_qa_configure: completed
NOTE: package libxdmcp-1.0.2: completed
NOTE: Running task 322 of 3196 (ID: 
1366, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb, 
do_compile)
NOTE: package libxdmcp-1.0.2: started
NOTE: package libxdmcp-1_1.0.2-r0: task do_compile: started
NOTE: package libxdmcp-1_1.0.2-r0: task do_compile: completed
NOTE: package libxdmcp-1.0.2: completed
NOTE: Running task 323 of 3196 (ID: 
1367, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb, 
do_install)
NOTE: package libxdmcp-1.0.2: started
NOTE: package libxdmcp-1_1.0.2-r0: task do_install: started
NOTE: package libxdmcp-1_1.0.2-r0: task do_install: completed
NOTE: package libxdmcp-1.0.2: completed
NOTE: Running task 324 of 3196 (ID: 
1371, /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb, 
do_package)
NOTE: package libxdmcp-1.0.2: started
NOTE: package libxdmcp-1_1.0.2-r0: task do_package: started
NOTE: Couldn't find shared library provider for libc.so.6
NOTE: Couldn't find shared library provider for libc.so.6
NOTE: couldn't find pkgconfig module 'xproto' in any package
NOTE: DO PACKAGE QA
NOTE: Checking Package: libxdmcp-dbg
ERROR: Can not check RPATH scanelf not found
ERROR: Error in executing:
ERROR: Exception:exceptions.SystemExit Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
ERROR: Exception:exceptions.SystemExit Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
ERROR: Exception:exceptions.SystemExit Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
ERROR: Exception:exceptions.SystemExit Message:1
ERROR: Printing the environment of the function
ERROR: Build 
of /home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb 
do_package failed
ERROR: Task 1371 
(/home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb, 
do_package) failed
ERROR: '/home/pat/devel/oe/oe/org.openembedded.dev_typhoon/packages/xorg-lib/libxdmcp_1.0.2.bb' 
failed


if i restart bitbake gpephone-image the package works an another one exits 
with this error. has anyone a ideas what happens?

here is my oe build config:
OE Build Configuration:
BB_VERSION     = "1.8.0"
OE_REVISION    = "<unknown>"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "htctornado"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20070419"
TARGET_FPU     = "soft"

regards,

 patrick (law)

-- 
Patrick Steiner | patrick.steiner@a1.net
ICQ: 128261350
WWW: http://helmsdeep.homelinux.net/~pat
 
working on (tux4u.skynet):
Fedora Core release 6 (Zod)
GNU/Linux 2.6.20-1.2944.fc6


