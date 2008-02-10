Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JOJnj-0000SP-2m
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Feb 2008 22:33:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id E228C14171BF;
	Sun, 10 Feb 2008 22:33:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1BnaulfynGn; Sun, 10 Feb 2008 22:33:40 +0100 (CET)
Received: from zaurus.lan (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 6893D1417196;
	Sun, 10 Feb 2008 22:33:40 +0100 (CET)
Date: Sun, 10 Feb 2008 22:33:47 +0100
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080210223347.7a151067@zaurus.lan>
In-Reply-To: <47ADA3F2.1000500@gmail.com>
References: <1201544344.5882.45.camel@hammer.suse.cz>
	<20080130124544.1f562944@widy.localdomain>
	<1201695196.27523.52.camel@hammer.suse.cz>
	<47A2D217.7070000@gmail.com> <1202075839.17746.11.camel@utx.utx.cz>
	<47ADA3F2.1000500@gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.0; arm-angstrom-linux-gnueabi)
Mime-Version: 1.0
Subject: Re: [patch commit request] kdrive xserver:	support	for	key codes 128-255
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
X-List-Received-Date: Sun, 10 Feb 2008 21:33:27 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 09 Feb 2008 07:00:34 -0600 Junqian Gordon Xu wrote:

> On 02/03/2008 03:57 PM, Stanislav Brabec wrote:

> > It adds support for key codes 128-255 in general.
> 
> I understand this patch is general. But could you educate me that
> except for the Z clamshells, what's the use case for other devices? I
> guess my question is more in line with Paul's challenge. Is this
> patch just a why-not for other devices or something might be helpful?

Many devices have special keys with (input.h) keycodes outside 1-127
(e. g. Mail - KEY_MAIL).

Now you have to map them to a random keys from range 1-127, otherwise
it will not work. In particular it invalidates key interpretation in
the kernel - kernel knows, that the key is Mail and not F11 but it has
to send KEY_F11, because KEY_MAIL is lost.

Even after this patch the situation will not be ideal - for example
KEY_OK has keycode 352 and cannot pass through X11 protocol. That is
why it is only a partial solution. Final solution could be: upgrade to
X12 (rewrite X and give up 20 years of compatibility; in proposal
collection stage) or at least write X Evdev Extension and Xlib keyboard
code rewrite (simpler to implement, but not yet started to work on).

The opinion of kernel people: We have a good and modern keyboard
layer, which can provide exact key meaning. We don't want to be limited
to 1-127 and mangle our keycodes. Let userspace fix their broken
drivers.

And hardware manufacturers don't make things easier. Many USB keyboards
identify themselves as devices including keys defined in the HID
standard (it allows them to recycle the same chip).

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus


