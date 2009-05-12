Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M3v34-0002Kv-Al
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 18:41:46 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1M3uwY-00086l-VQ
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 16:35:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 12 May 2009 16:35:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 12 May 2009 16:35:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 12 May 2009 18:32:23 +0200
Message-ID: <guc8an$pk6$1@ger.gmane.org>
References: <1242089668-11610-1-git-send-email-denis@denix.org>	<1242089668-11610-8-git-send-email-denis@denix.org>
	<200905121303.01792.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <200905121303.01792.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 7/8] linux-davinci: build linux-davinci kernels for dm6446, dm6467 and dm355 EVMs
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
X-List-Received-Date: Tue, 12 May 2009 16:41:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12-05-09 13:03, Marcin Juszkiewicz wrote:
> Dnia wtorek, 12 maja 2009 o 02:54:27 Denys Dmytriyenko napisał(a):
>> +++ b/recipes/linux/linux-davinci_2.6.28.bb
>> @@ -3,10 +3,12 @@ require linux.inc
>>   DESCRIPTION = "Linux kernel for Davinci processors"
>>   KERNEL_IMAGETYPE = "uImage"
>>
>> -COMPATIBLE_MACHINE = "davinci-sffsdr"
>> +COMPATIBLE_MACHINE = "(dm6446-evm|dm6467-evm|davinci-sffsdr)"
>
>> +++ b/recipes/linux/linux-davinci_git.bb
>
>> -COMPATIBLE_MACHINE = "(davinci-dvevm|davinci-sffsdr|dm355-leopard)"
>> +COMPATIBLE_MACHINE = "(dm6446-evm|dm6467-evm|dm355-evm|davinci-sffsdr|dm355-leopard)"
>
>> -DEFAULT_PREFERENCE = "-1"
>> +DEFAULT_PREFERENCE = "1"
>
> So all Davinci devices starts to use GIT kernel instead of 2.6.28?

That's the idea, it's where TI is producing patches against :)

regards,

Koen




