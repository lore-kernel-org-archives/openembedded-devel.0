Received: from [74.125.78.150] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1MeMGt-0000GT-Dp
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 07:02:39 +0200
Received: by ey-out-1920.google.com with SMTP id 3so112432eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 21:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=IiHBiVE3kNuiKWCinCj0AbPj3bpHQOXOKulUBArTycg=;
	b=rrjIo/XiFN3ooQbv+z9nkPlfwx3eGfI4HmDA2a5yO+NKlp7/3To40+0pyAooVJMKhQ
	ra1Rq+RTZKFtePqFR7vhAzrRY1aVmBdi3k3xPRtgwG255hWdueNg2NeFjUC5My+CCvwx
	ezuKZP6KEnvJMY7RFQo23fOBbWIzz+luq+esM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=CMQRc2o9s3y5pMM/8fzOspi+32sJhi1V/qyuaG4Vct7iLWiIaEyTFtktgPHJLAGktU
	gQWcw7vMIsM5eDdCtcHsiMK6JZDI7XwDpIE9p6GHFl0Ow3baf+v1s9aNFQWeLewvDHm7
	CbDxyocmYSKesHBl616NpLWqHsd0ZQ2/PeRZ0=
Received: by 10.210.76.4 with SMTP id y4mr931806eba.86.1250829917855;
	Thu, 20 Aug 2009 21:45:17 -0700 (PDT)
Received: from ?192.168.0.7? ([94.180.45.243])
	by mx.google.com with ESMTPS id 24sm1821525eyx.13.2009.08.20.21.45.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 20 Aug 2009 21:45:17 -0700 (PDT)
Message-ID: <4A8E267E.9070201@gmail.com>
Date: Fri, 21 Aug 2009 10:45:50 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8CD3A8.900@gmail.com> <20090820050404.GI32010@denix.org>
	<19c1b8a90908201946o18975addyfd8f8194661620eb@mail.gmail.com>
In-Reply-To: <19c1b8a90908201946o18975addyfd8f8194661620eb@mail.gmail.com>
Subject: Re: bitbake ignores DEFAULT_PREFERENCE
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
X-List-Received-Date: Fri, 21 Aug 2009 05:02:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Wed, Aug 19, 2009 at 10:04 PM, Denys Dmytriyenko<denis@denix.org> wrote:
>   
>> On Thu, Aug 20, 2009 at 10:40:08AM +0600, Dmitry Vinokurov wrote:
>>     
>>> Hello,
>>>
>>> I want to port OE to LPC3250 board and now I'm trying to build
>>> helloworld-image.
>>>
>>> I've created lpc3250.conf in conf/machine:
>>> TARGET_ARCH = "arm"
>>> PACKAGE_EXTRA_ARCHS = "armv5te"
>>> TARGET_CC_ARCH = "-fsigned-char -mfpu=vfp -mfloat-abi=softfp"
>>>
>>> Then I've added DEFAULT_PREFERENCE_lpc3250 = "1" to
>>> 'recipes/linux/linux_2.6.27.bb', but 'bitbake -v helloworld-image'
>>> downloads 2.6.23 kernel all the same. Re-reading all recipes database make
>>> no sense.
>>>       
>
> It could be downloading it for linux-libc-headers package too. bitbake -g
> can help you here.
>
>   
>>> Could anybody advise, how this can be solved? I need to use exactly 2.6.27
>>> kernel as I know that it definitely works.
>>>       
>> Are you sure it downloads 2.6.23 to build your kernel and not the
>> linux-libc-headers? Check the dependencies and what it's going to build by
>> executing "bitbake <target> -g" and then poking into depends.dot...
>>
>> Otherwise you can try setting PREFERRED_VERSION_virtual/kernel = "2.6.23" to
>> override DEFAULT_PREFERENCE...
>>
>> --
>> Denys
>>     
Yes, you're right, it was for linux-libc-headers package. I'm not so 
easily work with OE yet.

--
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



