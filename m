Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1NZKDx-00089X-Lz
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:23:08 +0100
Received: from pi (unknown [10.240.22.2])
	by mailhost.lundinova.se (Postfix) with ESMTP id 686F5B94006
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 09:20:45 +0100 (CET)
Received: from johan by pi with local (Exim 4.69) (envelope-from <johan@pi>)
	id 1NZKBh-0003Z9-CG for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:20:45 +0100
Date: Mon, 25 Jan 2010 09:20:45 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100125082045.GA12322@lundinova.se>
References: <4B54F75F.9030005@atmel.com>
	<1264007889.4003.207.camel@hammer.suse.cz>
MIME-Version: 1.0
In-Reply-To: <1264007889.4003.207.camel@hammer.suse.cz>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting a cursor
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
X-List-Received-Date: Mon, 25 Jan 2010 08:23:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 20, 2010 at 06:18:09PM +0100, Stanislav Brabec wrote:
> Ulf Samuelsson wrote:
> > Anyone got an idea how to get a cursor as default?
> > Googling, I have seen that /usr/share/icons/xcursor-transparent/cursors
> > all point at a transparent cursor abd that I can generate new cursors
> > using xcursorgen.
> > I guess I can also copy some cursors from a desktop, but If
> > I want to have cursor on by default, is there a magic setting somewhere?
> 
> This is the trick that works for me in GPE:
> 
> mkdir -p ~/.icons/default
> echo "Inherits=xcursor-transparent" >>~/.icons/default/index.theme
> 
> But it is not ideal. I would like to see it disable while using
> touchscreen or keyboard and enabled while using mouse, touchpad or mouse
> keys.

As someone already pointed out you can change the use_cursor setting for
matchbox. The default value however depends on whether your
MACHINE_FEATURES contains "touchscreen" or not.

/Johan



