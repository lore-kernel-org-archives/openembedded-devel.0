Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kq2BV-0007Ii-3P
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 10:56:49 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kq26X-0005TV-3s
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 08:51:41 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 08:51:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 08:51:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Oct 2008 10:51:33 +0200
Message-ID: <gd4aul$sb5$1@ger.gmane.org>
References: <200810151022.38477.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <200810151022.38477.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 08:56:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-10-2008 10:22, Holger Freyther wrote:
> Hey guys,
>
> I would start linking everything with -Wl,--hash-style=both as this is said to
> speed up the loading of shared libraries by about 50%

Also check the as-needed stuff from Poky:

ASNEEDED = "-Wl,--as-needed"
ASNEEDED_pn-console-tools = ""
ASNEEDED_pn-distcc = ""
ASNEEDED_pn-openobex = ""
ASNEEDED_pn-icu = ""
ASNEEDED_pn-xserver-kdrive-xomap = ""
ASNEEDED_pn-minimo = ""
ASNEEDED_pn-pciutils = ""
ASNEEDED_pn-puzzles = ""
ASNEEDED_pn-dialer = ""

TARGET_LDFLAGS += "${ASNEEDED}"

That should also reduce library load time *and* eliminate spurious deps.

> (google is your
> friend). This is an option for binutils and was introduced with binutils
> 2.17. Now there are two ways to achieve this:
>
> Change TARGET_LDFLAGS in e.g. the distro config (as this knows if binutils has
> this option available) or to change the "specs" of gcc to enable this by
> default. There is a patch from debian for gcc4.3 but it is leaving
> arm/armeabi out. What do you guys prefer?

It seems that the TARGET_LDFLAGS in distro would be the best option forward.

> I'm pretty sure that we will want to use the GNU hash style at Openmoko and
> this is creating an interesting problem in regard to a full system upgrade
> (which is supposed to work). Again there are two ways. Use force and bump PE
> on each package but we should avoid this.

PE is only there to fix versioning screwups (be it upstream or OE)

> I propose to rename PR to FILE_PR
> and change PR  to "${FILE_PR}${DISTRO_PR}" so everytime a distro is changing
> something that effects every package we can bump (e.g. Setting DISTRO_PR
> to .1 for Openmoko).

That sounds like a good idea, it would make changing compiler versions a 
lot safer.

regards,

Koen



