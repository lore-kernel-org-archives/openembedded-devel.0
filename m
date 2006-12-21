Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GxS04-0000xr-CG
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Dec 2006 18:46:36 +0100
Received: by nf-out-0910.google.com with SMTP id l24so2906278nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2006 09:44:08 -0800 (PST)
Received: by 10.49.91.6 with SMTP id t6mr11081169nfl.1166723047698;
	Thu, 21 Dec 2006 09:44:07 -0800 (PST)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id l22sm41007046nfc.2006.12.21.09.44.06;
	Thu, 21 Dec 2006 09:44:07 -0800 (PST)
Date: Thu, 21 Dec 2006 19:44:02 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1151969252.20061221194402@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <458AC366.3030405@dominion.kabel.utwente.nl>
References: <458AC366.3030405@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] Enable tune-thumb.inc for all armv5t and armv6t machines
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
X-List-Received-Date: Thu, 21 Dec 2006 17:46:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Thursday, December 21, 2006, 7:24:54 PM, you wrote:

> Hi,

> Today I seperated the thumb bits from
> conf/machine/include/ipx4xx.conf into
> conf/machine/include/. I'd like to enable for all >=v5t machines, but I'm unsure about
> using positive or negative logic.

  What about armv4t?

> * positive logic: might break for (soft)fpa distros that don't disable it, no problem for
> EABI distros
> * negative logic: no difference to status quo, but having negative logic in tune-* files
> feels a bit wrong.

  It's very nice to see ("real") thumb support being added to OE in
general! But I guess, it's too bold a step to switch to it be the
default. There're usual risk management issues (who knows what bugs
CPUs/software have regarding thumb), plus, thumb has known drawback of
reduced performance.

  In ideal case, thumb usage would be set per-package, with most
of libraries being normal code, and most apps - thumb (and in this
case thumb can be indeed the default).


> If you need numbers:
> http://ewi546.ewi.utwente.nl/tmp/thumb/comparison.txt (package:
> <thumb size> <regular size> (<unit>))

  Using ipk sizes is of course pretty heuristical ;-). IMHO, those
sizes are not too much convincing at all, but I'm sure raw exe sizes
are better, and striving for that ideal case is worthy task ;-)

> what do you all think?

> regards,

> Koen


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



