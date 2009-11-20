Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NBUnK-0007eo-SD for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:49:09 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NBUly-000423-AH
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 15:47:42 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 15:47:42 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 15:47:42 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 20 Nov 2009 15:47:17 +0100
Message-ID: <he6a5m$jph$1@ger.gmane.org>
References: <he689r$c57$1@ger.gmane.org>
	<4B06A6A7.1080204@SSpaeth.de>	<200911201531.00181.marcin@juszkiewicz.com.pl>
	<1258727981.13348.7.camel@opal>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1258727981.13348.7.camel@opal>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_FEATURE changes
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
X-List-Received-Date: Fri, 20 Nov 2009 14:49:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20-11-09 15:39, Michael 'Mickey' Lauer wrote:
> Am Freitag, den 20.11.2009, 15:30 +0100 schrieb Marcin Juszkiewicz:
>> Dnia piątek, 20 listopada 2009 o 15:24:39 Sebastian Spaeth napisał(a):
>>
>>> Better suggestions on how to achieve this are welcome.
>>
>> In distro config:
>>
>> MACHINE_FEATURES_om-gta01 = "this that those butnoapm"
>>
>> This way your distro has what you want and others have what was set in machine
>> config.
>
> Good idea.
>
> For the records though, I would consider it being the machine
> maintainer's call to define the machine config. If he decides that apm
> is very misleading on said machine, perhaps because without taking
> special care about the peripheral devices there will no be proper
> suspend in the first place, then I might be inclined to follow this
> reasoning and leave apm out there...

If that's the case, it should be at least noted in the commit message 
clearly. In this case it was a commit from someone very new to OE and it 
didn't include any explanation or SOBs or ACKs.

Since this is about the machine the is the default in our GettingStarted 
wiki, a mail to this list would have been nice as well, if only to 
increase the google juice :)

regards,

Koen



