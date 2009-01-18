Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LOWwA-0007C5-DM
	for openembedded-devel@openembedded.org; Sun, 18 Jan 2009 13:39:34 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LOWpT-0008Gy-AP
	for openembedded-devel@openembedded.org; Sun, 18 Jan 2009 12:32:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 18 Jan 2009 12:32:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 18 Jan 2009 12:32:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 18 Jan 2009 13:32:25 +0100
Message-ID: <gkv7gp$n1v$1@ger.gmane.org>
References: <4972660D.7070905@dls.net> <gkur78$pai$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090109 Shredder/3.0b2pre
In-Reply-To: <gkur78$pai$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: mdev?
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
X-List-Received-Date: Sun, 18 Jan 2009 12:39:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-01-09 10:02, Koen Kooi wrote:
> On 18-01-09 00:13, Mike (mwester) wrote:
>> I think I missed something somewhere. It seems that recent images have
>> mdev included in addition to udev - which doesn't work well.
>>
>> Poking around at the updated busybox recipes, I see no way to disable
>> mdev. I already investigated mdev as a replacement for udev on SlugOS,
>> and found it deficient in a number of areas -- so removing udev is not
>> an option for me.
>>
>> So, how do I disable mdev?
>
> The mdev symlink, config file and initscript need to get put in their
> own package (package, not recipe!).

I've implemented this solution. Mike, does it solve the problem for you?

regards,

Koen



