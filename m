Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXkCQ-0006KH-QQ
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 23:38:26 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXkB6-0007G2-L2
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 22:37:04 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 22:37:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 22:37:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 23:36:50 +0100
Message-ID: <gn28a2$8if$1@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>	<1234460865.3592.2.camel@mill.internal.reciva.com>
	<49946CA4.6060303@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <49946CA4.6060303@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass: add dynamic depends on locale packages (ipk specific)
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
X-List-Received-Date: Thu, 12 Feb 2009 22:38:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 19:38, Mike (mwester) wrote:
> Phil Blundell wrote:
>> On Thu, 2009-02-12 at 14:38 -0200, Otavio Salvador wrote:
>>> +
>>> +		if pkgname.find('-locale-') == -1:
>>> +			rdepends.append('%s-locale*' % pkgname)
>>> +
>> This looks like it will add locale dependencies to all the subpackages
>> (e.g. foo-doc, foo-dev and the like) as well as the main "foo" package,
>> which is a bit different to how the old code used to work.  But I guess
>> that's harmless enough: the worst effect will be to bloat the Packages
>> file a bit, and I doubt anybody will care too much.  So, thumbs up from
>> me.
>
> How much bloat?  Opkg already trips the OOM killer on the NSLU2 (32MB of
> RAM) when it loads the current Packages file and then tries to do
> something; we can work around it for now, but if this doubles the size
> in-memory, we may simply not have enough RAM to do whatever it is that
> opkg does with all that in-memory.
>
> I have grave concerns over anything that adds unnecessary entries that
> cannot be turned off.

You can make them approx 50% smaller by doing:

echo -n "Stripping source lines from Package files"
for i in `find .. -name Packages` ; do grep -v ^Source: $i|gzip 
-c9>$i.gz ;gunzip -c $i.gz>$i ; touch $i.sig ; done

And I have devices with 8MB ram that run opkg, so I echo Mike's comments :)

regards,

Koen



