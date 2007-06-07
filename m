Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1HwP0n-0002nq-HW
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2007 22:55:17 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 6F30C41268C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2007 15:52:52 -0500 (CDT)
Message-ID: <049901c7a945$9db5e690$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <03ec01c7a8bc$95a2f030$6e01a8c0@twilight><200706070839.52842.openembedded@hrw.one.pl><045401c7a8fa$ea96f300$6e01a8c0@twilight>
	<1181241958.6086.204.camel@localhost.localdomain>
Date: Thu, 7 Jun 2007 15:51:26 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: Need advice on changing kernel.bbclass
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
X-List-Received-Date: Thu, 07 Jun 2007 20:55:18 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Yes indeed - I agree with the reasoning for the change; I think the current
scheme is far closer to "correct" in terms of dependencies than the old one.

I poked at the existing kernel-2.4.22-xfs and kernel-image-2.4.22-xfs ipkgs
and dependencies on both the original (in the field) Unslung images, and on
the images as built by OE today.  As it turns out, on the original image,
kernel-image-2.4.22-xfs is not empty (it claims to contain the compressed
kernel image), however kernel-2.4.22-xfs does not exist at all.  So if I
understand ipkg and dependencies correctly, I believe that your suggestion
(adding an empty package to the feeds) should work fine.

Thanks for you suggestion -- I'll go work on that direction instead!

Regards,
Mike (mwester)

----- Original Message ----- 
From: "Richard Purdie" <rpurdie@rpsys.net>
To: <openembedded-devel@openembedded.org>
Sent: Thursday, June 07, 2007 1:45 PM
Subject: Re: [oe] Need advice on changing kernel.bbclass


> On Thu, 2007-06-07 at 06:56 -0500, Mike (mwester) wrote:
> > Build completed, with this suggestion.  :(  No joy:
> >
> > Package: kernel-module-binfmt-misc
> > Version: 2.4.22.l2.3r63-r18.5
> > Depends: update-modules, kernel-2.4.22-xfs
> > Section: kernel
> >
> > The kernel modules built remain firm in their conviction that they
depend
> > upon the kernel, not kernel-image.
>
> I stand by the reasoning for the reasoning for the change as detailed by
> the thread mentioned - it did address some underlying problems. It was
> assumed anyone rebuilding the modules could release a new kernel package
> too hence avoiding this dependency problem.
>
> On the NSLU2, kernel-image-2.4.22-xfs is probably an empty package? as
> will be kernel-2.4.22-xfs? Would it be possible to have both 'empty'
> packages in the feed? You could always have one have a Depends: on the
> other?
>
> Cheers,
>
> Richard




