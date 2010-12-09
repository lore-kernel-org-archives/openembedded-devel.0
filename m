Received: from smtp1.irobot.com ([206.83.81.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PQjsG-0008Jy-6i
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:01:45 +0100
X-AuditID: 0a460614-b7b13ae0000039bc-31-4d010b1cb29b
Received: from webmail.irobot.com (Unknown_Domain [10.70.6.12])
	by smtp1.irobot.com (Symantec Brightmail Gateway) with SMTP id
	B2.4D.14780.C1B010D4; Thu,  9 Dec 2010 12:00:12 -0500 (EST)
Received: from fever2.wardrobe.irobot.com ([192.168.163.187]) by
	webmail.irobot.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 9 Dec 2010 12:00:13 -0500
Received: from [192.168.69.108] ([192.168.69.108]) by
	fever2.wardrobe.irobot.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 9 Dec 2010 12:00:12 -0500
Message-ID: <4D010B10.1060903@gmail.com>
Date: Thu, 09 Dec 2010 09:00:00 -0800
From: Tim Harvey <harvey.tim@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
Newsgroups: gmane.comp.handhelds.openembedded
To: openembedded-devel@lists.openembedded.org
References: <4D00F942.6040103@comcast.net>
In-Reply-To: <4D00F942.6040103@comcast.net>
X-OriginalArrivalTime: 09 Dec 2010 17:00:12.0453 (UTC)
	FILETIME=[8B2B9550:01CB97C2]
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 206.83.81.187
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Release-2010.12 build failure - eglibc do_package Failed
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
X-List-Received-Date: Thu, 09 Dec 2010 17:01:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2010 07:44 AM, Ed Nelson wrote:
> I am using the latest release-2010.12 and doing a completely new build
> for the AT91SAM9g20 development board(no tmp directory and source
> directory empty).
> I am trying to build a base image that includes python.
> My build machine is running Ubuntu 10.04LTS.
>
> Build Configuration:
> BB_VERSION = "1.10.0"
> METADATA_BRANCH = "release-2010.12"
> METADATA_REVISION = "dec3967"
> TARGET_ARCH = "arm"
> TARGET_OS = "linux-gnueabi"
> MACHINE = "at91sam9g20ek"
> DISTRO = "angstrom"
> DISTRO_VERSION = "next"
> TARGET_FPU = "soft"
>
>
> The build fails on eglibc do_package with the following information.
>
> NOTE: Running task 1006 of 4003 (ID: 143,
> /home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb,
> do_package)
> NOTE: package eglibc-2.12-r17.7+svnr11982: task do_package: Started
> NOTE: preparing tree for binary locale generation
> NOTE: generating locale es_NI (UTF-8)
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb do_package
> failed
> ERROR: Task 143
> (/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb,
> do_package) failed with 256
> ERROR:
> '/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb'
> failed
> NOTE: Task failed: localedef returned an error (command was
> PATH="/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/usr/armv5te/bin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/usr/sbin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/usr/bin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/sbin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux//bin:/home/ed/oe/oe-release-2010.12/bitbake-1.10.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
> I18NPATH="/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree/usr/share/i18n"
> qemu-arm -s 1048576 -r 2.6.24 -L
> /home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree
> -E
> LD_LIBRARY_PATH=/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree/lib
> /home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree/bin/localedef
> --force --old-style --no-archive
> --prefix=/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree
> --inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).
> NOTE: package eglibc-2.12-r17.7+svnr11982: task do_package: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb do_package
> failed
> ERROR: Task 143
> (/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb,
> do_package) failed with 256
> ERROR:
> '/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb'
> failed
> ERROR:
> '/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb'
> failed
>
> There are 2 eglibc directors in
> ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi
> eglibc-2.12-r17.7+svnr11982
> and
> eglibc-intial-2.12-r17.7+svnr11982
>
> The file run.package_do_package.23963 was empty
>
> Any ideas
> Thanks
> Ed

I've started seeing the same recently with glibc:

Build system: native Ubuntu 10.04 i686

Build Configuration:
BB_VERSION        = "1.11.0"
METADATA_BRANCH   = ""origin/release-2010.12""
METADATA_REVISION = ""a5eeff8b2e4cb9ffa86af214850dcbbe32432242""
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "overoevm"
DISTRO            = "angstrom"
DISTRO_VERSION    = "devel"
TARGET_FPU        = "hard"
...
ERROR: Task 218 
(/home/tharvey/oe/commonos-sync/org.openembedded.dev/recipes/glibc/glibc_2.9.bb, 
do_package) failed with 256
NOTE: Task failed: localedef returned an error (command was 
PATH="/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux/usr/armv7a/bin:/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux/usr/sbin:/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux/usr/bin:/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux/sbin:/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux//bin:/home/tharvey/oe/commonos-sync/bitbake/bin:/home/tharvey/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" 
I18NPATH="/home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree/usr/share/i18n" 
qemu-arm -s 1048576 -r 2.6.16 -L 
/home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree 
-E 
LD_LIBRARY_PATH=/home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree/lib 
-cpu cortex-a8 
/home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree/bin/localedef 
--force --old-style --no-archive 
--prefix=/home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree 
--inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).


This doesn't seem to occur all the time and has only started recently 
from what I can tell

Tim


