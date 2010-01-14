Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NVRNc-0000x5-Jy
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 16:13:03 +0100
Received: from tamarin.localnet (host-88-217-163-202.customer.m-online.net
	[88.217.163.202])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 7DD841B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 15:08:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jan 2010 16:10:47 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <alpine.LFD.2.00.1001140946280.2804@localhost>
In-Reply-To: <alpine.LFD.2.00.1001140946280.2804@localhost>
MIME-Version: 1.0
Message-Id: <201001141610.47415.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE/bitbake and python 3?
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
X-List-Received-Date: Thu, 14 Jan 2010 15:13:03 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 14 January 2010 15:47:35 Robert P. J. Day wrote:
>   as i'm currently playing with python 3 but also digging my way thru
> bitbake, are there any obvious incompatibilities between bitbake/OE
> and python 3?  i'm assuming there is absolutely no guarantee that
> bitbake/OE will run under python 3.

I think we are using print >> file, STRING in a couple of places. What would be 
interesting is to use the Python3 converter and to look at the diff of what was
changed...



