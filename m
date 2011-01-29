Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PiyMQ-0004qv-3c
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 01:08:14 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PiyLa-0000Hp-OW from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 16:07:22 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 28 Jan 2011 16:07:22 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 28 Jan 2011 17:07:21 -0700
Message-ID: <4D435A32.9070901@mentor.com>
Date: Fri, 28 Jan 2011 17:07:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinAbLLKzbMbcQNSkgh8dQj+FD7WtuVd+wQ1ZKmz@mail.gmail.com>
In-Reply-To: <AANLkTinAbLLKzbMbcQNSkgh8dQj+FD7WtuVd+wQ1ZKmz@mail.gmail.com>
X-OriginalArrivalTime: 29 Jan 2011 00:07:21.0606 (UTC)
	FILETIME=[7FFD7A60:01CBBF48]
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
X-List-Received-Date: Sat, 29 Jan 2011 00:08:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2011 03:04 PM, Yury Bushmelev wrote:
> I have spent some time to looking over oestats client and server code.
> Below are some ideas.
[snip]
>> - workstation (distro + arch)*
> We have build arch in oestats already (BUILD_ARCH). I'll prefer
> replace it with BUILD_SYS because we can use e.g.
> darwin/freebsd/cygwin as build host later.
> As there is no reliable way to get user's build host distro I'll ask
> to introduce new bitbake variable (OESTATS_HOST_DISTRO?).

We can code some things up.  For example, if uname -o has Linux in the 
name, we can see if lsb_release exists (more often than not, it 
will/should) and then bam, we've got it.  Otherwise we can do some 
poking around before just giving up.

-- 
Tom Rini
Mentor Graphics Corporation


