Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <freyther@gmx.net>) id 1HJFvQ-0005ch-Ea
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Feb 2007 22:19:56 +0100
Received: (qmail invoked by alias); 19 Feb 2007 21:19:55 -0000
X-Provags-ID: V01U2FsdGVkX19N2akj1vZNsbsi6ZZwRYHZJuHfSqaEQWfJ2AeJ9C
	0RCg==
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <F47741A9-D1BE-46CE-87C8-B146E956A280@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Mon, 19 Feb 2007 22:19:30 +0100
To: openembedded-users@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Let there be rock^insanity
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
X-List-Received-Date: Mon, 19 Feb 2007 21:20:01 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit

Hi Freaks, Hi[1],

I finally found some time to finish a BitBake class, which is called  
insane.bbclass. This class is inspired by some early bugs in  
OpenEmbedded (e.g. the unzip package), and other bug reports and  
issues we have found during development. E.g. when creating the  
dedicated debug packages. Some packages are inspired by portage QA  
script.

The goal of this BitBake class, similiar to the fail-fast patchset  
(remember CROSS COMPILE Badness?), is to increase quality and to find  
issues at compile time before someone is shipping the first package  
with easy and obvious issues.

The insane.bbclass executes a set of unsound and incomplete tests on  
the packages, the content and the staging area to identify  
troublesome issues and will report them.

These tests include at the momemt:

-) A test to find config.log files in the current $WORKDIR to search  
for the "CROSS COMPILE Badness" string. Finding this string indicates  
some troubles with the configure script which are in conflict with  
the OpenEmbedded goals in creating a deterministic system. E.g. gnome- 
vfs, mp3blaster and mpd are known to fail this test. For convenience  
these scripts add /usr/include to the CPPFLAGS to find headers. For  
OpenEmbedded there is no excuse to search in these directories. To  
solve such issues it might be as easy as specifying additional  
parameters in EXTRA_OECONF or just fixing the configure script.

-) RPATH inside shipped binaries. RPATH to world writable directories  
could expose security issues and for an OE based distribution there  
is probably no excuse in having rpath set. Note that -rpath-link is  
considered okay and probably should be used.


-) permissions: Well we do not check permissions of directories,  
setuid'ed binaries and other files. E.g. we do not want world  
writable executable which might get the setuid bit set. Once such an  
issue is detected you can fix these by either adjusing the custom  
do_install task, or the package itself

-) .so symlinks in non -dev packages
    These symlinks indicate -dev packages and should be shipped in  
those packages. Normally you will adjust the FILES_* section to fix  
this issue

-) non debug (-dbg) package RDEPENDS on -dbg package
   Well a non debug package depends on libraries from a -dbg package.  
This can only be a packagign bug. This can be either a bug in the  
package itself, or the package you RDEPEND on.

-) .la files
	All libtool file should under no circumstances point to the  
$WORKDIR. This is a bug that should be fixed! And there is a lot to  
be fixed. This can be either hacked with sed or some proper solution  
I don't know.

	For packaged and -native staged files installed should be set to yes  
(installed=yes). E.g. installed=no is the wrong answer and shows an  
error. So make sure that installed=yes is found
	For -native staged files there should be no trace to /usr/include
	For packaged files the libdir should be /usr/lib

	Sadly there a lot of -native packages that need fixing, more than  
one of us can handle alone.

-) .pc files
	Similiar to libtool files, no direct reference to directories should  
be included. A bad example is croco from GNOME, and a patch for it is  
included in OpenEmbedded.

-) checking Architecture and ABI of binary files. If alpha is the  
PACKAGE_ARCH we will make sure alpha binaries are inside this  
package. If this is not the case check the compile log and see which  
compiler was used and fix the buildsystem.



The Angstrom Distribution is an early adaptor of this BitBake class  
and we might find issues and hopefully you will be able to spare a  
patch and improve the quality. It has never been so easy.



h.


[1] Subject of this mail and the first line is from a german music  
group, don't feel offended


