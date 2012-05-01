Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SP6y1-00053w-7m
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 08:53:45 +0200
Received: by lbbgo4 with SMTP id go4so2335347lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 23:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=1j4JLeefKow3XZWUOnf+0Z+lQuv9xkD9/NM1T6WPe+M=;
	b=F0DLuxDqK9VUQwyeWKzdAX6ucfk+AgOwqlPdzHe4kBbX669uYRIKXkXSR/uH7aZZsT
	fHAjnFOXG0v+LgpXcNuzgnxL4ccbtVK3s6aUGyJUsMnZLLYQbPcnMR2sj8T8nXp9VLSj
	OweApljZado5IcYFSfNuXKSgNsyfrzPpnWPPAAk1EsF+spSl6IPo5TlFaQSqPJP3SWik
	+cX3RXqXsGV8+FvIfsbKW17xIlxPwShftjdwItED7VrXA0vzRgibOiXKvPHp6tzlF0nJ
	4ATDjH72CV9J58/qVp2n1QdyRC1/v4lkqUZHvCg3ImY9o1B4IVoRMzAbGKCOTv0C8LA6
	IcrQ==
Received: by 10.112.30.102 with SMTP id r6mr1090061lbh.0.1335854642329;
	Mon, 30 Apr 2012 23:44:02 -0700 (PDT)
Received: from [192.168.1.104] ([37.191.128.59])
	by mx.google.com with ESMTPS id n6sm23499381lbn.11.2012.04.30.23.44.01
	(version=SSLv3 cipher=OTHER); Mon, 30 Apr 2012 23:44:01 -0700 (PDT)
Message-ID: <4F9F8630.3070901@gmail.com>
Date: Tue, 01 May 2012 08:44:00 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120324 Thunderbird/10.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F9A932F.1020400@gmail.com>
	<CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
In-Reply-To: <CAMKF1sroFDS7vqn+DMRRjd368h=YsUX-ijMobhfddkvCp_uNyQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 01 May 2012 06:53:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/01/12 00:05, Khem Raj wrote:
> On Fri, Apr 27, 2012 at 5:38 AM, Martin Ertsås<martiert@gmail.com>  wrote:
>> I'm working on a pandaboard with OMAP4460. Were trying to use the newest
>> PVR drivers, which conforms to the result that arose from
>> https://wiki.linaro.org/OfficeofCTO/HardFloat/LinkerPathCallApr2012
>>
>> We have applied the patch at the bottom of that page gcc, and also a
>> patch for making eglibc make ld-linux-armhf, and load ld-linux-armhf
>> instead of ld-linux. Problem is, this gives us a kernel panic when it
>> tries to run init.
> interesting bits are why kernel panics ?
> what error do you get from kernel ?
> is it some illegal instruction or something like that ?
> Do you have VFP enabled
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
Found out the problem why kernel panics. The patches I posted were the 
correct ones, but before this I used

SYSLIB_PATH or something before "/lib/ld-linux-armhf.so.3", so the 
output actually was /lib/lib/ld-linux-armhf.so.3




