Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 478CC6136C
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 18:08:30 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id j15so2325150pgm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=77Q/w7nw68r5dV8ldaqNS9u/JADkzIvafmdMcXZ8tb8=;
	b=ofj6jTAOWEFWYbT1c5j33BabOidHz9MJY+ftljMGu0ZeT3H69DLnFFzmntdmAzL65S
	LSgsBpk4UKE3zR7lazeVi5EqQyuNNefbjK74LTYBUzEzjIPYefLQ/Uzokax1hqrA0TUV
	k/v7WJoRUIim2hQUlHMlhMUVjHQgnMdXYyNEt4oDinHH6BETq6fREbTsZqoGfawtVVqv
	p0G1/450RT3pkQVKLFZUTn8762dtfvsAI8J02gckrR0f/E7h+7TsxJnWhP19dZLT7hHF
	lcCbGmRi2L/f/LGQ8ynuPRBYtU0uDBB3BYDVXT9zPflf2o1Fv5ayWX3MO5KzQvrJO1h1
	vatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=77Q/w7nw68r5dV8ldaqNS9u/JADkzIvafmdMcXZ8tb8=;
	b=sTBNY4+J5SwRl+eqj4dGmQ11DTp6j6vcb7jEYkEgVrXdU4KctHN6lAocxMNa3G1xLx
	s9I4XVcLqIGPCAmoDHlshwGrJxN73IfJsmbjvHVvvmT9AmNTJcMD9CObmX4PxfuQa4io
	whp34lxqzMlTUgqM76eHLteDqFmQK04rsDk+oZhMtsBoOIEWHXVVozhpLqFc5tG4kWBV
	8ePexOznkl4FO4k4t14YStppCN2cWBKXXLs8RmSVtCOfHTDiZJJXvC0pyN6EKQdThfej
	BV7Cy+NPUPtn4tw2Jth2bkQ4kr7+2VWr0QIbxYVCV7QnvSLwYTlHVw+u3bnaA2whV9hp
	/NmQ==
X-Gm-Message-State: APjAAAVxJHozLipTQlzXc0K9G0vV024uYcIC8JMbj1bF/QKPArA2Kym/
	1d3WWXqg9A7BlxrVMm6MRSFyOZAD0RY=
X-Google-Smtp-Source: APXvYqwV6432Noztphpfl5BeEx96o+kkmiTcjpYhL95wC6uJKkWB9C87ln1YtqbAwe2kqEsaLJOY2g==
X-Received: by 2002:aa7:9a01:: with SMTP id w1mr32388231pfj.231.1582222111509; 
	Thu, 20 Feb 2020 10:08:31 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:94fc:1e40:9cc4:7d04?
	([2601:646:9200:4e0:94fc:1e40:9cc4:7d04])
	by smtp.gmail.com with ESMTPSA id
	x190sm247599pfb.96.2020.02.20.10.08.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 20 Feb 2020 10:08:31 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>, Adrian Bunk <bunk@stusta.de>
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
	<20200220144848.msiyguq2bsmqokxc@jama>
	<20200220151620.GA30034@localhost>
	<20200220153758.o25tn46hhewgmasd@jama>
	<20200220161159.GB30034@localhost>
	<20200220162312.cqh5bwvdwxjp362g@jama>
	<20200220173421.egafqfq25kbtr4a4@jama>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <13aeb674-53bc-07b5-683e-a2322bcb025c@gmail.com>
