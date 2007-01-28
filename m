Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1HBIOn-0004AL-AA
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Jan 2007 23:21:21 +0100
Received: from cpc2-cmbg6-0-0-cust429.cmbg.cable.ntl.com ([81.107.33.174]
	helo=[192.168.2.189])
	by crown.reciva.com with esmtpsa (TLS-1.0:RSA_ARCFOUR_MD5:16)
	(Exim 4.50) id 1HBIOm-0007qv-Kl; Sun, 28 Jan 2007 22:21:20 +0000
From: Phil Blundell <pb@reciva.com>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <153772577.20070129001424@gmail.com>
References: <E1HBHQ2-0002RA-CZ@linuxtogo.org>
	<492827442.20070128233041@gmail.com>
	<1170022193.4354.0.camel@mebius.reciva.com>
	<153772577.20070129001424@gmail.com>
Date: Sun, 28 Jan 2007 22:22:35 +0000
Message-Id: <1170022955.4354.2.camel@mebius.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev package.bbclass: remove	directories named in FILES from image after file
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
X-List-Received-Date: Sun, 28 Jan 2007 22:21:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-01-29 at 00:14 +0200, Paul Sokolovsky wrote:
> Hello Phil,
> 
> Monday, January 29, 2007, 12:09:52 AM, you wrote:
> 
> > There shouldn't be any non-empty dirs.  If you're encountering some,
> > that must be a bug.  Do you have a testcase?
> 
>   Sure: I create a new .bb and just debug packaging. I'd prefer it
> didn't throw Python exception in my face ;-). Or: I'm sure there're
> few .bb which don't package all the stuff which is installed by
> "make install". One such example is busybox, which creates hoards of
> symlinks, but we don't packages (all of) them, instead relying on
> update-alternatives.

I just built busybox 1.2.1 and didn't see any problem.  Can you be more
specific about what exactly is going wrong for you?

p.




