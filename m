Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M9xU2-0005UF-Mq
	for openembedded-devel@openembedded.org; Fri, 29 May 2009 10:30:37 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M9xLu-0003ig-SX
	for openembedded-devel@openembedded.org; Fri, 29 May 2009 08:22:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 29 May 2009 08:22:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 29 May 2009 08:22:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 29 May 2009 10:22:00 +0200
Message-ID: <gvo5v8$1ef$1@ger.gmane.org>
References: <4A1F82D2.6020707@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090522 Shredder/3.0b3pre
In-Reply-To: <4A1F82D2.6020707@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
Subject: Re: libx11 1.2 problems (dolt vs. libtool)
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
X-List-Received-Date: Fri, 29 May 2009 08:30:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29-05-09 08:38, Jeremy Lainé wrote:
> Since libx11 was upgraded to 1.2, my libx11 builds are failing with:
>
> | ../../../doltlibtool: line 17:
> /home/oebuilder/oe/build/tmp/work/ppce300c3-angstrom-linux/libx11-1_1.2-r0/libX11-1.2/modules/im/ximcp/../../../libtool:
> No such file or directory
> | ../../../doltlibtool: line 17: exec:
> /home/oebuilder/oe/build/tmp/work/ppce300c3-angstrom-linux/libx11-1_1.2-r0/libX11-1.2/modules/im/ximcp/../../../libtool:
> cannot execute: No suchfile or directory
>
> It would seem I am not the only one with this problem:
>
> http://tinderbox.openembedded.net/packages/libx11/
>
> The problem is that the "dolibtool" script (see http://dolt.freedesktop.org) is trying to
> invoke the "libtool" script which it assumes lives in the base directory. However in OE
> the libtool script is called ${HOST_SYS}-libtool, so it is not being found.
>
> For now I am working around the problem with the following patch, but I suspect this is
> going to crop up in other packages sooner or later:

Powerpc is in the dolt whitelist (upstream, not OE), we already see this 
problem with webkit, and solve it in the exact same way.

regards,

Koen



