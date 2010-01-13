Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NV9NA-00018f-Ou
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 20:59:23 +0100
Received: from 88-109-31-216.dynamic.dsl.as9105.com ([88.109.31.216]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NV9L4-00073p-VL
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 19:57:11 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263337290.13906.27.camel@utx.utx.cz>
References: <1263337290.13906.27.camel@utx.utx.cz>
Date: Wed, 13 Jan 2010 19:57:06 +0000
Message-ID: <1263412626.457.275.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: GTK+, disabled XKB a.k.a. why keymaps/ModeSwitch don't work well in GPE or XFCE
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
X-List-Received-Date: Wed, 13 Jan 2010 19:59:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-01-13 at 00:01 +0100, Stanislav Brabec wrote:
> So there is a question: Why XKB is disabled in OE GTK+? Does it have any
> reason or it is a relict from the ancient age of kdrive based
> systems(**)? If it is true, I propose a patch to remove --disable-xkb
> not only from gtk+, but also all xorg-app and xorg-lib, or at least move
> this option to distribution configuration.

It probably is just a relic for the most part.  I think the original
reason for turning it off was that the majority of the platforms which
the contemporary distros were targetting at that time had (a) no
keyboards, or only rudimentary ones; and (b) very little flash space, so
the few kilobytes that could be saved by leaving out XKB support were
significant.

So, yes, making XKB support be a DISTRO_FEATURE sounds like a fine idea
to me.

p.




