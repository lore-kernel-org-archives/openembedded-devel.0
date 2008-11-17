Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L1zt6-0005e0-Ck
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 09:55:16 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L1zqp-00050g-O6
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 08:52:55 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 08:52:55 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 08:52:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 Nov 2008 09:52:47 +0100
Message-ID: <gfrbd0$69v$1@ger.gmane.org>
References: <gfnf5u$r3j$1@ger.gmane.org>	<20081116145911.GB14299@dodger.lab.datenfreihafen.org>	<20081117021309.1e431de0.raster@rasterman.com>	<gfpe06$6vm$3@ger.gmane.org>
	<20081117083928.ea23524c.raster@rasterman.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <20081117083928.ea23524c.raster@rasterman.com>
Sender: news <news@ger.gmane.org>
Subject: Re: e-wm broken after yesterdays upgrade
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
X-List-Received-Date: Mon, 17 Nov 2008 08:55:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-11-08 22:39, Carsten Haitzler (The Rasterman) wrote:
> On Sun, 16 Nov 2008 16:24:54 +0100 Koen Kooi<k.kooi@student.utwente.nl>
> babbled:
>
>> On 16-11-08 16:13, Carsten Haitzler (The Rasterman) wrote:
>>> On Sun, 16 Nov 2008 15:59:11 +0100 Stefan Schmidt<stefan@datenfreihafen.org>
>>> babbled:
>>>
>>> same. i have done a lot of changes to e packaging to keep up with upstream
>>> changes - and i tested newly build and flashed images (thats how i always do
>>> it) and of course it all works. i find it hard to think eina would have been
>>> dropped somewhere there as u'd get much bigger problems (you wouldn't even
>>> get e to start and get that far). are there loaders in the loaders dir
>>> (dirs with arch dirs and module.so's in them?).
>> root@omap3evm:~# find /usr/lib/evas/modules/loaders/
>> /usr/lib/evas/modules/loaders/
>> /usr/lib/evas/modules/loaders/png
>> /usr/lib/evas/modules/loaders/png/linux-gnueabi-arm
>> /usr/lib/evas/modules/loaders/png/linux-gnueabi-arm/module.so
>> /usr/lib/evas/modules/loaders/jpeg
>> /usr/lib/evas/modules/loaders/jpeg/linux-gnueabi-arm
>> /usr/lib/evas/modules/loaders/jpeg/linux-gnueabi-arm/module.so
>> /usr/lib/evas/modules/loaders/eet
>> /usr/lib/evas/modules/loaders/eet/linux-gnueabi-arm
>> /usr/lib/evas/modules/loaders/eet/linux-gnueabi-arm/module.so
>
> ok. thats most peculiar.
>
> /usr/share/enlightenment/data/images/test.png exits (and is non-zero - a valid
> displayable png?) (this is what e does on start as loaders are a runtime
> modifiable resource (you can add and remove them at will) e tests to see that
> its requirements are met by trying to load that png...


root@omap3evm:~# file /usr/share/enlightenment/data/images/test.png
/usr/share/enlightenment/data/images/test.png: cannot open 
`/usr/share/enlightenment/data/images/test.png' (No such file or directory)

Seems that's missing, which package is that supposed to be in?

regards,

Koen




