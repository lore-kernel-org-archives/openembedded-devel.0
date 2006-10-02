Received: from [68.142.228.52] (helo=web50911.mail.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.61)
	(envelope-from <catinella@yahoo.com>) id 1GUUCi-0002VL-SO
	for openembedded-devel@openembedded.org; Mon, 02 Oct 2006 22:15:57 +0200
Received: (qmail 80130 invoked by uid 60001); 2 Oct 2006 20:10:31 -0000
Message-ID: <20061002201031.80128.qmail@web50911.mail.yahoo.com>
Received: from [87.5.132.203] by web50911.mail.yahoo.com via HTTP;
	Mon, 02 Oct 2006 13:10:31 PDT
Date: Mon, 2 Oct 2006 13:10:31 -0700 (PDT)
From: Silvano Catinella <catinella@yahoo.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Wpkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2006 20:15:57 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hello,

my name is Silvano, I have developed a software package manager, but it is
completely different by all the others (rpm, deb, tgz...).

Like the others, Wpkg (this is the name of my software) is able to install,
remove , verify a package and it is able to query many information to the
installed packages. But the architecture is the difference: wpkg is basically a
framework, without extensions is able to 

 1) execute a pre-install script
 2) check package dependencies
 3) copy a predefined set of file in the target system
 4) execute a post-install script

...exactly like rpm.
But wpkg provides the possibility to write small module to perform any kind of
test and action. The module will have a keyword that who build a package can
use in the main installation-process configuration file. Some module are
included in an external wpkg-package:
ARCH   - installs the file only if the architecture is ok
USER   - sets the file owner
RIGHTS - sets the file permissions
LINK   - creates a symbolic link to the file

They are only a basic examples, I could write a module to check the
graphic-libraries (gtk or qt or...), to check devices (pen, mouse,
keyboard...), and so on...

Over that, the software could be in a non standard path, and the wpkg will be
configured to find the right path.

I have written wpkg in Tcl, I have chosen so, because it is available for a lot
of platform (linux, solarix, freeBSD, windows, mac, windowsCE,
windows-mobile...), it has great productivity, it does not use too many system
resources, it is easily used by everyone, it provides a great possibility to
interface itself with C.

Because palm-enviroment and embedded-environment in general has not a fix well
known software and hardware platforms, wpkg could help the user to have a
single package ables to adapt its installation-procedure to the host-system.

I have already written the manpages, but If you are interested I will be happy
to write you a deeper manual.



Best regards

Silvano Catinella

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 


