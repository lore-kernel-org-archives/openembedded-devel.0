Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1Hw9hR-0004uD-Iw
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2007 06:34:17 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 117ED4125E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2007 23:31:58 -0500 (CDT)
Message-ID: <03ec01c7a8bc$95a2f030$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jun 2007 23:30:31 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Need advice on changing kernel.bbclass
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
X-List-Received-Date: Thu, 07 Jun 2007 04:34:21 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Deep inside kernel.bbclass, do_split_packages() is invoked, and one of the
arguments passed in is:
   "extra_depends='update-modules kernel-%s'...".

I need to make that conditional, so that when DISTRO=="unslung", it becomes:
   "extra_depends='update-modules kernel-image-%s'...".

Why, you ask?  Well, for good or bad, there are numerous NSLU2's out there
that are expecting kernel modules to depend upon "kernel-image-2.4.22-xfs",
not on "kernel-2.4.22-xfs".  Since we can't reinstall those systems to make
them accomodate the change (something changed, perhaps along with bitbake
1.8?), the reasonable solution is to adjust the build process so that we
generate kernel module ipks with the same dependencies that they used to be
built with.  Kernel modules are build "on the fly" inside kernel.bbclass
with some python code; that python code is what is establishing the
dependencies, and that's the code that needs to be adjusted to handle this
situation.

Before I commit hideous hackery on kernel.bbclass, I thought perhaps I
should appeal to the community for some advice and feedback on how best to
do this.  I was thinking a conditional in the python code would be easiest,
and cleanest.  I don't know how to write such a conditional, but lack of
knowlege has never stopped me before ;-)  Python can't be that hard to
learn.

If there's a better, suggestion, I'm open for it.  The Unslung kernel is
frozen at 2.4.22-xfs (since that's what Linksys ships, and we need to remain
compatible with their kernel modules and software).  That sort of means that
spending a lot of work on an elegant solution for Unslung is pretty much a
waste of time -- quick and simple, so that we can go about building some new
kernel modules and getting them into the feeds (with correct dependencies),
is the goal.

For completeness, below is the entire original source line out of
kernel.bbclass:

   do_split_packages(d, root='/lib/modules', file_regex=module_regex,
output_pattern=module_pattern, description='%s kernel module',
postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
extra_depends='update-modules kernel-%s' % bb.data.getVar("KERNEL_VERSION",
d, 1))

Thanks!
Mike (mwester)




