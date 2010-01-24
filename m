Received: from asmtpout025.mac.com ([17.148.16.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1NZ8Zu-0000xe-2H
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 20:57:01 +0100
MIME-version: 1.0
Received: from [87.201.169.25] by asmtp025.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KWR00A01LUOCX10@asmtp025.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 10:54:35 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-0908210000 definitions=main-1001240109
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <alpine.LFD.2.00.1001241235020.2367@localhost>
Date: Sun, 24 Jan 2010 22:54:20 +0400
Message-id: <00AC3969-39B6-4A3D-8927-D913353C69C6@mac.com>
References: <687C35F4-E7DC-4898-907F-8C1CE8890887@mac.com>
	<9210BA9D-8420-46C3-BDD6-CEE4E853B42F@mac.com>
	<20100124154357.GG15943@jama>
	<1F9F6029-E5F8-4B85-967C-7FB2C110CFCE@mac.com>
	<alpine.LFD.2.00.1001241235020.2367@localhost>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 17.148.16.100
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: OpenEmbedded Developer <openembedded-devel@lists.openembedded.org>
Subject: Technote Overo-031: How to setup a development environment for the Overo platform using a Fedora-12 x86 64-bit VMware image
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
X-List-Received-Date: Sun, 24 Jan 2010 19:57:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Robert,
                 =20
On Jan 24, 2010, at 9:36 PM, Robert P. J. Day wrote:
>=20
>  once upon a time, i wrote much the same:
>=20
> http://www.crashcourse.ca/wiki/index.php/Angstrom
>=20
> perhaps we should exchange notes to come up with a single complete
> set.

I really like documenting stuff. I end up working on so many different =
things, that I tend to forget stuff after a few weeks, so I make sure I =
document each and every step. And of course share all that back with the =
community. :-)

Here's what I've written so far.=20

Note that there are still some un-resolved errors, such as psyco not =
working for 64-bit environment, and that for android development, I =
think I will need to use sun-jdk-1.5.0

Overview

This document describes how to setup a development environment for the =
Overo platform using a Fedora-12 x86 64-bit VMware image.

Procedure

Step 01.00: Install Fedora 10 into a VMware image.

Ensure that you install the following packages
	- development-libraries
	- development-tools

Create a new user group called =91developers=92.=20

Change the primary group for all developers to the =91developers=92 =
group, e.g. for user =91elvis=92, change the primary group to =
=91developers=92.

Step 02.00: Enable root login.

Step 02.01: Login as a regular user

$ su
# vi /etc/pam.d/gdm

Click =91A=92 and remove user!=3Droot from the following line

auth required pam_succeed_if.so user!=3Droot quiet

Click Esc and then type the following command :wq!

Now modify the gdm-password file

# vi /etc/pam.d/gdm-password

Click =91A=92 and remove user!=3Droot from the following line

auth required pam_succeed_if.so user!=3Droot quiet

Click Esc and then type the following command :wq!

Step 02.03: Modify /etc/sysctl.conf to make vm.mmap_min_addr =3D 0.

# vi /etc/sysctl.conf

Add the following line to the sysctl.conf file
vm.mmap_min_addr =3D 0

Step 02.03: Relogin as root


Step 03.00: Install the vmware tools

$ su
# cd Download/vmware-tools-distrib
# ./vmware-install.pl

You can run the VMware Tools by invoking the following command:

# /usr/bin/vmware-toolbox

To enable advanced X features
=20
1. Manually start /user/bin/vmware-user
2. Log out and log back into your desktop session
3. Restart your X session


Step 04.00: Install Sun JDK 1.5 (optional, only required for android =
development, not yet validated)

$ su
# cd Downloads/jdk-5u12-linux-i586
# ./jdk-5u12-linux-i586-rpm.bin


Step 05.00: Install Psyco JIT compiler (skip this step, doesn't work for =
64-bits yet)

Step 05.01: Download Psyco JIT compiler sources from svn

$ svn co http://codespeak.net/svn/psyco/dist/ psyco-dist

Step 05.02: Run the python installation script as a super user=20

$ su python setup.py install


Step 06.00: Download, build and install kermit

$ cd /tool
$ wget ftp://www.columbia.edu/kermit/test/tar/x.tar.gz
$ tar zxvf x.tar.gz
$ cd ckermit-9.0
$ make linux
$ su
# make install

This will install kermit in /usr/local/bin/

Set the permissions for /dev/ttyUSB0, so that a developer can access the =
Overo USB console.

$ su
# chgrp developers /dev/ttyUSB0


Step 07.00: Setup the Overo build environment

Step 07.01: Check out the OpenEmbedded build system.

$ cd /tool
$ mkdir overo-oe
$ cd overo-oe
$ git clone git://gitorious.org/gumstix-oe/mainline.git =
org.openembedded.dev
$ cd org.openembedded.dev
$ git checkout --track -b overo origin/overo

Step 07.02: Checkout BitBake.

$ cd /tool/overo-oe
$ git clone git://git.openembedded.org/bitbake.git
$ cd bitbake
$ git checkout -b 1.8 --track origin/1.8
$ cd ..


Step 07.03: Creating the OE configuration files and profile.

We now will create a profile script and the configuration files required =
to tailor OE to our needs.

To make this a somewhat easier task, there is a template for the =
required files in the openembedded installation we just did.

Copy these files to your overo-oe directory:

$ cp -r org.openembedded.dev/contrib/gumstix/build .

If you have followed the example installation and placed the build =
system in overo-oe in your home directory, you are now ready to proceed =
to the next step. If you have installed the build system in a different =
location you will need to edit overo-oe/build/profile and change the =
definition of OVEROTOP as appropriate.


Step 07.04: Setup source code caching.

As part of the build process OpenEmbedded downloads source code tarballs =
for the linux kernel, compiler, and other software packages.=20

By default this source code cache will be placed in overo-oe/sources. If =
you would like this cache to be located elsewhere, now is the time to =
edit build/conf/site.conf and set DL_DIR as appropriate.

For example, if you would like to cache the sources in =
/usr/share/sources, perform the following steps:

Add new group for cache management and add operating user to this group.

$ sudo groupadd oe
$ sudo usermod -a -G oe {your_username}

Next make source code storing directory and set owner and permission =
appropriately.

$ sudo mkdir /usr/share/sources
$ sudo chgrp oe /usr/share/sources
$ sudo chmod 0775 /usr/share/sources
$ sudo chmod ug+s /usr/share/sources

Edit the buid/conf/site.conf and set DL_DIR to /usr/share/sources as =
follows:

DL_DIR =3D "/usr/share/sources"

Step 07.05: Improve build performance by modifying site.conf to use =
multiple cores

Edit build/conf/site.conf

PARALLEL_MAKE =3D "-j 6"
BB_NUMBER_THREADS =3D "6"

Step 07.06: Reduce disk space usage by modifying local.conf=20

If you don't need OE to keep around the package source files (and other =
work files), you can add the following entry to your local.conf:

