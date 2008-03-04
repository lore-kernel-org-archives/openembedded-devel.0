Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JWdpw-0005ta-LT
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Mar 2008 21:34:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 5B3B21422AC4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2008 21:32:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UnPcrKmaHEZ
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2008 21:32:17 +0100 (CET)
Received: from zaurus.lan (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 2B2D11422AC3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2008 21:32:17 +0100 (CET)
Date: Tue, 4 Mar 2008 21:32:48 +0100
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080304213248.294bf042@zaurus.lan>
In-Reply-To: <1204629534.22237.4.camel@hammer.suse.cz>
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
	<1204541308.5725.10.camel@hammer.suse.cz>
	<19c1b8a90803032326s57ce6e5cic48a157e353dfb53@mail.gmail.com>
	<1204629534.22237.4.camel@hammer.suse.cz>
X-Mailer: Claws Mail 3.3.0 (GTK+ 2.12.3; arm-angstrom-linux-gnueabi)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iwwmmxt optimization and soft float in OE on PXA270
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
X-List-Received-Date: Tue, 04 Mar 2008 20:34:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:

> Khem Raj wrote: 
> > What ABI breakage are you seeing ?
> > Aren't you using EABI ?
I have verified, that gcc(1) does not tell true, and I see no breakage
while mixing these two environments (library from one x binary from
second one).

It allows me to do small benchmarks - compare default image with
optimized iwmmxt image.

I see about 13% performance improvement. I don't yet know why.

previous (mid-February) oe.dev image in chroot, compiled with defaults:
armv5, only mplayer for iwmmxt, softfp floats, reusing original kernel
and X:
2nd run:
real	0m26.696s
user	0m7.700s
sys	0m1.030s
3rd run:
real	0m26.611s
user	0m7.570s
sys	0m0.880s

playing video, everything compiled for iwmmxt with -msoft-float and
higher optimization options:
2nd run:
real	0m25.990s
user	0m6.840s
sys	0m0.830s
3rd run:
real	0m25.964s
user	0m6.700s
sys	0m0.760s

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus


