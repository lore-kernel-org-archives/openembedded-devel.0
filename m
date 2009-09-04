Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MjWgp-0005dm-Ft
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 13:10:57 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MjWOV-00089b-86
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 11:51:51 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MjWOV-00073c-2P
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 11:51:51 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90909030811k7f6932e0r93c94fccc43e9b1c@mail.gmail.com>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090901055731.GA22534@gmail.com>
	<57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
	<20090901153102.GA12420@gmail.com> <20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
	<1251970342.27780.192.camel@mill.internal.reciva.com>
	<19c1b8a90909030811k7f6932e0r93c94fccc43e9b1c@mail.gmail.com>
Date: Fri, 04 Sep 2009 11:51:47 +0100
Message-Id: <1252061507.27780.507.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Fri, 04 Sep 2009 11:11:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-09-03 at 08:11 -0700, Khem Raj wrote:
> On Thu, Sep 3, 2009 at 2:32 AM, Phil Blundell<philb@gnu.org> wrote:
> > On Wed, 2009-09-02 at 21:36 -0700, Tom Rini wrote:
> >> Can we get away with that?  'linux-gnu' over 'linux' should be fine I
> >> think but I'm worried about 'linux-uclibceabi', is that really a normal
> >> standard and known host?  Also, there's some overrides that depend on
> >> 'uclibcgnueabi' iirc, which need to be updated for libc-uclibc override
> >> instead.
> >
> > I think Khem's patch does update most/all of the overrides in question,
> > but if this requires an OELAYOUT_ABI change then it seems like a lot of
> > disruption to fix what is (if I understand correctly) only a cosmetic
> > problem in the first place.
> 
> The documentation around OELAYOUT_ABI says that it should be bumped
> whenever there is a change in tmp layout structure and this change will do 
> rename few directories and binaries in the tmp folder thats why the 
> bump
> 
> and incremental builds wont work anyway because cross compiler names
> will be different.
> thats why I was bumping it up.

Yes, I know what OELAYOUT_ABI is for.  The point I was making is that,
if changing the TARGET_OS strings is disruptive enough to require an
OELAYOUT_ABI bump (and hence, effectively, force everybody to delete
their working trees and rebuild from scratch), that seems like a lot of
hassle for very little actual gain.

As I understand it, there is no compelling reason why the TARGET_OS
strings need to be changed: the difference between linux and linux-gnu
(and between linux-uclibcgnueabi and linux-uclibceabi) is more of a
cosmetic one than a functional advantage.  If that's the case then the
change doesn't really seem to be important enough to justify the
upheaval; I would suggest leaving those strings alone for now.

If and when we are obliged to bump OELAYOUT_ABI for some other (more
important) reason, that would be a good time to fold in this sort of
thing.

Alternatively, a reasonable compromise might be to arrange for
OELAYOUT_ABI to be bumped only for folks who are using an affected
DISTRO (which I guess means micro and minimal in this situation).

p.




