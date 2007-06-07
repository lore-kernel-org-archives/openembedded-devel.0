Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1HwGfH-0003vq-GA
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2007 14:00:32 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 8F8F241266B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2007 06:58:05 -0500 (CDT)
Message-ID: <045401c7a8fa$ea96f300$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <03ec01c7a8bc$95a2f030$6e01a8c0@twilight>
	<200706070839.52842.openembedded@hrw.one.pl>
Date: Thu, 7 Jun 2007 06:56:43 -0500
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
X-List-Received-Date: Thu, 07 Jun 2007 12:00:36 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Build completed, with this suggestion.  :(  No joy:

Package: kernel-module-binfmt-misc
Version: 2.4.22.l2.3r63-r18.5
Depends: update-modules, kernel-2.4.22-xfs
Section: kernel

The kernel modules built remain firm in their conviction that they depend
upon the kernel, not kernel-image.

Mike (mwester)

----- Original Message ----- 
From: "Marcin Juszkiewicz" <openembedded@hrw.one.pl>
To: <openembedded-devel@lists.openembedded.org>
Sent: Thursday, June 07, 2007 1:39 AM
Subject: Re: [oe] Need advice on changing kernel.bbclass


>
> RPROVIDES_kernel-2.4.22-xfs = "kernel-image-2.4.22-xfs" should solve your
> problem.
>
> Change was in kernel*.bbclass and it was discussed on this list -
> thread "[oe] RFC: Kernel image packaging" from 14 March this year.
>
> -- 
> JID: hrw-jabber.org
> OpenEmbedded developer/consultant
>
>                  change your mind. it's starting to smell.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




