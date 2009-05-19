Received: from [192.67.63.129] (helo=rampart2.timecastle.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeff@taupro.com>) id 1M6Q1u-0003aX-1d
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 16:10:54 +0200
Received: from [192.168.3.100] (adsl-68-95-128-31.dsl.rcsntx.swbell.net
	[68.95.128.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by rampart2.timecastle.net (Postfix) with ESMTPSA id 0CD2F70043;
	Tue, 19 May 2009 09:03:27 -0500 (CDT)
Message-ID: <4A12BC2C.5020402@taupro.com>
Date: Tue, 19 May 2009 09:03:24 -0500
From: Jeff Rush <jeff@taupro.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=AA9D62B9
Subject: rootfs_tar.bbclass not found?
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
X-List-Received-Date: Tue, 19 May 2009 14:10:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hopefully a trivial question.

Objective: I am trying to generate a tarball of an executable program, the
helloworld.bb program, for installation onto a system that lacks support for
ipk files.

To get a tarball package, I add to my local.conf:

   INHERIT += "package_tar package_ipk"

but when I do:

   bitbake helloworld

or indeed any target, I get the following error during the parse stage:

ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/jeff/Projects/OpenEmbedded/openembedded/recipes/images/slugos-image.bb

This error is repeated for every *-image.bb file parsed.  The reason is
because the file classes/image.bbclass has this line at the top of the file:

  inherit rootfs_${IMAGE_PKGTYPE}

so it is looking for "rootfs_tar.bbclass" but the only rootfs-*.bbclass files
that exist are:

  classes/rootfs_deb.bbclass
  classes/rootfs_ipk.bbclass
  classes/rootfs_rpm.bbclass

So building an image from tar'd packages is not support - fine, because in
this case I really do not want to build an image, just a single helloworld.tar
package.  But I cannot get past the parsing phase because of this problem.

What can I add to my local.conf to 'short circuit' this logic related to the
building of images?

Thanks for helping out a newbie,

-Jeff


