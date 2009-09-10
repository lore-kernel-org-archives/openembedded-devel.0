Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mlder-0005LJ-Nf
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 09:01:32 +0200
Received: from tamarin.localnet (123-192-182-244.dynamic.kbronet.com.tw
	[123.192.182.244])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 0C9251B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 07:06:40 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Sep 2009 09:00:44 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
References: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
	<19c1b8a90906231030i3e810672j13ca95b56c647022@mail.gmail.com>
	<1245779214.29153.376.camel@lenovo.internal.reciva.com>
In-Reply-To: <1245779214.29153.376.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200909100900.44916.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [rfc] change default for BUILD_OPTIMIZATION, remove	spurious 	assignments
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
X-List-Received-Date: Thu, 10 Sep 2009 07:01:32 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 23 June 2009 19:46:54 Phil Blundell wrote:
> On Tue, 2009-06-23 at 10:30 -0700, Khem Raj wrote:
> >  -frename-registers was a workaround to get past a ARM GCC ICE in 4.2
> > IIRC we should get rid of it.
>
> No, -frename-registers is an optimisation in its own right.  I think we
> probably want to keep that.  You might be thinking of the
> -fno-rename-registers that we do use for some packages to avoid an ice
> on arm with gcc 3.4.
>
> > -fexpensive-optimizations and -fomit-frame-pointer are passed by
> > default at O2 so we should get rid of them too.
>
> Is that true on all targets?  I didn't think that -O2 implied
> -fomit-frame-pointer on arm.

=46rom my  testing on recent gcc... it is turned on by default.

z.


