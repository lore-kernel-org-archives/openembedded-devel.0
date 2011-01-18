Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>)
	id 1Pf7d2-00011I-VL; Tue, 18 Jan 2011 10:13:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id D00E51C110;
	Tue, 18 Jan 2011 09:12:48 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4e4j2KC4m7VF; Tue, 18 Jan 2011 09:12:48 +0000 (GMT)
Received: from [10.131.0.209] (188-220-38-49.zone11.bethere.co.uk
	[188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 146921C005;
	Tue, 18 Jan 2011 09:12:48 +0000 (GMT)
Message-ID: <4D355990.6010304@xora.org.uk>
Date: Tue, 18 Jan 2011 09:12:48 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-members@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
In-Reply-To: <AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 18 Jan 2011 09:13:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 18/01/2011 08:05, Otavio Salvador wrote:
> On Tue, Jan 18, 2011 at 05:21, Graeme Gregory<dp@xora.org.uk>  wrote:
>> On 17/01/2011 19:01, Frans Meulenbroeks wrote:
>>> - where possible stick to one recipe per package. This reduces the
>>> maintenance work and reduces the QA nightmare of lots of different
>>> permutations.
>>> I feel one recipe per package should be the common case for
>>> applications, and preferably also for libs (although I am well aware
>>> that especially in the latter case multiple versions cannot always be
>>> avoided).
>> OE is not a distro so this is a non starter already, please don't bog
>> down this discussion by re-opening this again. Angstrom 2008, Angstrom
>> 2010, kaelios and slugos are all released distributions with different
>> versions of apps just as a starter and they arent even near the total
>> number of distros in OE.
> I disagree. I think having too many versions of a package just makes
> difficult to get things done:
>
>   - it increases the amount of maintainence work;
>   - has a bigger time to get bugs spoted;
>
> Users of old distros ought to use a specific repository and branch.
> Master ought to be kept clean for 'next distro release'.
>
>
The ultimate end to this way of thinking is that OE reduces to becoming 
OE-core only as anything else in there is going to be useless to 
multiple distros.

This then leads to the big distros like Angstrom maintaining their own 
large meta data which is basically a fork of todays OE. Then comes the 
point if Angstrom is providing a much better service to other DISTROS 
like SlugOS than OE-core does then they might save themselves 
maintenance time by re-using our large data set. Basically destroying 
the value of OE and forcing a fork.

People really have to get out of the mindset that OE is a DISTRO, it is 
not and must provide services to all DISTRO.

Ill also point out that gentoo which is probably closest to OE in 
management of metadata does not pathalogically delete old versions.

Graeme



