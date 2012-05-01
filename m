Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SPCZd-0002fk-Bm
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 14:52:57 +0200
Received: by lbbgo4 with SMTP id go4so2452080lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 May 2012 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=nYFcyW7Jo4a9G4fcTeBnNkQVcI1oKLUG/FawnshHfl8=;
	b=KAVvOmJrmDKwstSXIj7GLpHUsFCDUl4v4dtQLlQ3v/VsMraIsYR2p4KQl8xdoclLV0
	O9YEe/CluvD9Vs8Cv0C2o4Cqf9CwJLrVPt8zvJMIVRhFIuVHo/6ioYnyegjd9aWqX0nc
	JsLD3Wn6p2FD4MyDQdRV+dI0gBF1SLlyibEVEddgyp/aq69VbAva6JA0EdLr2IXNltkX
	/up/lHdojBouo5ofnoYARGk+I8byzhl3iAwduc5oVFaxgpPGDjO0UX13WVolaj+KJTUm
	w4x/YCREjv93jw9C2pXCnQjSovR76PPzlXRW04SE1JeyNcGhljU1bijh1ffMCIIq3zKy
	L0LA==
Received: by 10.152.108.171 with SMTP id hl11mr23068722lab.29.1335876194124;
	Tue, 01 May 2012 05:43:14 -0700 (PDT)
Received: from [192.168.1.104] ([37.191.128.59])
	by mx.google.com with ESMTPS id fx5sm24578047lbb.5.2012.05.01.05.43.12
	(version=SSLv3 cipher=OTHER); Tue, 01 May 2012 05:43:12 -0700 (PDT)
Message-ID: <4F9FDA5F.1080400@gmail.com>
Date: Tue, 01 May 2012 14:43:11 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120324 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
	<4F9F8630.3070901@gmail.com>
	<CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
In-Reply-To: <CAMKF1spxTuL1b6yMN=N68tq=MLfJGT9jmgd6VzHmY+TwZvNLsA@mail.gmail.com>
Subject: Re: Openembedded and ld-linux-armhf.so.3
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
X-List-Received-Date: Tue, 01 May 2012 12:52:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/01/12 14:32, Khem Raj wrote:
> On Mon, Apr 30, 2012 at 11:44 PM, Martin Ertsås<martiert@gmail.com>  wrote:
>> On 05/01/12 00:05, Khem Raj wrote:
>>> On Fri, Apr 27, 2012 at 5:38 AM, Martin Ertsås<martiert@gmail.com>    wrote:
>>>> I'm working on a pandaboard with OMAP4460. Were trying to use the newest
>>>> PVR drivers, which conforms to the result that arose from
>>>> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>>>>
>>>> We have applied the patch at the bottom of that page gcc, and also a
>>>> patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
>>>> instead of ld-linux. Problem is, this gives us a kernel panic when it
>>>> tries to run init.
>>> interesting bits are why kernel panics ?
>>> what error do you get from kernel ?
>>> is it some illegal instruction or something like that ?
>>> Do you have VFP enabled
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> Found out the problem why kernel panics. The patches I posted were the
>> correct ones, but before this I used
>>
>> SYSLIB_PATH or something before "/lib/ld-linux-armhf.so.3", so the output
>> actually was /lib/lib/ld-linux-armhf.so.3
>>
> ok good. I would be interested if you test the patchset i posted
> it will help a lot
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
I'll try them tomorrow and send a mail telling the findings.


