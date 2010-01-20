Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NXeED-0007XS-Q6
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 18:20:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id E2D871417193
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 18:20:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wty4yfkgErk2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 18:20:33 +0100 (CET)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id C10B31417184
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 18:20:33 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B54F75F.9030005@atmel.com>
References: <4B54F75F.9030005@atmel.com>
Date: Wed, 20 Jan 2010 18:18:09 +0100
Message-Id: <1264007889.4003.207.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
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
X-List-Received-Date: Wed, 20 Jan 2010 17:20:28 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Ulf Samuelsson wrote:
> Anyone got an idea how to get a cursor as default?
> Googling, I have seen that /usr/share/icons/xcursor-transparent/cursors
> all point at a transparent cursor abd that I can generate new cursors
> using xcursorgen.
> I guess I can also copy some cursors from a desktop, but If
> I want to have cursor on by default, is there a magic setting somewhere?

This is the trick that works for me in GPE:

mkdir -p ~/.icons/default
echo "Inherits=xcursor-transparent" >>~/.icons/default/index.theme

But it is not ideal. I would like to see it disable while using
touchscreen or keyboard and enabled while using mouse, touchpad or mouse
keys.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



