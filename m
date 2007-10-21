Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IjkEY-0004oK-TU
	for openembedded-devel@openembedded.org; Mon, 22 Oct 2007 01:29:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9LNMQhV026030
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Oct 2007 00:22:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25947-02 for <openembedded-devel@openembedded.org>;
	Mon, 22 Oct 2007 00:22:22 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9LNMJTE026024
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Oct 2007 00:22:20 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4718A147.4000306@student.utwente.nl>
References: <E1Iinn8-0004il-BP@linuxtogo.org>
	<74d0deb30710190309s4c794a0gbb960a983ce41c9e@mail.gmail.com>
	<4718A147.4000306@student.utwente.nl>
Date: Mon, 22 Oct 2007 00:22:19 +0100
Message-Id: <1193008939.6145.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev	conf/distro/include/angstrom-2007-preferred-versions.inc: add
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
X-List-Received-Date: Sun, 21 Oct 2007 23:29:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-10-19 at 14:21 +0200, Koen Kooi wrote:
> > [...]
> >> +PREFERRED_VERSION_dbus ?="1.0.2"
> >> +PREFERRED_VERSION_dbus-c ?=""
> >> +PREFERRED_VERSION_dbus-c ?=""
> > 
> > dbus-c++ ?
> 
> yeah, it breaks on any PV with a '+' in it :(

Can you give an example? I can't seem to break that here...

> Incidentally, it also uncovers a bitbake bug:
> 
> Traceback (most recent call last):
>   File "/data/build/oe/bitbake/bin/bitbake", line 134, in <module>
>     main()
>   File "/data/build/oe/bitbake/bin/bitbake", line 131, in main
>     cooker.cook()
>   File "/data/build/oe/bitbake/lib/bb/cooker.py", line 565, in cook
>     return self.buildTargets(pkgs_to_build)
>   File "/data/build/oe/bitbake/lib/bb/cooker.py", line 470, in buildTargets
>     taskdata.add_unresolved(localdata, self.status)
>   File "/data/build/oe/bitbake/lib/bb/taskdata.py", line 509, in
> add_unresolved
>     self.add_provider_internal(cfgData, dataCache, target)
>   File "/data/build/oe/bitbake/lib/bb/taskdata.py", line 360, in
> add_provider_internal
>     eligible, foundUnique = bb.providers.filterProviders(all_p, item,
> cfgData, dataCache)
>   File "/data/build/oe/bitbake/lib/bb/providers.py", line 254, in
> filterProviders
>     eligible = _filterProviders(providers, item, cfgData, dataCache)
>   File "/data/build/oe/bitbake/lib/bb/providers.py", line 231, in
> _filterProviders
>     newver = "%s-%s" % (newvers[1], newvers[2])
> IndexError: string index out of range
> 
> 
> for thing like wirelesstool ('28') and jpeg '6b', it seems to access teh
> nevers[] array out of bounds.

Hopefully this and a raft of other bugs (like the weird bitbake -s
output) should be fixed now.

Cheers,

Richard




