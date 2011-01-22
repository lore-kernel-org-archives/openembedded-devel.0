Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pgi5u-0001dF-Is
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 19:21:51 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pgi5A-0004TN-2r from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 10:21:04 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 22 Jan 2011 10:21:03 -0800
Received: from [172.30.80.40] ([172.30.80.40]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 22 Jan 2011 11:21:02 -0700
Message-ID: <4D3B200B.6000909@mentor.com>
Date: Sat, 22 Jan 2011 11:20:59 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>	<4D35C5C3.60205@mentor.com>
	<ih4s84$gbj$1@dough.gmane.org>	<4D35FC8B.1090404@mentor.com>	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
In-Reply-To: <AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
X-OriginalArrivalTime: 22 Jan 2011 18:21:03.0010 (UTC)
	FILETIME=[2080D820:01CBBA61]
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Sat, 22 Jan 2011 18:21:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2011 01:46 AM, Frans Meulenbroeks wrote:
> 2011/1/18 Khem Raj<raj.khem@gmail.com>:
>> On Tue, Jan 18, 2011 at 12:48 PM, Tom Rini<tom_rini@mentor.com>  wrote:
>>> I think we also agree here.  But what's the rule of thumb(s) we want to
>>> have, to provide enough choice without too much headache?  As I said
>>> elsewhere, .inc files should probably be used a whole lot more, to help with
>>> the problem of recipe bugfixing and N recipes for an app with the problem.
>>>   We should probably also say that in addition to the "keep the last GPLv2+
>>> version around" rule of thumb we should also have a "keep the latest stable
>>> release" around too.  But what else?  To use busybox as an example, do we
>>> really need to keep 1.18.0 and 1.18.1 around when we have 1.18.2?  How about
>>> if we make the delta between the 3 be just the SRC_URI + checksums?
>>
>>
>> Well what to keep around can not be generalized so much. It also
>> depends upon the nature of releases for various packages
>> some packages have a major release and then push out bug fix releases
>> like busy box case you sited but there are packages
>> which only do major releases which can cause compatibility hassles as
>> new interfaces come and old ones are removed etc.
>> so I think it has to be flexible and mostly left to package
>> maintainers discretion as they know the nature of releases most but
>> I like the idea of keeping one GPLv2 release around and 1 latest
>> release around. If a distro pinned a version then that should
>> be considered as well. It is bad to sweep underneath a distros
>> pinnings. Then they have to rebuild and they get problems
>> as they have to make sure that if a package bump happens then they
>> should be able to define an upgrade path
>>
>> Sometimes newer is not always better in case of udev the size has
>> increased over the time and some distro's may not like
>> it and there can be many such scenarios.
>
> I wholehearthy agree with the proposal that it is left to the package
> maintainers discretion.

And what about packages that have been, well, gently orphaned?  I think 
we need to accept and understand that there will be a class of recipes 
that are simple enough that they don't need nor have spelled out 
maintainers.

> Wrt the GPLv2+ version. I suggest to reflect this in the name.
> E.g. you could have samba and samba-gplv2 (or perhaps samba-gplv2 and
> samba-gplv3). Then it immediately becomes obvious why there are two
> versions.

Put me in the "no" camp here please, we have a LICENSE field for a reason.

-- 
Tom Rini
Mentor Graphics Corporation


