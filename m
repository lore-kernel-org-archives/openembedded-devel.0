Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OEhmf-0004h9-3u
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 13:49:59 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 165DC5AFB79; Wed, 19 May 2010 05:45:57 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id C1C635AFB74;
	Wed, 19 May 2010 05:45:55 -0600 (MDT)
Message-ID: <4BF3CF73.1060506@mlbassoc.com>
Date: Wed, 19 May 2010 05:45:55 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>	<4BF3C9B8.8080501@mlbassoc.com>
	<alpine.LNX.2.00.1005191335020.21508@asterix.crazy-teaparty.dyndns.org>
In-Reply-To: <alpine.LNX.2.00.1005191335020.21508@asterix.crazy-teaparty.dyndns.org>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: Re: powerpc-g++ 4.2.4 problem casting long long to double
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
X-List-Received-Date: Wed, 19 May 2010 11:50:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/19/2010 05:41 AM, Vitus Jensen wrote:
> On Wed, 19 May 2010, Gary Thomas wrote:
>
>> On 05/19/2010 03:38 AM, Vitus Jensen wrote:
>>>
>>> We noticed a strange problem with C++ code casting long long variables
>>> to double, as a lot of qt-embedded code is doing.
>>>
>>> =================
>>> double
>>> convert(long long l)
>>> {
>>> return (double)l; // or double(l)
>>> }
>>>
>>> int
>>> main(int argc, char * argv[])
>>> {
>>> long long l = 10;
>>> double f;
>>>
>>> f = convert(l);
>>> printf("convert: %lld => %f\n", l, f);
>>> return 0;
>>> }
>>> ====================
>>>
>>> output:
>>> convert: 10 => 0.000000
>>>
>>> C++ compiled via powerpc-angstrom-linux-g++ gives the above result.
>>> Compiling the same code as C using powerpc-angstrom-linux-gcc works
>>> fine. But when looking at the assembler code both compiler produce
>>> virtually identical output and both call __floatdidf to do the actual
>>> conversion. Very strange, has anyone ever seen similar effects?
>>
>> Is this from a recent tree (i.e. post Richard Purdie's restructuring)?
>>
>> I've seen similar problems with C++ code on Poky which uses the same
>> changes.
>
> No, I'm building everything from the stable branch. There were some
> commits cherry-picked from .dev but those only add Qt 4.5.2.
>
> Poky is ARM only, right? Perhaps it would be helpfull to build a
> compiler from .dev and for a widely used powerpc-platform? How does
> n1200 sound? It uses the same ppc603e.

Actually, Poky also supports PowerPC now :-)

That said, it may or may not be related.  I'll do some investigating.

Thanks for isolating this problem to such a simple example.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


