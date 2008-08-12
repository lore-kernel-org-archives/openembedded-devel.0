Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KSzmA-000887-LV
	for openembedded-devel@openembedded.org; Tue, 12 Aug 2008 21:43:26 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KSzld-0002fx-0l
	for openembedded-devel@openembedded.org; Tue, 12 Aug 2008 19:42:53 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 12 Aug 2008 19:42:53 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 12 Aug 2008 19:42:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 12 Aug 2008 21:42:36 +0200
Message-ID: <g7sp3d$kte$1@ger.gmane.org>
References: <48A1D100.8070102@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <48A1D100.8070102@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: oprofile updates
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
X-List-Received-Date: Tue, 12 Aug 2008 19:43:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> Hi,
> as you might have seen I committed a patch for oprofile 0.9.3 and added
> 0.9.4.
>
> 0.9.3 was applying a patch that adds armv7 support but the CPU event
> files were not distributed because the patch modified a Makefile.in
> (which was overwritten since OE does autogen.sh/autoreconf).
>
> To my surprise the armv7 patch is still needed for 0.9.4 (although it
> was created months ago). So I adjusted it for this version.
>
> Oprofile 0.9.4 is interesting because it
>   - supports the avr32 CPUs
>   - provides libopagent
>
> The latter is hot stuff for JIT compilers: With the library you can tell
> oprofile that a JIT-created area of machine code has a certain name.
> With the name and the instruction sequence itself oprofile can then
> provide the same level of detailed information as it provides for normal
> C and C++ functions.
>
> Needless to say I would be happy if oprofile 0.9.4 could make it into
> angstrom 2008.1. :)

For which archs? It's already there for armv7a (it's part of the demo 
image): 
http://www.angstrom-distribution.org/repo/?action=details&pnm=oprofile

regards,

Koen



