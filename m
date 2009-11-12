Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8ZUV-0000wP-OH
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 14:13:38 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 5C2651B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 13:23:10 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 14:11:53 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
	<alpine.LFD.2.00.0911120748300.3045@localhost>
In-Reply-To: <alpine.LFD.2.00.0911120748300.3045@localhost>
MIME-Version: 1.0
Message-Id: <200911121411.53422.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 13:13:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Thursday 12 November 2009 13:58:23 Robert P. J. Day wrote:

>   i'm checking right now if there's an option to "ls" to turn *off*
> that feature, but i don't see one offhand.  perhaps a better lesson is
> that the way xterm's sinstall.sh script works is really hacky, using
> sed to allegedly reproduce a file's existing mode settings.  perhaps
> there's a simpler way to get that effect without dragging "sed" into
> it.  but, again, if only one package was affected, maybe just hack up
> an xterm fix and move on, and deal with things on a case-by-case
> basis as they come up.

Could you please try this patch to the sinstall.sh?

http://paste.lisp.org/display/90216



