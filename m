Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLlZL-0005ns-L0
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Nov 2011 01:54:11 +0100
Received: (qmail invoked by alias); 03 Nov 2011 00:48:03 -0000
Received: from p5B0A24CF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.36.207]
	by mail.gmx.net (mp062) with SMTP; 03 Nov 2011 01:48:03 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18BWk90vhkBIv4Oz568SivHeqj7v9hRkzvqmTC4rG
	n4COI/INqS/7h0
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Nov 2011 01:52:48 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <20111101085901.447CF1032F@opal>
	<201111022252.15928.schnitzeltony@gmx.de>
	<20111102233254.GJ9949@jama.jama.net>
In-Reply-To: <20111102233254.GJ9949@jama.jama.net>
MIME-Version: 1.0
Message-Id: <201111030152.49177.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] Martin Jansa : midori: fix build with dirty vala
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
X-List-Received-Date: Thu, 03 Nov 2011 00:54:11 -0000
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit

On Thursday, November 03, 2011 12:32:54 AM Martin Jansa wrote:
> > Hm - I am afraid since this update midori never finishes configuring
> > here. I waited for approximately 2 hours and stopped the process. The
> > log file is attached ( a fresh retry creates similar log ). I commented
> > out the whole
> 
> Have you tried to revert it to see that it's not caused ie by glib
> changes or something? Because my vala detection change is already finished
> before it writes this stuff and the tar in waf is compared with
> hardcoded checksum, so it also could not change just by this monster
> blob.
When sending previous mail I had two runs with and without your patch which gave 
me a clear picture. Now I have had some further rebuilds - seems sometimes it 
builds sometimes not! It's a bit late - tomorrow I would like to check further 
builds to see if I get a hang too with your patch reverted.
> 
> Could you also check if there is something interesting in ps aux or
> strace when it's "hanging"? On all 3 boxes I have tried this it always
> worked as expected.
> 
> > | do_configure_prepend()
> > 
> > function, ran
> > 
> > | bitbake -ccleanall midori
> > 
> > and
> > 
> > | bitbake midori
> > 
> > without further issues in few minutes.
> > 
> > Maybe we should rethink this monster blob commit intended to fix a corner
> > case...
> 
> Yes pity that this corner case is our only vala-native and I was hopping
> that newer midori with newer waf-1.6 will be released soon and this
> won't be needed anymore..
Did you send a note to xfce-bugzilla to increase probability of making it 
happen?

Andreas


