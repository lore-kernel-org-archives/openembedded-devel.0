Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1MhKCd-0000Qs-V6
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 11:26:32 +0200
Received: by ewy19 with SMTP id 19so3518375ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=PQUYI/iv+HQA++47Whexp7Q13QxuH8fnnWmTLfXLm3g=;
	b=bxxS5L+P52fOhIGQTJ8tWdaubtHQW9SUp0D5pdplXqdPsz+e3YCHi4vLeRrjqN1ehu
	3qrq+minN2e+UIQvpTkteCaE0fK1DbQrEA0939a/la/3I8FO4Q04c2iaOCIQSZ5kY5wx
	9BOp7d9SWdZ/uF3FDkY+XcZ/qAvwcfNLMn9Ys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=KHSANSkHK+m/2LocLi5BmlEshow57XmP/BN7gscKjIE3BrgOh42N/jdj/V4zMcbY6f
	azh+3dcsRq2ieBHlz405LygFt2s3/Bl/lRaQep7yeFi1g59QiRxgTUbXYWO0+zVQ4ObX
	VZwJjcJ/6rY3iaxaXwq6YsJBH/S4ovUJ2H8CQ=
Received: by 10.210.20.10 with SMTP id 10mr1452558ebt.72.1251536894484;
	Sat, 29 Aug 2009 02:08:14 -0700 (PDT)
Received: from ?192.168.0.7? ([94.180.58.182])
	by mx.google.com with ESMTPS id 10sm790049eyz.33.2009.08.29.02.08.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 29 Aug 2009 02:08:14 -0700 (PDT)
Message-ID: <4A98F02C.6020104@gmail.com>
Date: Sat, 29 Aug 2009 15:09:00 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8D4947.5030108@gmail.com>	<200908201526.46349.holger+oe@freyther.de>	<4A8D98FB.5000400@gmail.com>	<200908210343.48652.holger+oe@freyther.de>	<4A8F9BE3.1020606@gmail.com>
	<4A8FA20F.5050401@gmail.com>	<20090822231735.GA12848@gmail.com>
	<4A90C2F4.1010300@gmail.com>	<20090823065305.GA6361@gmail.com>
	<4A91434D.6070203@gmail.com> <20090823154300.GA9250@gmail.com>
	<4A942399.2020106@gmail.com>
In-Reply-To: <4A942399.2020106@gmail.com>
Subject: Re: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
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
X-List-Received-Date: Sat, 29 Aug 2009 09:26:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dmitry Vinokurov wrote:
> Khem Raj wrote:
>> On (23/08/09 19:25), Dmitry Vinokurov wrote:
>>  
>>> Khem Raj wrote:
>>>    
>>>> On (23/08/09 10:17), Dmitry Vinokurov wrote:
>>>>      
>>>>>>>> ERROR: 
>>>>>>>> '/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb' 
>>>>>>>>
>>>>>>>> failed
>>>>>>>> --------
>>>>>>>>
>>>>>>>> I.e. bitbake again confused cross-gcc and x86-gcc. Updated my OE
>>>>>>>> with git pull, removed tmp/ and made rebuild -- same result.
>>>>>>>>               
>>>>>>> Looks like error is in wrong ./configure parameter:
>>>>>>> --host=i686-linux instead of --host=arm-oe-linux-gnueabi .
>>>>>>> Now I'm trying to find, why --host was set to i686 and where it can
>>>>>>> be changed.
>>>>>>>             
>>>>>> its a cross package so host being i686-linux (I suppose you are 
>>>>>> building
>>>>>> on i686 box) is ok. Look into the config.log error message should 
>>>>>> be in
>>>>>> there
>>>>>>
>>>>>> -Khem
>>>>>>           
>>>>> Hm, "configure --help" says "--host=HOST cross-compile to build
>>>>> programs to run on HOST [BUILD]" and as I understand, I will run
>>>>> programs on ARM, so it should be 'arm-oe-linux-gnueabi'.
>>>>>
>>>>> Anyway, even if host should be x86, instead of i686-linux-gcc it
>>>>> finds arm-vfp-linux-gcc and fails.
>>>>>         
>>>> dont confuse pure cross with canadian cross. You are doing a normal
>>>> cross build here which means build machine is same as host machine.
>>>>
>>>> Your problem is probably because you are overriding CC and friends
>>>> which could be confusing (already confused) configure even more.
>>>>
>>>> Try setting CC_FOR_BUILD=<your native compiler on the build machine>
>>>>
>>>> Thanks
>>>>
>>>> -Khem
>>>>       
>>> Thank you for your help. I'm newbie in OE and crosscompiling at all
>>> and may confuse some things.
>>>
>>> Just now I've tried to build some not so simple as helloworld but
>>> not so complicated as kernel -- bc calculator. And I'd like to say
>>> that during configure stage it sets:
>>> --build=i686-linux --host=arm-oe-linux-gnueabi 
>>> --target=arm-oe-linux-gnueabi
>>>
>>> Builded bc works fine on my board and this is normal, not canadian,
>>> cross build.
>>>     
>>
>> its a target package being built on build machine. Your build was 
>> failing to compile a package which
>> will run on your host (similar to cross compilers) they are not same
>> cases. module-init-tools would be analogically similar to bc but not
>> module-init-tools-cross which is the package you reported failing.
>>   
> Yes, you're right. Recently read documentation more attentively 
> (http://docs.openembedded.org/usermanual/usermanual.html#recipes_variables) 
> and understood that I was wrong.
> Now appearing errors are more familiar to me and I hope soon image for 
> LPC3250 will be built successfully and I'll report about it.
Successfully builded kernel for LPC3250, it works on the board. But 
trouble with module-init-tools (configure try to use CC (set to arm 
compiler) as x86 compiler and fails due to "cannot run C compiled 
programs") still remains -- I temporarily solved it by explicitly 
setting CC=gcc in module-init-tools-cross_3.2.2.bb, though I don't think 
that it is good solution.

Maybe somebody more experienced could advise, how this trouble can be 
solved in the right way? I'm ready to give any needed logs.


