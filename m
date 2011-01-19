Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PfaRx-00057y-Ii
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 16:59:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 0A119A47A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 15:59:19 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id FPXugSJjrf08
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 15:59:18 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 38B9EA479E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 15:59:18 +0000 (GMT)
Message-ID: <4D370A54.6020607@xora.org.uk>
Date: Wed, 19 Jan 2011 15:59:16 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D36F9BE.1010601@xora.org.uk>
	<AANLkTi=sJGSCRxSF6tFPhrGb=NKfmiLNURg-n-Gmgc3Z@mail.gmail.com>
In-Reply-To: <AANLkTi=sJGSCRxSF6tFPhrGb=NKfmiLNURg-n-Gmgc3Z@mail.gmail.com>
X-Enigmail-Version: 1.1.1
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Wed, 19 Jan 2011 15:59:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 19/01/2011 15:33, Frans Meulenbroeks wrote:
> 2011/1/19 Graeme Gregory <dp@xora.org.uk>:
>> Hi, this email is sent as an ordinary member of OE.
>>
>> It seems to be on a technical level we are agreed that we should split
>> parts of OE out into the so called openembedded-core which will have a
>> stricter commit access and higher QA requirements on changes.
>>
>> I therefore think it is time to actually create the repository and let
>> the people who are interested in merging the good stuff from poky with
>> the good stuff from openembedded to create our "core". I don't think
>> there is any need to wait on the political part of the Yocto/OE
>> collaboration as its something we have agreed in principal to do anyway.
>>
>> I would request then that the TSC drive this forward with the server
>> admins and create this repo so work can happen.
>>
>> Graeme
> Graeme,
>
> Seems  a fine plan to me.
> Do we already have an idea what would be the starting base?
> And do we already have an idea on the QA requirements we want to impose on this?
> Lastly we might try to define some common understanding what is core
> and what not.
>
> I did some experiments with poky and found that some of the recipes I
> needed were missing; some of them might perhaps become part of core
> (e.g. i2ctools, squashfstools, libftdi, fastcgi), whereas others are
> quite unlikely to end up in core (e.g. urjtag). For the latter we must
> find another home (e.g. meta-openembedded), where hopefully we can
> also raise the QA bar somewhat.
>
> I'll happily contribute to raise the quality bar. However, if the goal
> is shuffling recipes without significant QA improvement or if QA
> improvement is optional, I'll probably pass.
>

Well I would hope that openembedded-core has a pull model similar to
poky/yocto but that is I think ultimately upto TSC members (with
consultation with membership). Hopefully they shall give their opinions
on the issue soon.

I would say the obvious starting point is poky, then merge OE
improvements into that. I think this would be less work than stripping
down OE to core level.

I think all the tools you have mentioned are bad examples of stuff to go
into core except possibly squashfs. Core should be purely enough to get
a busybox minimal image build in ext2/3/jffs/ubi given a machine.conf.
Basically enough to do board bringup and no more (with package
management capabilities). If core was recipes people "needed" it wouldnt
really be core fastcgi is pretty specialised bit of software.

Core should probably have a build bot which crunches a standard set of
tests on each commit so unlike OE currently people don't wake up to bad
day of debugging OE.

Graeme



