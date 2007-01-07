Received: from [204.127.192.83] (helo=rwcrmhc13.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <3rdshift@comcast.net>) id 1H3QBM-0006Yq-FF
	for openembedded-devel@openembedded.org; Sun, 07 Jan 2007 06:02:56 +0100
Received: from dollar.3rdshift.com
	(c-69-251-178-175.hsd1.md.comcast.net[69.251.178.175])
	by comcast.net (rwcrmhc13) with ESMTP
	id <20070107050124m1300iqls6e>; Sun, 7 Jan 2007 05:01:25 +0000
Received: from dollar.3rdshift.com (localhost.localdomain [127.0.0.1])
	by dollar.3rdshift.com (8.13.7/8.13.6) with ESMTP id l0751Nkp023048
	for <openembedded-devel@openembedded.org>;
	Sun, 7 Jan 2007 00:01:23 -0500
Received: (from vlg@localhost)
	by dollar.3rdshift.com (8.13.7/8.13.7/Submit) id l0751N5r023047
	for openembedded-devel@openembedded.org; Sun, 7 Jan 2007 00:01:23 -0500
From: VLG <3rdshift@comcast.net>
To: openembedded-devel@openembedded.org
Organization: 3rdShift Inc.
Date: Sun, 07 Jan 2007 00:01:23 -0500
Message-Id: <1168146083.2742.8.camel@dollar.3rdshift.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 (2.6.3-1.fc5.5) 
Subject: qemu-native-0.8.2-r2 fails to build
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
X-List-Received-Date: Sun, 07 Jan 2007 05:02:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I am trying to build 'openzaurus-3.5.4.2' distro for 'collie' in the
org.openembedded.oz354x/ without much luck:

$ bitbake gpe-image
--------------------------------------------------------------------------------
OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "format_version "1"

new_manifest [0000000000000000000000000000000000000004]

old_revision [87c2d837ea5586793e98a4604630ceb3fa70dc7c]"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "collie"
DISTRO         = "openzaurus"
DISTRO_VERSION = "3.5.4.2-rc2"
TARGET_FPU     = "soft"

NOTE: package qemu-native-0.8.2: started
NOTE: package qemu-native-0.8.2-r2: task do_fetch: started
NOTE: package qemu-native-0.8.2-r2: task do_fetch: completed
NOTE: package qemu-native-0.8.2-r2: task do_patch: started
NOTE: Applying patch '2.6.17-linux-libc-headers-fix.patch'
NOTE: Applying patch 'debug.patch'
ERROR: function do_patchcmd failed
ERROR: log data follows
(/extra/stuff/tmp/work/qemu-native-0.8.2-r2/temp/log.do_patchcmd.22315)
| Importing
patch /extra/stuff/org.openembedded.oz354x/packages/qemu/qemu-native-0.8.2/./debug.patch (stored as debug.patch)
| cp: cannot stat
`/extra/stuff/org.openembedded.oz354x/packages/qemu/qemu-native-0.8.2/./debug.patch': No such file or directory
| Failed to import patch debug.patch
NOTE: Task
failed: /extra/stuff/tmp/work/qemu-native-0.8.2-r2/temp/log.do_patchcmd.22315
NOTE: package qemu-native-0.8.2-r2: task do_patch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package qemu-native-0.8.2: failed
----------------------------------------------------------------------------------

My local.conf file (if that matters)
---------------------------------------------------------------------
DL_DIR = "/extra/stuff/sources"
BBFILES = "/extra/stuff/org.openembedded.oz354x/packages/*/*.bb"
BBMASK = ""
MACHINE = "collie"
TARGET_ARCH = "arm"
DISTRO = "openzaurus-3.5.4.2"
IMAGE_FSTYPES = "jffs2 tar"
BBINCLUDELOGS = "yes"
---------------------------------------------------------------------

Strangely enough, the same builds fine against org.openembedded.dev
branch.
Any ideas?

BTW,  if I set DISTRO to openzaurus-3.5.4, the version check fails (???)
although the /extra/stuff/org.openembedded.oz354x/conf/distro has
openzaurus-3.5.4.conf

thanks,
-Vlad


