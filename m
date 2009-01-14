Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LN66C-0000tZ-Lf
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 14:48:00 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LN5zl-0000Xi-Tf
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 13:41:22 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 14 Jan 2009 13:41:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 14 Jan 2009 13:41:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 14 Jan 2009 14:41:05 +0100
Message-ID: <gkkq1i$gq5$1@ger.gmane.org>
References: <20090113203242.4D378189331@amethyst.openembedded.net>	<20090114124842.32a3241e@adrastea.totalueberwachung.de>	<5ED84125-2736-489A-94F0-1E385661D7BA@student.utwente.nl>
	<20090114142431.7db4b26e@adrastea.totalueberwachung.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <20090114142431.7db4b26e@adrastea.totalueberwachung.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : mtd-utils-native: remove default-preference from 1.20+git, it shows now errors in my tests
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
X-List-Received-Date: Wed, 14 Jan 2009 13:48:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-01-09 14:24, Daniel Willmann wrote:
> On Wed, 14 Jan 2009 13:08:34 +0100
> Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>
>> Op 14 jan 2009, om 12:48 heeft Daniel Willmann het volgende
>> geschreven:
>>
>>> mtd-utils-native fails here with:
>>>
>>> | /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-
>>> native-1.2.0+git-r2/git/
>>> mkfs.ubifs/mkfs.ubifs.o: In function `write_super':
>>> | /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-
>>> native-1.2.0+git-r2/git/mkfs.ubifs/mkfs.ubifs.c:1866: undefined
>>> reference to `uuid_unparse_upper'
>>> | collect2: ld returned 1 exit status
>> Which e2fsprogs-libs-native do you have installed? Also, oe-devel is
>> subscriber only, enough with the CC:!
>
> It's building e2fsprogs-libs-native-1.35-r0

That will cause the linking problems, you need the 1.4x one.

> Thanks for reverting it in the mean time.

It failed with include problems on another machine, so let's wait till 
Tom Rini has pushed his fixed version.

regards,

Koen

> Regards,
> Daniel Willmann
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




