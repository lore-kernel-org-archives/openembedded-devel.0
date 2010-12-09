Received: from qmta15.emeryville.ca.mail.comcast.net ([76.96.27.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1PQigk-0003fk-3W
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 16:45:52 +0100
Received: from omta09.emeryville.ca.mail.comcast.net ([76.96.30.20])
	by qmta15.emeryville.ca.mail.comcast.net with comcast
	id h1fG1f0020S2fkCAF3kDDE; Thu, 09 Dec 2010 15:44:13 +0000
Received: from [192.168.1.101] ([71.202.66.210])
	by omta09.emeryville.ca.mail.comcast.net with comcast
	id h3k71f00C4YBSof8V3k8rh; Thu, 09 Dec 2010 15:44:08 +0000
Message-ID: <4D00F942.6040103@comcast.net>
Date: Thu, 09 Dec 2010 07:44:02 -0800
From: Ed Nelson <enelson1000@comcast.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 76.96.27.228
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Release-2010.12 build failure - eglibc do_package Failed
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
X-List-Received-Date: Thu, 09 Dec 2010 15:45:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am using the latest release-2010.12 and doing a completely new build 
for the AT91SAM9g20 development board(no tmp directory  and source 
directory empty).
I am trying to build a base image that includes python.
My build machine is running Ubuntu 10.04LTS.

Build Configuration:
BB_VERSION        = "1.10.0"
METADATA_BRANCH   = "release-2010.12"
METADATA_REVISION = "dec3967"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "at91sam9g20ek"
DISTRO            = "angstrom"
DISTRO_VERSION    = "next"
TARGET_FPU        = "soft"


The build fails on eglibc do_package with the following information.

NOTE: Running task 1006 of 4003 (ID: 143, 
/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb, 
do_package)
NOTE: package eglibc-2.12-r17.7+svnr11982: task do_package: Started
NOTE: preparing tree for binary locale generation
NOTE: generating locale es_NI (UTF-8)
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb do_package 
failed
ERROR: Task 143 
(/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb, 
do_package) failed with 256
ERROR: 
'/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb' 
failed
NOTE: Task failed: localedef returned an error (command was 
PATH="/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/usr/armv5te/bin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/usr/sbin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/usr/bin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/sbin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux//bin:/home/ed/oe/oe-release-2010.12/bitbake-1.10.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" 
I18NPATH="/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree/usr/share/i18n" 
qemu-arm -s 1048576 -r 2.6.24 -L 
/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree 
-E 
LD_LIBRARY_PATH=/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree/lib  
/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree/bin/localedef 
--force --old-style --no-archive 
--prefix=/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree 
--inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).
NOTE: package eglibc-2.12-r17.7+svnr11982: task do_package: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb do_package 
failed
ERROR: Task 143 
(/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb, 
do_package) failed with 256
ERROR: 
'/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb' 
failed
ERROR: 
'/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb' 
failed

There are 2 eglibc directors in 
ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi
eglibc-2.12-r17.7+svnr11982
and
eglibc-intial-2.12-r17.7+svnr11982

The file run.package_do_package.23963 was empty

Any ideas
Thanks
Ed




