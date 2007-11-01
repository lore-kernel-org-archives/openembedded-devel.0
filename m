Received: from [64.233.162.239] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <shanevolpe@gmail.com>) id 1IneDR-00085O-K1
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2007 18:52:25 +0100
Received: by nz-out-0506.google.com with SMTP id i11so444718nzh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2007 10:52:07 -0700 (PDT)
Received: by 10.115.106.7 with SMTP id i7mr839462wam.1193935760988;
	Thu, 01 Nov 2007 09:49:20 -0700 (PDT)
Received: by 10.114.154.7 with HTTP; Thu, 1 Nov 2007 09:49:20 -0700 (PDT)
Message-ID: <8c7950360711010949u45bb12e7p388b4d5dc4563ef3@mail.gmail.com>
Date: Thu, 1 Nov 2007 12:49:20 -0400
From: shanevolpe@gmail.com
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Overriding package config files in OE
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
X-List-Received-Date: Thu, 01 Nov 2007 17:52:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I  have quite a few config files I need to override with my own
customized files.  From what I have seen the most common way to do
this is to set up a local collection and use it in an overlay fashion
copying all the packages you wish to modify a config file for into the
local collection.
 I do not like the above solution for several reasons, its a
documentation challenge to keep track of what packages you just
changed config files and what packages you may have added patches or
changed other things (compile/linker/EXTRA_OECONF).  It also presents
a challenge when you want to merge back into a later version of OE.
It also forces you to make duplicate machines with different names and
add in machine directories to the package directory containing the
unique configurations if you have the same hardware that may have
different options (configurations).  Also if you wish to field upgrade
a machine from one version to another (configuration) it would be, I
think, a challenge with the above method.

Since I'm not satisfied with the overlay option I have worked on a
different approach and is the real reason I'm posting this email as I
would like to get feedback, comments  and criticism to my approach,
please keep in mind that I do realize this approach is STILL a hack
but it is what I have been able to come up with in a short period of
time and currently I believe it to be more scalable than the overlay
and also easier to manage and document.

I made a separate package containing all my custom config files, I
will refer to it as configs.bb.  I did NOT flag them as config files
(CONFFILES).

I was then able to make an image.bb file as follows:
##############################################################
EXTRA_IMAGEDEPENDS = "configs"
#RDEPENDS = ${PACKAGE_INSTALL}
RDEPENDS = "task-base"

PACKAGE_INSTALL = "${RDEPENDS} ${EXTRA_IMAGEDEPENDS}"
LICENSE = "LGPL"
PR = "r0"
IMAGE_BASENAME = "my-image"
IMAGE_ROOTFS = "${TMPDIR}/rootfs_myimage"

inherit image
##############################################################

This seems to force my configs.bb to be installed into the rootfs
after all the other packages have been installed and since I did not
specify the files in configs.bb as configuration  files it overrides
all the config files of the already installed packages with out
causing ipkg to spit out questions on how to handle the config file
(update, keep current version, show diffs) and hanging up the image
building.

Also with this method if you do need to update config.bb you just need
to set -force-overwrite and if you update one of the packages you
overwrote a config file to, ipkg should prompt you with what you want
to do with the config file.

Regards,
Shane


