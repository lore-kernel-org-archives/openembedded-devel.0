Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NReBv-0006u0-GL
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 05:05:18 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C1F821B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2010 04:00:27 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 Jan 2010 05:02:59 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1262570891.5811.14.camel@dejunliu-desktop>
	<201001040347.14305.holger+oe@freyther.de>
	<1262574693.5811.27.camel@dejunliu-desktop>
In-Reply-To: <1262574693.5811.27.camel@dejunliu-desktop>
MIME-Version: 1.0
Message-Id: <201001040502.59944.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: help on angstrom qemu
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
X-List-Received-Date: Mon, 04 Jan 2010 04:05:18 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Monday 04 January 2010 04:11:33 Dejun.Liu wrote:

> -->I used the OE build Qemu which at the staging
> dir(angstrom-dev/staging/i686-linux/usr/bin).
> and i executed the command in the buildserver not using ssh

The good thing is, I was just trying the same and see the error you see. The 
error is printed by qemu when it can not use the SetVideoMode call of SDL.

I will land a fix in a second. What you want to change in libsdl-native as a 
quick solution is to add DEPENDS += "libx11-native" and change --disable-
video-x11" to --enable-video-x11".


thanks
	z.