Date: Thu, 20 Feb 2020 10:08:30 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220173421.egafqfq25kbtr4a4@jama>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: S variable for svn fetcher Was: State of OE world - 2020-02-18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Feb 2020 18:08:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/20/20 9:34 AM, Martin Jansa wrote:
> On Thu, Feb 20, 2020 at 05:23:12PM +0100, Martin Jansa wrote:
>> On Thu, Feb 20, 2020 at 06:11:59PM +0200, Adrian Bunk wrote:
>>> On Thu, Feb 20, 2020 at 04:37:58PM +0100, Martin Jansa wrote:
>>>> On Thu, Feb 20, 2020 at 05:16:20PM +0200, Adrian Bunk wrote:
>>>>> On Thu, Feb 20, 2020 at 03:48:48PM +0100, Martin Jansa wrote:
>>>>>> ...
>>>>>> Any idea why these aren't shown in our build?
>>>>>> ...
>>>>>
>>>>> What is your mirror configuration?
>>>>>
>>>>> Default configuration downloads the tarball from [1].
>>>>
>>>> Maybe I'm missing your point, but these aren't fetch issues.
>>>> ...
>>>
>>> MIRRORS = "" (and deleting the downloaded tar) is what I needed for
>>> getting a build failure.
>>
>> OK, I see now, sorry.
>>
>> That explains why it's not shown in khem's builds and might be broken
>> well before thud already, the tarball created here today:
>>
>> $ tar xvf ../downloads/gpio_svn.openmoko.org_.trunk.src.target_4949_.tar.gz
>> gpio/
>> gpio/trunk/
>> gpio/trunk/doc/
>> gpio/trunk/doc/hardware/
>> gpio/trunk/doc/hardware/GTA01Bv3/
>> gpio/trunk/doc/hardware/GTA01Bv3/gpio.txt
>> gpio/trunk/doc/hardware/GTA01Bv3/pmu-voltage.txt
>> ...
>>
>> while the corresponding tarball on mirror:
>> http://sources.openembedded.org/gpio_svn.openmoko.org_.trunk.src.target_4949_.tar.gz
>> $ tar xvf gpio_svn.openmoko.org_.trunk.src.target_4949_.tar.gz
>> gpio/
>> gpio/gpio-s3c6410.c
>> gpio/Makefile
>> gpio/gpio.c
>> gpio/gpio-glamo.c
>> gpio/README
>>
>> Will check when it got broken before thud.
> 
> It's still reproducible in pyro, so probably not caused by changes in OE.
> 
> There is one more recipe using svn in meta-multimedia which works fine:
> meta-multimedia/recipes-dvb/oscam/oscam_svn.bb:SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
> 
> The rest are all from svn.openmoko.org:
> meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb:SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
> meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb:SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
> meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb:SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=sjf2410-linux;protocol=http \
> meta-oe/recipes-support/usbpath/usbpath_svn.bb:SRC_URI = "svn://svn.openmoko.org/trunk/src/host;module=usbpath;protocol=http \
> meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb:SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=AR6kSDK.build_sw.18;protocol=http \
> 
> And now this leads to do_fetch running:
> svn --non-interactive --trust-server-cert co --no-auth-cache --ignore-externals -r 4949 http://svn.openmoko.org/trunk/src/target/gpio@4949 gpio
> as before, but now it redirects to github:
> 
> Redirecting to URL 'https://github.com/openmoko/openmoko-svn':
> A    gpio/branches
> A    gpio/branches/oe
> A    gpio/branches/oe/pre-20070305
> A    gpio/branches/oe/pre-20070305/README
> A    gpio/branches/oe/pre-20070305/classes
> A    gpio/branches/oe/pre-20070305/classes/autotools.bbclass
> A    gpio/branches/oe/pre-20070305/classes/base.bbclass
> A    gpio/branches/oe/pre-20070305/classes/openmoko-base.bbclass
> A    gpio/branches/oe/pre-20070305/classes/openmoko-panel-plugin.bbclass
> ..
> 
> and the svn bridge to github probably doesn't work exactly the same as the
> native svn repo used to work, but I don't see it explicitly mentioned in:
> https://help.github.com/en/github/importing-your-projects-to-github/support-for-subversion-clients
> 
> So to resolve this quickly I'm going to send SRC_URI updates for
> these recipes to just use git fetcher from:
> https://github.com/openmoko/openmoko-svn
> directly. I don't think anyone is using these nowadays, so it's
> also fine with me to just delete them all, which I'll do in
> separate follow-up commit in case someone tries to resurrect them
> later in own layer.
> 

I think plan looks good. Lets fix the SRC_URI and then delete them

