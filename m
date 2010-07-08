Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OX98A-0007Z2-Tf
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 10:40:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1OWyhH-0002AP-Rt; Thu, 08 Jul 2010 22:31:55 +0100
From: Phil Blundell <philb@gnu.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <AANLkTinJLDCgt2ku0lIoHiT0EPlYMH8HDJLI-hAaXMvG@mail.gmail.com>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com>
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com>
	<1278622050.15825.18.camel@lenovo.internal.reciva.com>
	<AANLkTinJLDCgt2ku0lIoHiT0EPlYMH8HDJLI-hAaXMvG@mail.gmail.com>
Date: Thu, 08 Jul 2010 22:32:04 +0100
Message-ID: <1278624724.15825.32.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 08:40:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2010-07-08 at 14:12 -0700, Khem Raj wrote:
> hmm TARGET_ARCH wouldnt be the one but BASE_PACKAGE_ARCH does have sub-arch
> info. Although I would agree with you that we can build this information from
> BASE_PACKAGE_ARCH but its not as bad to have it as a machine feature either.

I do think it is fairly undesirable to have the same thing configured in
two places.  If a DISTRO sets THUMB_INTERWORK to off on a v4t platform
then I think they would have a reasonable expectation that this would
cause bx to not be used.  If uclibc is looking at some other place to
decide then it will not behave in the expected fashion.

p.





