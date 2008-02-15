Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JQ3ds-0005Y9-OB
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 17:42:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FGfweH017864
	for <openembedded-devel@openembedded.org>; Fri, 15 Feb 2008 16:41:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17484-08 for <openembedded-devel@openembedded.org>;
	Fri, 15 Feb 2008 16:41:53 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FGfoPR017854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 15 Feb 2008 16:41:50 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fp4dk4$kgh$1@ger.gmane.org>
References: <E1JPfb1-0006hO-Ll@linuxtogo.org>
	<74d0deb30802140817g153c4fe3if16cd9eabe67c9f3@mail.gmail.com>
	<200802151245.30040.mickey@vanille-media.de>	<fp48t2$i8$1@ger.gmane.org>
	<47B5A9A4.3040400@dls.net>  <fp4dk4$kgh$1@ger.gmane.org>
Date: Fri, 15 Feb 2008 16:41:51 +0000
Message-Id: <1203093711.8636.72.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFD: is bitbake 1.8.10 minimum supported standard? (was:	[oe-commits] org.oe.dev anki: fix parse error)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2008 16:42:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-02-15 at 17:11 +0100, Rolf Leggewie wrote:
> Mike (mwester) wrote:
> > Requiring a bitbake upgrade to accommodate a 
> > single-line in a single recipe that can easily be expressed in a fashion 
> > compatible with the existing bitbake versions installed, well that just 
> > seem to fly in the face of that earlier discussion.
> 
> Well, seen from that angle that seems to hold.  But that was not my
> angle and I hope I was not being mistaken in this regard.
> 
> IIRC bitbake 1.8.10 has quite many bug fixes as well (RP?).  So, that is
> more what I was getting at.  AFAIK, .dev and bitbake were meant to be
> closely coupled.  IOW, don't run bleeding edge .dev with an old bitbake
> and expect things to work.
> 
> I am open to extend the time until 1.8.8 is officially dead for .dev
> What do others think about this question of timing?

Yes, 1.8.10 has lots of other fixes and improvements and I'd like to
see .dev switch to it at some point. Once we do that there are some
simplifications of code in OE.dev that can be made too.

I appreciate the bitbake 1.8.6 -> 1.8.8 change was bumpy due to sqlite
but 1.8.8 -> 1.8.10 should just be a drop in replacement so I don't see
any reason not to...

Cheers,

Richard




