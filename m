Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HYJ7V-0002mb-8Y
	for openembedded-devel@openembedded.org; Mon, 02 Apr 2007 11:46:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l329kbBG018333
	for <openembedded-devel@openembedded.org>;
	Mon, 2 Apr 2007 10:46:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18215-02 for <openembedded-devel@openembedded.org>;
	Mon,  2 Apr 2007 10:46:34 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l329kQhj018323
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 2 Apr 2007 10:46:26 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1308675383.20070402112257@vanille-media.de>
References: <E1HVVtt-0007Xk-Tg@linuxtogo.org>
	<1308675383.20070402112257@vanille-media.de>
Date: Mon, 02 Apr 2007 10:46:25 +0100
Message-Id: <1175507186.5819.16.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev zaurus-clamshell: Fix jffs2	commandline, enable lzo compression
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
X-List-Received-Date: Mon, 02 Apr 2007 09:46:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-04-02 at 11:22 +0200, Michael 'Mickey' Lauer wrote:
> > zaurus-clamshell: Fix jffs2 commandline, enable lzo compression
> 
> Richard, if you have a minute, could you summarize the benefits of
> using LZO and what I need to tweak to enable it for a device (i.e.
> fic-gta01)

LZO allows much faster decompression than zlib at similar (but never
quite as good) compression ratios. When used with jffs2 it means file
reads are less processor intensive and hence faster. It gives a 40%
speedup to file reads in my tests and the "favourlzo" mode image size
might increase by say 5%. If you have an optimised boot procedure, you
can end up processor bound so it can also help device boot time a lot.
OE's boot procedure is not optimised though so this doesn't show up as
well under OE.

As for configuring it, the tricky question is given some block of data,
how should jffs2 compress it? There are a variety of modes you can put
mkfs.jffs2 into and the kernel has a similar set of modes too. There are
a few options:

"size" - Compress the data with each compressor and pick the one with
best compression

"priority" - Compress the data with the first compressor in a list of
compressors which gives any compression.

"favourlzo" - Like size, compress the data with each compressor and pick
the one with best compression *but* choose LZO is the sizes are close
since we know its fast.

mtd-utils in OE has patches to enable lzo compression. The standard
jffs2 image creation command has "-x lzo" in it to disable the LZO
compressor so anyone without a patched kernel still gets working images.
Since the zaurus kernels mostly have lzo support,
zaurus-clamshell-2.6.conf has "-m favourlzo" in the commandline it
overrides the default with making the zaurus clamshell images use a
hybrid of zlib and lzo compression.

"favourlzo" might be good at image creation time but on device itself,
you might want "priority" to save repeatedly calling multiple
compressors upon file writes.

So simply put:
* Add kernel patches
* Make sure you're using the patched mtd-utils
* Add "-m favourlzo" to the image creation commandline

Cheers,

Richard



