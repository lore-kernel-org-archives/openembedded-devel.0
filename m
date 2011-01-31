Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PjwHB-0006EE-EO
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 17:06:50 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PjwGJ-0002zq-7j from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 08:05:55 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 31 Jan 2011 08:05:54 -0800
Received: from [172.30.80.99] ([172.30.80.99]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 Jan 2011 09:05:53 -0700
Message-ID: <4D46DDD7.7090305@mentor.com>
Date: Mon, 31 Jan 2011 09:05:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinAbLLKzbMbcQNSkgh8dQj+FD7WtuVd+wQ1ZKmz@mail.gmail.com>	<4D435A32.9070901@mentor.com>
	<AANLkTiku+-Z5nMcW+FyvmcD5F=dxATgtzwYKOT2Qpn4F@mail.gmail.com>
In-Reply-To: <AANLkTiku+-Z5nMcW+FyvmcD5F=dxATgtzwYKOT2Qpn4F@mail.gmail.com>
X-OriginalArrivalTime: 31 Jan 2011 16:05:53.0589 (UTC)
	FILETIME=[BCA12650:01CBC160]
Subject: Re: oestats as automated testing reporting tool (Was: testing branch 2011-01-20)
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
X-List-Received-Date: Mon, 31 Jan 2011 16:06:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/31/2011 02:22 AM, Yury Bushmelev wrote:
> 2011/1/29 Tom Rini<tom_rini@mentor.com>:
>> On 01/26/2011 03:04 PM, Yury Bushmelev wrote:
>>>
>>> I have spent some time to looking over oestats client and server code.
>>> Below are some ideas.
>>
>> [snip]
>>>>
>>>> - workstation (distro + arch)*
>>>
>>> We have build arch in oestats already (BUILD_ARCH). I'll prefer
>>> replace it with BUILD_SYS because we can use e.g.
>>> darwin/freebsd/cygwin as build host later.
>
>>> As there is no reliable way to get user's build host distro I'll ask
>>> to introduce new bitbake variable (OESTATS_HOST_DISTRO?).
>>
>> We can code some things up.  For example, if uname -o has Linux in the name,
>> we can see if lsb_release exists (more often than not, it will/should) and
>> then bam, we've got it.  Otherwise we can do some poking around before just
>> giving up.
>
> I'm considering using following scenario:
> a) try OESTATS_HOST_DISTRO in bb env
> a) try lsb_release -irc
> c) set it to "Please install lsb_release or setup OESTATS_HOST_DISTRO
> in your local.conf"
>
> We can get distro name by many other ways (/etc/issue,
> /etc/*-release). But I have no other reliable ideas how to get distro
> version.

Works for me.  Shouldn't spend too much time on the various corner cases 
here.

> I've found other problem. Kernel arch may be different from userspace
> arch. They may use i686 userspace with x86_64 kernel. I suspect that
> userspace arch is more interesting for us. First idea is using "file
> /sbin/init" e.g. to detect userspace arch and pass it as BUILD_ARCH.

Yeah, we really shouldn't care about the kernel arch, just the userspace 
arch.

-- 
Tom Rini
Mentor Graphics Corporation


