Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1HwGCK-0003bd-MK
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2007 13:30:37 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 90800411972
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2007 06:28:10 -0500 (CDT)
Message-ID: <044101c7a8f6$bcf43290$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <03ec01c7a8bc$95a2f030$6e01a8c0@twilight>
	<200706070839.52842.openembedded@hrw.one.pl>
Date: Thu, 7 Jun 2007 06:26:48 -0500
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
X-List-Received-Date: Thu, 07 Jun 2007 11:30:41 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


----- Original Message ----- 
From: "Marcin Juszkiewicz" <openembedded@hrw.one.pl>
To: <openembedded-devel@lists.openembedded.org>
Sent: Thursday, June 07, 2007 1:39 AM
Subject: Re: [oe] Need advice on changing kernel.bbclass


>
> RPROVIDES_kernel-2.4.22-xfs = "kernel-image-2.4.22-xfs" should solve your
> problem.

I've made the change, and the build is starting...

but I'm not sure about this.  This will instruct ipkg that the package
"kernel-2.4.22-xfs" will satisify the dependency for
"kernel-image-2.4.22-xfs", right?  That's not the problem I've faced with
right now; I don't need to generate extra information for the
kernel-*.ipk --- that won't help the hundreds and hundreds of devices
already installed.  I need instead to alter the information in the generated
kernel-module-*.ipk files so that they do not have a dependency on
kernel-2.4.22-xfs (as the installed devices do not, according to the old
packaging, have that dependency satisfied -- instead they feature only
kernel-image-2.4.22-xfs).
Or do I misunderstand the RPROVIDES/RDEPENDS mechanism?

> Change was in kernel*.bbclass and it was discussed on this list -
> thread "[oe] RFC: Kernel image packaging" from 14 March this year.

I'll dig up that thread for review.  Clearly this is not a high-priority
problem, if it's taken almost 3 months for this issue to surface since this
change to kernel.bbclass was made -- clearly adding kernel modules to the
feeds for the older releases is not a common things any more.  But there is
a (reasonable) request in the queue, so I'd like to find a way to get those
modules built (that doesn't require the user to "upgrade" their installation
entirely, especially since I have no intention at this time of building a
new release for them to upgrade to!)

Thanks!
Mike (mwester)




