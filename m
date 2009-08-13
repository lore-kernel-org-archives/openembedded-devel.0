Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MbhxT-0008O6-W1 for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 23:35:40 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MbhhS-0007qy-1J for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 21:19:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 21:19:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 21:19:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 Aug 2009 23:18:47 +0200
Message-ID: <h61vvo$n4v$1@ger.gmane.org>
References: <4A83BD15.7070006@atmel.com>	<h60je5$992$1@ger.gmane.org>	<4A83E5FC.2020002@atmel.com>	<h60t34$5kl$1@ger.gmane.org>	<4A8402B0.1000308@atmel.com>	<h611re$jjp$1@ger.gmane.org>	<4A842FF6.70906@atmel.com>	<h61f31$vvd$2@ger.gmane.org>
	<4A84793A.3090203@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <4A84793A.3090203@atmel.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 13 Aug 2009 21:35:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-09 22:36, Ulf Samuelsson wrote:
> Koen Kooi skrev:
>> On 13-08-09 17:23, Ulf Samuelsson wrote:
>>
>>> I maintain that if I do "MACHINE=at91sam9260dfc bitbake at91bootstrap"
>>> from the build directory, it is ignored and the MACHINE definition
>>> (MACHINE=at91sam9261df) in local.conf is used.
>>
>> Yes, local.conf takes precedence over env, so remove it from local.conf.
>>
>
> Thanks,
> It is easier in the script to symlink "build/conf/local.conf" to
> "build/conf/${MACHINE}.conf" which has the correct MACHINE definition.
> Then I can use the script as well as building manually
> without having to remember to set MACHINE explicitly

ehm...

So you're saying "it's easier to do ln conf/mymachine.conf 
conf/local.conf ; bitbake foo than to do MACHINE=mymachine bitbake foo 
because I don't need to remember machine". To me that doesn't make sense 
since either way you end up setting machine pretty much manually. And 
your 'easier' way incurs a 10 minutes reparse penalty when switching 
machines while mine doesn't. I guess you like coffee breaks more than I 
do :)



