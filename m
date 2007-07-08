Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1I7Xou-00073i-BD
	for openembedded-devel@openembedded.org; Sun, 08 Jul 2007 16:33:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l68ERZpa006200
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Jul 2007 15:27:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06034-03 for <openembedded-devel@openembedded.org>;
	Sun,  8 Jul 2007 15:27:32 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l68ERTmd006184
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Jul 2007 15:27:29 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1183896051.5647.24.camel@utx.lan>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<1183886795.6407.15.camel@localhost.localdomain>
	<1183896051.5647.24.camel@utx.lan>
Date: Sun, 08 Jul 2007 15:27:28 +0100
Message-Id: <1183904848.6407.33.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sun, 08 Jul 2007 14:33:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-07-08 at 14:00 +0200, Stanislav Brabec wrote:
> Richard Purdie wrote:
> > The ideas in formfactor are directly lifted from zaurusd. I still wish
> > zaurusd could become a more generic kind of glue program like the fabled
> > devmand should have been but I can't be the person to do that.
> 
> On my opinion shell script handled events are very ineffective solution.
> It's easy to program it, but it is ugly and slow. For example, look what
> happens at headphones removal event: Loading shell interpreter, parsing
> script, calling alsactl, writing state to /etc, modifying this text
> config by sed, writing it back, calling alsactl again. Think about
> millions of obsolete machine instructions and also obsolete /etc write
> (one flash cycle or one obsolete start of HDD).

This is a tangent to the original point but yes, shell isn't the most
efficient way to do this. FWIW, none of the events handled in zaurusd
needs massive amounts of efficiency and it did need something easy to
program/hack as when it was written, it was meant as a prototype and
hence was subject to change.

> Desktop systems (and devmand proposal) use HAL -> D-BUS -> D-BUS enabled
> app. I guess it's the right way, which prevents calling a bunch of
> scripts for each single event, and instead of it introduces "listen what
> you need, get event, do what you should". Single purpose monitoring
> daemons can turn into D-BUS event providers, applications or action
> daemons can listen and react on whatever they need.
> 
> In upper mentioned example one daemon can listen to keyboard+jack events
> and send it to D-BUS, another daemon linked with alsa will list these
> events and modify mixer directly.

It you look through the archives I've always hinted it would evolve to
use dbus. With the current playing field, it would make sense to work
with OHM for that. Where I disagree with OHM is about the need for a
source for device specific data like dpi. keyboard location etc :-(.

Regards,

Richard




