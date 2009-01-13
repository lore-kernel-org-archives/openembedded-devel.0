Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LMpSC-0006Jc-1B
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 21:01:36 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LMpLq-0003lG-O2
	for openembedded-devel@openembedded.org; Tue, 13 Jan 2009 19:55:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 19:55:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 13 Jan 2009 19:55:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Jan 2009 20:51:26 +0100
Message-ID: <gkirbu$mtt$2@ger.gmane.org>
References: <200901132011.00353.openembedded@haerwu.biz>
	<200901132023.37777.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <200901132023.37777.mickey@vanille-media.de>
Sender: news <news@ger.gmane.org>
Subject: Re: HAL and Xserver
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
X-List-Received-Date: Tue, 13 Jan 2009 20:01:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-01-09 20:23, Michael 'Mickey' Lauer wrote:
> Am Tuesday 13 January 2009 20:10:59 schrieb Marcin Juszkiewicz:
>> Hi
>>
>> Current x11-image depends on 'angstrom-x11-base-depends' which adds HAL.
>> For one customer I am building images with 1.3.0.0 xserver-kdrive so HAL
>> is not required at all (not to mention that it does not find any devices
>> when mdev is used instead of udev).
>>
>> I created patch which removes HAL from 'angstrom-x11-base-depends' and
>> moves it into dependencies of xserver-(kdrive,xorg) newer then 1.3.0.0.
>>
>> What do you think about it?
>
> Sounds good. I'd even welcome if we could disable it for all versions.

You can't, it's needed to get input devices nowadays, there's a 3 month 
long flamewar about it on the xorg mailinglists if you want some 
background on it.

regards,

Koen




