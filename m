Received: from fallback1.mail.ru ([94.100.176.18])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1OM2dW-0006Xt-3S
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 19:30:51 +0200
Received: from mx48.mail.ru (mx48.mail.ru [94.100.176.62])
	by fallback1.mail.ru (mPOP.Fallback_MX) with ESMTP id F0D4691BBC3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jun 2010 21:20:17 +0400 (MSD)
Received: from [77.51.33.209] (port=39589 helo=localhost)
	by mx48.mail.ru with asmtp id 1OM2TB-00081I-00
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 21:20:09 +0400
Date: Tue, 8 Jun 2010 21:20:05 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100608172005.GA28481@rainbow>
References: <20100605204019.GA1403@jama>
	<AANLkTilB6QtJOplQmu00-D7TeVHKiz2fbO5_ZZjN7iRZ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilB6QtJOplQmu00-D7TeVHKiz2fbO5_ZZjN7iRZ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam: Not detected
X-Mras: Ok
X-SA-Exim-Connect-IP: 94.100.176.18
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Latest binutils-cross-2.20.1-r10.0 build issue with binutils-2.20.1 on gentoo host
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
X-List-Received-Date: Tue, 08 Jun 2010 17:30:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 23:14 Mon 07 Jun     , Martin Jansa wrote:
> On Sat, Jun 5, 2010 at 10:40 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > FYI:
> >
> > If you run into issue
> > ar: can't set BFD default target to `x86_64-pc-linux-gnu': Invalid bfd target
> >
> > Like I did in:
> > http://tinderbox.openembedded.net/packages/601631/
> >
Yup. I got this breakage too, only binutils-cross version is 2.18-r10.2
and error is:
ar: can't set BFD default target to `i686-pc-linux-gnu': Invalid bfd target

see for example http://tinderbox.openembedded.net/packages/602258/

Though I didn't dig into problem deeply and simply workaround it by
reverting 208ece17f76686e0faa44b2a9223fcadb692a991
But I'll gladly test any patches fixing the issue (whatever it is) in a
proper way.

-- 
Best regards,
Dmitry "MAD" Artamonow



