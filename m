Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1PIjbE-0002Fq-M8
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 16:07:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 0E36A2C7EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 15:05:31 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGA4aeAXQoMO
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 15:05:26 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 83EC92C7DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 15:05:26 +0000 (UTC)
Message-ID: <4CE3EF4C.2050105@gmail.com>
Date: Wed, 17 Nov 2010 16:05:48 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE3D70F.2000101@gmail.com>
	<AANLkTin0i5rSxwA8Q3+jN7tLR-Rn3JEei6D==1CjKOh9@mail.gmail.com>
In-Reply-To: <AANLkTin0i5rSxwA8Q3+jN7tLR-Rn3JEei6D==1CjKOh9@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Error: git was compiled without libcurl support
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
X-List-Received-Date: Wed, 17 Nov 2010 15:07:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks ha scritto, Il 17/11/2010 15:01:
> 2010/11/17 Marco Cavallini <koansoftware@gmail.com>:
>> Hi, I just tried installing OE retrieving it from git
>> git clone git://git.openembedded.org/openembedded
>>
>> bitbake version 1.10.0
>> branch master
>> MACHINE=akita time bitbake minimal-image
>> DISTRO = "angstrom-2008.1"
>> host machine : Debian lenny x86_64-linux
>>
>> I face to an unexpected error
>> "Error: git was compiled without libcurl support"
>>
>> I successfully built it until November 2nd but since last Saturday I
>> wonder if it should build or if is normal this behavoiur.
>> log: http://paste.ubuntu.com/533450/
>>
> 
> you're using git from the host, guess that got changed one way or another.
> 

Frans,
thank you for answering.

I tried removing ASSUME_PROVIDED git-native from my config (local.conf)
in this case bitbake create git and use it instead of the host provided.
Then I did

 bitbake -b git-native

Anyway there are errors again
http://tinderbox.openembedded.net/packages/985559/


Is anybody out there building with Debian Lenny 64 ?
TIA

/marco


