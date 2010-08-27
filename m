Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Oozs3-0002eQ-OF
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 16:25:34 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id DC2521660968; Fri, 27 Aug 2010 08:24:48 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 39D551660962;
	Fri, 27 Aug 2010 08:24:28 -0600 (MDT)
Message-ID: <4C77CA9C.6080205@mlbassoc.com>
Date: Fri, 27 Aug 2010 08:24:28 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: Cliff Brake <cliff.brake@gmail.com>
References: <4C771A94.1020802@mlbassoc.com>
	<AANLkTimhME5XnoVz+a6vrnDyvZBeoK9Yy9st0MVAQ2H3@mail.gmail.com>
In-Reply-To: <AANLkTimhME5XnoVz+a6vrnDyvZBeoK9Yy9st0MVAQ2H3@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Testing build failure
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
X-List-Received-Date: Fri, 27 Aug 2010 14:25:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/27/2010 07:51 AM, Cliff Brake wrote:
> On Thu, Aug 26, 2010 at 9:53 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> MACHINE=beagleboard
>> DISTRO=angstrom-2010.x
>> IMAGE=beagleboard-linuxtag2010-demo-image
>> HOST=Fedora 12 32-bit
>> fails to build ti-dsplink
>>   -- because ti-cgt6x installed tools incorrectly
>>
>> Cliff - how did this build for you on Ubuntu/64-bit?  Can you send me
>> the logs for ti-dsplink and ti-cgt6x?
>
> Hi Gary,
>
> I was using the angstrom-2008.1 distro -- not sure if that matters.
> It looks like 2010.x is not ready for general use based on comments in
> inc files.

I already had success with this for qemuarm, so I thought I'd continue
with it (fuller testing coverage)

> I ran into an issue with one of the TI components where I had a '.' in
> my directory path that it did not like.

I've run into this before myself.

> I assume you have manually downloaded the binaries from TI and have
> placed them in your sources/downloads directory?

Certainly.

The problem I have is that the ti-cgt6x tools are installed into /opt/TI/TI_CGT_C6000_6.1.9
instead of tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-cgt6x-tree

I see that when you ran it, the do_unpack step for ti-cgt6x got this error:
   Where do you want to install C6000 Code Generation Tools?
   [/opt/TI/TI_CGT_C6000_6.1.9]
   Install Error: You do not have permission to write to /opt.

Presumably it then installed into $HOME (that's what the recipe is expecting).
On my system though, I _have_ write permission in /opt and the tools end up
in the wrong place and everything falls apart from there onwards.

I just checked and if I remove write permission to /opt, this package
runs properly.  I've worked out a patch using --prefix= to the TI binary
installer that makes it install correctly even if /opt is writeable.

> My logs are:
> http://bec-systems.com/oe/ti-cgt6x-1_6_1_9-r4.tar.gz
> http://bec-systems.com/oe/ti-dsplink-1_1_64-r88h.tar.gz

Thanks, I think these showed the problem well.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


