Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MWTp8-0002mM-L8
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 13:29:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id ABE381409713;
	Thu, 30 Jul 2009 13:17:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y1KFpv5E1CA8; Thu, 30 Jul 2009 13:17:44 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 08A8C1416BA2;
	Thu, 30 Jul 2009 13:17:43 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Marc Olzheim <zlo@zlo.nu>
In-Reply-To: <20090730105711.GA29595@zlo.nu>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
	<1244635240.28486.7.camel@hammer.suse.cz>
	<20090730105711.GA29595@zlo.nu>
Date: Thu, 30 Jul 2009 13:14:24 +0200
Message-Id: <1248952464.21030.110.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.2 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks libtool's do_configure [PATCH]
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
X-List-Received-Date: Thu, 30 Jul 2009 11:29:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Marc Olzheim wrote:
> I'm not sure how you tested this, but there are quotes missing, so that
> the "-E" argument to "grep" is passed to "export" instead. I guess some
> shells have a "-E" flag to "export", so it is silently ignored, but mine
> don't.

I tried both versions - quoted and unquoted - before the commit. Both
worked for me, that is why I committed the shorter one.

Well, adding quotes is safe. Can you check your configure output and
host shell version?

My configure output:

checking for a sed that does not truncate output... (cached) /bin/sed
checking for grep that handles long lines and -e... (cached) /bin/sed
checking for egrep... (cached) /bin/grep -E
checking for fgrep... (cached) /bin/grep -F

It indicates, that it worked correctly.

My native shell is:

/OE/openembedded/build> sh --version
GNU bash, version 4.0.24(1)-release (x86_64-suse-linux-gnu)

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



