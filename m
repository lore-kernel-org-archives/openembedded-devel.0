Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M68yi-000427-Ds
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 21:58:28 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M68rd-000Hn9-2R
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 23:51:09 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2009 23:51:06 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905181716.24601.khimov@altell.ru>
	<4A11B5B4.8040804@kernelconcepts.de>
In-Reply-To: <4A11B5B4.8040804@kernelconcepts.de>
MIME-Version: 1.0
Message-Id: <200905182351.06676.khimov@altell.ru>
Subject: Re: [oe-commits] Roman I Khimov : (e)glibc-package: fix kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 19:58:28 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 18 May 2009 23:23:32 Florian Boor wrote:
> Hi,
>
> Roman I Khimov schrieb:
> > I've not heard yet of this really breaking something. And frankly I don't
> > see any reason for that. If it actually does - feel free to shout and
> > scream of course, we'll think how to handle it better.
>
> I assume it breaks for everyone using qemu 0.9.x. I see it failing with
> this message now:

OK, this is a problem in second patch from series, "-E" parameter was added 
recently, dated Jan 30 2009 in qemu git. Bad, bad, bad.

How to fix that? Check QEMU version?


