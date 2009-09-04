Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MjeIi-0001Zf-I2
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 21:18:24 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mje0L-00076f-C8
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 19:59:25 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90909041034w2648fa24pbc0f5899ca229fa2@mail.gmail.com>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
	<1251970342.27780.192.camel@mill.internal.reciva.com>
	<19c1b8a90909030811k7f6932e0r93c94fccc43e9b1c@mail.gmail.com>
	<1252061507.27780.507.camel@mill.internal.reciva.com>
	<19c1b8a90909040827w70b4dd95mc700ca1ebb01b0f4@mail.gmail.com>
	<1252078620.27780.515.camel@mill.internal.reciva.com>
	<19c1b8a90909041034w2648fa24pbc0f5899ca229fa2@mail.gmail.com>
Date: Fri, 04 Sep 2009 19:59:23 +0100
Message-Id: <1252090763.4490.22.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Fri, 04 Sep 2009 19:18:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-09-04 at 10:34 -0700, Khem Raj wrote:
> On Fri, Sep 4, 2009 at 8:37 AM, Phil Blundell<philb@gnu.org> wrote:
> > On Fri, 2009-09-04 at 08:27 -0700, Khem Raj wrote:
> >> Other distros also need this change. IMO it will be better
> >> that we enforce a rebuild otherwise users might have issues that
> >> are hard to debug.
> >
> > Why do other DISTROs need this change?  Surely if they aren't using
> > sane-toolchain.inc to set TARGET_OS then they oughtn't to be affected.
> 
> because of the TARGET_OS OVERRIDES now depend upon the new target triplet.
> Probably one way would be to leave the old overrides in there but that would
> have been more confusing.

Oh, I see.  So anybody who sets TARGET_OS by hand is going to lose
unless they change their settings to match?  I guess there should at
least be a diagnostic for that.

p.




