Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1Mj4Lw-0004Ce-3y
	for openembedded-devel@openembedded.org; Thu, 03 Sep 2009 06:55:20 +0200
Received: (qmail 24541 invoked from network); 3 Sep 2009 04:36:31 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 2 Sep 2009 21:36:31 -0700
Date: Wed, 2 Sep 2009 21:36:30 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090903043630.GQ23034@smtp.west.cox.net>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
	<20090901055731.GA22534@gmail.com>
	<57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
	<20090901153102.GA12420@gmail.com>
	<20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?=	linux-gnuspe for e500
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
X-List-Received-Date: Thu, 03 Sep 2009 04:55:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 02, 2009 at 02:07:54PM -0700, Khem Raj wrote:
> On Wed, Sep 2, 2009 at 1:29 PM, Phil Blundell<philb@gnu.org> wrote:
> > On Wed, 2009-09-02 at 12:20 -0700, Khem Raj wrote:
> >> This also changes the target triplet for linux-uclibgnueabi to
> >> uclibc-uclibcebi. So I have also bumped up the OELAYOUT_ABI
> >
> > Ah, that doesn't sound so good.  Changing OELAYOUT_ABI will be a
> > nuisance for everyone, even if they aren't using either uclibc or the
> > TARGET_OS auto-generator.  Is there a way to avoid that?
> 
> It changes from linux to linux-gnu for non uclibc systems too which I
> forgot to mention

Can we get away with that?  'linux-gnu' over 'linux' should be fine I
think but I'm worried about 'linux-uclibceabi', is that really a normal
standard and known host?  Also, there's some overrides that depend on
'uclibcgnueabi' iirc, which need to be updated for libc-uclibc override
instead.

-- 
Tom Rini


