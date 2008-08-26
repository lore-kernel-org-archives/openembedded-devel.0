Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KXxgG-0005jL-PJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Aug 2008 14:29:52 +0200
Received: from andromeda.vanille.de (e180173185.adsl.alicedsl.de
	[85.180.173.185])
	by drlauer-research.com (Postfix) with ESMTP id D7929584BD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Aug 2008 14:37:01 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Aug 2008 14:28:20 +0200
User-Agent: KMail/1.9.9
References: <g90p1m$r3m$1@ger.gmane.org>
In-Reply-To: <g90p1m$r3m$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200808261428.20385.mickey@vanille-media.de>
Subject: Re: disapprove 9cdbd45b5ff507c6e00fc91c08ec5e17929302f4
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
X-List-Received-Date: Tue, 26 Aug 2008 12:29:52 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Dienstag 26 August 2008 13:22:32 schrieb Rolf Leggewie:
> Koen,
>
> may I suggest that instead of screaming "bogus" at the top of your lungs
> all the time and thus discrediting your fellow contributors' work you
> start pitching in with quality assurance?  There sure are an awful lot
> of stale bugs and unbuildable stuff in OE.
>
> I am well aware that COMPATIBLE_MACHINE in the definition of fso-image
> is not the best solution.  At the current state of affairs, it is
> correct though.  The image relies on $XSERVER which is not defined for
> all machines in OE.  Those machines are incompatible with that image
> definition.
>
> You're heartily invited to help fix OE to have a sane default for
> $XSERVER for *all* machines.  I've started work on this but have not yet
> finished.  Until that is done, removing compatible machine from the
> image definition is a step backwards which is why I have disapproved
> commit 9cdbd45b5ff507c6e00fc91c08ec5e17929302f4.

Well, in this case I agree with Koen.  COMPATIBLE_MACHINE should never appear 
in an image recipe, e.g. I used to happily build fso-image for the Motorola 
EZX series and now i can no longer.

Lets fix the XServer issue instead.

-- 
:M:


