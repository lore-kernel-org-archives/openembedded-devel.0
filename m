Received: from static.88-198-119-4.clients.your-server.de ([88.198.119.4]
	helo=hetzner) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pl0Ic-0001ov-SV
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 15:36:43 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Pl07P-00006S-JF
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 15:25:07 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1296735116.2258.44.camel@phil-desktop>
References: <4D4929CB.6040009@dresearch.de>	<4D49552D.3010705@dresearch.de>
	<4D4A6796.1070006@dresearch.de>
	<AANLkTinyw5W+jaZVba1LyAn5h1c-1kCDt9vXPBERhzk2@mail.gmail.com>
	<4D4A88FC.3090706@dresearch.de> <4D4A91D9.2040406@freyther.de>
	<4D4A96A0.4080402@dresearch.de> <4D4A9739.6040909@freyther.de>
	<4D4A9A94.6030108@dresearch.de> <1296735116.2258.44.camel@phil-desktop>
Date: Thu, 03 Feb 2011 14:25:09 +0000
Message-ID: <1296743109.15389.1.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 14:36:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-02-03 at 12:11 +0000, Phil Blundell wrote:
> On Thu, 2011-02-03 at 13:07 +0100, Steffen Sledz wrote:
> > conftest.c:(.text+0xc): undefined reference to `mcount'
> 
> That looks like your C library was either built without profiling
> support, or is using a different profiling ABI.  (I think there was a
> change in this area for ARM EABI sometime around gcc 4.4, and glibc
> might not have caught up with it.)

Oh, I just noticed that it's glibc itself you're trying to build with
profiling on.  You need to not do that, or at least not by the mechanism
you're trying to use.  If you really want to profile glibc itself then
there is an --enable-profile configure option which will do the right
thing.  Otherwise, you need to suppress the PROFILE_OPTIMIZATION when
building glibc.

p.




