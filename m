Received: from [207.172.157.102] (helo=smtp02.lnh.mail.rcn.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1KtN7a-0007z6-92
	for openembedded-devel@openembedded.org; Fri, 24 Oct 2008 15:54:34 +0200
Received: from mr02.lnh.mail.rcn.net ([207.172.157.22])
	by smtp02.lnh.mail.rcn.net with ESMTP; 24 Oct 2008 09:53:58 -0400
Received: from smtp01.lnh.mail.rcn.net (smtp01.lnh.mail.rcn.net [207.172.4.11])
	by mr02.lnh.mail.rcn.net (MOS 3.8.6-GA) with ESMTP id PEH82168;
	Fri, 24 Oct 2008 09:53:58 -0400 (EDT)
Message-Id: <77ts5u$jtgmng@smtp01.lnh.mail.rcn.net>
Received: from unknown (HELO tmt.rcn.com) ([216.240.30.23])
	by smtp01.lnh.mail.rcn.net with ESMTP; 24 Oct 2008 09:53:27 -0400
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Fri, 24 Oct 2008 09:53:02 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
In-Reply-To: <48239d390810240611i60e4acaaybf75b00f241d2c93@mail.gmail.co
 m>
References: <48239d390810240611i60e4acaaybf75b00f241d2c93@mail.gmail.com>
Mime-Version: 1.0
X-Junkmail-Whitelist: YES (by domain whitelist at mr02.lnh.mail.rcn.net)
Subject: Re: busybox start-stop-daemon problems with recent kernels
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
X-List-Received-Date: Fri, 24 Oct 2008 13:54:34 -0000
Content-Type: text/plain; charset="us-ascii"

At 09:11 AM 10/24/2008, Sergey Lapin wrote:
>Hi, all!
>How do you people overcome problems with start-stop-daemon
>of busybox with recent kernels (seek error)?
>
>Is there any solution to this? I use vanilla git kernel with my images
>(I use out-of-tree .bb's for that) and have problems. This
>does not occur with kernels which are built by OE.
>
>Any ideas?

It's a bug in busybox, which tries to seek on /proc/cpuinfo (or something)
in a misguided attempt to determine the filesize. The kernel stopped allowing
seeks on /proc entries back in 2.6.24:
	<http://www.lkml.org/lkml/2008/4/16/185>

I have hack-y patches for busybox 1.9.2 and 1.11.1, I notice the latest
OE metadata is now 1.11.3, perhaps it's fixed upstream (which I can't
believe it's not, having been in the kernel for 6 months). Let me know
if you want them.

Tom.



