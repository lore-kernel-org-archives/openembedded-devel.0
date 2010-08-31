Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OqPil-00009L-Ku
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 14:13:48 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OqPiG-0005Ve-5h
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 13:13:16 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OqPiF-0005pM-TN
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 13:13:15 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C7A46EA.9040609@dresearch.de>
References: <1282916906-21411-1-git-send-email-sledz@dresearch.de>
	<4C77C60E.3080106@dresearch.de>
	<AANLkTinuV6vLXXKJ_hrkNs-23cauS8OZA6gpyZySz-=s@mail.gmail.com>
	<4C7A46EA.9040609@dresearch.de>
Date: Tue, 31 Aug 2010 13:13:15 +0100
Message-ID: <1283256795.13038.210.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rsyslog: keep rsyslog running as long as possible on shutdown
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
X-List-Received-Date: Tue, 31 Aug 2010 12:13:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-08-29 at 13:39 +0200, Steffen Sledz wrote:
> Am 28.08.2010 01:34, schrieb Khem Raj:
> >>> +INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
> >>
> >> I just wanted to ask if there are any objections (e.g. a policy on
> >> using start/stop order 'levels') in using 'stop 90' here.
> >>
> > 
> > I guess its distro maintainers call isnt it ?
> 
> I'm not sure if it is. That's why i asked for policies about this. ;-)

Yes, the DISTRO maintainers would have the final say about start/stop
levels (and, indeed, whether to use sysvinit at all).  But it seems
sensible for the package to provide reasonable defaults that would be
acceptable to some/most distros.

p.




