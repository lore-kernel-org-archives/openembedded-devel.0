Received: from cassiel.sirena.org.uk ([80.68.93.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1OobcD-0000QX-Us
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 14:31:35 +0200
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1Oobbj-0001UP-Ty
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 13:31:03 +0100
Resent-From: broonie@sirena.org.uk
Resent-Date: Thu, 26 Aug 2010 13:31:03 +0100
Resent-Message-ID: <20100826123103.GA5721@sirena.org.uk>
Resent-To: openembedded-devel@lists.openembedded.org
Received: from opensource.wolfsonmicro.com ([80.75.67.52]
	helo=opensource2.wolfsonmicro.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@opensource.wolfsonmicro.com>)
	id 1OoFrp-0004pJ-OH for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 15:18:30 +0200
Received: from finisterre.wolfsonmicro.main (lumison.wolfsonmicro.com
	[87.246.78.27])
	by opensource2.wolfsonmicro.com (Postfix) with ESMTPSA id CA00178815C; 
	Wed, 25 Aug 2010 14:12:11 +0100 (BST)
Received: from broonie by finisterre.wolfsonmicro.main with local (Exim 4.72)
	(envelope-from <broonie@opensource.wolfsonmicro.com>)
	id 1OoFmI-0000Hv-UL; Wed, 25 Aug 2010 14:12:30 +0100
Date: Wed, 25 Aug 2010 14:12:30 +0100
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
To: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Message-ID: <20100825131230.GA1102@opensource.wolfsonmicro.com>
References: <1282294508.6198.27.camel@dpdev> <4C6E920E.4030806@balister.org>
	<1282319238.17914.5.camel@dpdev> <1282733124.8247.0.camel@dpdev>
MIME-Version: 1.0
In-Reply-To: <1282733124.8247.0.camel@dpdev>
X-Cookie: You will be awarded some great honor.
User-Agent: Mutt/1.5.20 (2009-06-14)
Resent-Date: Thu, 26 Aug 2010 13:31:03 +0100
X-SA-Exim-Connect-IP: 80.68.93.111
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: udev hangs on boot
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
X-List-Received-Date: Thu, 26 Aug 2010 12:31:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 25, 2010 at 11:45:24AM +0100, Dimitris Papastamos wrote:

> The issue has been resolved. Udev was hanging on boot because the kernel
> was compiled without unix domain sockets support.

Hrm, udev probably ought to be complaining more loudly about that one,
and have error handling that doesn't involve hanging.



