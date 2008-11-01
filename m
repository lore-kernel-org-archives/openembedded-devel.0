Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1KwFDg-00031q-SI
	for openembedded-devel@openembedded.org; Sat, 01 Nov 2008 13:04:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 0FF251405338
	for <openembedded-devel@openembedded.org>;
	Sat,  1 Nov 2008 12:39:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwgXh4vUZyQi for <openembedded-devel@openembedded.org>;
	Sat,  1 Nov 2008 12:39:08 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id C95261416BA2
	for <openembedded-devel@openembedded.org>;
	Sat,  1 Nov 2008 12:39:08 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@openembedded.org
In-Reply-To: <geh3kt$bp7$1@ger.gmane.org>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>
	<20081031233753.43f5f09d.raster@rasterman.com>	<gef9q7$o65$1@ger.gmane.org>
	<20081101085334.8afcd730.raster@rasterman.com>
	<geh3kt$bp7$1@ger.gmane.org>
Date: Sat, 01 Nov 2008 12:38:16 +0100
Message-Id: <1225539496.4090.6.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig	on boot when ld.so. conf is present
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
X-List-Received-Date: Sat, 01 Nov 2008 12:04:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> I don't have a strong opinion on that :) People more knowledgable about 
> ldconfig should chip in on this topic.

And what about something like:
if ..../ld.so.cache -ot /usr/lib -o /etc/ld.so.cache -ot /lib ; then
    /sbin/ldconfig
fi

Call ldconfig only if ld.so cache is outdated. Fast for users of package
managers, working for others, fast in subsequent reboots.

I guess that all package managers use method "fill new file in target
directory, then replace existing", so timestamp of library directory is
updated on any change.

Note that /etc/ld.so.conf contain also /usr/local/lib (not exists by
default, but defined by FHS) and /usr/X11R6/lib (obsolete).


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



