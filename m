Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Mq19Q-0006jT-D1
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 10:55:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 75DAC1409721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 10:48:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WGG-I-EuWmY
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 10:48:41 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 4B1161416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 10:48:40 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090921223956.GF3599@denix.org>
References: <1253549226-16186-1-git-send-email-denis@denix.org>
	<1253562306.16477.38.camel@lenovo.internal.reciva.com>
	<20090921223956.GF3599@denix.org>
Date: Tue, 22 Sep 2009 10:54:31 +0200
Message-Id: <1253609671.5539.10.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.91 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] netbase: don't start udhcpc if kernel assigned IP statically
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
X-List-Received-Date: Tue, 22 Sep 2009 08:55:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Mon, Sep 21, 2009 at 08:45:06PM +0100, Phil Blundell wrote:

> > It seems like there must be a better way of solving this problem.  How
> > about just teaching "ifup -a" to spot interfaces that are already up and
> > leave them alone?
> 
> Won't work for the case of kernel-acquired DHCP address, i.e. kernel level 
> autoconfig, aka IP_PNP, aka ip=dhcp command line.

It was done in past, but removed. With one of new wpa_supplicant
versions, wireless stopped to work. wpa_supplicant turns up any wireless
interface immediately. (Well, WPA wireless still needs debugging. It
works with about 50% probability.)

What about parsing of kernel parameters during the boot and then doing
something.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



