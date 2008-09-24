Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KiRF4-0006we-53
	for openembedded-devel@openembedded.org; Wed, 24 Sep 2008 12:05:06 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KiRBU-0005Og-PE
	for openembedded-devel@openembedded.org; Wed, 24 Sep 2008 10:01:24 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 24 Sep 2008 10:01:24 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 24 Sep 2008 10:01:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 24 Sep 2008 12:01:12 +0200
Message-ID: <gbd358$fe6$1@ger.gmane.org>
References: <gb0738$dcq$1@ger.gmane.org>
	<1222248265.4350.11.camel@al.mesalab.lan>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <1222248265.4350.11.camel@al.mesalab.lan>
Sender: news <news@ger.gmane.org>
Subject: Re: Math is hard, but please pay attention to PV
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
X-List-Received-Date: Wed, 24 Sep 2008 10:05:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Alessandro Pellizzari wrote:
> Il giorno ven, 19/09/2008 alle 14.48 +0200, Koen Kooi ha scritto:
>
>> Old version:
>> libedje0 1:0.9.9.043+cvs20080610-r0
>>
>> New version:
>> libedje0 1:0.5.0.043+svnr35727-r1
>
> Speaking of this, last weekend I tried to create a recipe for fbreader
> 0.8.17, but bitbake insisted on compiling fbreader 0.8.2a because 2>  1
> I had to remove the recipe for 0.8.2a from packages/fbreader.

The proper way to fix that is to set PE = "1" in 0.8.17 and upward 
recipes. This will increase the package epoch making it always sort higher.

regards,

Koen



