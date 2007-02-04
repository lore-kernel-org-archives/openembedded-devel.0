Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <freyther@gmx.net>) id 1HDr1J-0008GO-N8
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Feb 2007 00:43:41 +0100
Received: (qmail invoked by alias); 04 Feb 2007 23:43:41 -0000
Received: from dsl-62-220-14-162.berlikomm.net (EHLO [192.168.1.23])
	[62.220.14.162]
	by mail.gmx.net (mp039) with SMTP; 05 Feb 2007 00:43:41 +0100
X-Authenticated: #1949623
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <45C66B59.3060006@dominion.kabel.utwente.nl>
References: <45C66B59.3060006@dominion.kabel.utwente.nl>
Message-Id: <63AF3283-1F43-4CFC-B3F0-EC07596C6171@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Mon, 5 Feb 2007 00:43:30 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Subject: Re: LDFLAGS += "--as-needed" ?
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
X-List-Received-Date: Sun, 04 Feb 2007 23:43:42 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 05.02.2007 um 00:25 schrieb Koen Kooi:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I have encountered a few packages that have unnecessary  
> dependencies due to excessive
> linking. A while back we discussed passing '--as-needed' to ld to  
> get rid of those. My
> question is: what happens when software uses gcc to link?
>
> Do we want to enable such a thing globally?

then we should pass --as-needed to the linker (-Wl,)?

But the real question is:
	Who is going to fix libtool once again? From my KDE experience I  
remember libtool randomly reordering libraries which broke --as- 
needed badly. But my memory is vague and could be corrupted...



h.


