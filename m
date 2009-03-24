Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lm3GC-0001Ls-Ke
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 10:49:28 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lm3En-0008MZ-HK
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 09:48:01 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 24 Mar 2009 09:48:01 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Mar 2009 09:48:01 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 24 Mar 2009 10:47:48 +0100
Message-ID: <gqaa84$phh$1@ger.gmane.org>
References: <200902140035.13820.khimov@altell.ru>	<200902171525.28995.khimov@altell.ru>	<877i2g63wr.fsf@neumann.lab.ossystems.com.br>	<200903232137.43902.khimov@altell.ru>
	<87tz5k3s28.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090316 Shredder/3.0b3pre
In-Reply-To: <87tz5k3s28.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Tue, 24 Mar 2009 09:49:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-03-09 21:25, Otavio Salvador wrote:
> Roman I Khimov<khimov@altell.ru>  writes:
>
>
> [...]
>
>>> Mind to fix it?
>>
>> Sure, I'll fix it this week and will try to push even more things as I'm
>> sitting now on a bunch of patches and have zero time to push anything
>> upstream.
>
> Nice, thx.
>
>> OK. Also, as I've seen Khem had issues trying to build siproxd and even had
>> fixed some of those (original recipe worked fine for me), I've set up two
>> sample testing configs with x86-prescott and qemuarm machines and with
>> plain Angstrom distro. So I've tried to put siproxd in there expecting to
>> reproduce something and discovered another thing - that it wants libosip2>
>> 3.0.0 while Angstrom has 2.2.2 in preferred.
>>
>> What's the best way to handle that and specify that siproxd wants libosip2>
>> 3.0.0? Or it shouldn't be handled in recipes in this cases and I'm just
>> switching to minimal or something and proceeding?
>
> This is a distro setting, you shouldn't worry about it in your recipe.
>
> If Koen thinks it should be the default, he will handle the preferred
> version change by himself.

Noone seems to know why that's in there and the log message is not being 
helpfull either, so it's gone now :)

regards,

Koen




