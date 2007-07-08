Received: from [212.47.7.226] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1I7VWw-0001J1-2v
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jul 2007 14:06:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 01A5C3098793
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jul 2007 14:00:54 +0200 (CEST)
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (penguin [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27956-03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Jul 2007 14:00:53 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id C19A73098792
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jul 2007 14:00:53 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1183886795.6407.15.camel@localhost.localdomain>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<1183886795.6407.15.camel@localhost.localdomain>
Date: Sun, 08 Jul 2007 14:00:51 +0200
Message-Id: <1183896051.5647.24.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.2 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at penguin.cz
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Sun, 08 Jul 2007 12:06:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:

> The ideas in formfactor are directly lifted from zaurusd. I still wish
> zaurusd could become a more generic kind of glue program like the fabled
> devmand should have been but I can't be the person to do that.

On my opinion shell script handled events are very ineffective solution.
It's easy to program it, but it is ugly and slow. For example, look what
happens at headphones removal event: Loading shell interpreter, parsing
script, calling alsactl, writing state to /etc, modifying this text
config by sed, writing it back, calling alsactl again. Think about
millions of obsolete machine instructions and also obsolete /etc write
(one flash cycle or one obsolete start of HDD).

Desktop systems (and devmand proposal) use HAL -> D-BUS -> D-BUS enabled
app. I guess it's the right way, which prevents calling a bunch of
scripts for each single event, and instead of it introduces "listen what
you need, get event, do what you should". Single purpose monitoring
daemons can turn into D-BUS event providers, applications or action
daemons can listen and react on whatever they need.

In upper mentioned example one daemon can listen to keyboard+jack events
and send it to D-BUS, another daemon linked with alsa will list these
events and modify mixer directly.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



