Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IvrkO-00010Y-Sx
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Nov 2007 10:56:25 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 0870D53FB9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2007 04:53:53 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Sat, 24 Nov 2007 04:53:53 -0500
X-Sasl-enc: PHQEbpuOCia7JmC0UvG/RKATk0mzn95FUo3rpwM3kh4C 1195898032
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 39A4D3D75
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2007 04:53:51 -0500 (EST)
Message-ID: <4747F49C.50602@whitby.id.au>
Date: Sat, 24 Nov 2007 20:23:32 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1Iv6U0-0003D9-3S@linuxtogo.org>	<4746C4A5.6040501@student.utwente.nl>	<05db01c82dfe$1401e230$6e01a8c0@twilight>	<c384c5ea0711231351u1b91c5b6o437ecc5d512991e8@mail.gmail.com>	<4747921A.8000300@whitby.id.au>
	<1195876746.5374.7.camel@localhost.localdomain>
In-Reply-To: <1195876746.5374.7.camel@localhost.localdomain>
Subject: Re: [oe-commits] org.oe.dev SlugOS: ixp4xx-kernel	-	added	2.6.23.8 recipe and supporting files. (Note that
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
X-List-Received-Date: Sat, 24 Nov 2007 09:56:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Matthias Hentges wrote:
> VANILLA_VERSION = "2.6.23"
> KERNEL_VERSION = "2.6.23.8"
> 
> SRC_URI = "
> ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${VANILLA_VERSION}.tar.bz2
> \
> ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${KERNEL_VERSION}.bz2;patch=1
> \
> "
> 
> The above is IMO indeed a lot more elegant than 
> 
> SRC_URI = "
> ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.23.8.tar.bz2

Even more elegant is not having to specify the SRC_URI or
vanilla_version and kernel_version in the .bb file at all.  The
ixp4xx-kernel.inc file gets all the info it needs from the .bb filename.

It is implemented to be able to handle a whole lot more scenarios than
the simple one of 2.6.23.8 - if people want to fix it so that it still
handles all those -ac, -mm, and -gitNN scenarios listed in the
documentation in the comments at the start of the file, but is also
optimally tuned as far as downloads go, then as Koen would always say:

 "Patches are welcome".

As usual, people should understand something before they criticise it.

-- Rod


