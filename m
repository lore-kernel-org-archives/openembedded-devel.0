Received: from fmmailgate02.web.de ([217.72.192.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1NeXJz-0004Y7-PL
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 18:22:54 +0100
Received: from smtp08.web.de (fmsmtp08.dlan.cinetic.de [172.20.5.216])
	by fmmailgate02.web.de (Postfix) with ESMTP id D530B14D4D80D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2010 17:48:47 +0100 (CET)
Received: from [79.215.2.198] (helo=merkur.sol.de)
	by smtp08.web.de with asmtp (TLSv1:AES256-SHA:256)
	(WEB.DE 4.110 #314) id 1NeWn1-0002fl-00
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 17:48:47 +0100
Received: from jens by merkur.sol.de with local (Exim 4.69)
	(envelope-from <tux-master@web.de>) id 1NeWa3-0001zz-UQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 17:35:24 +0100
Date: Mon, 8 Feb 2010 17:35:23 +0100
From: Jens Seidel <jensseidel@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100208163520.GA7674@merkur.sol.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4B701EA0.5090304@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4B701EA0.5090304@dresearch.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: tux-master@web.de
X-Sender: tux-master@web.de
X-Provags-ID: V01U2FsdGVkX18sWDKbxyc8wnl9i+tg4NEnoKueiJ3SXxWrzTve
	OyImXl0QUwtFtMx9F8dKX3QyCUbReKKAC7D9tbjJ51mSI0BMzy sni70yEYg=
X-SA-Exim-Connect-IP: 217.72.192.227
X-SA-Exim-Mail-From: tux-master@web.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: configure failes for mc-4.6.2-r4
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
X-List-Received-Date: Mon, 08 Feb 2010 17:22:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2010 at 03:24:32PM +0100, Steffen Sledz wrote:
> Is anybody familar with autotools able to fix this?
 
> ERROR: function do_configure failed
> ERROR: log data follows (/home/DRESEARCH/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/mc-4.6.2-r4/temp/log.do_configure.3914)
> | NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint

> | autoreconf: configure.ac: not using Gettext

> | configure.ac:104: required file `config/config.rpath' not found

As far as I remember config/config.rpath is added by autopoint which
provides translation support. I call in my scripts
$ autopoint --force
after
$ autoreconf --force --install -I config

I wonder about the "not using Gettext" but the problem is probably
"--exclude=autopoint".

Hope it helps,
Jens


