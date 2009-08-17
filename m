Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Md7Tc-0003Kc-E2
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 21:02:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 4499A5362BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 14:45:41 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15567-05 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 17 Aug 2009 14:45:41 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 19EFE535049
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 14:45:41 -0400 (EDT)
Message-ID: <4A89A554.2030201@cbnco.com>
Date: Mon, 17 Aug 2009 14:45:40 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>	<200908171612.13311.holger+oe@freyther.de>	<4A8978CD.8060607@cbnco.com>
	<200908172229.32840.khimov@altell.ru>
In-Reply-To: <200908172229.32840.khimov@altell.ru>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 3/3] syslinux: upgrade to 3.82 and split into a few packages
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
X-List-Received-Date: Mon, 17 Aug 2009 19:02:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Roman I Khimov wrote:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 17=
 =D0=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2009 19:35:41 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Michael Smith =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:

> You can also do bootable USB drive images with GRUB (not GRUB2, unfortu=
nately)
> with something like this added to standard ext2 image for drive FS:

I've been running into some odd behaviour with GRUB and a lot of newer=20
(read: cheaper) USB sticks on HP servers. For some reason GRUB can only=20
access some tiny portion of the device (e.g. first 100 MB out of 2000).

That alone probably wouldn't have stopped me (SanDisk Cruzers always=20
work :) but it's not really possible to build GRUB for x86_64, and GRUB2=20
will only build with a fight.

extlinux definitely lacks all the command-line troubleshooting features=20
that make me like GRUB... but so far it hasn't needed any=20
troubleshooting, it just works :)

Mike


