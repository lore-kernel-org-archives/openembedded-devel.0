Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N6tOK-0005ir-4E for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 23:04:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N6tN8-0002da-R1
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 23:03:02 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 23:03:02 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 23:03:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 07 Nov 2009 23:02:33 +0100
Message-ID: <hd4qpq$ee0$1@ger.gmane.org>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 22:04:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-11-09 21:38, Frans Meulenbroeks wrote:
> While trying to build xmltv I got this:
>
> NOTE: The MD5Sums did not match. Wanted:
> '495fd8c320f67a0c8e0b90ccb060f0ea' and Got:
> '68d9a93d507bbf917e1f3ad294fd5727'
> NOTE: Task failed: Checksum of
> 'http://xmltwig.com/xmltwig/XML-Twig-3.33.tar.gz' failed
>
> How should I handle this. Of course I can change the checksum, but i
> don't think that is the intention :-)
> Is there a version somewhere cached that has the old checksum (so I
> can compare).
> Or how else should I handle this?

I implemented option 'd':

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=7e8f2afa6fb064aaa3b477456c60f64b20caedeb

And I have to repeat that the twig upstream are idiots for behaving like 
this. May the fleas of a thousand camels infest their sensitive regions!

regards,

Koen



