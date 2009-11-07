Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N6mdJ-0002rw-7s for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 15:51:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N6mc8-00085q-8h
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 15:50:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 15:50:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 15:50:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 07 Nov 2009 15:42:16 +0100
Message-ID: <hd4108$sbn$2@ger.gmane.org>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>	<200911070406.18094.holger+oe@freyther.de>	<ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
	<4AF574B5.2010802@mwester.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4AF574B5.2010802@mwester.net>
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
X-List-Received-Date: Sat, 07 Nov 2009 14:51:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-11-09 14:23, Mike Westerhof wrote:
> Frans Meulenbroeks wrote:
> ...
>>
>> Reluctantly updated checksums.ini
>>
>> Frans
>
> But of course there's no magic that will remove the old cached tarball
> out of one's downloads directory when this sort of thing happens.
> (Busybox has been known to do this, too)
>
> What do folks think we should do about that when it occurs?
> a) support two entries (old and new) in checksums.ini
> b) do nothing (leave as is)
> c) add some sort of support so that the user gets additional information
>     with the new checksum match failure explaining that the checksum was
>     updated and they need to manually remove the old (bad) tarball

d) rename the tarball slighty and mirror in on a known good server (e.g. 
angstrom sourcemirror) and have OE use that.

regards,

Koen



