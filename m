Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PfTmy-0004c8-8G
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 09:53:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 0FC69A452A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:52:32 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 7FbgapzddbBh
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:52:31 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 4EBB1A4522
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 08:52:31 +0000 (GMT)
Message-ID: <4D36A64E.9060804@xora.org.uk>
Date: Wed, 19 Jan 2011 08:52:30 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>	<4D35C5C3.60205@mentor.com>
	<ih4s84$gbj$1@dough.gmane.org>	<4D35FC8B.1090404@mentor.com>	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
In-Reply-To: <AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
X-Enigmail-Version: 1.1.1
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
X-List-Received-Date: Wed, 19 Jan 2011 08:53:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 19/01/2011 08:46, Frans Meulenbroeks wrote:
> 2011/1/18 Khem Raj <raj.khem@gmail.com>:
>> On Tue, Jan 18, 2011 at 12:48 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>> I think we also agree here.  But what's the rule of thumb(s) we want to
>>> have, to provide enough choice without too much headache?  As I said
>>> elsewhere, .inc files should probably be used a whole lot more, to help with
>>> the problem of recipe bugfixing and N recipes for an app with the problem.
>>>  We should probably also say that in addition to the "keep the last GPLv2+
>>> version around" rule of thumb we should also have a "keep the latest stable
>>> release" around too.  But what else?  To use busybox as an example, do we
>>> really need to keep 1.18.0 and 1.18.1 around when we have 1.18.2?  How about
>>> if we make the delta between the 3 be just the SRC_URI + checksums?
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
>>
> I wholehearthy agree with the proposal that it is left to the package
> maintainers discretion.
> Wrt the GPLv2+ version. I suggest to reflect this in the name.
> E.g. you could have samba and samba-gplv2 (or perhaps samba-gplv2 and
> samba-gplv3). Then it immediately becomes obvious why there are two
> versions.
> Similarly with versions that became a lot fatter over time (which imho
> is a good reason to keep the old version).
I am totally against this idea, it just makes a total mess of the
namespace. We have the ability to put comments in bitbake files use it.

Graeme



