Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OKnKJ-0004XY-Ot
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 08:58:03 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OKnGA-0008BE-OF for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 02:53:35 -0400
Date: Sat, 5 Jun 2010 02:53:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.00.1006050226160.9902@lynx>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: trying to simplify the patch/apply/pnum/striplevel jungle
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
X-List-Received-Date: Sat, 05 Jun 2010 06:58:03 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just working my way thru the OE manual and source and it's clear
that there could be some cleanup of superfluous or deprecated patch
info.  so can someone clarify whether my understanding of the
following is correct?

pnum/striplevel
===============

  first, "pnum=" is deprecated and has been replaced by "striplevel="
and, in any event, given that the default patchlevel is one, it's
unnecessary for either of those to be there while being set to one.  i
don't see any cleanup in the source itself, but the manual could be
updated on that point, as in
(http://docs.openembedded.org/usermanual/html/src_uri_variable.html):

"pnum

    By default patches are applied with the "-p 1" parameter, which
strips off the first directory of the pathname in the patches. This
option is used to explicitly control the value passed to "-p". The
most typical use is when the patches are relative to the source
directory already and need to be applied using "-p 0", in which case
the "pnum=0" option is supplied."

  obviously, the manual could mention that that's deprecated and
should additionally describe striplevel.

  in fact, given that there's no reference to pnum= in the OE source,
perhaps support for (and all references to) "pnum" can be dropped
entirely unless other (non-OE) projects still depend on it.

  in any event, i can submit a patch to update the manual.

patch/apply
===========

  as i read it, "patch=" has also been deprecated and, once again, the
manual could stand to be updated (on that same page above):

"patch

    Used as "patch=1" to define this file as a patch file. Patch files
will be copied to ${S}/patches and then applied to source from within
the source directory, ${S}."

  there's still some "patch=" content in the OE source, such as:

recipes/udev/udev_100.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
recipes/udev/udev_100.bb:	    file://flags.patch;patch=1 \
recipes/udev/udev_100.bb:	    file://mtd-exclude-persistent.patch;patch=1 \
recipes/udev/udev_092.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
recipes/udev/udev_092.bb:	    file://flags.patch;patch=1 \
recipes/udev/udev_092.bb:	    file://udevsynthesize.patch;patch=1 \
recipes/udev/udev_092.bb:            file://arm_inotify_fix.patch;patch=1 \
recipes/udev/udev_092.bb:	    file://mtd-exclude-persistent.patch;patch=1 \
recipes/udev/udev_097.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
recipes/udev/udev_097.bb:	    file://flags.patch;patch=1 \

  what i need clarified is the possible usage of "apply=" WRT patches.
as i read classes/patch.bblclass, it seems like:

  * any file whose name ends in either ".diff" or ".patch" is
    considered a patch and will, by default, be processed that way

  * "apply=no" is only necessary to *prevent* default
    processing of a ".patch" or ".diff" file

  * "apply=yes" is only necessary to *force* processing of a file
    that *doesn't* end with one of those suffixes.  in short,
    something like this is redundant:

    recipes/socketcan/libsocketcan_0.0.7.bb:SRC_URI +=
      "file://install-can_netlink.h.patch;apply=yes \ ...
                                          ^^^^^^^^^ redundant

is all that about right?

pname
=====

  not much reference to that in the source, but there is some:

$ grep -r pname= *
recipes/linux/ixp4xx-kernel.inc:
patch_uri.append("${KERNELORG_MIRROR}/pub/linux/kernel/v%s/testing/patch-%s.bz2;apply=yes;pname=%s;name=rcpatch"
% (major, pname, pname))
recipes/linux/ixp4xx-kernel.inc:
patch_uri.append("${KERNELORG_MIRROR}/pub/linux/kernel/v%s/snapshots/patch-%s.bz2;apply=yes;pname=%s;name=gitpatch"
% (major, pname, pname))
recipes/linux/ixp4xx-kernel.inc:
patch_uri.append("${KERNELORG_MIRROR}/pub/linux/kernel/people/akpm/patches/%s/%s/%s/%s.bz2;apply=yes;pname=%s;name=mmpatch"
% (major, base, pname, pname, pname))

seems pretty self-explanatory -- patch processing for, in these cases,
a tarball where one needs to define the name of the patch accordingly.
i'm assuming that, in cases like this where the suffix is not a patch
suffix, you *must* specify "apply=yes", correct?  in other words, it
would make no sense to just specify pname= without the accompanying
apply=, is that right?  there's no mention of that in the OE manual on
that same page.  should there be?  or is that so specialized and
unusual that it can be left unexplained?

  i think that's all i'm curious about regarding the source or the
manual.  i can throw together a few patches to clean up the more
obvious stuff.

rday



-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


