Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MA7va-0004wG-O6
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 May 2009 21:39:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id A620D1409733
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2009 21:31:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HECbtAgorUQ
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2009 21:31:26 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 7B1331409731
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2009 21:31:26 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 May 2009 21:31:14 +0200
Message-Id: <1243625474.7500.25.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: [RFC] remove CONFIG_SYSFS_DEPRECATED from kernels
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
X-List-Received-Date: Fri, 29 May 2009 19:40:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hallo.

I would like to propose removal of =EF=BB=BFCONFIG_SYSFS_DEPRECATED* from=
 all
kernel configurations. Only distros with ancient kernels without udev,
distros with proprietary applications depending on the old /sys
structure should stick at the old /sys structure (and old udev).

It would be nice to migrate all updated distros to the new /sys
structure. All major desktop distributions migrated several years ago
and we may expect end of support of the old /sys layout (udev already
did it).

Migration should simplify life of developers of hardware control
utilities.

For the migration see instructions below. It should be easy to migrate.
For example migration of angstrom for spitz required probably just one
line change in the whole distro.

Rationale:

CONFIG_SYSFS_DEPRECATED* forces old /sys file system structure, which
was deprecates sometimes around linux-2.6.15. Major distributions
already left this structure (before 2007).

Sticking with the deprecated /sys structure may bring problems for new
versions of software. For example latest udev does not support
CONFIG_SYSFS_DEPRECATED* any more.

Actually, CONFIG_SYSFS_DEPRECATED* together with udev-141 breaks
touchscreen in the latest oe.dev angstrom builds.
http://projects.linuxtogo.org/pipermail/angstrom-distro-devel/2009-May/00=
3252.html

Instructions:

Use script below to find potential candidates (users of changed parts
of /sys).

Then skip packages that are maintained and packaged for major
distributions. They were already fixed.

Check the rest for following problems:

- Absolute paths into /sys/class. These paths may change.

- Not expecting symlinks in /sys/class. /sys/class will now contain
directories with symlinks instead of directories. (=3D> commands with -R
will not recurse)

#!/bin/sh
cd tmp/work

grep -rl '/sys/\(class\|devices\)' */*/install 2>/dev/null |
sed 's:^[^/]*/::;s:/.*::' |
uniq >../../sys_accesses.lst

grep -rl '/sys/\(block\|bus\|class\|dev\|devices\|firmware\|fs\|kernel\|m=
odule\|power\)' */*/*/configure* 2>/dev/null |
sed 's:^[^/]*/::;s:/.*::' |
uniq >../../sys_host_checks.lst



________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



