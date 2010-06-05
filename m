Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OL1TR-0006oi-CW
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 00:04:16 +0200
Received: by vws11 with SMTP id 11so452109vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 14:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=dC9rgIffK5RTz5LQXm1M/EUADK7JdyUk6y0a7X5MuH0=;
	b=f4xZf/w0khO/XkHYNSBRwMlyAYzfiuL+HZCkKo1KHjExX2jzpxY4yDjd0oWr7c/SGT
	RYNhOVSN8jICJ5D10ZRppcuZAddMn4dh9KBYgWu1VYL+jLSgyXqK9tLHCFoA/NT9Mtst
	OHGPUnMDmVSiFjfLB5mDgjTYCn4p1SJt3Iv40=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=UxUPaDHuVCZw+EQ3VEk2xC8l2dierlJ5NeIbZehFdrPbHAVsGsUxIvj3/NZPMyU0Ti
	YEyYBNRknN2dlLQ9Ym6LakJun5B8vFp8gHn4PXH6B0b5ysDJbA9iT78pWi/0oiihB1sf
	UjOrYHNG3CigCJMxZOMGdLsoRGaiaxNvm2oWY=
Received: by 10.224.26.83 with SMTP id d19mr7142339qac.321.1275775194134; Sat, 
	05 Jun 2010 14:59:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Sat, 5 Jun 2010 14:59:33 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1006050226160.9902@lynx>
References: <alpine.DEB.2.00.1006050226160.9902@lynx>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 5 Jun 2010 14:59:33 -0700
X-Google-Sender-Auth: Qiau7zpZ0HSG3oopTU7XyqAGM54
Message-ID: <AANLkTik0GDc2e8Rmzi_MiUmnu5RS1Feje3NUb1AIG6Vc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: trying to simplify the patch/apply/pnum/striplevel jungle
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
X-List-Received-Date: Sat, 05 Jun 2010 22:04:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 4, 2010 at 11:53 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
>  just working my way thru the OE manual and source and it's clear
> that there could be some cleanup of superfluous or deprecated patch
> info.  so can someone clarify whether my understanding of the
> following is correct?
>
> pnum/striplevel
> ===============
>
>  first, "pnum=" is deprecated and has been replaced by "striplevel="
> and, in any event, given that the default patchlevel is one, it's
> unnecessary for either of those to be there while being set to one.  i
> don't see any cleanup in the source itself, but the manual could be
> updated on that point, as in
> (http://docs.openembedded.org/usermanual/html/src_uri_variable.html):
>
> "pnum
>
>    By default patches are applied with the "-p 1" parameter, which
> strips off the first directory of the pathname in the patches. This
> option is used to explicitly control the value passed to "-p". The
> most typical use is when the patches are relative to the source
> directory already and need to be applied using "-p 0", in which case
> the "pnum=0" option is supplied."
>
>  obviously, the manual could mention that that's deprecated and
> should additionally describe striplevel.
>
>  in fact, given that there's no reference to pnum= in the OE source,
> perhaps support for (and all references to) "pnum" can be dropped
> entirely unless other (non-OE) projects still depend on it.
>
>  in any event, i can submit a patch to update the manual.
>

pnum works for compatibility reasons, but it will display a warning, with a
pointer to the new parameter to use instead.  But yes, that's correct, it
was just a rename for clarity.

patch/apply
> ===========
>
>  as i read it, "patch=" has also been deprecated and, once again, the
> manual could stand to be updated (on that same page above):
>
> "patch
>
>    Used as "patch=1" to define this file as a patch file. Patch files
> will be copied to ${S}/patches and then applied to source from within
> the source directory, ${S}."
>
>  there's still some "patch=" content in the OE source, such as:
>
> recipes/udev/udev_100.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
> recipes/udev/udev_100.bb:           file://flags.patch;patch=1 \
> recipes/udev/udev_100.bb:
> file://mtd-exclude-persistent.patch;patch=1 \
> recipes/udev/udev_092.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
> recipes/udev/udev_092.bb:           file://flags.patch;patch=1 \
> recipes/udev/udev_092.bb:           file://udevsynthesize.patch;patch=1 \
> recipes/udev/udev_092.bb:            file://arm_inotify_fix.patch;patch=1
> \
> recipes/udev/udev_092.bb:
> file://mtd-exclude-persistent.patch;patch=1 \
> recipes/udev/udev_097.bb:SRC_URI += "file://noasmlinkage.patch;patch=1 \
> recipes/udev/udev_097.bb:           file://flags.patch;patch=1 \
>
>  what i need clarified is the possible usage of "apply=" WRT patches.
> as i read classes/patch.bblclass, it seems like:
>
>  * any file whose name ends in either ".diff" or ".patch" is
>    considered a patch and will, by default, be processed that way
>
>  * "apply=no" is only necessary to *prevent* default
>    processing of a ".patch" or ".diff" file
>
>  * "apply=yes" is only necessary to *force* processing of a file
>    that *doesn't* end with one of those suffixes.  in short,
>    something like this is redundant:
>
>    recipes/socketcan/libsocketcan_0.0.7.bb:SRC_URI +=
>      "file://install-can_netlink.h.patch;apply=yes \ ...
>                                          ^^^^^^^^^ redundant
>
> is all that about right?
>

Yep, that's all correct.  It seemed silly to not optimize for the common
case - .diff/.patch & -p 1, so now it does so.  'patch' parameter too, still
works for compatibility, and will display a warning.

pname
> =====
>

I have no idea on this one, I'm afraid, other than what I've seen in the
source.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