INHERIT +=3D "rm_work"

This will significantly reduce the amount of disk space used.

Step 07.07: Modify your .bashrc file.

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#
# Environment setup for java
#

export JAVA_HOME=3D"/usr/java/jdk1.5.0_12"
export PATH=3D"${JAVA_HOME}/bin:$PATH"

#
# end java setup
#


#
# Environment setup for oe
#

export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO ANGSTROM_MODE OVEROTOP =
OEBRANCH USERBRANCH"

export OVEROTOP=3D"/tool/overo-oe"
export OEBRANCH=3D"${OVEROTOP}/org.openembedded.dev"
export USERBRANCH=3D"${OVEROTOP}/user.collection"

export CROSSCOMPILER=3D"armv7a"
export =
PATH=3D"${OVEROTOP}/bitbake/bin:${OVEROTOP}/tmp/cross/${CROSSCOMPILER}/bin=
:$PATH"
export BBPATH=3D"${OVEROTOP}/build:${USERBRANCH}:${OEBRANCH}"

umask 0002

#
# end oe setup
#

#
# Environment setup for android
#

export REPOTOP=3D"/tool/script"
export ANDROID_JAVA_HOME=3D$JAVA_HOME
export ANDROID_TOP=3D"/tool/android"
export ANDROID_HOST=3D"linux-x86"
export ANDROID_HOST_TOOLS=3D"${ANDROID_TOP}/out/host/${ANDROID_HOST}/bin"
export PATH=3D"${REPOTOP}:${ANDROID_HOST_TOOLS}:$PATH"

#
# end android setup
#


Step 08.00: Install additional packages required by BitBake.

$ su
# yum install help2man
# yum install texi2html


Step 09.00: Install additional packages required by Fedora 12 x86 =
64-bit.

$ su
# yum install glibc-static
# =20


Step 10.00: Build a basic kernel and a non-gui root file system image in =
one step using the following command

$ bitbake omap3-console-image
$ bitbake x-load
$ bitbake u-boot-omap3

Additional bitbake recipies can be found in =
org.openembedded.dev/packages/image

$ bitbake omap3-desktop-image
$ bitbake omap3-udesktop-image

If BitBake complains about the mmap_min_addr not being set to 0, type =
the following :

$ su
# echo =930=94 > /proc/sys/vm/mmap_min_addr

Step 11.00: Update the org.openembedded.dev sources at regular intervals =
by typing the following command

$ cd org.openembedded.dev
$ git pull


Related Topics

None

Related Links

01. How to install OpenEmbedded and Bitbake - PIXHAWK.

02. Quick Command Reference for OE - PIXHAWK.

03. Git cheat sheet - Zack Rusin.


Best regards,

Elvis


