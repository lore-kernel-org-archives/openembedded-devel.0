Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MbmRl-0005ve-QH
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 04:23:13 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id CB2891B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 02:10:02 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Aug 2009 04:06:00 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A84650F.1080902@linuxbj.com>
In-Reply-To: <4A84650F.1080902@linuxbj.com>
MIME-Version: 1.0
Message-Id: <200908140406.00714.holger+oe@freyther.de>
Subject: Re: patch for compcache recipe
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
X-List-Received-Date: Fri, 14 Aug 2009 02:23:13 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 13 August 2009 21:10:07 Ming Chow =E5=91=A8=E6=98=8E wrote:
> Hi,
>
> I have tried compcache from code.google.com on beagleboard rev B5 and
> n800 for a couple of weeks. It seems helping me getting more usable memor=
y.
> The patch will add compcache stuff which provides both compcache kernel
> modules and managing tool.
> Tested with recent oe repo on my boards, more evaluation on various real
> hardware platforms needed though.
> BTW not touched checksum.ini for the tarball yet.

Hi,

the patch looks nice. I have three minor comments.=20

Would you please add the checksums.ini entry and send the mail with a Signe=
d-
off-by: line?

I think sending the last two patches (modules_instal target) and not using =
gcc=20
directly upstream would make sense? Did you already do that?

This one is on naming. The exmap kernel module is called "kernel-module-
exmap", for the sake of consistency you should consider renaming "compach-
modules" to "kernel-module-compcache"? And maybe install rzscontrol into th=
e=20
compache package too. The reason is that it is not easy to spot the=20
relationship from compache to the rzscontrol package.

z.


