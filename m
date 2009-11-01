Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N4eTA-0002Zw-Q7 for openembedded-devel@lists.openembedded.org;
	Sun, 01 Nov 2009 18:44:03 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N4eS4-0005dV-Tp
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Nov 2009 18:42:52 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Nov 2009 18:42:52 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Nov 2009 18:42:52 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 01 Nov 2009 18:42:28 +0100
Message-ID: <hckha6$1ud$1@ger.gmane.org>
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <200910291241.35265.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Sun, 01 Nov 2009 17:44:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29-10-09 12:41, Marcin Juszkiewicz wrote:
>
> Hi
>
> I know that checksums.ini returns many times on ML so many of you are bored
> with it. But I have some stuff to show/share about it.
>
> Sometime ago new format was suggested for conf/checksums.ini and I implemented
> it today. It looks simple and is simple:
>
> [archivename]
> url0=url-to-sources
> url1=alternative-url-to-sources
> url2=another-alternative-url-to-sources
> md5=md5sum
> sha256=sha256sum
>
> What differs from old implementation? Use of archive names instead of urls so
> no more "I fetch from my local Debian mirror and got hit by lack of checksums"
> etc problems. By default OE does not even care about urls - it just checks for
> section by archive name and use md5/sha256 sums to check does file is the
> proper one. Urls can be used by source mirror building tools.
>
> How many changes are needed? Few:
>
> 1. 3 lines patch to base.bbclass
> 2. new checksums sorter
> 3. old checksums ->  new checksums converter
>
> I think that it would be nice to switch to that.
>
> Ideas? Opinions?

Even though the cabal apparantly doesn't want people to respond to your 
idea, I'm going to respond anyway.

I like your idea and think we should implement it. I'm not sure how the 
urlX entries would benefit my usecase, but I suppose it doesn't hurt to 
have them.

regards,

Koen



